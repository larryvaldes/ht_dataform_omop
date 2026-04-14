# Linear Tasks: Migrate Dataform Code to dbt

> Generated: 2026-04-14  
> Linear Initiative: Migrate Dataform Code to DBT  
> Related: `MERGE_PLAN.md`

---

## Epic 1 — dbt Project Scaffolding

*Set up the skeleton before any models are built. Nothing else can start without this.*

- [ ] **1.1 Initialize dbt project for OMOP pipeline**
  Create `dbt_project.yml`, `profiles.yml` (BigQuery), `packages.yml`. Configure dev/prod targets pointing to `healthtree-production`. Run `dbt debug` to confirm connection.

- [ ] **1.2 Install and configure required dbt packages**
  Add `dbt-utils` (for `surrogate_key`, `accepted_range`, `relationships_where`). Add any other packages needed for custom test macros. Run `dbt deps`.

- [ ] **1.3 Implement custom macro: `surrogate_int_id`**
  Deterministic integer surrogate key generator used by `observation_period`, `condition_era`, and `drug_era`. Port from `_newApproach` design.

- [ ] **1.4 Implement custom schema test macros (batch 1)**
  `concept_zero_rate`, `domain_routing_valid`, `type_concept_valid`, `person_completeness`. Blocking for all YAML schema files.

- [ ] **1.5 Implement custom schema test macros (batch 2)**
  `value_completeness`, `outside_observation_period`, `date_not_in_future`, `date_not_after`, `fk_null_rate`, `concept_mapping_rate`.

- [ ] **1.6 Create seed files**
  - `seed__myeloma_snomed_classification` (MM/SMM/MGUS SNOMED codes with category labels)
  - `seed__route_display_to_concept` (FHIR route display text → concept_id)
  - `map__hl7_omop` (HL7 demographic codes → OMOP concepts)

---

## Epic 2 — Vocabulary & Staging Layer

*Decouple all vocabulary lookups from hardcoded `healthtree-production.OMOP.*` references.*

- [ ] **2.1 Build `stg_raw_athena__*` vocabulary pass-through models**
  9 models: `concept`, `concept_ancestor`, `concept_class`, `concept_relationship`, `concept_synonym`, `vocabulary`, `domain`, `relationship`, `drug_strength`. Simple `SELECT *` from existing `OMOP.*` BigQuery tables.

- [ ] **2.2 Build `int_omop__standard_concept_map`**
  Port `vocabulary_mapping.sqlx` (URN OID → vocab name) and extend to resolve source codes → standard concept_id by domain. Used by drug route resolution and location country mapping.

- [ ] **2.3 Build vocabulary final tables (`omop__concept`, `omop__vocabulary`, etc.)**
  Wire up the 10 OMOP vocabulary tables as pass-throughs from `stg_raw_athena__*`. Required for FK test resolution in all YAML schemas.

- [ ] **2.4 Build `omop__source_to_concept_map`, `omop__cdm_source`, `omop__metadata`**
  `source_to_concept_map` sources from `map__hl7_omop`. `cdm_source` and `metadata` are hardcoded HealthTree CDM v5.4 metadata rows.

---

## Epic 3 — Person, Visit & Reference Data

*Person identity and the reference data that all clinical tables depend on.*

- [ ] **3.1 Build `int_omop__person`**
  Port `universe.sqlx` + `person_gender/race/ethnicity.sqlx` into one intermediate model. Preserve: universe exclusion (internal emails, deleted.com), gender coalesce (FHIR → HT.users), ISO birth date extraction, ROW_NUMBER `person_id` generation.

- [ ] **3.2 Build `int_omop__visit_occurrence` and `int_omop__visit_detail`**
  Primary: port `visit_valid.sqlx` → `visit_occurrence.sqlx`. Populate `visit_concept_id`, `admitted_from_concept_id`, `discharged_to_concept_id`. Link `visit_detail_id` to parent `visit_occurrence_id`.

- [ ] **3.3 Build `int_facility__organization` (care site) and `int_omop__provider`**
  Care site: port `care_site.sqlx` with place-of-service rules (Community Oncology → 8716, hospital-based → 8756, Sandbox → 0). Provider: Practitioner + PractitionerRole join with NUCC specialty mapping.

- [ ] **3.4 Build `int_location__patient_address_condense_legacy`**
  Port `location.sqlx`. Address deduplication by completeness (rank by null count across address_line_1, city, state, zip, county; pick most complete). Add SNOMED country → standard concept via `int_omop__standard_concept_map`.

- [ ] **3.5 Build `int_omop__death`**
  Port `death.sqlx`. Sources: `Patient.deceasedBoolean` and `Patient.deceasedDateTime`. Authoritative death date used for observation period capping.

- [ ] **3.6 Build final tables: `omop__person`, `omop__visit_occurrence`, `omop__visit_detail`, `omop__care_site`, `omop__location`, `omop__provider`, `omop__death`**
  Wire up each final table from its corresponding intermediate model.

---

## Epic 4 — Condition & Procedure Pipelines

- [ ] **4.1 Build `int_omop__condition_occurrence` (primary stream)**
  Port `normalizations-Condition` → `condition_occurrence.sqlx`. Preserve SNOMED/ICD concept mapping, encounter reference → `visit_occurrence_id` join, `condition_status_concept_id` mapping.

- [ ] **4.2 Build `int_omop__condition_occurrence_from_allergy_intolerance`**
  New stream (does not exist in current project). Extract conditions from FHIR AllergyIntolerance resources.

- [ ] **4.3 Build `int_omop__procedure_occurrence` (primary) and `int_omop__procedure_from_condition`**
  Primary: port `norm_r4_proc` → `procedure_occurrence.sqlx`. New stream: extract procedure-like codes from Condition resources.

- [ ] **4.4 Build final tables: `omop__condition_occurrence`, `omop__procedure_occurrence`**
  Union all streams. Apply sentinel date filter (`> '1902-01-01'` and `<= current_date()`). This filter exists in `_newApproach` but not in the current Dataform project.

---

## Epic 5 — Drug Exposure Pipeline

- [ ] **5.1 Build `int_omop__drug_exposure` (primary, from MedicationRequest)**
  Port `new_drug_exposure3.sqlx` → `drug_exposure_semi.sqlx`. Preserve: contained medication ingredient unnesting (`medicationCodeableConcept.coding[]`), RxNorm concept mapping, end date 3-tier imputation (explicit → start + days_supply − 1 → start + 29 days, clamped to start).

- [ ] **5.2 Port 22-drug manual mapping reinforcement into `int_omop__drug_exposure`**
  Port `drug_manualMappings.sqlx` as a fallback override when standard concept mapping returns 0. Do not drop — fills known vocabulary gaps for: lenalidomide, carfilzomib, bortezomib, daratumumab, venetoclax, and 17 more hematology drugs.

- [ ] **5.3 Implement route concept dual fallback in `int_omop__drug_exposure`**
  (1) SNOMED route code → `int_omop__standard_concept_map` (Route domain), then (2) FHIR route display text → `seed__route_display_to_concept`. Not present in current project.

- [ ] **5.4 Build `int_omop__drug_exposure_from_procedure` and `_from_immunization`**
  Two new streams. Procedure stream: drug-like infusion procedures with RxNorm coding. Immunization stream: FHIR Immunization → CVX → RxNorm mapping.

- [ ] **5.5 Build `int_omop__drug_exposure_from_lot` (artificial LoT medications)**
  Port `artMed.sqlx` + `artMedMap.sqlx`. Preserve medication explosion from LoT regimen components and deduplication logic.

- [ ] **5.6 Build final table: `omop__drug_exposure`**
  Union all 4 streams. Apply sentinel date filter.

---

## Epic 6 — Measurement Pipeline

- [ ] **6.1 Build `int_omop__measurement` (primary) with 4-format date parser**
  Port `measurement_valid.sqlx` → `measurement_semi.sqlx`. Critical: preserve the 4-format date parser (ISO 8601, JavaScript date string with GMT timezone offset, year-month only, year only). Store `practitioner_id` as string — not `provider_id` — for incremental FK safety.

- [ ] **6.2 Port BMI, body weight, and body height measurement reinforcements**
  Port `bmi.sqlx` (concept 3038553, operator 4172703, unit 9531), `body_weight.sqlx` (concept 3025315), `body_height.sqlx` (concept 3023540) as override layers in the measurement pipeline.

- [ ] **6.3 Port beta2-microglobulin, albumin, ECOG, and ISS measurement reinforcements**
  Port `beta2micro.sqlx`, `albumin.sqlx`, `ecog.sqlx`, `ecog_fix.sqlx` (measurement variant), `iss.sqlx` (measurement variant). Critical for myeloma clinical data completeness.

- [ ] **6.4 Build `int_omop__measurement_from_condition`, `_from_procedure`, `_from_observation`**
  Three new streams not present in the current project. Build each fresh.

- [ ] **6.5 Build intermediate marker TABLE `int_omop__measurement_coded`**
  Lists all measurement_ids currently in the measurement pipeline. Must be a TABLE (not a view), rebuilt every run. Required for observation cross-domain eviction in task 7.6.

- [ ] **6.6 Build final table: `omop__measurement`**
  Union all 4 streams. Apply fresh `provider_id` join (practitioner_id → `int_omop__provider.provider_source_value`). Cross-domain eviction: exclude rows where `measurement_id IN (SELECT record_pk FROM int_omop__observation_mapped)`. Sentinel date filter.

---

## Epic 7 — Observation Pipeline

*Depends on Epic 6 — marker tables must exist before eviction logic can be wired up.*

- [ ] **7.1 Build `int_omop__observation` (primary) with 4-format date parser**
  Port `norm_observation.sqlx` → `obs_code_unnested.sqlx` → `observation_semi.sqlx`. Preserve: LOINC priority code selection logic, 4-format date parser (same as measurement), LOINC/SNOMED concept mapping. Store `practitioner_id` as string for FK safety.

- [ ] **7.2 Port cytogenetic genomic reinforcements**
  Port `del13q.sqlx` (concept 35977004), `del17p.sqlx`, `t_4_14.sqlx`, `t_6_14.sqlx`, `t_14_16.sqlx`, `hyperdiploidy.sqlx`, `hypodiploidy.sqlx` into a unified intermediate override layer. Preserve both matching strategies: REGEXP_EXTRACT on source code AND LIKE on source value string.

- [ ] **7.3 Port ECOG, ISS observation reinforcements and LoT outcome observations**
  Port `ecog_fix.sqlx` (observation variant), `iss.sqlx` (observation variant). Port `outcomeAsObs.sqlx` (`observation_concept_id=36305408` "Treatment Response") as `int_omop__observation_from_lot_outcome`.

- [ ] **7.4 Build `int_omop__observation_from_*` new streams**
  Build 5 new streams: `_from_condition`, `_from_procedure`, `_from_allergy_intolerance`, `_from_person` (demographics as observations), `_from_measurement` (measurement fallback routing).

- [ ] **7.5 Build intermediate marker TABLE `int_omop__observation_mapped`**
  Symmetric to `int_omop__measurement_coded`. Lists all observation_ids in the observation pipeline. Must be a TABLE, rebuilt every run. Used by measurement eviction in task 6.6.

- [ ] **7.6 Build final table: `omop__observation`**
  Union all 6 streams. Fresh `provider_id` join. Cross-domain eviction: exclude rows where `observation_id IN (SELECT record_pk FROM int_omop__measurement_coded)`. Sentinel date filter.

---

## Epic 8 — Episode & Lines of Therapy

- [ ] **8.1 Build `int_omop__episode` (Lines of Therapy)**
  Port `episode_lines_parent.sqlx`. Preserve disease GUID → SNOMED concept mapping. Audit all active disease GUIDs in source — current project hardcodes only 3 (MM, MDS, AML); verify none are missing. Keep date validation: nullify `episode_end_date` when `< episode_start_date`.

- [ ] **8.2 Build `int_omop__procedure_from_lot` (artificial LoT procedures)**
  Port `artProc.sqlx`. LoT surgery/procedure records → `omop__procedure_occurrence`.

- [ ] **8.3 Build `omop__episode` and `omop__episode_event`**
  Port both final tables. Implement open-ended episode cap in `omop__episode_event`: default `episode_end_date` to `episode_start_date + 365 days` for open episodes to prevent over-matching future events.

- [ ] **8.4 Build `omop__note`**
  Port from `int_omop__note_from_document_reference` (FHIR DocumentReference). Preserve: LOINC document type for `note_class_concept_id`, `encoding_concept_id=32678` (UTF-8), `language_concept_id=4180186` (English).

---

## Epic 9 — Derived & Aggregate Tables

- [ ] **9.1 Build `omop__observation_period` (merged fix — highest priority in this epic)**
  Merge all three fixes that no single approach has in full: (1) aggregate min/max from both start AND end dates across all event tables, (2) filter `event_date >= birth_year` (Achilles-114), (3) cap `observation_period_end_date` at `death_date` using `LEAST()`.

- [ ] **9.2 Build `omop__condition_era`**
  Implement 30-day gap window algorithm from `_newApproach/omop__condition_era.sql` (running-MAX method). Compare against existing `condition_era.sqlx`; use new approach logic.

- [ ] **9.3 Build `omop__drug_era` with RxNorm ingredient roll-up**
  Port from `_newApproach/omop__drug_era.sql`. Includes: deduplicated drug→ingredient map from `concept_ancestor` (RxNorm Ingredient class, shortest path), CVX vaccine exclusion, 30-day gap window with `gap_days` computation.

- [ ] **9.4 Build `omop__cohort` and `omop__cohort_definition`**
  Not in current project as formal OMOP tables. MM, SMM, MGUS cohorts via `seed__myeloma_snomed_classification`. Earliest diagnosis as `cohort_start_date`. Cohort end: death_date → observation_period_end_date → current_date(), in that order.

---

## Epic 10 — Schema Tests & Validation

- [ ] **10.1 Port YAML schema files to dbt format (clinical tables)**
  Port `omop__person.yml`, `omop__visit_occurrence.yml`, `omop__condition_occurrence.yml`, `omop__drug_exposure.yml`, `omop__measurement.yml`, `omop__observation.yml`, `omop__procedure_occurrence.yml`, `omop__visit_detail.yml`.

- [ ] **10.2 Port YAML schema files to dbt format (derived + vocabulary tables)**
  Port `omop__observation_period.yml`, `omop__drug_era.yml`, `omop__episode.yml`, `omop__note.yml`, `omop__vocabulary_tables.yml`, and remaining schema files.

- [ ] **10.3 Calibrate `concept_zero_rate` thresholds against production data**
  After reinforcements are in place, measure actual zero rates per domain and update YAML thresholds. Expected changes: observation < 72%, measurement < 11%, drug < 7%, procedure ≤ 36%.

- [ ] **10.4 Port DQD plausibility tests from `dataQualityTests/` as dbt tests**
  Convert `FIELD_plausibleBeforeDeath.sql`, `FIELD_plausibleAfterBirth.sql`, `FIELD_plausibleDuringLife.sql`, `FIELD_plausibleStartBeforeEnd.sql`, `FIELD_isStandardValidConcept.sql`, `FIELD_measureValueCompleteness.sql`, and remaining 20+ tests. Document the 3 known bad-death-date patients as expected failures — do not suppress the tests.

- [ ] **10.5 Row count and concept mapping validation: dbt output vs. Dataform production**
  For each OMOP table compare: `COUNT(*)`, `COUNT(DISTINCT person_id)`, zero-concept rate. Investigate any significant delta before promoting to production.

- [ ] **10.6 Re-run full DQD suite against dbt output. Target: > 91.9 / 100**
  Expected score increase from: observation period fix, genomic reinforcements, manual drug mappings. The 3 bad-death-date patients remain failures pending source correction in `HT.users.passedAwayDate`.

---

## Dependency Order

```
Epic 1 (Scaffolding)
  └─► Epic 2 (Vocabulary)
        └─► Epic 3 (Person & Visit)
              └─► Epic 4 (Condition & Procedure)
              └─► Epic 5 (Drug Exposure)
              └─► Epic 6 (Measurement)  ──► Epic 7 (Observation)
              └─► Epic 8 (Episode & LoT)
        All of 3–8 ──► Epic 9 (Derived Tables)
        Epic 1 macros ──► Epic 10 (Schema Tests, runs alongside 3–9)
```

**Total: 45 tasks across 10 epics.**
