-- ============================================================
-- Care Site Empty Row Audit
-- ============================================================
-- The CARE_SITE table currently outputs a single row with all NULL
-- values. This is because care_site.sqlx hardcodes:
--   SELECT null AS care_site_id, null AS care_site_name, ...
--
-- This is the empty row the reviewer flagged.
--
-- ACTION REQUIRED (ETL fix, not a data fix):
--   Populate care_site from real facility source data.
--   Candidate sources already in the pipeline:
--     - HT.facilityConnections
--     - FHIR Organization resource (r4-Organization)
--   Until then, the table can be made empty (zero rows) by adding
--   WHERE 1=0, which is preferable to a single all-NULL row.
-- ============================================================

SELECT
  care_site_id,
  care_site_name,
  place_of_service_concept_id,
  location_id,
  care_site_source_value,
  place_of_service_source_value,

  CASE
    WHEN care_site_id              IS NULL
     AND care_site_name            IS NULL
     AND care_site_source_value    IS NULL
    THEN 'EMPTY ROW — all fields NULL. Fix: populate from facility source or remove row.'
    ELSE 'OK'
  END                               AS diagnosis

FROM `healthtree-production.dataform.care_site`

ORDER BY diagnosis DESC
