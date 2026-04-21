-- ============================================================
-- Death Table: Zero Values That Should Be NULL
-- ============================================================
-- The OMOP CDM reviewer flagged two issues in the DEATH table:
--
--   1. death_type_concept_id = 0
--      This field is required and must be a valid Type Concept.
--      For EHR-sourced death records the correct value is 32817 (EHR).
--      Current ETL in death.sqlx hardcodes: 0 as death_type_concept_id
--      → ACTION: Replace 0 with 32817 in death.sqlx
--
--   2. cause_concept_id = 0
--      When cause of death is unknown the field should be NULL, not 0.
--      Current ETL hardcodes: 0 as cause_concept_id
--      → ACTION: Replace 0 with NULL in death.sqlx
-- ============================================================

-- Scope of each issue
SELECT
  'death_type_concept_id = 0'                                    AS issue,
  COUNT(*)                                                       AS affected_rows,
  COUNT(DISTINCT person_id)                                      AS affected_patients,
  'Replace hardcoded 0 with 32817 (EHR) in death.sqlx'          AS etl_fix
FROM `healthtree-production.dataform.death`
WHERE death_type_concept_id = 0

UNION ALL

SELECT
  'cause_concept_id = 0',
  COUNT(*),
  COUNT(DISTINCT person_id),
  'Replace hardcoded 0 with NULL in death.sqlx — unknown cause of death should be NULL per OMOP CDM'
FROM `healthtree-production.dataform.death`
WHERE cause_concept_id = 0

UNION ALL

-- Sanity check: any non-zero values already present?
SELECT
  'cause_concept_id != 0 (already mapped)',
  COUNT(*),
  COUNT(DISTINCT person_id),
  'These are correctly mapped — no action needed'
FROM `healthtree-production.dataform.death`
WHERE cause_concept_id != 0 AND cause_concept_id IS NOT NULL

ORDER BY affected_rows DESC
