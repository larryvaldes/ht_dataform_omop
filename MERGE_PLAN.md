# OMOP Pipeline Merge Plan: Existing Approach + `_newApproach`

> Generated: 2026-04-13  
> Branch: `development`  
> Author: Claude Code analysis

---

## Overview

This document captures the findings from a full scan of both the existing Dataform OMOP pipeline and the `_newApproach` folder, and provides a complete, ordered to-do list for merging the best of both without cutting corners.

---

## Part 1 — Existing Project Summary (excluding `_newApproach`)

### Architecture

Three-layer Dataform SQLX pipeline:

1. **`_valid` layer** — Extracts and filters FHIR data; validates against universe
2. **`_semi` / `norm_` layer** — Normalizes, parses dates, joins to OMOP vocabulary
3. **Final tables** — Applies business logic, reinforcements, and multi-universe merging

**Key config:** `workflow_settings.yaml` — Dataform Core 3.0.0, `healthtree-production`, `us-central1`, default dataset `dataform`.

### Data Sources

| Source | FHIR Resource / Table | OMOP Target |
|---|---|---|
| HT_test_sync / HT BigQuery | Patient | person |
| HT BigQuery | Observation (valueQuantity) | measurement |
| HT BigQuery | Observation (valueCodeableConcept) | observation |
| HT BigQuery | Condition | condition_occurrence |
| HT BigQuery | MedicationRequest + contained Medication | drug_exposure |
| HT BigQuery | Procedure | procedure_occurrence |
| HT BigQuery | Encounter | visit_occurrence |
| HT BigQuery | Device | device_exposure |
| normalizations-* tables | Pre-mapped validated records | condition / observation / procedure |
| ANISH.linesOfTherapy | Lines of Therapy AI data | episode + artificial drugs/procedures/outcomes |
| HT.users | Demographics, death dates | person, death |
| HT.facilityConnections | Facility linkage | visit, care_site |

### Concept Mapping Strategy

- **Vocabulary tables:** `OMOP.Concept` via `stg_*` views filtered by `vocabulary_id`
- **Join strategy:** `concept_code = source_code AND source_system LIKE '%' || vocabulary_id || '%'`
- **Vocabulary URN mapping:** `vocabulary_mapping.sqlx` translates FHIR URN OIDs to OMOP vocab names (SNOMED, ICD9CM, ICD10CM, LOINC, RxNorm, CPT4, NDC, CVX, UCUM)
- **FHIR code array priority:** LOINC > multi-digit numeric > single-digit/text (in `obs_code_unnested.sqlx`, `meas_code_unnested.sqlx`)
- **Fallback:** NULL/0 concept_id — records kept but unmapped

### Domain-Specific Reinforcements (Critical — Must Not Be Lost)

**Measurement adjustments** (`meas_adjusted.sqlx` unions):
- `bmi.sqlx` — hardcodes `measurement_concept_id=3038553`, `operator_concept_id=4172703`, `unit_concept_id=9531` for LOINC `39156-5`, SNOMED `162859006`, and related codes
- `body_weight.sqlx` — normalizes weight to concept 3025315
- `body_height.sqlx` — normalizes height to concept 3023540
- `beta2micro.sqlx`, `albumin.sqlx` — lab value overrides
- `ecog.sqlx`, `ecog_fix.sqlx` (measurement variant) — ECOG performance status
- `iss.sqlx` (measurement variant) — ISS staging

**Observation adjustments** (`obs_adjusted.sqlx` unions):
- `del13q.sqlx` — concept 35977004; matched via REGEXP_EXTRACT on source code AND LIKE on source value
- `del17p.sqlx` — deletion 17p cytogenetic marker
- `t_4_14.sqlx`, `t_6_14.sqlx`, `t_14_16.sqlx` — translocation markers
- `hyperdiploidy.sqlx`, `hypodiploidy.sqlx` — ploidy markers
- `ecog_fix.sqlx` (observation variant), `iss.sqlx` (observation variant)

**Drug manual mappings** (`drug_manualMappings.sqlx` — 22 curated chemo drugs):
- lenalidomide → 19026972
- carfilzomib → 42873638
- bortezomib → 1336825
- daratumumab → 35605744
- venetoclax → 35604205
- (and 17 more)
- Applied in `drug_exposure_final.sqlx` as fallback when standard mapping returns 0

**Episode/LoT mappings** (`episode_lines_parent.sqlx`):
- Disease GUID → SNOMED: `GxAhXAnh` → 437233 (MM), `WCJo8Io` → 140352 (MDS), `EkjGB5k` → 4147411 (AML)
- Date validation: nullify `episode_end_date` when `< episode_start_date`

**Artificial universe** (ANISH LoT):
- `artMed.sqlx` + `artMedMap.sqlx` → artificial drug_exposure records
- `artProc.sqlx` → artificial procedure_occurrence records
- `outcomeAsObs.sqlx` → observation records with `observation_concept_id=36305408` ("Treatment Response")

### Date Parsing (4 Formats — Critical for Legacy Data)

1. ISO 8601: `SAFE_CAST(value AS TIMESTAMP)`
2. JavaScript date string: `PARSE_TIMESTAMP('%a %b %d %Y %H:%M:%S GMT%z', ...)` (e.g., `"Tue Jan 11 2022 00:00:00 GMT-0700 (Mountain Standard Time)"`)
3. Year-month only: `"2023-06"` → `"2023-06-01 00:00:00"`
4. Year only: `"2023"` → `"2023-01-01 00:00:00"`

### Known Data Quality Findings (`dataQualityTests/findings.md`)

- **Finding 1 (open):** 3 patients with incorrect death dates → 11,440 plausibility violations. Source fix required in `HT.users.passedAwayDate`.
- **Finding 2 (fixed):** 200 LoT records with `endDate < startDate` — nullified in `episode_lines_parent.sqlx`
- **Finding 3 (fixed):** 56.3% of observation period end dates exceeded death date — capped with `LEAST()` in `observation_period.sqlx`
- **Current DQD score: 91.9/100** (644 passed, 57 failed — 98% of failures are the 3 bad death dates)

---

## Part 2 — `_newApproach` Summary

### Architecture

Three-tier dbt-style SQL pipeline:

1. **`stg_raw_athena__*`** — Pass-through projections of OHDSI Athena vocabulary tables
2. **`int_omop__*`** — Domain-specific FHIR transformations; stores `practitioner_id` (string) not `provider_id` (FK) for incremental safety
3. **`omop__*`** — Final union tables with fresh provider FK join, cross-domain eviction, date filtering, and schema tests

**Note:** Uses dbt syntax (`{{ config(materialized='table') }}`, `{{ ref() }}`, YAML schemas in `schemas/`), BigQuery pipe SQL (`|> union all by name`, `|> where`, `|> select`), and custom macros (`surrogate_int_id`, `concept_zero_rate`, etc.).

### Key Architectural Patterns Not in the Existing Project

**1. Incremental-safe provider FK**
Intermediate models store FHIR `practitioner_id` (string). The `provider_id` (int FK) join to `int_omop__provider.provider_source_value` happens only at the final table rebuild. Prevents stale FK accumulation when practitioners are deleted from Firestore. ~85% null rate on measurement provider is expected and documented.

**2. Cross-domain eviction (measurement ↔ observation)**
Two marker TABLEs, rebuilt every run:
- `int_omop__measurement_coded` — lists all current measurement_ids
- `int_omop__observation_mapped` — lists all current observation_ids

Final `omop__measurement` evicts rows present in `int_omop__observation_mapped`. Final `omop__observation` evicts rows present in `int_omop__measurement_coded`. Prevents duplicates when a FHIR Observation gains/loses LOINC coding between runs.

**3. Observation period from ALL event dates (start AND end)**
Aggregates 26+ UNION ALLs of both start and end dates from every clinical table. Including end dates prevents 61% of observation periods from being cut short. Also applies Achilles-114: excludes event dates before birth year.

**4. Drug era with RxNorm ingredient roll-up**
Pre-builds a deduplicated drug→ingredient map from `concept_ancestor` (RxNorm Ingredient class, shortest path). CVX vaccines excluded (no RxNorm Ingredient ancestor). 30-day gap window algorithm for era grouping with `gap_days` computation.

**5. Multi-stream union architecture**
| OMOP Table | Streams |
|---|---|
| condition_occurrence | primary + from_allergy_intolerance |
| drug_exposure | primary + from_procedure + from_immunization |
| measurement | primary + from_condition + from_procedure + from_observation |
| observation | primary + from_condition + from_procedure + from_allergy_intolerance + from_person + from_measurement |
| procedure_occurrence | primary + from_condition |

**6. Comprehensive YAML schema tests**
23 schema files with calibrated null/zero-rate thresholds per domain, custom macros, FK integrity tests, and Achilles-conformance validators:

| Domain | concept_zero_rate threshold | provider_id null threshold |
|---|---|---|
| Condition | 5% | 100% |
| Drug | 7% | 42% |
| Measurement | 11% | 85% |
| Observation | 72% | 92% |
| Procedure | 36% | 89% |

**7. Other new patterns**
- Sentinel date filter: `> '1902-01-01'` on all event tables
- End date imputation for drug_exposure: explicit end → start + days_supply - 1 → start + 29 days (THEMIS T119)
- Route concept dual fallback: SNOMED code → `int_omop__standard_concept_map`, then FHIR display text → `seed__route_display_to_concept`
- Episode open-ended cap: `episode_end_date` defaulted to `episode_start_date + 365 days` for open episodes
- Location deduplication by address completeness (null count ranking)
- Myeloma cohort tables (`omop__cohort`, `omop__cohort_definition`) via `seed__myeloma_snomed_classification`
- `omop__cdm_source` and `omop__metadata` tables
- `surrogate_int_id()` macro for deterministic integer surrogate keys

### What `_newApproach` Is Missing

- All domain-specific reinforcements (BMI, genomic markers, manual drug mappings)
- Artificial LoT universe (artMed, artProc, outcomeAsObs)
- Episode disease GUID → SNOMED mapping
- 4-format date parser (JS date strings are critical for HealthTree legacy data)
- FHIR code array unnesting with LOINC priority logic
- Death date capping on observation_period
- Universe filter (exclude internal emails, deleted.com accounts)
- DQD plausibility test suite

---

## Part 3 — What Each Approach Contributes to the Merged Result

| Keep from **existing project** | Keep from **`_newApproach`** |
|---|---|
| 22-drug manual mapping reinforcement | Incremental-safe practitioner string → provider_id fresh join |
| BMI, weight, height, beta2m, albumin, ECOG, ISS measurement overrides | Cross-domain eviction (measurement ↔ observation) |
| del13q, del17p, t_4_14, t_6_14, t_14_16, hyperdiploidy, hypodiploidy observation overrides | Observation period uses both start+end dates + death cap |
| Artificial LoT universe (artMed, artProc, outcomeAsObs) | Drug era with RxNorm ingredient roll-up |
| Episode disease GUID → SNOMED mapping | Condition era implementation |
| 4-format date parser (JS date strings) | Comprehensive YAML schema tests |
| FHIR code array unnesting with LOINC priority | Multi-stream union architecture |
| Death date capping on observation_period | Achilles-114 birth year filter + sentinel date filter |
| Universe filter (exclude internal users) | Myeloma cohort + CDM source tables |
| DQD test suite (26+ tests) | Dual-fallback route concept resolution |
| Episode date inversion fix (nullify end < start) | Episode open-ended 365-day cap |

---

## Part 4 — To-Do List (Ordered, No Corners Cut)

---

### Phase 0 — Architecture Decision (Do First, Everything Depends on It)

- [ ] **0.1. Decide on the target framework.**
  The existing project is Dataform SQLX (`workflow_settings.yaml`, `.sqlx` files, `config { type: "table" }`). The `_newApproach` is dbt-style SQL (`{{ config(materialized='table') }}`, `{{ ref() }}`, `.sql` files, `schemas/*.yml`). Explicitly decide: stay on Dataform and port new patterns into SQLX, OR migrate from Dataform to dbt. All subsequent work depends on this choice.

- [ ] **0.2. Inventory all intermediate models referenced by `_newApproach` that do not yet exist.**
  Every `int_omop__*`, `stg_raw_athena__*`, `int_facility__*`, `int_location__*`, `int_omop__*_coded`, and `int_omop__*_mapped` model is referenced but not present in `_newApproach`. List each one — this is the full scope of net-new build work.

- [ ] **0.3. Inventory all seed tables referenced by `_newApproach` that do not yet exist.**
  - `seed__myeloma_snomed_classification`
  - `seed__route_display_to_concept`
  - `map__hl7_omop`

- [ ] **0.4. Inventory all custom macros/tests referenced by `_newApproach` that do not yet exist.**
  - `surrogate_int_id()`
  - `concept_zero_rate`
  - `domain_routing_valid`
  - `type_concept_valid`
  - `person_completeness`
  - `value_completeness`
  - `outside_observation_period`
  - `date_not_in_future`
  - `date_not_after`
  - `fk_null_rate`
  - `concept_mapping_rate`

---

### Phase 1 — Implement Infrastructure (Prerequisites for Everything Else)

- [ ] **1.1. Create the vocabulary staging layer.**
  Build `stg_raw_athena__concept`, `stg_raw_athena__concept_ancestor`, `stg_raw_athena__concept_class`, `stg_raw_athena__concept_relationship`, `stg_raw_athena__concept_synonym`, `stg_raw_athena__vocabulary`, `stg_raw_athena__domain`, `stg_raw_athena__relationship`, `stg_raw_athena__drug_strength` as simple pass-through models from `healthtree-production.OMOP.*`. This decouples vocabulary from hardcoded dataset references throughout the pipeline.

- [ ] **1.2. Implement the `surrogate_int_id()` macro.**
  Used by `observation_period`, `condition_era`, and `drug_era` to generate deterministic integer surrogate keys from concatenated string inputs.

- [ ] **1.3. Implement all custom schema test macros.**
  Build each macro from Phase 0.4. Required for YAML schema files to execute without errors.

- [ ] **1.4. Create seed tables.**
  - `seed__myeloma_snomed_classification`: MM, SMM, MGUS SNOMED codes with category labels
  - `seed__route_display_to_concept`: FHIR route display text → route concept_id fallback mapping
  - `map__hl7_omop`: HL7 demographic code → OMOP concept mappings (gender, race, ethnicity)

- [ ] **1.5. Build `int_omop__standard_concept_map`.**
  Referenced in route resolution (`drug_exposure`) and country mapping (`location`). Port the existing `vocabulary_mapping.sqlx` URN OID → vocab name logic, extended to resolve source codes → standard concept_id by domain.

---

### Phase 2 — Core Person & Visit Pipeline

- [ ] **2.1. Build `int_omop__person`.**
  Port `universe.sqlx` + `person_gender.sqlx` + `person_race.sqlx` + `person_ethnicity.sqlx` into a unified intermediate model. Carry over: universe exclusion (internal emails, deleted.com), gender coalesce (FHIR → HT.users), ISO birth date component extraction, ROW_NUMBER-based sequential `person_id` generation.

- [ ] **2.2. Build `int_omop__visit_occurrence`.**
  Port `visit_valid.sqlx` → `visit_occurrence.sqlx` into the new layer. Populate `visit_concept_id`, `visit_type_concept_id`, `admitted_from_concept_id`, `discharged_to_concept_id` where mappable.

- [ ] **2.3. Build `int_omop__visit_detail`.**
  Port from existing `visit_detail.sqlx`. Link `visit_detail_id` to parent `visit_occurrence_id`.

- [ ] **2.4. Build `int_facility__organization` (care_site).**
  Port `care_site.sqlx`. Apply place-of-service rules: Community Oncology → 8716, hospital-based → 8756, Sandbox → 0.

- [ ] **2.5. Build `int_location__patient_address_condense_legacy` (location).**
  Port `location.sqlx`. Implement address deduplication by completeness (rank by null count across address_line_1, city, state, zip, county; pick most complete). Add country SNOMED → standard concept resolution via `int_omop__standard_concept_map`.

---

### Phase 3 — Condition & Procedure Pipelines

- [ ] **3.1. Build `int_omop__condition_occurrence` (primary).**
  Port `normalizations-Condition` → `condition_occurrence.sqlx` into an intermediate model. Preserve SNOMED/ICD concept mapping, encounter reference → `visit_occurrence_id` join, and `condition_status_concept_id` mapping.

- [ ] **3.2. Build `int_omop__condition_occurrence_from_allergy_intolerance`.**
  New stream (new approach only). Extract conditions from FHIR AllergyIntolerance resources. Build fresh.

- [ ] **3.3. Apply sentinel date filter to `omop__condition_occurrence`.**
  Add `condition_start_date > '1902-01-01' AND condition_start_date <= current_date()`. This exists in the new approach but not the current project.

- [ ] **3.4. Build `int_omop__procedure_occurrence` (primary).**
  Port `norm_r4_proc` → `procedure_occurrence.sqlx` logic. Preserve encounter reference → `visit_occurrence_id` join and CPT4/SNOMED concept mapping.

- [ ] **3.5. Build `int_omop__procedure_from_condition`.**
  New stream (new approach only). Extract procedure-like codes from Condition resources. Build fresh.

---

### Phase 4 — Drug Exposure Pipeline (Most Complex)

- [ ] **4.1. Build `int_omop__drug_exposure` (primary, from MedicationRequest).**
  Port `new_drug_exposure3.sqlx` → `drug_exposure_semi.sqlx` → `drug_exposure.sqlx`. Preserve: contained medication ingredient unnesting (`medicationCodeableConcept.coding[]`), RxNorm concept mapping, end date imputation 3-tier logic (explicit end → start + days_supply - 1 → start + 29 days, clamped to start).

- [ ] **4.2. Port the 22-drug manual mapping reinforcement.**
  Integrate `drug_manualMappings.sqlx` logic into `int_omop__drug_exposure` as a fallback applied when standard concept mapping returns 0. Do NOT drop — these fill known vocabulary gaps for hematology drugs (lenalidomide, carfilzomib, bortezomib, daratumumab, venetoclax, and 17 more).

- [ ] **4.3. Build `int_omop__drug_exposure_from_procedure`.**
  New stream (new approach only). Extract drug-like procedure codes (e.g., chemotherapy infusion procedures carrying RxNorm coding). Build fresh.

- [ ] **4.4. Build `int_omop__drug_exposure_from_immunization`.**
  New stream (new approach only). Extract drug exposures from FHIR Immunization resources. CVX → RxNorm mapping. Build fresh.

- [ ] **4.5. Implement route concept dual fallback in `int_omop__drug_exposure`.**
  (1) SNOMED route code → `int_omop__standard_concept_map` (Route domain), then (2) FHIR route display text → `seed__route_display_to_concept`. The existing project does not do this.

- [ ] **4.6. Build `int_omop__drug_exposure_from_lot` (artificial LoT medications).**
  Port `artMed.sqlx` + `artMedMap.sqlx` into a new intermediate model. Preserve medication explosion from regimen components and deduplication logic. Union into final `omop__drug_exposure`.

---

### Phase 5 — Measurement Pipeline

- [ ] **5.1. Build `int_omop__measurement` (primary, from FHIR Observation with valueQuantity).**
  Port `measurement_valid.sqlx` → `measurement_semi.sqlx`. Preserve: the 4-format date parser (ISO, JS date string with GMT timezone, year-month, year-only — critical for HealthTree legacy data), code priority logic from `meas_code_unnested.sqlx`, LOINC/SNOMED concept mapping.

- [ ] **5.2. Store `practitioner_id` as string (not `provider_id`) in `int_omop__measurement`.**
  Store `fhir.performer[0].reference` as string. Do the `int_omop__provider.provider_source_value` → `provider_id` join only at the final `omop__measurement` rebuild. Prevents stale FK accumulation.

- [ ] **5.3. Port the BMI reinforcement.**
  Override `measurement_concept_id=3038553`, `operator_concept_id=4172703`, `unit_concept_id=9531` for BMI source codes from `bmi.sqlx`. Implement as a priority layer unioned before the final table (same pattern as existing `meas_adjusted.sqlx`).

- [ ] **5.4. Port body weight and body height reinforcements.**
  Same pattern as BMI. Port from `body_weight.sqlx` (concept 3025315) and `body_height.sqlx` (concept 3023540).

- [ ] **5.5. Port beta2-microglobulin, albumin, ECOG, and ISS measurement reinforcements.**
  Port `beta2micro.sqlx`, `albumin.sqlx`, `ecog.sqlx`, `ecog_fix.sqlx` (measurement variant), `iss.sqlx` (measurement variant). Critical for myeloma clinical data completeness.

- [ ] **5.6. Build `int_omop__measurement_from_condition`.**
  New stream (new approach only). Build fresh.

- [ ] **5.7. Build `int_omop__measurement_from_procedure`.**
  New stream (new approach only). Build fresh.

- [ ] **5.8. Build `int_omop__measurement_from_observation`.**
  New stream (new approach only). Build fresh.

- [ ] **5.9. Build the intermediate marker TABLE `int_omop__measurement_coded`.**
  Lists all measurement_ids currently in `int_omop__measurement` and its sub-streams. Must be a TABLE (not a view), rebuilt every run. Required for cross-domain eviction in Phase 6.8.

---

### Phase 6 — Observation Pipeline

- [ ] **6.1. Build `int_omop__observation` (primary, from FHIR Observation with valueCodeableConcept).**
  Port `norm_observation.sqlx` → `obs_code_unnested.sqlx` → `observation_semi.sqlx`. Preserve: smart code selection with LOINC priority logic, the 4-format date parser, LOINC/SNOMED concept mapping.

- [ ] **6.2. Store `practitioner_id` as string in `int_omop__observation`.**
  Same pattern as measurement. Fresh `provider_id` join at final `omop__observation` rebuild.

- [ ] **6.3. Port the cytogenetic genomic reinforcements.**
  Port `del13q.sqlx` (concept 35977004), `del17p.sqlx`, `t_4_14.sqlx`, `t_6_14.sqlx`, `t_14_16.sqlx`, `hyperdiploidy.sqlx`, `hypodiploidy.sqlx` into a unified override layer (e.g., `int_omop__observation_genomic`). Preserve BOTH matching strategies: REGEXP_EXTRACT on source code AND LIKE pattern on source value.

- [ ] **6.4. Port the ECOG and ISS observation reinforcements.**
  Port `ecog_fix.sqlx` (observation variant) and `iss.sqlx` (observation variant).

- [ ] **6.5. Build `int_omop__observation_from_condition`, `_from_procedure`, `_from_allergy_intolerance`, `_from_person`, `_from_measurement`.**
  New streams (new approach only). Build each fresh. Note: `_from_person` carries demographic data as observations; `_from_measurement` handles fallback routing.

- [ ] **6.6. Port LoT outcome observations.**
  Port `outcomeAsObs.sqlx` (`observation_concept_id=36305408` "Treatment Response") into `int_omop__observation_from_lot_outcome`. Union into final `omop__observation`.

- [ ] **6.7. Build the intermediate marker TABLE `int_omop__observation_mapped`.**
  Symmetric to `int_omop__measurement_coded`. Lists all observation_ids in the observation pipeline. Must be a TABLE, rebuilt every run. Used by measurement eviction.

- [ ] **6.8. Implement cross-domain eviction in final `omop__measurement` and `omop__observation`.**
  - `omop__measurement`: filter out rows where `measurement_id IN (SELECT record_pk FROM int_omop__observation_mapped)`
  - `omop__observation`: filter out rows where `observation_id IN (SELECT record_pk FROM int_omop__measurement_coded)`
  This prevents duplicates when a FHIR Observation gains or loses LOINC coding between runs.

---

### Phase 7 — Episode & Lines of Therapy

- [ ] **7.1. Build `int_omop__episode` (Lines of Therapy).**
  Port `episode_lines_parent.sqlx`. Preserve: disease GUID → SNOMED concept mapping (all GUIDs, not just the 3 currently hardcoded — audit for completeness), and date validation (nullify `episode_end_date` when `< episode_start_date`).

- [ ] **7.2. Build `int_omop__drug_exposure_from_lot` (artificial medications).**
  Port `artMed.sqlx` + `artMedMap.sqlx`. Preserve medication explosion from regimen components and deduplication logic.

- [ ] **7.3. Build `int_omop__procedure_from_lot` (artificial procedures).**
  Port `artProc.sqlx`. LoT surgery/procedure records → `omop__procedure_occurrence`.

- [ ] **7.4. Implement episode open-ended date cap in `omop__episode_event`.**
  From the new approach: cap open episodes at `episode_start_date + 365 days`. Cross-check against existing `episode_event.sqlx` to confirm no logic is lost in migration.

---

### Phase 8 — Derived Tables

- [ ] **8.1. Rebuild `omop__observation_period` with all three fixes merged.**
  The existing project has death date capping (`LEAST(obs_end, death_date)`). The new approach has: include both start AND end dates from all events + Achilles-114 birth year filter. The merged version must have **all three**: aggregate min/max from event start+end dates, validate `event_date >= birth_year`, then cap `observation_period_end_date` at `death_date` using `LEAST()`. Neither approach alone has all three.

- [ ] **8.2. Build `omop__condition_era`.**
  Port from `_newApproach/omop__condition_era.sql` (30-day gap window logic with running-MAX method). Compare against existing `condition_era.sqlx`; the new approach's implementation is more correct. Use the new approach logic.

- [ ] **8.3. Build `omop__drug_era` with ingredient roll-up.**
  Port from `_newApproach/omop__drug_era.sql`. Includes: pre-building a deduplicated drug→ingredient map from `concept_ancestor` (RxNorm Ingredient, shortest path), excluding CVX vaccines, 30-day gap window with `gap_days` computation.

- [ ] **8.4. Build `omop__provider`.**
  Port from `int_omop__provider` (Practitioner + PractitionerRole join). Ensure NUCC specialty mapping and gender mapping are in place.

- [ ] **8.5. Build `omop__death`.**
  Port from `int_omop__death`. Sources: `Patient.deceasedBoolean` and `Patient.deceasedDateTime`. The death date here is the authoritative source for observation period capping.

- [ ] **8.6. Build `omop__note`.**
  Port from `int_omop__note_from_document_reference`. Preserve LOINC document type for `note_class_concept_id`, `encoding_concept_id=32678` (UTF-8), `language_concept_id=4180186` (English).

- [ ] **8.7. Build `omop__cohort` + `omop__cohort_definition` (new).**
  Not in the existing project as formal OMOP tables. Port from `_newApproach/omop__cohort.sql` using `seed__myeloma_snomed_classification`. MM, SMM, MGUS cohorts with earliest diagnosis as `cohort_start_date` and death/observation_end/current_date as `cohort_end_date`.

- [ ] **8.8. Build `omop__cdm_source` and `omop__metadata` (new).**
  Not in the existing project. Port from new approach. Hardcode HealthTree CDM metadata, CDM version 5.4, vocabulary version, Athena reference date.

---

### Phase 9 — Vocabulary Tables

- [ ] **9.1. Wire up all 10 vocabulary pass-through tables.**
  `omop__concept`, `omop__concept_ancestor`, `omop__concept_class`, `omop__concept_relationship`, `omop__concept_synonym`, `omop__vocabulary`, `omop__domain`, `omop__drug_strength`, `omop__relationship`, `omop__source_to_concept_map`. These point to `stg_raw_athena__*` from Phase 1.1. Required for FK test resolution in YAML schemas.

---

### Phase 10 — YAML Schema Tests

- [ ] **10.1. Apply YAML schema files to all merged tables.**
  Port all 23 YAML files from `_newApproach/schemas/`. Adjust syntax to match chosen framework (Dataform uses inline `config {}` assertions; dbt uses `schema.yml`).

- [ ] **10.2. Calibrate `concept_zero_rate` thresholds against empirical production data.**
  The new approach defines thresholds theoretically. After adding reinforcements, re-measure actual zero rates and adjust:
  - Observation: 72% → should decrease after genomic reinforcements
  - Procedure: 36% → verify
  - Measurement: 11% → should decrease after BMI/vitals reinforcements
  - Drug: 7% → should decrease after manual mappings

- [ ] **10.3. Add DQD plausibility tests from the existing test suite.**
  Convert `dataQualityTests/FIELD_plausibleBeforeDeath.sql`, `FIELD_plausibleAfterBirth.sql`, `FIELD_plausibleDuringLife.sql`, `FIELD_plausibleStartBeforeEnd.sql`, `FIELD_isStandardValidConcept.sql`, `FIELD_measureValueCompleteness.sql`, and all remaining tests into dbt/Dataform tests. The 3 patients with incorrect death dates (Finding 1) will still trigger until source data is fixed — document this as a known exception.

- [ ] **10.4. Add `date_not_in_future` and `date_not_after` tests to all event tables.**
  Attach to: condition_occurrence, drug_exposure, measurement, observation, procedure_occurrence, visit_occurrence, observation_period.

- [ ] **10.5. Add `outside_observation_period` test to all clinical event tables.**
  Validates that no event dates fall outside the person's observation period. Key conformance check — was already failing for the 3 patients with incorrect death dates.

---

### Phase 11 — End-to-End Validation

- [ ] **11.1. Full build and row count comparison against current production.**
  For each OMOP table, compare: `COUNT(*)`, `COUNT(DISTINCT person_id)`, `SUM(CASE WHEN concept_id = 0 THEN 1 END)`. Any significant delta requires investigation before promoting to production.

- [ ] **11.2. Re-run the full DQD suite. Target score: >91.9/100.**
  Expected improvements: observation period fix resolves the 56.3% end-date violations; genomic reinforcements reduce zero-rate observations; manual drug mappings reduce zero-rate drugs. The 3 bad death date patients remain failures until the source is corrected.

- [ ] **11.3. Validate episode and LoT integrity.**
  Confirm artificial drug/procedure/observation records still link to correct `episode_id`s. Audit the disease GUID → concept mapping for completeness across all active GUIDs in the source (not just the 3 hardcoded in `episode_lines_parent.sqlx`).

- [ ] **11.4. Validate concept domain routing across all tables.**
  Run `domain_routing_valid` tests. Every non-zero `concept_id` must belong to the expected OMOP domain (Condition, Drug, Measurement, Observation, Procedure, Visit, etc.). This was not enforced in the old approach.
