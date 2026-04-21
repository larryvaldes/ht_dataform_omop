-- ============================================================
-- Condition Concepts with Wrong OMOP Domain
-- ============================================================
-- condition_concept_id must map to the 'Condition' domain per OMOP CDM.
-- Records where a non-Condition concept is used indicate a mapping error
-- in the ETL (likely a SNOMED code that resolves to a different domain
-- such as Observation, Procedure, or Measurement in OMOP vocabulary).
--
-- ACTION: Review the listed source codes in the ETL and either:
--   (a) Re-route the record to the appropriate OMOP table, or
--   (b) Find the correct Condition-domain standard concept.
-- ============================================================

SELECT
  c.domain_id                         AS actual_domain,
  c.vocabulary_id,
  c.concept_class_id,
  co.condition_concept_id,
  c.concept_name,
  co.condition_source_code,
  co.condition_source_value,
  COUNT(DISTINCT co.person_id)        AS affected_patients,
  COUNT(*)                            AS record_count

FROM `healthtree-production.dataform.condition_occurrence` co
JOIN `healthtree-production.OMOP.Concept` c
  ON c.concept_id = co.condition_concept_id

WHERE co.condition_concept_id != 0
  AND c.domain_id != 'Condition'

GROUP BY
  c.domain_id, c.vocabulary_id, c.concept_class_id,
  co.condition_concept_id, c.concept_name,
  co.condition_source_code, co.condition_source_value

ORDER BY record_count DESC
