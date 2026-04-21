--DDL to create dqdashboard_results table.
DROP TABLE IF EXISTS dataform.dqdashboard_results;
create table dataform.dqdashboard_results
(
  num_violated_rows     INT64,
  pct_violated_rows     FLOAT64,
  num_denominator_rows  INT64,
  execution_time        STRING,
  query_text            STRING,
  check_name            STRING,
  check_level           STRING,
  check_description     STRING,
  cdm_table_name        STRING,
  cdm_field_name        STRING,
  concept_id            STRING,
  unit_concept_id       STRING,
  sql_file              STRING,
  category              STRING,
  subcategory           STRING,
  context               STRING,
  warning               STRING,
  error                 STRING,
  checkid               STRING,
  is_error              INT64,
  not_applicable        INT64,
  failed                INT64,
  passed                INT64,
  not_applicable_reason STRING,
  threshold_value       INT64,
  notes_value           STRING
);

