# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a **FHIR R4 → OMOP CDM v5.4 ETL pipeline** built on **Google Cloud Dataform v3.0.0**, targeting BigQuery project `healthtree-production`, dataset `dataform`. It converts HealthTree patient data (oncology-focused, primarily multiple myeloma) into the standardized OMOP format for research.

## Configuration

**`workflow_settings.yaml`** is the Dataform config:
```yaml
defaultProject: healthtree-production
defaultLocation: us-central1
defaultDataset: dataform
defaultAssertionDataset: dataform_assertions
dataformCoreVersion: 3.0.0
```

## Running & Testing

There is no build step — Dataform compiles and runs `.sqlx` files directly in BigQuery.

```bash
# Run OHDSI Data Quality Dashboard checks (writes to dataform.dqdashboard_results)
./dataQualityTests/run_dqd.sh

# Append results without resetting the table
./dataQualityTests/run_dqd.sh --no-reset

# Inspect CDM structure
./dataQualityTests/run_cdm_inspection.sh

# Query DQD failures
bq query --use_legacy_sql=false \
  'SELECT check_level, check_name, cdm_table_name, cdm_field_name,
          SUM(failed) AS failures
   FROM `healthtree-production.dataform.dqdashboard_results`
   WHERE failed = 1
   GROUP BY 1,2,3,4'
```

Clinical audit queries are in `clinical_review/` and can be run directly in BigQuery.

## Architecture: Three-Layer Transformation

```
FHIR R4 BigQuery Tables
        │
        ▼
Layer 1: *_valid.sqlx
  Filter to universe (universe.sqlx excludes internal emails & deleted accounts)
  Extract & type-cast raw FHIR fields
        │
        ▼
Layer 2: *_semi.sqlx / norm_*.sqlx
  Unnest FHIR coding arrays
  Map FHIR URN OIDs → OMOP vocabulary names (via vocabulary_mapping.sqlx)
  Join to OMOP concept table on concept_code
        │
        ▼
Layer 3: Adjustments/ (domain-specific reinforcements)
  meas_adjusted.sqlx  = UNION of specialized measurement overrides (BMI, weight, labs, ECOG, ISS)
  obs_adjusted.sqlx   = UNION of specialized observations (cytogenetics, translocations, ploidy)
  drug_manualMappings = 22 hardcoded chemo drugs (lenalidomide, carfilzomib, etc.)
        │
        ▼
Final OMOP Tables (omop__*.sqlx)
```

**ANISH AI episode data** flows separately: `ANISH.linesOfTherapy` → `episode/` tables → artificial medication/procedure/outcome records.

## Key Patterns

**Surrogate key generation** (no native OMOP IDs in source):
```sql
ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS condition_occurrence_id
```

**Date parsing — always handle 4 formats** from FHIR string dates:
```sql
COALESCE(
  SAFE_CAST(value AS DATE),                                         -- ISO 8601
  DATE(PARSE_TIMESTAMP('%a %b %d %Y %H:%M:%S GMT%z', value)),      -- JS date string
  CAST(CONCAT(SUBSTR(value, 1, 7), '-01') AS DATE),                 -- YYYY-MM
  CAST(CONCAT(value, '-01-01') AS DATE)                             -- YYYY
)
```

**Concept priority** when multiple FHIR codes exist: LOINC > multi-digit numeric > text

**Domain routing** — concept's `domain_id` must match the OMOP table it lands in. Use `clinical_review/condition_wrong_domain.sql` to audit misrouted records.

**Date guards** — all clinical event tables must filter:
- `event_date >= person.birth_date`
- `event_date <= COALESCE(death_date, CURRENT_DATE())`

## Codebase Split: Legacy vs. New Approach

| Path | Format | Status |
|------|--------|--------|
| `definitions/` | Dataform `.sqlx` (87 files) | Production, running |
| `_newApproach/` | dbt-style `.sql` + YAML schemas | In-progress refactor |

The `_newApproach/` folder uses Malloy-style `{{ ref() }}` syntax and YAML schema files in `_newApproach/schemas/`. `MERGE_PLAN.md` and `ToDo.md` describe the migration strategy. When editing production logic, target `definitions/`. When working on the migration, target `_newApproach/`.

## Data Sources

- `HT_test_sync.apps-curehub-medicalResources-r4-*` — Raw FHIR R4 tables
- `HT_test_sync.normalizations-*` — Pre-validated/normalized records (preferred source where available)
- `HT.users` — Patient demographics, `passedAwayDate` (death dates — known data quality issues)
- `HT.facilityConnections` — Facility linkage
- `ANISH.linesOfTherapy` — AI-generated treatment episodes

## Known Data Quality Issues

**Current DQD Score: ~91.9/100**

- **Bad death dates** — 3 patients in `HT.users.passedAwayDate` have dates contradicted by 5+ years of activity. This causes ~11,440 post-death record violations. **Root cause is upstream data; no ETL fix needed** — clinical team must correct.
- `clinical_review/` contains 12 audit SQL files for ongoing monitoring.

## Oncology-Specific Concepts

Hard-coded OMOP concept IDs appear throughout the Adjustments layer for:
- Cytogenetic markers: del(13q), del(17p), t(4;14), t(6;14), t(14;16), hyperdiploidy, hypodiploidy
- Performance status: ECOG (4 values mapped), ISS staging (I/II/III)
- Key labs: albumin, beta-2 microglobulin, BMI, body weight, body height
- Chemo drugs: 22 manually mapped drugs in `drug_manualMappings.sqlx`

When adding new concept mappings, add a comment with the drug/condition name next to the concept ID.
