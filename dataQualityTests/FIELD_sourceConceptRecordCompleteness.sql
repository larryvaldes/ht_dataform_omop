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
  ,'sourceConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the source concept field CONDITION_SOURCE_CONCEPT_ID in the CONDITION_OCCURRENCE table.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourceconceptrecordcompleteness_condition_occurrence_condition_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 10 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 10 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,10 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_SOURCE_CONCEPT_ID
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
            'CONDITION_OCCURRENCE.CONDITION_SOURCE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.condition_occurrence cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.condition_source_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.condition_occurrence cdmtable
    where (cdmtable.condition_source_concept_id is not null
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
  ,'sourceConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the source concept field CAUSE_SOURCE_CONCEPT_ID in the DEATH table.' as check_description
  ,'DEATH' as cdm_table_name
  ,'CAUSE_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourceconceptrecordcompleteness_death_cause_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 10 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 10 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,10 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DEATH
cdmFieldName = CAUSE_SOURCE_CONCEPT_ID
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
            'DEATH.CAUSE_SOURCE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.death cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.cause_source_concept_id = 0
        or (cdmtable.cause_source_concept_id is null and cdmtable.cause_source_value is not null)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.death cdmtable
    where (cdmtable.cause_source_concept_id is not null
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
  ,'sourceConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the source concept field DEVICE_SOURCE_CONCEPT_ID in the DEVICE_EXPOSURE table.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourceconceptrecordcompleteness_device_exposure_device_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 10 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 10 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,10 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = DEVICE_SOURCE_CONCEPT_ID
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
            'DEVICE_EXPOSURE.DEVICE_SOURCE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.device_exposure cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.device_source_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.device_exposure cdmtable
    where (cdmtable.device_source_concept_id is not null
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
  ,'sourceConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the source concept field UNIT_SOURCE_CONCEPT_ID in the DEVICE_EXPOSURE table.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'UNIT_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourceconceptrecordcompleteness_device_exposure_unit_source_concept_id' as checkid
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
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = UNIT_SOURCE_CONCEPT_ID
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
            'DEVICE_EXPOSURE.UNIT_SOURCE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.device_exposure cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.unit_source_concept_id = 0
        or (cdmtable.unit_source_concept_id is null and cdmtable.unit_source_value is not null)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.device_exposure cdmtable
    where (cdmtable.unit_source_concept_id is not null
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
  ,'sourceConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the source concept field DRUG_SOURCE_CONCEPT_ID in the DRUG_EXPOSURE table.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourceconceptrecordcompleteness_drug_exposure_drug_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 10 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 10 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,10 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DRUG_SOURCE_CONCEPT_ID
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
            'DRUG_EXPOSURE.DRUG_SOURCE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.drug_exposure cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.drug_source_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.drug_exposure cdmtable
    where (cdmtable.drug_source_concept_id is not null
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
  ,'sourceConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the source concept field EPISODE_SOURCE_CONCEPT_ID in the EPISODE table.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourceconceptrecordcompleteness_episode_episode_source_concept_id' as checkid
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
cdmTableName = EPISODE
cdmFieldName = EPISODE_SOURCE_CONCEPT_ID
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
            'EPISODE.EPISODE_SOURCE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.episode cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.episode_source_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.episode cdmtable
    where (cdmtable.episode_source_concept_id is not null
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
  ,'sourceConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the source concept field MEASUREMENT_SOURCE_CONCEPT_ID in the MEASUREMENT table.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourceconceptrecordcompleteness_measurement_measurement_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 10 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 10 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,10 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_SOURCE_CONCEPT_ID
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
            'MEASUREMENT.MEASUREMENT_SOURCE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.measurement cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.measurement_source_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.measurement cdmtable
    where (cdmtable.measurement_source_concept_id is not null
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
  ,'sourceConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the source concept field UNIT_SOURCE_CONCEPT_ID in the MEASUREMENT table.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'UNIT_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourceconceptrecordcompleteness_measurement_unit_source_concept_id' as checkid
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
cdmTableName = MEASUREMENT
cdmFieldName = UNIT_SOURCE_CONCEPT_ID
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
            'MEASUREMENT.UNIT_SOURCE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.measurement cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.unit_source_concept_id = 0
        or (cdmtable.unit_source_concept_id is null and cdmtable.unit_source_value is not null)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.measurement cdmtable
    where (cdmtable.unit_source_concept_id is not null
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
  ,'sourceConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the source concept field OBSERVATION_SOURCE_CONCEPT_ID in the OBSERVATION table.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourceconceptrecordcompleteness_observation_observation_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 10 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 10 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,10 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = OBSERVATION
cdmFieldName = OBSERVATION_SOURCE_CONCEPT_ID
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
            'OBSERVATION.OBSERVATION_SOURCE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.observation cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.observation_source_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.observation cdmtable
    where (cdmtable.observation_source_concept_id is not null
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
  ,'sourceConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the source concept field PROCEDURE_SOURCE_CONCEPT_ID in the PROCEDURE_OCCURRENCE table.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourceconceptrecordcompleteness_procedure_occurrence_procedure_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 10 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 10 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,10 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT_RECORD_COMPLETENESS
number of 0s / total number of records with non-null concept_id 
NB: in non-required fields, missing values are also counted as failures when a source value is available
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_SOURCE_CONCEPT_ID
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
            'PROCEDURE_OCCURRENCE.PROCEDURE_SOURCE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.procedure_occurrence cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.procedure_source_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.procedure_occurrence cdmtable
    where (cdmtable.procedure_source_concept_id is not null
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
  ,'sourceConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the source concept field SPECIALTY_SOURCE_CONCEPT_ID in the PROVIDER table.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'SPECIALTY_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourceconceptrecordcompleteness_provider_specialty_source_concept_id' as checkid
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
cdmFieldName = SPECIALTY_SOURCE_CONCEPT_ID
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
            'PROVIDER.SPECIALTY_SOURCE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.provider cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.specialty_source_concept_id = 0
        or (cdmtable.specialty_source_concept_id is null and cdmtable.specialty_source_value is not null)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.provider cdmtable
    where (cdmtable.specialty_source_concept_id is not null
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
  ,'sourceConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the source concept field VISIT_DETAIL_SOURCE_CONCEPT_ID in the VISIT_DETAIL table.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourceconceptrecordcompleteness_visit_detail_visit_detail_source_concept_id' as checkid
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
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_DETAIL_SOURCE_CONCEPT_ID
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
            'VISIT_DETAIL.VISIT_DETAIL_SOURCE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.visit_detail cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.visit_detail_source_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.visit_detail cdmtable
    where (cdmtable.visit_detail_source_concept_id is not null
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
  ,'sourceConceptRecordCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value of 0 in the source concept field VISIT_SOURCE_CONCEPT_ID in the VISIT_OCCURRENCE table.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_concept_record_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_sourceconceptrecordcompleteness_visit_occurrence_visit_source_concept_id' as checkid
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
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = VISIT_SOURCE_CONCEPT_ID
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
            'VISIT_OCCURRENCE.VISIT_SOURCE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.visit_occurrence cdmtable
        /* Violates if 0, or, for non-required fields, if empty and respective source value non-empty. For example, this resolves to the following for death.cause_concept_id:
        WHERE death.cause_concept_id = 0 OR (death.cause_concept_id IS NULL AND death.cause_source_value IS NOT NULL)
        */
        where cdmtable.visit_source_concept_id = 0
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select count(*) as num_rows
    from dataform.visit_occurrence cdmtable
    where (cdmtable.visit_source_concept_id is not null
    )
) denominator
) cte
)
 SELECT *
from cte_all
;

