-- ============================================================
-- Events Before Birth Date — Clinical Team Review
-- ============================================================
-- Finds clinical records dated before the patient's recorded birth date.
-- May indicate a data entry error in birth_datetime (person table)
-- OR in the event date itself.
--
-- Severity based on how far before birth the earliest violation falls:
--   LOW    :   1 –  90 days before birth
--   MEDIUM :  91 – 365 days before birth
--   HIGH   : 366+ days before birth
-- ============================================================

WITH

births AS (
  SELECT
    person_id,
    person_source_value,
    DATE(birth_datetime) AS birth_date
  FROM `healthtree-production.dataform.person`
  WHERE birth_datetime IS NOT NULL
),

conditions AS (
  SELECT person_source_value, SAFE_CAST(condition_start_DATE AS DATE) AS event_date, 'condition_occurrence' AS source_table
  FROM `healthtree-production.dataform.condition_occurrence` WHERE condition_start_DATE IS NOT NULL
),
measurements AS (
  SELECT person_source_value, SAFE_CAST(measurement_DATE AS DATE) AS event_date, 'measurement' AS source_table
  FROM `healthtree-production.dataform.measurement` WHERE measurement_DATE IS NOT NULL
),
observations AS (
  SELECT person_source_value, SAFE_CAST(observation_DATE AS DATE) AS event_date, 'observation' AS source_table
  FROM `healthtree-production.dataform.observation` WHERE observation_DATE IS NOT NULL
),
drugs AS (
  SELECT person_source_value, SAFE_CAST(drug_exposure_start_DATE AS DATE) AS event_date, 'drug_exposure' AS source_table
  FROM `healthtree-production.dataform.drug_exposure` WHERE drug_exposure_start_DATE IS NOT NULL
),
procedures AS (
  SELECT person_source_value, SAFE_CAST(procedure_date AS DATE) AS event_date, 'procedure_occurrence' AS source_table
  FROM `healthtree-production.dataform.procedure_occurrence` WHERE procedure_date IS NOT NULL
),
visits AS (
  SELECT person_source_value, SAFE_CAST(visit_start_DATE AS DATE) AS event_date, 'visit_occurrence' AS source_table
  FROM `healthtree-production.dataform.visit_occurrence` WHERE visit_start_DATE IS NOT NULL
),

all_events AS (
  SELECT * FROM conditions   UNION ALL SELECT * FROM measurements
  UNION ALL SELECT * FROM observations UNION ALL SELECT * FROM drugs
  UNION ALL SELECT * FROM procedures   UNION ALL SELECT * FROM visits
),

violations AS (
  SELECT
    b.person_id,
    b.person_source_value,
    b.birth_date,
    e.event_date,
    e.source_table,
    DATE_DIFF(b.birth_date, e.event_date, DAY) AS days_before_birth
  FROM births b
  JOIN all_events e
    ON e.person_source_value = b.person_source_value
   AND e.event_date < b.birth_date
),

per_patient AS (
  SELECT
    person_id,
    person_source_value,
    birth_date,
    MAX(days_before_birth)                                         AS max_days_before_birth,
    MIN(event_date)                                                AS earliest_violation_date,
    COUNT(*)                                                       AS total_violations,
    COUNTIF(source_table = 'condition_occurrence')                 AS condition_occurrence_count,
    COUNTIF(source_table = 'measurement')                          AS measurement_count,
    COUNTIF(source_table = 'observation')                          AS observation_count,
    COUNTIF(source_table = 'drug_exposure')                        AS drug_exposure_count,
    COUNTIF(source_table = 'procedure_occurrence')                 AS procedure_occurrence_count,
    COUNTIF(source_table = 'visit_occurrence')                     AS visit_occurrence_count
  FROM violations
  GROUP BY person_id, person_source_value, birth_date
)

SELECT
  pp.person_source_value                        AS username,
  u.email                                       AS email,
  pp.birth_date,
  pp.earliest_violation_date,
  pp.max_days_before_birth,

  CASE
    WHEN pp.max_days_before_birth BETWEEN   1 AND  90 THEN 'LOW'
    WHEN pp.max_days_before_birth BETWEEN  91 AND 365 THEN 'MEDIUM'
    ELSE                                               'HIGH'
  END                                           AS severity,

  pp.total_violations,
  pp.condition_occurrence_count,
  pp.measurement_count,
  pp.observation_count,
  pp.drug_exposure_count,
  pp.procedure_occurrence_count,
  pp.visit_occurrence_count

FROM per_patient pp
LEFT JOIN `healthtree-production.HT.users` u
  ON u.userId = pp.person_source_value

ORDER BY pp.max_days_before_birth DESC
