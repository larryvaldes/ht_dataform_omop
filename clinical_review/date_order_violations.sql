-- ============================================================
-- Date Order Violations — End Date Before Start Date
-- ============================================================
-- Finds records where end_date < start_date across all OMOP tables
-- that carry a period. These are structural data quality violations
-- per OMOP CDM and should be corrected in the ETL or source data.
--
-- Note: EPISODE end_date inversions from ANISH source were already
-- patched in episode_lines_parent.sqlx (NULL-ified). This query will
-- confirm whether any survive in the final episode table.
-- ============================================================

SELECT
  'observation_period'              AS omop_table,
  CAST(person_id AS STRING)         AS record_id,
  observation_period_start_date     AS start_date,
  observation_period_end_date       AS end_date,
  DATE_DIFF(
    observation_period_start_date,
    observation_period_end_date, DAY
  )                                 AS days_inverted,
  NULL                              AS person_source_value

FROM `healthtree-production.dataform.observation_period`
WHERE observation_period_end_date < observation_period_start_date

UNION ALL

SELECT
  'episode',
  CAST(episode_id AS STRING),
  episode_start_date,
  episode_end_date,
  DATE_DIFF(episode_start_date, episode_end_date, DAY),
  person_source_value

FROM `healthtree-production.dataform.episode`
WHERE episode_end_date IS NOT NULL
  AND episode_end_date < episode_start_date

UNION ALL

SELECT
  'procedure_occurrence',
  CAST(procedure_occurrence_id AS STRING),
  procedure_date,
  procedure_end_date,
  DATE_DIFF(procedure_date, procedure_end_date, DAY),
  person_source_value

FROM `healthtree-production.dataform.procedure_occurrence`
WHERE procedure_end_date IS NOT NULL
  AND procedure_end_date < procedure_date

UNION ALL

SELECT
  'drug_exposure',
  CAST(drug_exposure_id AS STRING),
  drug_exposure_start_DATE,
  drug_exposure_end_DATE,
  DATE_DIFF(drug_exposure_start_DATE, drug_exposure_end_DATE, DAY),
  person_source_value

FROM `healthtree-production.dataform.drug_exposure`
WHERE drug_exposure_end_DATE IS NOT NULL
  AND drug_exposure_end_DATE < drug_exposure_start_DATE

UNION ALL

SELECT
  'visit_occurrence',
  CAST(visit_occurrence_id AS STRING),
  visit_start_DATE,
  visit_end_DATE,
  DATE_DIFF(visit_start_DATE, visit_end_DATE, DAY),
  person_source_value

FROM `healthtree-production.dataform.visit_occurrence`
WHERE visit_end_DATE IS NOT NULL
  AND visit_end_DATE < visit_start_DATE

UNION ALL

SELECT
  'condition_occurrence',
  CAST(condition_occurrence_id AS STRING),
  condition_start_DATE,
  condition_end_DATE,
  DATE_DIFF(condition_start_DATE, condition_end_DATE, DAY),
  person_source_value

FROM `healthtree-production.dataform.condition_occurrence`
WHERE condition_end_DATE IS NOT NULL
  AND condition_end_DATE < condition_start_DATE

ORDER BY omop_table, days_inverted DESC
