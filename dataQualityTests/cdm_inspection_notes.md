# CDM Inspection & DQD — Setup Notes

**Date:** 2026-04-20

---

## What CDMInspection is

CDMInspection is an **EHDEN** R package (`EHDEN/CdmInspection` on GitHub) that runs on top of Achilles results and produces an official Word-document report for certifying an OMOP CDM instance for EHDEN/OHDSI network participation.

It is more of a **holistic readiness review** than a scoring tool:
- Vocabulary coverage (mapped vs unmapped codes per domain)
- Top unmapped source codes
- Table row counts and statistics
- Drug exposure mapping breakdown
- ATLAS/WebAPI connectivity check
- Official EHDEN-formatted Word document output

In contrast, **DQD (DataQualityDashboard)** is the rule-based quality scorer (~4,000 checks, produces a score out of 100).

### Execution order for a full OHDSI quality review

1. **WhiteRabbit** — profile source data before ETL
2. **Achilles** — generate aggregate summary statistics post-ETL
3. **DataQualityDashboard (DQD)** — run automated DQ checks
4. **CdmInspection** — formal SME inspection report layered on top

### R connection status — RESOLVED (2026-04-21)

The JDBC connection was failing with:
> `Transaction control statements are supported only in scripts or sessions`

**Root cause:** `DatabaseConnector` sends `BEGIN` statements that BigQuery rejects outside of sessions.  
**Fix:** Add `EnableSession=1` to the JDBC connection string. Auth uses `OAuthType=3` (Application Default Credentials via `gcloud auth application-default login` — already configured as `lazaro@healthtree.org`).

Working connection string:
```
jdbc:bigquery://https://www.googleapis.com/bigquery/v2:443
  ;ProjectId=healthtree-production
  ;OAuthType=3
  ;EnableSession=1
  ;Timeout=60
```

JDBC driver location: `~/Documents/GitHub/DataQualityDashboard/drivers/GoogleBigQueryJDBC42.jar`  
(`DATABASECONNECTOR_JAR_FOLDER` env var points there.)

All required packages installed (2026-04-21):
- `DatabaseConnector` 7.0.0
- `SqlRender` 1.19.4
- `Achilles` 1.8
- `CdmInspection` 1.2.4 (v1.2.4+ required for BigQuery column alias fix)

---

## Scripts Created

| File | Purpose |
|------|---------|
| `run_all_checks.sh` | Master script — runs DQD + CDM Inspection |
| `run_dqd.sh` | DQD only (existing, was already working) |
| `run_cdm_inspection.sh` | CDMInspection replicated in pure `bq` CLI |
| `run_cdm_inspection_r.r` | R version template (use when JDBC is fixed) |

---

## Usage

```bash
# Run everything (DQD + CDM Inspection)
./dataQualityTests/run_all_checks.sh

# DQD only
./dataQualityTests/run_all_checks.sh --dqd-only

# CDM Inspection only
./dataQualityTests/run_all_checks.sh --cdmi-only

# Skip resetting the DQD results table (append mode)
./dataQualityTests/run_all_checks.sh --no-reset
```

---

## CDM Inspection — What the bq Script Checks (8 sections)

| # | Section | Output File |
|---|---------|-------------|
| 1 | CDM source metadata (cdm_source table) | `cdm_source.csv` |
| 2 | Row counts for all 36 CDM tables | `table_counts.csv` |
| 3 | Mapped vs unmapped records per domain | `vocabulary_coverage.csv` |
| 4 | Top 50 unmapped source codes per domain | `unmapped_source_codes.csv` |
| 5 | Drug exposure vocabulary breakdown | `drug_mapping_coverage.csv` |
| 6 | Source-to-concept-map usage | `source_to_concept_map.csv` |
| 7 | Observation period coverage stats | `observation_period_stats.csv` |
| 8 | Gender/race/ethnicity/age breakdown | `person_demographics.csv` |

Each run creates a timestamped folder: `cdm_inspection_YYYYMMDD_HHMMSS/`  
Each folder also contains `cdm_inspection_summary.md` — a human-readable markdown summary of all findings.

---

## What the bq Script Does NOT Cover

These require R and cannot be replicated in pure SQL:

- Achilles-based longitudinal trend analyses
- ATLAS/WebAPI connectivity checks
- Official EHDEN Word-document report format
- R-session hardware benchmarks

---

## When the R Connector is Fixed

Use `run_cdm_inspection_r.r`. Prerequisites:

```r
remotes::install_github("OHDSI/ROhdsiWebApi")
remotes::install_github("EHDEN/CdmInspection")
```

Make sure you are on **v1.2.4 or later** — earlier versions had a BigQuery bug where SQL column aliases with spaces caused syntax errors (fixed in PR #88, April 2024).

Also ensure **Achilles has been run** and its results tables exist in the `dataform` dataset before running CdmInspection.
