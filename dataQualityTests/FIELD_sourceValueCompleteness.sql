/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'sourceValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of distinct source values in the CONDITION_SOURCE_VALUE field of the CONDITION_OCCURRENCE table mapped to 0.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_source_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourcevaluecompleteness_condition_occurrence_condition_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 10 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 10 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,10 as threshold_value
  ,null as notes_value
from (
  /*********
SOURCE_VALUE_COMPLETENESS
number of source values with 0 standard concept / number of distinct source values
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_SOURCE_VALUE
standardConceptFieldName = CONDITION_CONCEPT_ID
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select distinct 
            'CONDITION_OCCURRENCE.CONDITION_SOURCE_VALUE' as violating_field, 
            cdmtable.condition_source_value
        from dataform.condition_occurrence cdmtable
        where cdmtable.condition_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(distinct cdmtable.condition_source_value) + count(distinct case when cdmtable.condition_source_value is null then 1 end) as num_rows
    from dataform.condition_occurrence cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'sourceValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of distinct source values in the CONDITION_STATUS_SOURCE_VALUE field of the CONDITION_OCCURRENCE table mapped to 0.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_STATUS_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_source_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourcevaluecompleteness_condition_occurrence_condition_status_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
SOURCE_VALUE_COMPLETENESS
number of source values with 0 standard concept / number of distinct source values
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_STATUS_SOURCE_VALUE
standardConceptFieldName = CONDITION_STATUS_CONCEPT_ID
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select distinct 
            'CONDITION_OCCURRENCE.CONDITION_STATUS_SOURCE_VALUE' as violating_field, 
            cdmtable.condition_status_source_value
        from dataform.condition_occurrence cdmtable
        where cdmtable.condition_status_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(distinct cdmtable.condition_status_source_value) + count(distinct case when cdmtable.condition_status_source_value is null then 1 end) as num_rows
    from dataform.condition_occurrence cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'sourceValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of distinct source values in the CAUSE_SOURCE_VALUE field of the DEATH table mapped to 0.' as check_description
  ,'DEATH' as cdm_table_name
  ,'CAUSE_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_source_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourcevaluecompleteness_death_cause_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 10 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 10 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,10 as threshold_value
  ,null as notes_value
from (
  /*********
SOURCE_VALUE_COMPLETENESS
number of source values with 0 standard concept / number of distinct source values
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DEATH
cdmFieldName = CAUSE_SOURCE_VALUE
standardConceptFieldName = CAUSE_SOURCE_CONCEPT_ID
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select distinct 
            'DEATH.CAUSE_SOURCE_VALUE' as violating_field, 
            cdmtable.cause_source_value
        from dataform.death cdmtable
        where cdmtable.cause_source_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(distinct cdmtable.cause_source_value) + count(distinct case when cdmtable.cause_source_value is null then 1 end) as num_rows
    from dataform.death cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'sourceValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of distinct source values in the DEVICE_SOURCE_VALUE field of the DEVICE_EXPOSURE table mapped to 0.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_source_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourcevaluecompleteness_device_exposure_device_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
SOURCE_VALUE_COMPLETENESS
number of source values with 0 standard concept / number of distinct source values
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = DEVICE_SOURCE_VALUE
standardConceptFieldName = DEVICE_CONCEPT_ID
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select distinct 
            'DEVICE_EXPOSURE.DEVICE_SOURCE_VALUE' as violating_field, 
            cdmtable.device_source_value
        from dataform.device_exposure cdmtable
        where cdmtable.device_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(distinct cdmtable.device_source_value) + count(distinct case when cdmtable.device_source_value is null then 1 end) as num_rows
    from dataform.device_exposure cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'sourceValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of distinct source values in the UNIT_SOURCE_VALUE field of the DEVICE_EXPOSURE table mapped to 0.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'UNIT_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_source_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourcevaluecompleteness_device_exposure_unit_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
SOURCE_VALUE_COMPLETENESS
number of source values with 0 standard concept / number of distinct source values
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = UNIT_SOURCE_VALUE
standardConceptFieldName = UNIT_CONCEPT_ID
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select distinct 
            'DEVICE_EXPOSURE.UNIT_SOURCE_VALUE' as violating_field, 
            cdmtable.unit_source_value
        from dataform.device_exposure cdmtable
        where cdmtable.unit_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(distinct cdmtable.unit_source_value) + count(distinct case when cdmtable.unit_source_value is null then 1 end) as num_rows
    from dataform.device_exposure cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'sourceValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of distinct source values in the DRUG_SOURCE_VALUE field of the DRUG_EXPOSURE table mapped to 0.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_source_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourcevaluecompleteness_drug_exposure_drug_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 10 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 10 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,10 as threshold_value
  ,null as notes_value
from (
  /*********
SOURCE_VALUE_COMPLETENESS
number of source values with 0 standard concept / number of distinct source values
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DRUG_SOURCE_VALUE
standardConceptFieldName = DRUG_CONCEPT_ID
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select distinct 
            'DRUG_EXPOSURE.DRUG_SOURCE_VALUE' as violating_field, 
            cdmtable.drug_source_value
        from dataform.drug_exposure cdmtable
        where cdmtable.drug_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(distinct cdmtable.drug_source_value) + count(distinct case when cdmtable.drug_source_value is null then 1 end) as num_rows
    from dataform.drug_exposure cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'sourceValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of distinct source values in the ROUTE_SOURCE_VALUE field of the DRUG_EXPOSURE table mapped to 0.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'ROUTE_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_source_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourcevaluecompleteness_drug_exposure_route_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
SOURCE_VALUE_COMPLETENESS
number of source values with 0 standard concept / number of distinct source values
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = ROUTE_SOURCE_VALUE
standardConceptFieldName = ROUTE_CONCEPT_ID
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select distinct 
            'DRUG_EXPOSURE.ROUTE_SOURCE_VALUE' as violating_field, 
            cdmtable.route_source_value
        from dataform.drug_exposure cdmtable
        where cdmtable.route_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(distinct cdmtable.route_source_value) + count(distinct case when cdmtable.route_source_value is null then 1 end) as num_rows
    from dataform.drug_exposure cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'sourceValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of distinct source values in the MEASUREMENT_SOURCE_VALUE field of the MEASUREMENT table mapped to 0.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_source_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourcevaluecompleteness_measurement_measurement_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 10 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 10 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,10 as threshold_value
  ,null as notes_value
from (
  /*********
SOURCE_VALUE_COMPLETENESS
number of source values with 0 standard concept / number of distinct source values
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_SOURCE_VALUE
standardConceptFieldName = MEASUREMENT_CONCEPT_ID
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select distinct 
            'MEASUREMENT.MEASUREMENT_SOURCE_VALUE' as violating_field, 
            cdmtable.measurement_source_value
        from dataform.measurement cdmtable
        where cdmtable.measurement_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(distinct cdmtable.measurement_source_value) + count(distinct case when cdmtable.measurement_source_value is null then 1 end) as num_rows
    from dataform.measurement cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'sourceValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of distinct source values in the UNIT_SOURCE_VALUE field of the MEASUREMENT table mapped to 0.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'UNIT_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_source_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourcevaluecompleteness_measurement_unit_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
SOURCE_VALUE_COMPLETENESS
number of source values with 0 standard concept / number of distinct source values
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = UNIT_SOURCE_VALUE
standardConceptFieldName = UNIT_CONCEPT_ID
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select distinct 
            'MEASUREMENT.UNIT_SOURCE_VALUE' as violating_field, 
            cdmtable.unit_source_value
        from dataform.measurement cdmtable
        where cdmtable.unit_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(distinct cdmtable.unit_source_value) + count(distinct case when cdmtable.unit_source_value is null then 1 end) as num_rows
    from dataform.measurement cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'sourceValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of distinct source values in the OBSERVATION_SOURCE_VALUE field of the OBSERVATION table mapped to 0.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_source_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourcevaluecompleteness_observation_observation_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
SOURCE_VALUE_COMPLETENESS
number of source values with 0 standard concept / number of distinct source values
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = OBSERVATION
cdmFieldName = OBSERVATION_SOURCE_VALUE
standardConceptFieldName = OBSERVATION_CONCEPT_ID
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select distinct 
            'OBSERVATION.OBSERVATION_SOURCE_VALUE' as violating_field, 
            cdmtable.observation_source_value
        from dataform.observation cdmtable
        where cdmtable.observation_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(distinct cdmtable.observation_source_value) + count(distinct case when cdmtable.observation_source_value is null then 1 end) as num_rows
    from dataform.observation cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'sourceValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of distinct source values in the QUALIFIER_SOURCE_VALUE field of the OBSERVATION table mapped to 0.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'QUALIFIER_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_source_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourcevaluecompleteness_observation_qualifier_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
SOURCE_VALUE_COMPLETENESS
number of source values with 0 standard concept / number of distinct source values
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = OBSERVATION
cdmFieldName = QUALIFIER_SOURCE_VALUE
standardConceptFieldName = QUALIFIER_CONCEPT_ID
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select distinct 
            'OBSERVATION.QUALIFIER_SOURCE_VALUE' as violating_field, 
            cdmtable.qualifier_source_value
        from dataform.observation cdmtable
        where cdmtable.qualifier_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(distinct cdmtable.qualifier_source_value) + count(distinct case when cdmtable.qualifier_source_value is null then 1 end) as num_rows
    from dataform.observation cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'sourceValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of distinct source values in the UNIT_SOURCE_VALUE field of the OBSERVATION table mapped to 0.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'UNIT_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_source_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourcevaluecompleteness_observation_unit_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
SOURCE_VALUE_COMPLETENESS
number of source values with 0 standard concept / number of distinct source values
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = OBSERVATION
cdmFieldName = UNIT_SOURCE_VALUE
standardConceptFieldName = UNIT_CONCEPT_ID
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select distinct 
            'OBSERVATION.UNIT_SOURCE_VALUE' as violating_field, 
            cdmtable.unit_source_value
        from dataform.observation cdmtable
        where cdmtable.unit_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(distinct cdmtable.unit_source_value) + count(distinct case when cdmtable.unit_source_value is null then 1 end) as num_rows
    from dataform.observation cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'sourceValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of distinct source values in the PAYER_SOURCE_VALUE field of the PAYER_PLAN_PERIOD table mapped to 0.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PAYER_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_source_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourcevaluecompleteness_payer_plan_period_payer_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
SOURCE_VALUE_COMPLETENESS
number of source values with 0 standard concept / number of distinct source values
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = PAYER_SOURCE_VALUE
standardConceptFieldName = PAYER_CONCEPT_ID
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select distinct 
            'PAYER_PLAN_PERIOD.PAYER_SOURCE_VALUE' as violating_field, 
            cdmtable.payer_source_value
        from dataform.payer_plan_period cdmtable
        where cdmtable.payer_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(distinct cdmtable.payer_source_value) + count(distinct case when cdmtable.payer_source_value is null then 1 end) as num_rows
    from dataform.payer_plan_period cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'sourceValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of distinct source values in the PLAN_SOURCE_VALUE field of the PAYER_PLAN_PERIOD table mapped to 0.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PLAN_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_source_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourcevaluecompleteness_payer_plan_period_plan_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
SOURCE_VALUE_COMPLETENESS
number of source values with 0 standard concept / number of distinct source values
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = PLAN_SOURCE_VALUE
standardConceptFieldName = PLAN_CONCEPT_ID
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select distinct 
            'PAYER_PLAN_PERIOD.PLAN_SOURCE_VALUE' as violating_field, 
            cdmtable.plan_source_value
        from dataform.payer_plan_period cdmtable
        where cdmtable.plan_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(distinct cdmtable.plan_source_value) + count(distinct case when cdmtable.plan_source_value is null then 1 end) as num_rows
    from dataform.payer_plan_period cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'sourceValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of distinct source values in the SPONSOR_SOURCE_VALUE field of the PAYER_PLAN_PERIOD table mapped to 0.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'SPONSOR_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_source_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourcevaluecompleteness_payer_plan_period_sponsor_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
SOURCE_VALUE_COMPLETENESS
number of source values with 0 standard concept / number of distinct source values
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = SPONSOR_SOURCE_VALUE
standardConceptFieldName = SPONSOR_CONCEPT_ID
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select distinct 
            'PAYER_PLAN_PERIOD.SPONSOR_SOURCE_VALUE' as violating_field, 
            cdmtable.sponsor_source_value
        from dataform.payer_plan_period cdmtable
        where cdmtable.sponsor_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(distinct cdmtable.sponsor_source_value) + count(distinct case when cdmtable.sponsor_source_value is null then 1 end) as num_rows
    from dataform.payer_plan_period cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'sourceValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of distinct source values in the STOP_REASON_SOURCE_VALUE field of the PAYER_PLAN_PERIOD table mapped to 0.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'STOP_REASON_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_source_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourcevaluecompleteness_payer_plan_period_stop_reason_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
SOURCE_VALUE_COMPLETENESS
number of source values with 0 standard concept / number of distinct source values
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = STOP_REASON_SOURCE_VALUE
standardConceptFieldName = STOP_REASON_CONCEPT_ID
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select distinct 
            'PAYER_PLAN_PERIOD.STOP_REASON_SOURCE_VALUE' as violating_field, 
            cdmtable.stop_reason_source_value
        from dataform.payer_plan_period cdmtable
        where cdmtable.stop_reason_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(distinct cdmtable.stop_reason_source_value) + count(distinct case when cdmtable.stop_reason_source_value is null then 1 end) as num_rows
    from dataform.payer_plan_period cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'sourceValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of distinct source values in the ETHNICITY_SOURCE_VALUE field of the PERSON table mapped to 0.' as check_description
  ,'PERSON' as cdm_table_name
  ,'ETHNICITY_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_source_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourcevaluecompleteness_person_ethnicity_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
SOURCE_VALUE_COMPLETENESS
number of source values with 0 standard concept / number of distinct source values
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PERSON
cdmFieldName = ETHNICITY_SOURCE_VALUE
standardConceptFieldName = ETHNICITY_CONCEPT_ID
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select distinct 
            'PERSON.ETHNICITY_SOURCE_VALUE' as violating_field, 
            cdmtable.ethnicity_source_value
        from dataform.person cdmtable
        where cdmtable.ethnicity_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(distinct cdmtable.ethnicity_source_value) + count(distinct case when cdmtable.ethnicity_source_value is null then 1 end) as num_rows
    from dataform.person cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'sourceValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of distinct source values in the GENDER_SOURCE_VALUE field of the PERSON table mapped to 0.' as check_description
  ,'PERSON' as cdm_table_name
  ,'GENDER_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_source_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourcevaluecompleteness_person_gender_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
SOURCE_VALUE_COMPLETENESS
number of source values with 0 standard concept / number of distinct source values
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PERSON
cdmFieldName = GENDER_SOURCE_VALUE
standardConceptFieldName = GENDER_CONCEPT_ID
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select distinct 
            'PERSON.GENDER_SOURCE_VALUE' as violating_field, 
            cdmtable.gender_source_value
        from dataform.person cdmtable
        where cdmtable.gender_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(distinct cdmtable.gender_source_value) + count(distinct case when cdmtable.gender_source_value is null then 1 end) as num_rows
    from dataform.person cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'sourceValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of distinct source values in the RACE_SOURCE_VALUE field of the PERSON table mapped to 0.' as check_description
  ,'PERSON' as cdm_table_name
  ,'RACE_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_source_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourcevaluecompleteness_person_race_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
SOURCE_VALUE_COMPLETENESS
number of source values with 0 standard concept / number of distinct source values
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PERSON
cdmFieldName = RACE_SOURCE_VALUE
standardConceptFieldName = RACE_CONCEPT_ID
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select distinct 
            'PERSON.RACE_SOURCE_VALUE' as violating_field, 
            cdmtable.race_source_value
        from dataform.person cdmtable
        where cdmtable.race_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(distinct cdmtable.race_source_value) + count(distinct case when cdmtable.race_source_value is null then 1 end) as num_rows
    from dataform.person cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'sourceValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of distinct source values in the MODIFIER_SOURCE_VALUE field of the PROCEDURE_OCCURRENCE table mapped to 0.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'MODIFIER_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_source_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourcevaluecompleteness_procedure_occurrence_modifier_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
SOURCE_VALUE_COMPLETENESS
number of source values with 0 standard concept / number of distinct source values
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = MODIFIER_SOURCE_VALUE
standardConceptFieldName = MODIFIER_CONCEPT_ID
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select distinct 
            'PROCEDURE_OCCURRENCE.MODIFIER_SOURCE_VALUE' as violating_field, 
            cdmtable.modifier_source_value
        from dataform.procedure_occurrence cdmtable
        where cdmtable.modifier_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(distinct cdmtable.modifier_source_value) + count(distinct case when cdmtable.modifier_source_value is null then 1 end) as num_rows
    from dataform.procedure_occurrence cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'sourceValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of distinct source values in the PROCEDURE_SOURCE_VALUE field of the PROCEDURE_OCCURRENCE table mapped to 0.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_source_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourcevaluecompleteness_procedure_occurrence_procedure_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 10 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 10 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,10 as threshold_value
  ,null as notes_value
from (
  /*********
SOURCE_VALUE_COMPLETENESS
number of source values with 0 standard concept / number of distinct source values
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_SOURCE_VALUE
standardConceptFieldName = PROCEDURE_CONCEPT_ID
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select distinct 
            'PROCEDURE_OCCURRENCE.PROCEDURE_SOURCE_VALUE' as violating_field, 
            cdmtable.procedure_source_value
        from dataform.procedure_occurrence cdmtable
        where cdmtable.procedure_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(distinct cdmtable.procedure_source_value) + count(distinct case when cdmtable.procedure_source_value is null then 1 end) as num_rows
    from dataform.procedure_occurrence cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'sourceValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of distinct source values in the GENDER_SOURCE_VALUE field of the PROVIDER table mapped to 0.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'GENDER_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_source_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourcevaluecompleteness_provider_gender_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
SOURCE_VALUE_COMPLETENESS
number of source values with 0 standard concept / number of distinct source values
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROVIDER
cdmFieldName = GENDER_SOURCE_VALUE
standardConceptFieldName = GENDER_CONCEPT_ID
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select distinct 
            'PROVIDER.GENDER_SOURCE_VALUE' as violating_field, 
            cdmtable.gender_source_value
        from dataform.provider cdmtable
        where cdmtable.gender_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(distinct cdmtable.gender_source_value) + count(distinct case when cdmtable.gender_source_value is null then 1 end) as num_rows
    from dataform.provider cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'sourceValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of distinct source values in the SPECIALTY_SOURCE_VALUE field of the PROVIDER table mapped to 0.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'SPECIALTY_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_source_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourcevaluecompleteness_provider_specialty_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
SOURCE_VALUE_COMPLETENESS
number of source values with 0 standard concept / number of distinct source values
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROVIDER
cdmFieldName = SPECIALTY_SOURCE_VALUE
standardConceptFieldName = SPECIALTY_CONCEPT_ID
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select distinct 
            'PROVIDER.SPECIALTY_SOURCE_VALUE' as violating_field, 
            cdmtable.specialty_source_value
        from dataform.provider cdmtable
        where cdmtable.specialty_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(distinct cdmtable.specialty_source_value) + count(distinct case when cdmtable.specialty_source_value is null then 1 end) as num_rows
    from dataform.provider cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'sourceValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of distinct source values in the ANATOMIC_SITE_SOURCE_VALUE field of the SPECIMEN table mapped to 0.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'ANATOMIC_SITE_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_source_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourcevaluecompleteness_specimen_anatomic_site_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
SOURCE_VALUE_COMPLETENESS
number of source values with 0 standard concept / number of distinct source values
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = SPECIMEN
cdmFieldName = ANATOMIC_SITE_SOURCE_VALUE
standardConceptFieldName = ANATOMIC_SITE_CONCEPT_ID
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select distinct 
            'SPECIMEN.ANATOMIC_SITE_SOURCE_VALUE' as violating_field, 
            cdmtable.anatomic_site_source_value
        from dataform.specimen cdmtable
        where cdmtable.anatomic_site_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(distinct cdmtable.anatomic_site_source_value) + count(distinct case when cdmtable.anatomic_site_source_value is null then 1 end) as num_rows
    from dataform.specimen cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'sourceValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of distinct source values in the DISEASE_STATUS_SOURCE_VALUE field of the SPECIMEN table mapped to 0.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'DISEASE_STATUS_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_source_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourcevaluecompleteness_specimen_disease_status_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
SOURCE_VALUE_COMPLETENESS
number of source values with 0 standard concept / number of distinct source values
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = SPECIMEN
cdmFieldName = DISEASE_STATUS_SOURCE_VALUE
standardConceptFieldName = DISEASE_STATUS_CONCEPT_ID
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select distinct 
            'SPECIMEN.DISEASE_STATUS_SOURCE_VALUE' as violating_field, 
            cdmtable.disease_status_source_value
        from dataform.specimen cdmtable
        where cdmtable.disease_status_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(distinct cdmtable.disease_status_source_value) + count(distinct case when cdmtable.disease_status_source_value is null then 1 end) as num_rows
    from dataform.specimen cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'sourceValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of distinct source values in the SPECIMEN_SOURCE_VALUE field of the SPECIMEN table mapped to 0.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'SPECIMEN_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_source_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourcevaluecompleteness_specimen_specimen_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
SOURCE_VALUE_COMPLETENESS
number of source values with 0 standard concept / number of distinct source values
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = SPECIMEN
cdmFieldName = SPECIMEN_SOURCE_VALUE
standardConceptFieldName = SPECIMEN_CONCEPT_ID
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select distinct 
            'SPECIMEN.SPECIMEN_SOURCE_VALUE' as violating_field, 
            cdmtable.specimen_source_value
        from dataform.specimen cdmtable
        where cdmtable.specimen_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(distinct cdmtable.specimen_source_value) + count(distinct case when cdmtable.specimen_source_value is null then 1 end) as num_rows
    from dataform.specimen cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'sourceValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of distinct source values in the UNIT_SOURCE_VALUE field of the SPECIMEN table mapped to 0.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'UNIT_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_source_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourcevaluecompleteness_specimen_unit_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
SOURCE_VALUE_COMPLETENESS
number of source values with 0 standard concept / number of distinct source values
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = SPECIMEN
cdmFieldName = UNIT_SOURCE_VALUE
standardConceptFieldName = UNIT_CONCEPT_ID
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select distinct 
            'SPECIMEN.UNIT_SOURCE_VALUE' as violating_field, 
            cdmtable.unit_source_value
        from dataform.specimen cdmtable
        where cdmtable.unit_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(distinct cdmtable.unit_source_value) + count(distinct case when cdmtable.unit_source_value is null then 1 end) as num_rows
    from dataform.specimen cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'sourceValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of distinct source values in the ADMITTED_FROM_SOURCE_VALUE field of the VISIT_DETAIL table mapped to 0.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'ADMITTED_FROM_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_source_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourcevaluecompleteness_visit_detail_admitted_from_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
SOURCE_VALUE_COMPLETENESS
number of source values with 0 standard concept / number of distinct source values
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = ADMITTED_FROM_SOURCE_VALUE
standardConceptFieldName = ADMITTED_FROM_CONCEPT_ID
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select distinct 
            'VISIT_DETAIL.ADMITTED_FROM_SOURCE_VALUE' as violating_field, 
            cdmtable.admitted_from_source_value
        from dataform.visit_detail cdmtable
        where cdmtable.admitted_from_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(distinct cdmtable.admitted_from_source_value) + count(distinct case when cdmtable.admitted_from_source_value is null then 1 end) as num_rows
    from dataform.visit_detail cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'sourceValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of distinct source values in the DISCHARGED_TO_SOURCE_VALUE field of the VISIT_DETAIL table mapped to 0.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'DISCHARGED_TO_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_source_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourcevaluecompleteness_visit_detail_discharged_to_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
SOURCE_VALUE_COMPLETENESS
number of source values with 0 standard concept / number of distinct source values
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = DISCHARGED_TO_SOURCE_VALUE
standardConceptFieldName = DISCHARGED_TO_CONCEPT_ID
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select distinct 
            'VISIT_DETAIL.DISCHARGED_TO_SOURCE_VALUE' as violating_field, 
            cdmtable.discharged_to_source_value
        from dataform.visit_detail cdmtable
        where cdmtable.discharged_to_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(distinct cdmtable.discharged_to_source_value) + count(distinct case when cdmtable.discharged_to_source_value is null then 1 end) as num_rows
    from dataform.visit_detail cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'sourceValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of distinct source values in the ADMITTED_FROM_SOURCE_VALUE field of the VISIT_OCCURRENCE table mapped to 0.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'ADMITTED_FROM_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_source_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourcevaluecompleteness_visit_occurrence_admitted_from_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
SOURCE_VALUE_COMPLETENESS
number of source values with 0 standard concept / number of distinct source values
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = ADMITTED_FROM_SOURCE_VALUE
standardConceptFieldName = ADMITTED_FROM_CONCEPT_ID
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select distinct 
            'VISIT_OCCURRENCE.ADMITTED_FROM_SOURCE_VALUE' as violating_field, 
            cdmtable.admitted_from_source_value
        from dataform.visit_occurrence cdmtable
        where cdmtable.admitted_from_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(distinct cdmtable.admitted_from_source_value) + count(distinct case when cdmtable.admitted_from_source_value is null then 1 end) as num_rows
    from dataform.visit_occurrence cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'sourceValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of distinct source values in the DISCHARGED_TO_SOURCE_VALUE field of the VISIT_OCCURRENCE table mapped to 0.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'DISCHARGED_TO_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_source_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourcevaluecompleteness_visit_occurrence_discharged_to_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
SOURCE_VALUE_COMPLETENESS
number of source values with 0 standard concept / number of distinct source values
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = DISCHARGED_TO_SOURCE_VALUE
standardConceptFieldName = DISCHARGED_TO_CONCEPT_ID
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select distinct 
            'VISIT_OCCURRENCE.DISCHARGED_TO_SOURCE_VALUE' as violating_field, 
            cdmtable.discharged_to_source_value
        from dataform.visit_occurrence cdmtable
        where cdmtable.discharged_to_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(distinct cdmtable.discharged_to_source_value) + count(distinct case when cdmtable.discharged_to_source_value is null then 1 end) as num_rows
    from dataform.visit_occurrence cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'sourceValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of distinct source values in the VISIT_SOURCE_VALUE field of the VISIT_OCCURRENCE table mapped to 0.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_source_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourcevaluecompleteness_visit_occurrence_visit_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 10 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 10 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,10 as threshold_value
  ,null as notes_value
from (
  /*********
SOURCE_VALUE_COMPLETENESS
number of source values with 0 standard concept / number of distinct source values
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = VISIT_SOURCE_VALUE
standardConceptFieldName = VISIT_CONCEPT_ID
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select distinct 
            'VISIT_OCCURRENCE.VISIT_SOURCE_VALUE' as violating_field, 
            cdmtable.visit_source_value
        from dataform.visit_occurrence cdmtable
        where cdmtable.visit_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(distinct cdmtable.visit_source_value) + count(distinct case when cdmtable.visit_source_value is null then 1 end) as num_rows
    from dataform.visit_occurrence cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

