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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field PLACE_OF_SERVICE_CONCEPT_ID in the CARE_SITE table.' as check_description
  ,'CARE_SITE' as cdm_table_name
  ,'PLACE_OF_SERVICE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_care_site_place_of_service_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CARE_SITE
cdmFieldName = PLACE_OF_SERVICE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'CARE_SITE.PLACE_OF_SERVICE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.care_site cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.place_of_service_concept_id = 0
        or (cdmtable.place_of_service_concept_id is null and cdmtable.place_of_service_source_value is not null)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.care_site cdmtable
    where (cdmtable.place_of_service_concept_id is not null
    or cdmtable.place_of_service_source_value is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field CONDITION_CONCEPT_ID in the CONDITION_ERA table.' as check_description
  ,'CONDITION_ERA' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_condition_era_condition_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_ERA
cdmFieldName = CONDITION_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'CONDITION_ERA.CONDITION_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.condition_era cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.condition_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.condition_era cdmtable
    where (cdmtable.condition_concept_id is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field CONDITION_CONCEPT_ID in the CONDITION_OCCURRENCE table.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_condition_occurrence_condition_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'CONDITION_OCCURRENCE.CONDITION_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.condition_occurrence cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.condition_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.condition_occurrence cdmtable
    where (cdmtable.condition_concept_id is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field CONDITION_STATUS_CONCEPT_ID in the CONDITION_OCCURRENCE table.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_STATUS_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_condition_occurrence_condition_status_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_STATUS_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'CONDITION_OCCURRENCE.CONDITION_STATUS_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.condition_occurrence cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.condition_status_concept_id = 0
        or (cdmtable.condition_status_concept_id is null and cdmtable.condition_status_source_value is not null)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.condition_occurrence cdmtable
    where (cdmtable.condition_status_concept_id is not null
    or cdmtable.condition_status_source_value is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field CONDITION_TYPE_CONCEPT_ID in the CONDITION_OCCURRENCE table.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_condition_occurrence_condition_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'CONDITION_OCCURRENCE.CONDITION_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.condition_occurrence cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.condition_type_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.condition_occurrence cdmtable
    where (cdmtable.condition_type_concept_id is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field COST_TYPE_CONCEPT_ID in the COST table.' as check_description
  ,'COST' as cdm_table_name
  ,'COST_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_cost_cost_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = COST
cdmFieldName = COST_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'COST.COST_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.cost cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.cost_type_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.cost cdmtable
    where (cdmtable.cost_type_concept_id is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field CAUSE_CONCEPT_ID in the DEATH table.' as check_description
  ,'DEATH' as cdm_table_name
  ,'CAUSE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_death_cause_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DEATH
cdmFieldName = CAUSE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'DEATH.CAUSE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.death cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.cause_concept_id = 0
        or (cdmtable.cause_concept_id is null and cdmtable.cause_source_value is not null)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.death cdmtable
    where (cdmtable.cause_concept_id is not null
    or cdmtable.cause_source_value is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field DEATH_TYPE_CONCEPT_ID in the DEATH table.' as check_description
  ,'DEATH' as cdm_table_name
  ,'DEATH_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_death_death_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DEATH
cdmFieldName = DEATH_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'DEATH.DEATH_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.death cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.death_type_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.death cdmtable
    where (cdmtable.death_type_concept_id is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field DEVICE_CONCEPT_ID in the DEVICE_EXPOSURE table.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_device_exposure_device_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = DEVICE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'DEVICE_EXPOSURE.DEVICE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.device_exposure cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.device_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.device_exposure cdmtable
    where (cdmtable.device_concept_id is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field DEVICE_TYPE_CONCEPT_ID in the DEVICE_EXPOSURE table.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_device_exposure_device_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = DEVICE_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'DEVICE_EXPOSURE.DEVICE_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.device_exposure cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.device_type_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.device_exposure cdmtable
    where (cdmtable.device_type_concept_id is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field UNIT_CONCEPT_ID in the DEVICE_EXPOSURE table.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_device_exposure_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = UNIT_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'DEVICE_EXPOSURE.UNIT_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.device_exposure cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.unit_concept_id = 0
        or (cdmtable.unit_concept_id is null and cdmtable.unit_source_value is not null)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.device_exposure cdmtable
    where (cdmtable.unit_concept_id is not null
    or cdmtable.unit_source_value is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field DRUG_CONCEPT_ID in the DOSE_ERA table.' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'DRUG_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_dose_era_drug_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DOSE_ERA
cdmFieldName = DRUG_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'DOSE_ERA.DRUG_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.dose_era cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.drug_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.dose_era cdmtable
    where (cdmtable.drug_concept_id is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field UNIT_CONCEPT_ID in the DOSE_ERA table.' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_dose_era_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DOSE_ERA
cdmFieldName = UNIT_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'DOSE_ERA.UNIT_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.dose_era cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.unit_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.dose_era cdmtable
    where (cdmtable.unit_concept_id is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field DRUG_CONCEPT_ID in the DRUG_ERA table.' as check_description
  ,'DRUG_ERA' as cdm_table_name
  ,'DRUG_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_drug_era_drug_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_ERA
cdmFieldName = DRUG_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'DRUG_ERA.DRUG_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.drug_era cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.drug_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.drug_era cdmtable
    where (cdmtable.drug_concept_id is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field DRUG_CONCEPT_ID in the DRUG_EXPOSURE table.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_drug_exposure_drug_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DRUG_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'DRUG_EXPOSURE.DRUG_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.drug_exposure cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.drug_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.drug_exposure cdmtable
    where (cdmtable.drug_concept_id is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field DRUG_TYPE_CONCEPT_ID in the DRUG_EXPOSURE table.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_drug_exposure_drug_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DRUG_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'DRUG_EXPOSURE.DRUG_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.drug_exposure cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.drug_type_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.drug_exposure cdmtable
    where (cdmtable.drug_type_concept_id is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field ROUTE_CONCEPT_ID in the DRUG_EXPOSURE table.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'ROUTE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_drug_exposure_route_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = ROUTE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'DRUG_EXPOSURE.ROUTE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.drug_exposure cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.route_concept_id = 0
        or (cdmtable.route_concept_id is null and cdmtable.route_source_value is not null)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.drug_exposure cdmtable
    where (cdmtable.route_concept_id is not null
    or cdmtable.route_source_value is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field EPISODE_CONCEPT_ID in the EPISODE table.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_episode_episode_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'EPISODE.EPISODE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.episode cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.episode_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.episode cdmtable
    where (cdmtable.episode_concept_id is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field DOMAIN_CONCEPT_ID_1 in the FACT_RELATIONSHIP table.' as check_description
  ,'FACT_RELATIONSHIP' as cdm_table_name
  ,'DOMAIN_CONCEPT_ID_1' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_fact_relationship_domain_concept_id_1' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = FACT_RELATIONSHIP
cdmFieldName = DOMAIN_CONCEPT_ID_1
**********/
select 
    num_violated_rows, 
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
        select 
            'FACT_RELATIONSHIP.DOMAIN_CONCEPT_ID_1' as violating_field, 
            cdmtable.* 
        from dataform.fact_relationship cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.domain_concept_id_1 = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.fact_relationship cdmtable
    where (cdmtable.domain_concept_id_1 is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field DOMAIN_CONCEPT_ID_2 in the FACT_RELATIONSHIP table.' as check_description
  ,'FACT_RELATIONSHIP' as cdm_table_name
  ,'DOMAIN_CONCEPT_ID_2' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_fact_relationship_domain_concept_id_2' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = FACT_RELATIONSHIP
cdmFieldName = DOMAIN_CONCEPT_ID_2
**********/
select 
    num_violated_rows, 
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
        select 
            'FACT_RELATIONSHIP.DOMAIN_CONCEPT_ID_2' as violating_field, 
            cdmtable.* 
        from dataform.fact_relationship cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.domain_concept_id_2 = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.fact_relationship cdmtable
    where (cdmtable.domain_concept_id_2 is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field RELATIONSHIP_CONCEPT_ID in the FACT_RELATIONSHIP table.' as check_description
  ,'FACT_RELATIONSHIP' as cdm_table_name
  ,'RELATIONSHIP_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_fact_relationship_relationship_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = FACT_RELATIONSHIP
cdmFieldName = RELATIONSHIP_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'FACT_RELATIONSHIP.RELATIONSHIP_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.fact_relationship cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.relationship_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.fact_relationship cdmtable
    where (cdmtable.relationship_concept_id is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field COUNTRY_CONCEPT_ID in the LOCATION table.' as check_description
  ,'LOCATION' as cdm_table_name
  ,'COUNTRY_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_location_country_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = LOCATION
cdmFieldName = COUNTRY_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'LOCATION.COUNTRY_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.location cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.country_concept_id = 0
        or (cdmtable.country_concept_id is null and cdmtable.country_source_value is not null)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.location cdmtable
    where (cdmtable.country_concept_id is not null
    or cdmtable.country_source_value is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field MEASUREMENT_CONCEPT_ID in the MEASUREMENT table.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_measurement_measurement_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'MEASUREMENT.MEASUREMENT_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.measurement cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.measurement_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.measurement cdmtable
    where (cdmtable.measurement_concept_id is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field MEASUREMENT_TYPE_CONCEPT_ID in the MEASUREMENT table.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_measurement_measurement_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'MEASUREMENT.MEASUREMENT_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.measurement cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.measurement_type_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.measurement cdmtable
    where (cdmtable.measurement_type_concept_id is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field UNIT_CONCEPT_ID in the MEASUREMENT table.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_measurement_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = UNIT_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'MEASUREMENT.UNIT_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.measurement cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.unit_concept_id = 0
        or (cdmtable.unit_concept_id is null and cdmtable.unit_source_value is not null)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.measurement cdmtable
    where (cdmtable.unit_concept_id is not null
    or cdmtable.unit_source_value is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field OBSERVATION_CONCEPT_ID in the OBSERVATION table.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_observation_observation_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = OBSERVATION
cdmFieldName = OBSERVATION_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'OBSERVATION.OBSERVATION_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.observation cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.observation_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.observation cdmtable
    where (cdmtable.observation_concept_id is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field OBSERVATION_TYPE_CONCEPT_ID in the OBSERVATION table.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_observation_observation_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = OBSERVATION
cdmFieldName = OBSERVATION_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'OBSERVATION.OBSERVATION_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.observation cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.observation_type_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.observation cdmtable
    where (cdmtable.observation_type_concept_id is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field UNIT_CONCEPT_ID in the OBSERVATION table.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_observation_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = OBSERVATION
cdmFieldName = UNIT_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'OBSERVATION.UNIT_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.observation cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.unit_concept_id = 0
        or (cdmtable.unit_concept_id is null and cdmtable.unit_source_value is not null)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.observation cdmtable
    where (cdmtable.unit_concept_id is not null
    or cdmtable.unit_source_value is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field PERIOD_TYPE_CONCEPT_ID in the OBSERVATION_PERIOD table.' as check_description
  ,'OBSERVATION_PERIOD' as cdm_table_name
  ,'PERIOD_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_observation_period_period_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = OBSERVATION_PERIOD
cdmFieldName = PERIOD_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'OBSERVATION_PERIOD.PERIOD_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.observation_period cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.period_type_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.observation_period cdmtable
    where (cdmtable.period_type_concept_id is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field ETHNICITY_CONCEPT_ID in the PERSON table.' as check_description
  ,'PERSON' as cdm_table_name
  ,'ETHNICITY_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_person_ethnicity_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PERSON
cdmFieldName = ETHNICITY_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'PERSON.ETHNICITY_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.person cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.ethnicity_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.person cdmtable
    where (cdmtable.ethnicity_concept_id is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field GENDER_CONCEPT_ID in the PERSON table.' as check_description
  ,'PERSON' as cdm_table_name
  ,'GENDER_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_person_gender_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PERSON
cdmFieldName = GENDER_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'PERSON.GENDER_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.person cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.gender_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.person cdmtable
    where (cdmtable.gender_concept_id is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field RACE_CONCEPT_ID in the PERSON table.' as check_description
  ,'PERSON' as cdm_table_name
  ,'RACE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_person_race_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PERSON
cdmFieldName = RACE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'PERSON.RACE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.person cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.race_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.person cdmtable
    where (cdmtable.race_concept_id is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field MODIFIER_CONCEPT_ID in the PROCEDURE_OCCURRENCE table.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'MODIFIER_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_procedure_occurrence_modifier_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = MODIFIER_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'PROCEDURE_OCCURRENCE.MODIFIER_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.procedure_occurrence cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.modifier_concept_id = 0
        or (cdmtable.modifier_concept_id is null and cdmtable.modifier_source_value is not null)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.procedure_occurrence cdmtable
    where (cdmtable.modifier_concept_id is not null
    or cdmtable.modifier_source_value is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field PROCEDURE_CONCEPT_ID in the PROCEDURE_OCCURRENCE table.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_procedure_occurrence_procedure_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'PROCEDURE_OCCURRENCE.PROCEDURE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.procedure_occurrence cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.procedure_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.procedure_occurrence cdmtable
    where (cdmtable.procedure_concept_id is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field PROCEDURE_TYPE_CONCEPT_ID in the PROCEDURE_OCCURRENCE table.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_procedure_occurrence_procedure_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'PROCEDURE_OCCURRENCE.PROCEDURE_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.procedure_occurrence cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.procedure_type_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.procedure_occurrence cdmtable
    where (cdmtable.procedure_type_concept_id is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field GENDER_CONCEPT_ID in the PROVIDER table.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'GENDER_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_provider_gender_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROVIDER
cdmFieldName = GENDER_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'PROVIDER.GENDER_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.provider cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.gender_concept_id = 0
        or (cdmtable.gender_concept_id is null and cdmtable.gender_source_value is not null)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.provider cdmtable
    where (cdmtable.gender_concept_id is not null
    or cdmtable.gender_source_value is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field SPECIALTY_CONCEPT_ID in the PROVIDER table.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'SPECIALTY_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_provider_specialty_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROVIDER
cdmFieldName = SPECIALTY_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'PROVIDER.SPECIALTY_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.provider cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.specialty_concept_id = 0
        or (cdmtable.specialty_concept_id is null and cdmtable.specialty_source_value is not null)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.provider cdmtable
    where (cdmtable.specialty_concept_id is not null
    or cdmtable.specialty_source_value is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field SPECIMEN_CONCEPT_ID in the SPECIMEN table.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'SPECIMEN_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_specimen_specimen_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = SPECIMEN
cdmFieldName = SPECIMEN_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'SPECIMEN.SPECIMEN_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.specimen cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.specimen_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.specimen cdmtable
    where (cdmtable.specimen_concept_id is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field SPECIMEN_TYPE_CONCEPT_ID in the SPECIMEN table.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'SPECIMEN_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_specimen_specimen_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = SPECIMEN
cdmFieldName = SPECIMEN_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'SPECIMEN.SPECIMEN_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.specimen cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.specimen_type_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.specimen cdmtable
    where (cdmtable.specimen_type_concept_id is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field UNIT_CONCEPT_ID in the SPECIMEN table.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_specimen_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = SPECIMEN
cdmFieldName = UNIT_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'SPECIMEN.UNIT_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.specimen cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.unit_concept_id = 0
        or (cdmtable.unit_concept_id is null and cdmtable.unit_source_value is not null)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.specimen cdmtable
    where (cdmtable.unit_concept_id is not null
    or cdmtable.unit_source_value is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field ADMITTED_FROM_CONCEPT_ID in the VISIT_DETAIL table.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'ADMITTED_FROM_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_visit_detail_admitted_from_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = ADMITTED_FROM_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'VISIT_DETAIL.ADMITTED_FROM_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.visit_detail cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.admitted_from_concept_id = 0
        or (cdmtable.admitted_from_concept_id is null and cdmtable.admitted_from_source_value is not null)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.visit_detail cdmtable
    where (cdmtable.admitted_from_concept_id is not null
    or cdmtable.admitted_from_source_value is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field DISCHARGED_TO_CONCEPT_ID in the VISIT_DETAIL table.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'DISCHARGED_TO_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_visit_detail_discharged_to_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = DISCHARGED_TO_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'VISIT_DETAIL.DISCHARGED_TO_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.visit_detail cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.discharged_to_concept_id = 0
        or (cdmtable.discharged_to_concept_id is null and cdmtable.discharged_to_source_value is not null)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.visit_detail cdmtable
    where (cdmtable.discharged_to_concept_id is not null
    or cdmtable.discharged_to_source_value is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field VISIT_DETAIL_CONCEPT_ID in the VISIT_DETAIL table.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_visit_detail_visit_detail_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_DETAIL_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'VISIT_DETAIL.VISIT_DETAIL_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.visit_detail cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.visit_detail_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.visit_detail cdmtable
    where (cdmtable.visit_detail_concept_id is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field VISIT_DETAIL_TYPE_CONCEPT_ID in the VISIT_DETAIL table.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_visit_detail_visit_detail_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_DETAIL_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'VISIT_DETAIL.VISIT_DETAIL_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.visit_detail cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.visit_detail_type_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.visit_detail cdmtable
    where (cdmtable.visit_detail_type_concept_id is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field ADMITTED_FROM_CONCEPT_ID in the VISIT_OCCURRENCE table.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'ADMITTED_FROM_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_visit_occurrence_admitted_from_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = ADMITTED_FROM_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'VISIT_OCCURRENCE.ADMITTED_FROM_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.visit_occurrence cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.admitted_from_concept_id = 0
        or (cdmtable.admitted_from_concept_id is null and cdmtable.admitted_from_source_value is not null)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.visit_occurrence cdmtable
    where (cdmtable.admitted_from_concept_id is not null
    or cdmtable.admitted_from_source_value is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field DISCHARGED_TO_CONCEPT_ID in the VISIT_OCCURRENCE table.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'DISCHARGED_TO_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_visit_occurrence_discharged_to_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = DISCHARGED_TO_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'VISIT_OCCURRENCE.DISCHARGED_TO_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.visit_occurrence cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.discharged_to_concept_id = 0
        or (cdmtable.discharged_to_concept_id is null and cdmtable.discharged_to_source_value is not null)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.visit_occurrence cdmtable
    where (cdmtable.discharged_to_concept_id is not null
    or cdmtable.discharged_to_source_value is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field VISIT_CONCEPT_ID in the VISIT_OCCURRENCE table.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_visit_occurrence_visit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = VISIT_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'VISIT_OCCURRENCE.VISIT_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.visit_occurrence cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.visit_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.visit_occurrence cdmtable
    where (cdmtable.visit_concept_id is not null
    )
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
  ,'standardConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the standard concept field VISIT_TYPE_CONCEPT_ID in the VISIT_OCCURRENCE table.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_standardconceptrecordcompleteness_visit_occurrence_visit_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = VISIT_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
        select 
            'VISIT_OCCURRENCE.VISIT_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.visit_occurrence cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.visit_type_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.visit_occurrence cdmtable
    where (cdmtable.visit_type_concept_id is not null
    )
) denominator
) cte
)
 SELECT *
from cte_all
;

