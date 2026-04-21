-- ============================================================
-- Plausible Gender Violations — Clinical Team Review
-- ============================================================
-- Identifies patients with conditions that are anatomically implausible
-- for their recorded gender. Two possible root causes:
--   (a) The gender recorded in the person table is wrong
--   (b) The condition code is wrong (miscoded at source)
--
-- The clinical team should verify each case and correct in the
-- original source system (HT.users or the originating EHR record).
--
-- Approach: matches condition concepts whose names indicate a
-- gender-specific anatomy against the patient's recorded gender.
-- Male-only conditions on female patients, and vice versa.
-- ============================================================

WITH

-- Concepts associated with male-only anatomy
male_only_conditions AS (
  SELECT concept_id, concept_name, 'MALE' AS expected_gender
  FROM `healthtree-production.OMOP.Concept`
  WHERE domain_id = 'Condition'
    AND standard_concept = 'S'
    AND (
      LOWER(concept_name) LIKE '%prostat%'
      OR LOWER(concept_name) LIKE '%testic%'
      OR LOWER(concept_name) LIKE '%spermat%'
      OR LOWER(concept_name) LIKE '%epididym%'
      OR LOWER(concept_name) LIKE '%penile%'
      OR LOWER(concept_name) LIKE '%of penis%'
      OR LOWER(concept_name) LIKE '%cryptorch%'
      OR LOWER(concept_name) LIKE '%seminal%'
    )
),

-- Concepts associated with female-only anatomy
female_only_conditions AS (
  SELECT concept_id, concept_name, 'FEMALE' AS expected_gender
  FROM `healthtree-production.OMOP.Concept`
  WHERE domain_id = 'Condition'
    AND standard_concept = 'S'
    AND (
      LOWER(concept_name) LIKE '%ovari%'
      OR LOWER(concept_name) LIKE '%uterine%'
      OR LOWER(concept_name) LIKE '%of uterus%'
      OR LOWER(concept_name) LIKE '%cervix%'
      OR LOWER(concept_name) LIKE '%cervical%'
      OR LOWER(concept_name) LIKE '%vaginal%'
      OR LOWER(concept_name) LIKE '%of vagina%'
      OR LOWER(concept_name) LIKE '%vulv%'
      OR LOWER(concept_name) LIKE '%endometri%'
      OR LOWER(concept_name) LIKE '%fallopian%'
      OR LOWER(concept_name) LIKE '%preeclampsia%'
      OR LOWER(concept_name) LIKE '%eclampsia%'
      OR LOWER(concept_name) LIKE '%placent%'
      OR LOWER(concept_name) LIKE '%obstetric%'
      OR LOWER(concept_name) LIKE '%maternal%'
    )
),

gender_specific AS (
  SELECT * FROM male_only_conditions
  UNION ALL
  SELECT * FROM female_only_conditions
),

violations AS (
  SELECT
    p.person_source_value,
    CASE p.gender_concept_id
      WHEN 8507 THEN 'MALE'
      WHEN 8532 THEN 'FEMALE'
      ELSE 'UNKNOWN / OTHER'
    END                                       AS recorded_gender,
    p.gender_source_value,
    gs.expected_gender,
    co.condition_occurrence_id,
    co.condition_concept_id,
    gs.concept_name                           AS condition_name,
    co.condition_start_DATE,
    co.condition_source_value,
    co.condition_source_code

  FROM `healthtree-production.dataform.condition_occurrence` co
  JOIN `healthtree-production.dataform.person` p
    ON p.person_id = co.person_id
  JOIN gender_specific gs
    ON gs.concept_id = co.condition_concept_id

  WHERE co.condition_concept_id != 0
    AND (
      -- Female patient with male-only condition
      (p.gender_concept_id = 8532 AND gs.expected_gender = 'MALE')
      OR
      -- Male patient with female-only condition
      (p.gender_concept_id = 8507 AND gs.expected_gender = 'FEMALE')
    )
)

SELECT
  v.person_source_value                       AS username,
  u.email                                     AS email,
  v.recorded_gender,
  v.expected_gender                           AS condition_expected_gender,
  v.condition_name,
  v.condition_concept_id,
  v.condition_occurrence_id,
  v.condition_start_DATE,
  v.condition_source_value,
  v.condition_source_code,
  'Verify: check patient gender OR condition code in source system' AS action

FROM violations v
LEFT JOIN `healthtree-production.HT.users` u
  ON u.userId = v.person_source_value

ORDER BY v.condition_name, v.person_source_value
