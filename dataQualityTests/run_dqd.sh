#!/usr/bin/env bash
# =============================================================================
# run_dqd.sh — Run all OHDSI DQD checks against healthtree-production.dataform
#
# Usage:
#   ./dataQualityTests/run_dqd.sh           # full run (reset + all checks)
#   ./dataQualityTests/run_dqd.sh --no-reset # skip table reset, append results
#
# Requirements: gcloud CLI authenticated, bq CLI available
# =============================================================================

set -euo pipefail

# ── Config ────────────────────────────────────────────────────────────────────
PROJECT="healthtree-production"
DATASET="dataform"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG_FILE="${SCRIPT_DIR}/run_dqd_$(date +%Y%m%d_%H%M%S).log"
RESET=true

# Parse flags
for arg in "$@"; do
  case $arg in
    --no-reset) RESET=false ;;
    *) echo "Unknown argument: $arg"; exit 1 ;;
  esac
done

# ── Helpers ───────────────────────────────────────────────────────────────────
log() { echo "[$(date '+%H:%M:%S')] $*" | tee -a "$LOG_FILE"; }

run_sql() {
  local file="$1"
  # BigQuery types bare `null` as INT64, but the results table expects STRING for
  # not_applicable_reason and notes_value. Fix with sed before sending to bq.
  sed \
    -e 's/,null as not_applicable_reason/,CAST(null AS STRING) as not_applicable_reason/g' \
    -e 's/,null as notes_value/,CAST(null AS STRING) as notes_value/g' \
    "$file" \
  | bq query \
      --project_id="$PROJECT" \
      --dataset_id="$DATASET" \
      --use_legacy_sql=false \
      --max_rows=0 \
      --quiet 2>&1
}

# ── Order: DDL first, then TABLE, FIELD, CONCEPT checks ──────────────────────
DDL_FILE="${SCRIPT_DIR}/ddlDqdResults.sql"
declare -a CHECK_FILES

while IFS= read -r -d '' f; do
  fname="$(basename "$f")"
  # Skip the DDL file, the R script, log files, and this script itself
  [[ "$fname" == "ddlDqdResults.sql" ]]   && continue
  [[ "$fname" == *.r || "$fname" == *.R ]] && continue
  [[ "$fname" == *.log || "$fname" == *.txt ]] && continue
  [[ "$fname" == *.sh ]] && continue
  CHECK_FILES+=("$f")
done < <(find "$SCRIPT_DIR" -maxdepth 1 -name "*.sql" -print0 | sort -z)

TOTAL=${#CHECK_FILES[@]}

# ── Step 1: Reset results table ───────────────────────────────────────────────
if $RESET; then
  log "Resetting dqdashboard_results table..."
  if run_sql "$DDL_FILE" >> "$LOG_FILE" 2>&1; then
    log "Table reset OK."
  else
    log "ERROR: Failed to reset results table. Aborting."
    exit 1
  fi
else
  log "Skipping table reset (--no-reset). Appending to existing results."
fi

# ── Step 2: Run each check file ───────────────────────────────────────────────
PASSED=0
FAILED=0
FAILED_FILES=()

log "Running $TOTAL DQD check files..."
log "────────────────────────────────────────────"

for i in "${!CHECK_FILES[@]}"; do
  f="${CHECK_FILES[$i]}"
  fname="$(basename "$f")"
  num=$((i + 1))

  printf "[%02d/%02d] %-55s" "$num" "$TOTAL" "$fname" | tee -a "$LOG_FILE"

  if run_sql "$f" >> "$LOG_FILE" 2>&1; then
    echo " OK" | tee -a "$LOG_FILE"
    PASSED=$((PASSED + 1))
  else
    echo " FAILED" | tee -a "$LOG_FILE"
    FAILED=$((FAILED + 1))
    FAILED_FILES+=("$fname")
  fi
done

# ── Step 3: Summary ───────────────────────────────────────────────────────────
log "────────────────────────────────────────────"
log "Done. SQL files: $PASSED OK, $FAILED failed."

if [[ ${#FAILED_FILES[@]} -gt 0 ]]; then
  log "Failed SQL files (execution errors, not data failures):"
  for f in "${FAILED_FILES[@]}"; do
    log "  - $f"
  done
fi

log ""
log "Results written to: ${PROJECT}.${DATASET}.dqdashboard_results"
log "Full log: $LOG_FILE"
log ""
log "Run this query to see DQD failures:"
log "  bq query --use_legacy_sql=false \\"
log "    'SELECT check_level, check_name, cdm_table_name, cdm_field_name,"
log "            SUM(failed) AS failures, SUM(passed) AS passed"
log "     FROM \`${PROJECT}.${DATASET}.dqdashboard_results\`"
log "     WHERE failed = 1"
log "     GROUP BY 1,2,3,4"
log "     ORDER BY failures DESC'"
