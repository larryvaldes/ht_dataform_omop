#!/usr/bin/env bash
# =============================================================================
# run_all_checks.sh — Run all OMOP data quality checks
#
# Runs in order:
#   1. DQD (DataQualityDashboard) — OHDSI rule-based checks (~27 SQL files)
#   2. CDM Inspection              — EHDEN-style vocabulary/coverage inspection
#
# Usage:
#   ./dataQualityTests/run_all_checks.sh              # full run
#   ./dataQualityTests/run_all_checks.sh --dqd-only   # skip CDM Inspection
#   ./dataQualityTests/run_all_checks.sh --cdmi-only  # skip DQD
#   ./dataQualityTests/run_all_checks.sh --no-reset   # don't reset dqdashboard_results
#
# Requirements: gcloud CLI authenticated, bq CLI available
# =============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RUN_DQD=true
RUN_CDMI=true
NO_RESET=""

for arg in "$@"; do
  case $arg in
    --dqd-only)  RUN_CDMI=false ;;
    --cdmi-only) RUN_DQD=false ;;
    --no-reset)  NO_RESET="--no-reset" ;;
    *) echo "Unknown argument: $arg"; exit 1 ;;
  esac
done

OVERALL_START=$(date +%s)
STEP_ERRORS=0

echo "=============================================================="
echo " OMOP Data Quality — Full Check Suite"
echo " $(date '+%Y-%m-%d %H:%M:%S')"
echo "=============================================================="
echo ""

# ── Step 1: DQD ──────────────────────────────────────────────────
if $RUN_DQD; then
  echo "── Step 1/2: DataQualityDashboard (DQD) ─────────────────────"
  echo ""
  if bash "${SCRIPT_DIR}/run_dqd.sh" $NO_RESET; then
    echo ""
    echo "  DQD: DONE"
  else
    echo ""
    echo "  DQD: COMPLETED WITH ERRORS (check log above)"
    STEP_ERRORS=$((STEP_ERRORS+1))
  fi
  echo ""
else
  echo "── Step 1/2: DQD skipped (--cdmi-only) ──────────────────────"
  echo ""
fi

# ── Step 2: CDM Inspection ────────────────────────────────────────
if $RUN_CDMI; then
  echo "── Step 2/2: CDM Inspection ─────────────────────────────────"
  echo ""
  if bash "${SCRIPT_DIR}/run_cdm_inspection.sh"; then
    echo ""
    echo "  CDM Inspection: DONE"
  else
    echo ""
    echo "  CDM Inspection: COMPLETED WITH ERRORS (check log above)"
    STEP_ERRORS=$((STEP_ERRORS+1))
  fi
  echo ""
else
  echo "── Step 2/2: CDM Inspection skipped (--dqd-only) ────────────"
  echo ""
fi

ELAPSED=$(( $(date +%s) - OVERALL_START ))
echo "=============================================================="
echo " All checks finished in ${ELAPSED}s."
if [[ $STEP_ERRORS -gt 0 ]]; then
  echo " WARNING: ${STEP_ERRORS} step(s) reported errors."
fi
echo "=============================================================="
