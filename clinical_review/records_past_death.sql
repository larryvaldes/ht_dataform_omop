-- ============================================================
-- Records Past Death Date — Clinical Team Review
-- ============================================================
-- Purpose : Identify patients who have clinical records dated
--           after their recorded death date. Intended for the
--           clinical team to verify whether the death date is
--           correct or is a data entry error in HT.users.passedAwayDate.
--
-- Severity is based on the worst-case record (furthest past death):
--   LOW      :   1 –  90 days after death
--   MEDIUM   :  91 – 365 days after death
--   HIGH     : 366 – 1095 days after death  (1–3 years)
--   CRITICAL : 1096+ days after death       (>3 years)
-- ============================================================

WITH

-- Deceased patients with a valid death date
deceased AS (
  SELECT
    d.person_id,
    d.person_source_value,
    d.death_DATE
  FROM `healthtree-production.dataform.death` d
  WHERE d.death_DATE IS NOT NULL
),

-- ── Clinical events per table ──────────────────────────────

conditions AS (
  SELECT
    person_source_value,
    SAFE_CAST(condition_start_DATE AS DATE) AS event_date,
    'condition_occurrence' AS source_table
  FROM `healthtree-production.dataform.condition_occurrence`
  WHERE condition_start_DATE IS NOT NULL
),

measurements AS (
  SELECT
    person_source_value,
    SAFE_CAST(measurement_DATE AS DATE) AS event_date,
    'measurement' AS source_table
  FROM `healthtree-production.dataform.measurement`
  WHERE measurement_DATE IS NOT NULL
),

observations AS (
  SELECT
    person_source_value,
    SAFE_CAST(observation_DATE AS DATE) AS event_date,
    'observation' AS source_table
  FROM `healthtree-production.dataform.observation`
  WHERE observation_DATE IS NOT NULL
),

drugs AS (
  SELECT
    person_source_value,
    SAFE_CAST(drug_exposure_start_DATE AS DATE) AS event_date,
    'drug_exposure' AS source_table
  FROM `healthtree-production.dataform.drug_exposure`
  WHERE drug_exposure_start_DATE IS NOT NULL
),

procedures AS (
  SELECT
    person_source_value,
    SAFE_CAST(procedure_date AS DATE) AS event_date,
    'procedure_occurrence' AS source_table
  FROM `healthtree-production.dataform.procedure_occurrence`
  WHERE procedure_date IS NOT NULL
),

visits AS (
  SELECT
    person_source_value,
    SAFE_CAST(visit_start_DATE AS DATE) AS event_date,
    'visit_occurrence' AS source_table
  FROM `healthtree-production.dataform.visit_occurrence`
  WHERE visit_start_DATE IS NOT NULL
),

-- Union all clinical events
all_events AS (
  SELECT * FROM conditions
  UNION ALL SELECT * FROM measurements
  UNION ALL SELECT * FROM observations
  UNION ALL SELECT * FROM drugs
  UNION ALL SELECT * FROM procedures
  UNION ALL SELECT * FROM visits
),

-- Keep only events that fall AFTER the patient's death date
violations AS (
  SELECT
    d.person_id,
    d.person_source_value,
    d.death_DATE,
    e.event_date,
    e.source_table,
    DATE_DIFF(e.event_date, d.death_DATE, DAY) AS days_after_death
  FROM deceased d
  JOIN all_events e
    ON e.person_source_value = d.person_source_value
    AND e.event_date > d.death_DATE
),

-- Aggregate per patient: worst-case days, count per table
per_patient AS (
  SELECT
    person_id,
    person_source_value,
    death_DATE,
    MAX(days_after_death)                                            AS max_days_after_death,
    MAX(event_date)                                                  AS latest_record_date,
    COUNT(*)                                                         AS total_violations,

    COUNTIF(source_table = 'condition_occurrence')                   AS condition_occurrence_count,
    COUNTIF(source_table = 'measurement')                            AS measurement_count,
    COUNTIF(source_table = 'observation')                            AS observation_count,
    COUNTIF(source_table = 'drug_exposure')                          AS drug_exposure_count,
    COUNTIF(source_table = 'procedure_occurrence')                   AS procedure_occurrence_count,
    COUNTIF(source_table = 'visit_occurrence')                       AS visit_occurrence_count
  FROM violations
  GROUP BY person_id, person_source_value, death_DATE
)

-- Final output: join email from HT.users for additional context, apply severity label
-- person_source_value IS the username — it is the stable patient identifier used
-- throughout the pipeline and matches HT.users.userId.
SELECT
  pp.person_source_value                                            AS username,
  u.email                                                           AS email,
  pp.death_DATE,
  pp.latest_record_date,
  pp.max_days_after_death,

  CASE
    WHEN pp.max_days_after_death BETWEEN   1 AND   90 THEN 'LOW'
    WHEN pp.max_days_after_death BETWEEN  91 AND  365 THEN 'MEDIUM'
    WHEN pp.max_days_after_death BETWEEN 366 AND 1095 THEN 'HIGH'
    ELSE                                                   'CRITICAL'
  END                                                                AS severity,

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

ORDER BY pp.max_days_after_death DESC
