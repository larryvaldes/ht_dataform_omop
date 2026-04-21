#!/usr/bin/env bash
# =============================================================================
# run_cdm_inspection.sh — CDM Inspection for healthtree-production.dataform
#
# This script replicates the EHDEN CdmInspection R package behaviour using
# the bq CLI directly, bypassing the R/JDBC connector that is failing.
#
# What CdmInspection normally does (and what this script covers):
#   1. CDM source metadata (cdm_source table)
#   2. Row counts for every CDM table
#   3. Vocabulary coverage: standard vs non-standard concepts per domain
#   4. Top unmapped source codes per domain
#   5. Drug exposure mapping coverage
#   6. Source-to-concept-map summary
#   7. Observation period coverage stats
#   8. Person demographics snapshot
#
# What this script CANNOT replicate without R:
#   - Achilles-based trend analyses (requires Achilles to have been run first)
#   - ATLAS/WebAPI connectivity checks
#   - The official EHDEN Word-document report format
#   - R-session hardware benchmarks
#
# Outputs (written to OUTPUT_DIR):
#   cdm_source.csv
#   table_counts.csv
#   vocabulary_coverage.csv
#   unmapped_source_codes.csv
#   drug_mapping_coverage.csv
#   source_to_concept_map.csv
#   observation_period_stats.csv
#   person_demographics.csv
#   cdm_inspection_summary.md   ← human-readable summary of all findings
#
# Usage:
#   ./dataQualityTests/run_cdm_inspection.sh
#   ./dataQualityTests/run_cdm_inspection.sh --output-dir /path/to/dir
#
# Requirements: gcloud CLI authenticated, bq CLI available
# =============================================================================

set -euo pipefail

# ── Config ────────────────────────────────────────────────────────────────────
PROJECT="healthtree-production"
DATASET="dataform"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TIMESTAMP="$(date +%Y%m%d_%H%M%S)"
OUTPUT_DIR="${SCRIPT_DIR}/cdm_inspection_${TIMESTAMP}"
LOG_FILE="${SCRIPT_DIR}/run_cdm_inspection_${TIMESTAMP}.log"

for arg in "$@"; do
  case $arg in
    --output-dir=*) OUTPUT_DIR="${arg#*=}" ;;
    *) echo "Unknown argument: $arg"; exit 1 ;;
  esac
done

mkdir -p "$OUTPUT_DIR"

# ── Helpers ───────────────────────────────────────────────────────────────────
log()  { echo "[$(date '+%H:%M:%S')] $*" | tee -a "$LOG_FILE"; }
ok()   { echo " OK"     | tee -a "$LOG_FILE"; }
fail() { echo " FAILED" | tee -a "$LOG_FILE"; }

# Run a SQL query and write results to a CSV file.
# $1 = output CSV filename (relative to OUTPUT_DIR)
# $2 = SQL string
run_query_to_csv() {
  local outfile="${OUTPUT_DIR}/$1"
  local sql="$2"
  bq query \
    --project_id="$PROJECT" \
    --dataset_id="$DATASET" \
    --use_legacy_sql=false \
    --format=csv \
    --quiet \
    "$sql" > "$outfile" 2>>"$LOG_FILE"
}

# Run a SQL query and capture stdout as a variable (for embedding in report).
run_query_inline() {
  local sql="$1"
  bq query \
    --project_id="$PROJECT" \
    --dataset_id="$DATASET" \
    --use_legacy_sql=false \
    --format=prettyjson \
    --quiet \
    "$sql" 2>>"$LOG_FILE"
}

log "================================================================="
log "CDM Inspection — ${PROJECT}.${DATASET}"
log "Output directory: ${OUTPUT_DIR}"
log "================================================================="

ERRORS=0

# =============================================================================
# 1. CDM Source Metadata
# =============================================================================
log ""
log "── 1/8  CDM source metadata ─────────────────────────────────────"
printf "  cdm_source.csv ..." | tee -a "$LOG_FILE"

if run_query_to_csv "cdm_source.csv" "
SELECT
  cdm_source_name,
  cdm_source_abbreviation,
  cdm_holder,
  source_description,
  source_documentation_reference,
  cdm_etl_reference,
  CAST(source_release_date AS STRING)  AS source_release_date,
  CAST(cdm_release_date AS STRING)     AS cdm_release_date,
  cdm_version,
  vocabulary_version
FROM \`${PROJECT}.${DATASET}.cdm_source\`
LIMIT 1
"; then ok; else fail; ERRORS=$((ERRORS+1)); fi

# =============================================================================
# 2. Row counts for every CDM table
# =============================================================================
log ""
log "── 2/8  Table row counts ────────────────────────────────────────"
printf "  table_counts.csv ..." | tee -a "$LOG_FILE"

# Uses INFORMATION_SCHEMA to discover tables, then counts rows for each one
# The UNION approach avoids needing dynamic SQL while covering all standard tables.
if run_query_to_csv "table_counts.csv" "
WITH counts AS (
  SELECT 'person'                AS table_name, COUNT(*) AS row_count FROM \`${PROJECT}.${DATASET}.person\`
  UNION ALL SELECT 'observation_period',       COUNT(*) FROM \`${PROJECT}.${DATASET}.observation_period\`
  UNION ALL SELECT 'visit_occurrence',         COUNT(*) FROM \`${PROJECT}.${DATASET}.visit_occurrence\`
  UNION ALL SELECT 'visit_detail',             COUNT(*) FROM \`${PROJECT}.${DATASET}.visit_detail\`
  UNION ALL SELECT 'condition_occurrence',     COUNT(*) FROM \`${PROJECT}.${DATASET}.condition_occurrence\`
  UNION ALL SELECT 'drug_exposure',            COUNT(*) FROM \`${PROJECT}.${DATASET}.drug_exposure\`
  UNION ALL SELECT 'procedure_occurrence',     COUNT(*) FROM \`${PROJECT}.${DATASET}.procedure_occurrence\`
  UNION ALL SELECT 'device_exposure',          COUNT(*) FROM \`${PROJECT}.${DATASET}.device_exposure\`
  UNION ALL SELECT 'measurement',              COUNT(*) FROM \`${PROJECT}.${DATASET}.measurement\`
  UNION ALL SELECT 'observation',              COUNT(*) FROM \`${PROJECT}.${DATASET}.observation\`
  UNION ALL SELECT 'death',                    COUNT(*) FROM \`${PROJECT}.${DATASET}.death\`
  UNION ALL SELECT 'note',                     COUNT(*) FROM \`${PROJECT}.${DATASET}.note\`
  UNION ALL SELECT 'note_nlp',                 COUNT(*) FROM \`${PROJECT}.${DATASET}.note_nlp\`
  UNION ALL SELECT 'specimen',                 COUNT(*) FROM \`${PROJECT}.${DATASET}.specimen\`
  UNION ALL SELECT 'fact_relationship',        COUNT(*) FROM \`${PROJECT}.${DATASET}.fact_relationship\`
  UNION ALL SELECT 'location',                 COUNT(*) FROM \`${PROJECT}.${DATASET}.location\`
  UNION ALL SELECT 'care_site',                COUNT(*) FROM \`${PROJECT}.${DATASET}.care_site\`
  UNION ALL SELECT 'provider',                 COUNT(*) FROM \`${PROJECT}.${DATASET}.provider\`
  UNION ALL SELECT 'payer_plan_period',        COUNT(*) FROM \`${PROJECT}.${DATASET}.payer_plan_period\`
  UNION ALL SELECT 'cost',                     COUNT(*) FROM \`${PROJECT}.${DATASET}.cost\`
  UNION ALL SELECT 'drug_era',                 COUNT(*) FROM \`${PROJECT}.${DATASET}.drug_era\`
  UNION ALL SELECT 'dose_era',                 COUNT(*) FROM \`${PROJECT}.${DATASET}.dose_era\`
  UNION ALL SELECT 'condition_era',            COUNT(*) FROM \`${PROJECT}.${DATASET}.condition_era\`
  UNION ALL SELECT 'episode',                  COUNT(*) FROM \`${PROJECT}.${DATASET}.episode\`
  UNION ALL SELECT 'episode_event',            COUNT(*) FROM \`${PROJECT}.${DATASET}.episode_event\`
  UNION ALL SELECT 'cdm_source',               COUNT(*) FROM \`${PROJECT}.${DATASET}.cdm_source\`
  UNION ALL SELECT 'concept',                  COUNT(*) FROM \`${PROJECT}.${DATASET}.concept\`
  UNION ALL SELECT 'vocabulary',               COUNT(*) FROM \`${PROJECT}.${DATASET}.vocabulary\`
  UNION ALL SELECT 'domain',                   COUNT(*) FROM \`${PROJECT}.${DATASET}.domain\`
  UNION ALL SELECT 'concept_class',            COUNT(*) FROM \`${PROJECT}.${DATASET}.concept_class\`
  UNION ALL SELECT 'concept_relationship',     COUNT(*) FROM \`${PROJECT}.${DATASET}.concept_relationship\`
  UNION ALL SELECT 'relationship',             COUNT(*) FROM \`${PROJECT}.${DATASET}.relationship\`
  UNION ALL SELECT 'concept_synonym',          COUNT(*) FROM \`${PROJECT}.${DATASET}.concept_synonym\`
  UNION ALL SELECT 'concept_ancestor',         COUNT(*) FROM \`${PROJECT}.${DATASET}.concept_ancestor\`
  UNION ALL SELECT 'source_to_concept_map',    COUNT(*) FROM \`${PROJECT}.${DATASET}.source_to_concept_map\`
  UNION ALL SELECT 'drug_strength',            COUNT(*) FROM \`${PROJECT}.${DATASET}.drug_strength\`
)
SELECT table_name, row_count
FROM counts
ORDER BY row_count DESC
"; then ok; else fail; ERRORS=$((ERRORS+1)); fi

# =============================================================================
# 3. Vocabulary coverage: standard vs non-standard per domain
# =============================================================================
log ""
log "── 3/8  Vocabulary coverage ─────────────────────────────────────"
printf "  vocabulary_coverage.csv ..." | tee -a "$LOG_FILE"

if run_query_to_csv "vocabulary_coverage.csv" "
WITH domain_records AS (
  -- Condition
  SELECT 'condition_occurrence' AS domain_table, 'condition' AS domain,
    condition_concept_id         AS standard_concept_id,
    condition_source_concept_id  AS source_concept_id
  FROM \`${PROJECT}.${DATASET}.condition_occurrence\`
  UNION ALL
  -- Drug
  SELECT 'drug_exposure', 'drug',
    drug_concept_id, drug_source_concept_id
  FROM \`${PROJECT}.${DATASET}.drug_exposure\`
  UNION ALL
  -- Procedure
  SELECT 'procedure_occurrence', 'procedure',
    procedure_concept_id, procedure_source_concept_id
  FROM \`${PROJECT}.${DATASET}.procedure_occurrence\`
  UNION ALL
  -- Measurement
  SELECT 'measurement', 'measurement',
    measurement_concept_id, measurement_source_concept_id
  FROM \`${PROJECT}.${DATASET}.measurement\`
  UNION ALL
  -- Observation
  SELECT 'observation', 'observation',
    observation_concept_id, observation_source_concept_id
  FROM \`${PROJECT}.${DATASET}.observation\`
  UNION ALL
  -- Device
  SELECT 'device_exposure', 'device',
    device_concept_id, device_source_concept_id
  FROM \`${PROJECT}.${DATASET}.device_exposure\`
),
coverage AS (
  SELECT
    domain_table,
    domain,
    COUNT(*)                                                              AS total_records,
    COUNTIF(standard_concept_id IS NOT NULL AND standard_concept_id != 0) AS mapped_records,
    COUNTIF(standard_concept_id IS NULL OR standard_concept_id = 0)       AS unmapped_records
  FROM domain_records
  GROUP BY 1, 2
)
SELECT
  domain_table,
  domain,
  total_records,
  mapped_records,
  unmapped_records,
  ROUND(SAFE_DIVIDE(mapped_records, total_records) * 100, 2) AS pct_mapped
FROM coverage
ORDER BY total_records DESC
"; then ok; else fail; ERRORS=$((ERRORS+1)); fi

# =============================================================================
# 4. Top 50 unmapped source codes per domain (mirrors CdmInspection output)
# =============================================================================
log ""
log "── 4/8  Top unmapped source codes ──────────────────────────────"
printf "  unmapped_source_codes.csv ..." | tee -a "$LOG_FILE"

if run_query_to_csv "unmapped_source_codes.csv" "
WITH unmapped AS (
  SELECT 'condition_occurrence' AS domain_table, 'condition' AS domain,
    condition_source_value AS source_value,
    condition_source_concept_id AS source_concept_id,
    condition_concept_id AS standard_concept_id
  FROM \`${PROJECT}.${DATASET}.condition_occurrence\`
  WHERE condition_concept_id IS NULL OR condition_concept_id = 0
  UNION ALL
  SELECT 'drug_exposure', 'drug',
    drug_source_value, drug_source_concept_id, drug_concept_id
  FROM \`${PROJECT}.${DATASET}.drug_exposure\`
  WHERE drug_concept_id IS NULL OR drug_concept_id = 0
  UNION ALL
  SELECT 'procedure_occurrence', 'procedure',
    procedure_source_value, procedure_source_concept_id, procedure_concept_id
  FROM \`${PROJECT}.${DATASET}.procedure_occurrence\`
  WHERE procedure_concept_id IS NULL OR procedure_concept_id = 0
  UNION ALL
  SELECT 'measurement', 'measurement',
    measurement_source_value, measurement_source_concept_id, measurement_concept_id
  FROM \`${PROJECT}.${DATASET}.measurement\`
  WHERE measurement_concept_id IS NULL OR measurement_concept_id = 0
  UNION ALL
  SELECT 'observation', 'observation',
    observation_source_value, observation_source_concept_id, observation_concept_id
  FROM \`${PROJECT}.${DATASET}.observation\`
  WHERE observation_concept_id IS NULL OR observation_concept_id = 0
),
ranked AS (
  SELECT
    domain_table,
    domain,
    source_value,
    source_concept_id,
    COUNT(*) AS record_count,
    ROW_NUMBER() OVER (PARTITION BY domain ORDER BY COUNT(*) DESC) AS rn
  FROM unmapped
  GROUP BY 1, 2, 3, 4
)
SELECT domain_table, domain, source_value, source_concept_id, record_count
FROM ranked
WHERE rn <= 50
ORDER BY domain, record_count DESC
"; then ok; else fail; ERRORS=$((ERRORS+1)); fi

# =============================================================================
# 5. Drug exposure mapping coverage (drug-specific CdmInspection section)
# =============================================================================
log ""
log "── 5/8  Drug mapping coverage ───────────────────────────────────"
printf "  drug_mapping_coverage.csv ..." | tee -a "$LOG_FILE"

if run_query_to_csv "drug_mapping_coverage.csv" "
SELECT
  COALESCE(c.vocabulary_id, 'Unmapped')                         AS vocabulary_id,
  COALESCE(c.concept_class_id, 'Unmapped')                      AS concept_class_id,
  COUNT(*)                                                       AS record_count,
  ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2)            AS pct_of_total,
  COUNTIF(de.drug_concept_id IS NULL OR de.drug_concept_id = 0) AS unmapped_count
FROM \`${PROJECT}.${DATASET}.drug_exposure\` de
LEFT JOIN \`${PROJECT}.${DATASET}.concept\` c
  ON de.drug_concept_id = c.concept_id
  AND c.standard_concept = 'S'
GROUP BY 1, 2
ORDER BY record_count DESC
LIMIT 100
"; then ok; else fail; ERRORS=$((ERRORS+1)); fi

# =============================================================================
# 6. Source-to-concept-map summary
# =============================================================================
log ""
log "── 6/8  Source-to-concept-map ───────────────────────────────────"
printf "  source_to_concept_map.csv ..." | tee -a "$LOG_FILE"

if run_query_to_csv "source_to_concept_map.csv" "
SELECT
  source_vocabulary_id,
  target_vocabulary_id,
  COUNT(*)            AS mapping_count,
  COUNT(DISTINCT source_code) AS distinct_source_codes,
  COUNT(DISTINCT target_concept_id) AS distinct_target_concepts
FROM \`${PROJECT}.${DATASET}.source_to_concept_map\`
GROUP BY 1, 2
ORDER BY mapping_count DESC
"; then ok; else fail; ERRORS=$((ERRORS+1)); fi

# =============================================================================
# 7. Observation period coverage
# =============================================================================
log ""
log "── 7/8  Observation period stats ────────────────────────────────"
printf "  observation_period_stats.csv ..." | tee -a "$LOG_FILE"

if run_query_to_csv "observation_period_stats.csv" "
SELECT
  COUNT(*)                                                   AS total_observation_periods,
  COUNT(DISTINCT person_id)                                  AS persons_with_obs_period,
  MIN(observation_period_start_date)                         AS earliest_start,
  MAX(observation_period_end_date)                           AS latest_end,
  ROUND(AVG(DATE_DIFF(observation_period_end_date,
                      observation_period_start_date, DAY)), 1) AS avg_duration_days,
  MIN(DATE_DIFF(observation_period_end_date,
                observation_period_start_date, DAY))          AS min_duration_days,
  MAX(DATE_DIFF(observation_period_end_date,
                observation_period_start_date, DAY))          AS max_duration_days,
  (SELECT COUNT(*) FROM \`${PROJECT}.${DATASET}.person\`)    AS total_persons,
  ROUND(COUNT(DISTINCT person_id) * 100.0
        / (SELECT COUNT(*) FROM \`${PROJECT}.${DATASET}.person\`), 2) AS pct_persons_covered
FROM \`${PROJECT}.${DATASET}.observation_period\`
"; then ok; else fail; ERRORS=$((ERRORS+1)); fi

# =============================================================================
# 8. Person demographics snapshot
# =============================================================================
log ""
log "── 8/8  Person demographics ─────────────────────────────────────"
printf "  person_demographics.csv ..." | tee -a "$LOG_FILE"

if run_query_to_csv "person_demographics.csv" "
SELECT
  COALESCE(g.concept_name, 'Unknown') AS gender,
  COALESCE(r.concept_name, 'Unknown') AS race,
  COALESCE(e.concept_name, 'Unknown') AS ethnicity,
  EXTRACT(YEAR FROM CURRENT_DATE()) - p.year_of_birth AS age_approx,
  COUNT(*) AS person_count
FROM \`${PROJECT}.${DATASET}.person\` p
LEFT JOIN \`${PROJECT}.${DATASET}.concept\` g ON p.gender_concept_id  = g.concept_id
LEFT JOIN \`${PROJECT}.${DATASET}.concept\` r ON p.race_concept_id    = r.concept_id
LEFT JOIN \`${PROJECT}.${DATASET}.concept\` e ON p.ethnicity_concept_id = e.concept_id
GROUP BY 1, 2, 3, 4
ORDER BY person_count DESC
LIMIT 200
"; then ok; else fail; ERRORS=$((ERRORS+1)); fi

# =============================================================================
# Generate markdown summary report
# =============================================================================
log ""
log "── Generating cdm_inspection_summary.md ─────────────────────────"

SUMMARY="${OUTPUT_DIR}/cdm_inspection_summary.md"
{
  echo "# CDM Inspection Summary"
  echo ""
  echo "**Project:** \`${PROJECT}.${DATASET}\`"
  echo "**Run date:** $(date '+%Y-%m-%d %H:%M:%S')"
  echo "**Script:** run_cdm_inspection.sh (bq CLI — replaces EHDEN CdmInspection R package)"
  echo ""
  echo "---"
  echo ""

  echo "## 1. CDM Source"
  echo ""
  if [[ -s "${OUTPUT_DIR}/cdm_source.csv" ]]; then
    cat "${OUTPUT_DIR}/cdm_source.csv"
  else
    echo "_No cdm_source data found._"
  fi
  echo ""

  echo "## 2. Table Row Counts"
  echo ""
  echo "| Table | Row Count |"
  echo "|-------|----------:|"
  if [[ -s "${OUTPUT_DIR}/table_counts.csv" ]]; then
    tail -n +2 "${OUTPUT_DIR}/table_counts.csv" | while IFS=',' read -r tbl cnt; do
      echo "| ${tbl} | ${cnt} |"
    done
  else
    echo "_No data._"
  fi
  echo ""

  echo "## 3. Vocabulary Coverage by Domain"
  echo ""
  echo "| Domain Table | Total Records | Mapped | Unmapped | % Mapped |"
  echo "|--------------|-------------:|-------:|---------:|---------:|"
  if [[ -s "${OUTPUT_DIR}/vocabulary_coverage.csv" ]]; then
    tail -n +2 "${OUTPUT_DIR}/vocabulary_coverage.csv" | while IFS=',' read -r dtbl dom tot mapped unmapped pct; do
      echo "| ${dtbl} | ${tot} | ${mapped} | ${unmapped} | ${pct}% |"
    done
  else
    echo "_No data._"
  fi
  echo ""

  echo "## 4. Top Unmapped Source Codes (top 10 per domain)"
  echo ""
  echo "Full list: \`unmapped_source_codes.csv\`"
  echo ""
  if [[ -s "${OUTPUT_DIR}/unmapped_source_codes.csv" ]]; then
    echo "| Domain | Source Value | Source Concept ID | Record Count |"
    echo "|--------|-------------|------------------:|-------------:|"
    tail -n +2 "${OUTPUT_DIR}/unmapped_source_codes.csv" | head -50 | while IFS=',' read -r dtbl dom sv scid cnt; do
      echo "| ${dom} | ${sv} | ${scid} | ${cnt} |"
    done
  else
    echo "_No unmapped codes — excellent!_"
  fi
  echo ""

  echo "## 5. Drug Mapping Coverage (top vocabularies)"
  echo ""
  echo "Full list: \`drug_mapping_coverage.csv\`"
  echo ""

  echo "## 6. Source-to-Concept-Map Summary"
  echo ""
  if [[ -s "${OUTPUT_DIR}/source_to_concept_map.csv" ]]; then
    echo "| Source Vocab | Target Vocab | Mappings | Distinct Sources | Distinct Targets |"
    echo "|-------------|-------------|--------:|----------------:|----------------:|"
    tail -n +2 "${OUTPUT_DIR}/source_to_concept_map.csv" | while IFS=',' read -r sv tv mc dsc dtc; do
      echo "| ${sv} | ${tv} | ${mc} | ${dsc} | ${dtc} |"
    done
  else
    echo "_source_to_concept_map is empty._"
  fi
  echo ""

  echo "## 7. Observation Period Coverage"
  echo ""
  if [[ -s "${OUTPUT_DIR}/observation_period_stats.csv" ]]; then
    cat "${OUTPUT_DIR}/observation_period_stats.csv"
  else
    echo "_No observation period data._"
  fi
  echo ""

  echo "## 8. Person Demographics"
  echo ""
  echo "Full breakdown: \`person_demographics.csv\`"
  echo ""

  echo "---"
  echo ""
  echo "## Output Files"
  echo ""
  echo "| File | Description |"
  echo "|------|-------------|"
  echo "| cdm_source.csv | CDM source metadata |"
  echo "| table_counts.csv | Row counts for all CDM tables |"
  echo "| vocabulary_coverage.csv | Mapped vs unmapped records per domain |"
  echo "| unmapped_source_codes.csv | Top 50 unmapped source codes per domain |"
  echo "| drug_mapping_coverage.csv | Drug exposure vocabulary breakdown |"
  echo "| source_to_concept_map.csv | Source-to-concept-map usage |"
  echo "| observation_period_stats.csv | Observation period coverage statistics |"
  echo "| person_demographics.csv | Gender/race/ethnicity/age breakdown |"
  echo ""
  echo "## Note: What This Script Does Not Cover"
  echo ""
  echo "The EHDEN CdmInspection R package also includes:"
  echo "- Achilles-based longitudinal trend analyses (requires Achilles to have been run)"
  echo "- ATLAS/WebAPI connectivity checks"
  echo "- Official EHDEN Word-document report (requires officer/flextable R packages)"
  echo "- R-session hardware benchmarks"
  echo ""
  echo "To run the full CdmInspection with the Word-doc output, fix the R JDBC connector"
  echo "and run the \`run_cdm_inspection_r.r\` script."
} > "$SUMMARY"

log "  Summary written to: ${SUMMARY}"

# =============================================================================
# Final summary
# =============================================================================
log ""
log "================================================================="
if [[ $ERRORS -eq 0 ]]; then
  log "CDM Inspection complete — all 8 checks passed."
else
  log "CDM Inspection complete — ${ERRORS} check(s) failed (see log above)."
fi
log "Output: ${OUTPUT_DIR}"
log "Log:    ${LOG_FILE}"
log "================================================================="
