-- ============================================================
-- Condition Status Concept ID = 0 Audit
-- ============================================================
-- 81% of CONDITION_OCCURRENCE records have condition_status_concept_id = 0.
-- Per OMOP CDM, this field is optional — if there is no status to record
-- it should be NULL, not 0.
--
-- This query breaks down what source values are driving the 0, so the
-- ETL can be corrected:
--
--   Case 1: source value IS NULL
--     → The source had no status at all. Set concept_id to NULL.
--
--   Case 2: source value exists but maps to 0
--     → A value was present but couldn't be mapped. Either find the
--       correct concept or set to NULL if the value is unmeaningful.
--
-- Mapped statuses already in use (concept_id != 0):
--   32906 → "Resolved"
-- ============================================================

-- Part 1: Breakdown of zero-status records by source value
SELECT
  'zero_status_breakdown'                                             AS query_part,
  COALESCE(condition_status_source_value, '(NULL — no source value)') AS condition_status_source_value,
  COUNT(*)                                                            AS record_count,
  ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2)                 AS pct_of_zero_status_records
FROM `healthtree-production.dataform.condition_occurrence`
WHERE condition_status_concept_id = 0
GROUP BY condition_status_source_value
ORDER BY record_count DESC

-- Part 2 (run separately if needed): Overall status distribution
-- SELECT condition_status_concept_id, COUNT(*) AS cnt
-- FROM `healthtree-production.dataform.condition_occurrence`
-- GROUP BY condition_status_concept_id
-- ORDER BY cnt DESC
