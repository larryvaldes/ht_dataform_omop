-- ============================================================
-- Patients with Clinical Data but No Observation Period
-- ============================================================
-- Per OMOP CDM, any patient who has clinical data MUST have at least
-- one entry in the OBSERVATION_PERIOD table. If 40%+ of patients are
-- missing it, the observation_period ETL logic is not covering all
-- persons who have records.
--
-- ACTION: Investigate observation_period.sqlx — ensure the event
-- collection CTEs cover every patient that has records in at least
-- one clinical table.
-- ============================================================

WITH

patients_with_obs_period AS (
  SELECT DISTINCT person_id
  FROM `healthtree-production.dataform.observation_period`
),

clinical_events AS (
  SELECT person_id, person_source_value, 'condition_occurrence' AS src
    FROM `healthtree-production.dataform.condition_occurrence`
  UNION ALL
  SELECT person_id, person_source_value, 'measurement'
    FROM `healthtree-production.dataform.measurement`
  UNION ALL
  SELECT person_id, person_source_value, 'observation'
    FROM `healthtree-production.dataform.observation`
  UNION ALL
  SELECT person_id, person_source_value, 'drug_exposure'
    FROM `healthtree-production.dataform.drug_exposure`
  UNION ALL
  SELECT person_id, person_source_value, 'procedure_occurrence'
    FROM `healthtree-production.dataform.procedure_occurrence`
  UNION ALL
  SELECT person_id, person_source_value, 'visit_occurrence'
    FROM `healthtree-production.dataform.visit_occurrence`
),

clinical_counts AS (
  SELECT
    person_id,
    person_source_value,
    COUNT(*)                                     AS total_clinical_records,
    COUNTIF(src = 'condition_occurrence')        AS condition_count,
    COUNTIF(src = 'measurement')                 AS measurement_count,
    COUNTIF(src = 'observation')                 AS observation_count,
    COUNTIF(src = 'drug_exposure')               AS drug_count,
    COUNTIF(src = 'procedure_occurrence')        AS procedure_count,
    COUNTIF(src = 'visit_occurrence')            AS visit_count
  FROM clinical_events
  GROUP BY person_id, person_source_value
)

SELECT
  cc.person_source_value                         AS username,
  u.email                                        AS email,
  cc.total_clinical_records,
  cc.condition_count,
  cc.measurement_count,
  cc.observation_count,
  cc.drug_count,
  cc.procedure_count,
  cc.visit_count

FROM clinical_counts cc
LEFT JOIN patients_with_obs_period op ON op.person_id = cc.person_id
LEFT JOIN `healthtree-production.HT.users` u
  ON u.userId = cc.person_source_value

WHERE op.person_id IS NULL          -- has clinical data but NO observation_period row
  AND cc.total_clinical_records > 0

ORDER BY cc.total_clinical_records DESC
