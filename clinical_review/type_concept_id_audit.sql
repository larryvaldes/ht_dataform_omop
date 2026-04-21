-- ============================================================
-- Type Concept ID Audit (All Clinical Tables)
-- ============================================================
-- *_type_concept_id encodes the provenance of a record (EHR entry,
-- claim, patient-reported, etc.). It is a required field per OMOP CDM
-- and must never be 0 or NULL.
--
-- Common correct values:
--   32817  → EHR (most records from HealthTree)
--   32020  → Encounter Diagnosis
--   32827  → Registry
--   38000245 → Problem List Entry
--   44786628 → Primary Diagnosis
--   44786629 → Secondary Diagnosis
--
-- This query shows the breakdown per table so the ETL owner can
-- identify which tables still need their type_concept_id corrected.
-- ============================================================

-- Summary: zero/null rate per table
SELECT
  omop_table,
  field,
  total_rows,
  zero_or_null_count,
  ROUND(100.0 * zero_or_null_count / NULLIF(total_rows, 0), 2) AS pct_invalid,
  non_zero_count,
  ROUND(100.0 * non_zero_count / NULLIF(total_rows, 0), 2)     AS pct_valid
FROM (

  SELECT 'condition_occurrence' AS omop_table, 'condition_type_concept_id' AS field,
    COUNT(*)                                                         AS total_rows,
    COUNTIF(condition_type_concept_id = 0 OR condition_type_concept_id IS NULL) AS zero_or_null_count,
    COUNTIF(condition_type_concept_id != 0 AND condition_type_concept_id IS NOT NULL) AS non_zero_count
  FROM `healthtree-production.dataform.condition_occurrence`

  UNION ALL

  SELECT 'drug_exposure', 'drug_type_concept_id',
    COUNT(*),
    COUNTIF(drug_type_concept_id = 0 OR drug_type_concept_id IS NULL),
    COUNTIF(drug_type_concept_id != 0 AND drug_type_concept_id IS NOT NULL)
  FROM `healthtree-production.dataform.drug_exposure`

  UNION ALL

  SELECT 'measurement', 'measurement_type_concept_id',
    COUNT(*),
    COUNTIF(measurement_type_concept_id = 0 OR measurement_type_concept_id IS NULL),
    COUNTIF(measurement_type_concept_id != 0 AND measurement_type_concept_id IS NOT NULL)
  FROM `healthtree-production.dataform.measurement`

  UNION ALL

  SELECT 'observation', 'observation_type_concept_id',
    COUNT(*),
    COUNTIF(observation_type_concept_id = 0 OR observation_type_concept_id IS NULL),
    COUNTIF(observation_type_concept_id != 0 AND observation_type_concept_id IS NOT NULL)
  FROM `healthtree-production.dataform.observation`

  UNION ALL

  SELECT 'procedure_occurrence', 'procedure_type_concept_id',
    COUNT(*),
    COUNTIF(procedure_type_concept_id = 0 OR procedure_type_concept_id IS NULL),
    COUNTIF(procedure_type_concept_id != 0 AND procedure_type_concept_id IS NOT NULL)
  FROM `healthtree-production.dataform.procedure_occurrence`

  UNION ALL

  SELECT 'visit_occurrence', 'visit_type_concept_id',
    COUNT(*),
    COUNTIF(visit_type_concept_id = 0 OR visit_type_concept_id IS NULL),
    COUNTIF(visit_type_concept_id != 0 AND visit_type_concept_id IS NOT NULL)
  FROM `healthtree-production.dataform.visit_occurrence`

  UNION ALL

  SELECT 'death', 'death_type_concept_id',
    COUNT(*),
    COUNTIF(death_type_concept_id = 0 OR death_type_concept_id IS NULL),
    COUNTIF(death_type_concept_id != 0 AND death_type_concept_id IS NOT NULL)
  FROM `healthtree-production.dataform.death`

)

ORDER BY pct_invalid DESC
