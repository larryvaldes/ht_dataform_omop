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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the LOCATION_ID field in the CARE_SITE table that does not exist in the LOCATION table.' as check_description
  ,'CARE_SITE' as cdm_table_name
  ,'LOCATION_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_care_site_location_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = CARE_SITE
cdmFieldName = LOCATION_ID
fkTableName = LOCATION
fkFieldName = LOCATION_ID
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
        select 
            'CARE_SITE.LOCATION_ID' as violating_field, 
            cdmtable.*
        from dataform.care_site cdmtable
            left join 
                dataform.location fktable 
                on cdmtable.location_id = fktable.location_id
        where fktable.location_id is null 
            and cdmtable.location_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.care_site cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PLACE_OF_SERVICE_CONCEPT_ID field in the CARE_SITE table that does not exist in the CONCEPT table.' as check_description
  ,'CARE_SITE' as cdm_table_name
  ,'PLACE_OF_SERVICE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_care_site_place_of_service_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = CARE_SITE
cdmFieldName = PLACE_OF_SERVICE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'CARE_SITE.PLACE_OF_SERVICE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.care_site cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.place_of_service_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.place_of_service_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.care_site cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the CDM_VERSION_CONCEPT_ID field in the CDM_SOURCE table that does not exist in the CONCEPT table.' as check_description
  ,'CDM_SOURCE' as cdm_table_name
  ,'CDM_VERSION_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_cdm_source_cdm_version_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = CDM_SOURCE
cdmFieldName = CDM_VERSION_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'CDM_SOURCE.CDM_VERSION_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.cdm_source cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.cdm_version_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.cdm_version_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.cdm_source cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the COHORT_DEFINITION_ID field in the COHORT_DEFINITION table that does not exist in the COHORT table.' as check_description
  ,'COHORT_DEFINITION' as cdm_table_name
  ,'COHORT_DEFINITION_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_cohort_definition_cohort_definition_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = COHORT_DEFINITION
cdmFieldName = COHORT_DEFINITION_ID
fkTableName = COHORT
fkFieldName = COHORT_DEFINITION_ID
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
        select 
            'COHORT_DEFINITION.COHORT_DEFINITION_ID' as violating_field, 
            cdmtable.*
        from dataform.cohort_definition cdmtable
            left join 
                dataform.cohort fktable
                on cdmtable.cohort_definition_id = fktable.cohort_definition_id
        where fktable.cohort_definition_id is null 
            and cdmtable.cohort_definition_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.cohort_definition cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the DEFINITION_TYPE_CONCEPT_ID field in the COHORT_DEFINITION table that does not exist in the CONCEPT table.' as check_description
  ,'COHORT_DEFINITION' as cdm_table_name
  ,'DEFINITION_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_cohort_definition_definition_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = COHORT_DEFINITION
cdmFieldName = DEFINITION_TYPE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'COHORT_DEFINITION.DEFINITION_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.cohort_definition cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.definition_type_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.definition_type_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.cohort_definition cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the SUBJECT_CONCEPT_ID field in the COHORT_DEFINITION table that does not exist in the CONCEPT table.' as check_description
  ,'COHORT_DEFINITION' as cdm_table_name
  ,'SUBJECT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_cohort_definition_subject_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = COHORT_DEFINITION
cdmFieldName = SUBJECT_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'COHORT_DEFINITION.SUBJECT_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.cohort_definition cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.subject_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.subject_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.cohort_definition cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the CONCEPT_ID field in the CONCEPT_SYNONYM table that does not exist in the CONCEPT table.' as check_description
  ,'CONCEPT_SYNONYM' as cdm_table_name
  ,'CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_concept_synonym_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = CONCEPT_SYNONYM
cdmFieldName = CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'CONCEPT_SYNONYM.CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.concept_synonym cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.concept_synonym cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the LANGUAGE_CONCEPT_ID field in the CONCEPT_SYNONYM table that does not exist in the CONCEPT table.' as check_description
  ,'CONCEPT_SYNONYM' as cdm_table_name
  ,'LANGUAGE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_concept_synonym_language_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = CONCEPT_SYNONYM
cdmFieldName = LANGUAGE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'CONCEPT_SYNONYM.LANGUAGE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.concept_synonym cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.language_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.language_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.concept_synonym cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the CONDITION_CONCEPT_ID field in the CONDITION_ERA table that does not exist in the CONCEPT table.' as check_description
  ,'CONDITION_ERA' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_condition_era_condition_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = CONDITION_ERA
cdmFieldName = CONDITION_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'CONDITION_ERA.CONDITION_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.condition_era cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.condition_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.condition_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.condition_era cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PERSON_ID field in the CONDITION_ERA table that does not exist in the PERSON table.' as check_description
  ,'CONDITION_ERA' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_condition_era_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_ERA
cdmFieldName = PERSON_ID
fkTableName = PERSON
fkFieldName = PERSON_ID
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
        select 
            'CONDITION_ERA.PERSON_ID' as violating_field, 
            cdmtable.*
        from dataform.condition_era cdmtable
            left join 
                dataform.person fktable 
                on cdmtable.person_id = fktable.person_id
        where fktable.person_id is null 
            and cdmtable.person_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.condition_era cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the CONDITION_CONCEPT_ID field in the CONDITION_OCCURRENCE table that does not exist in the CONCEPT table.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_condition_occurrence_condition_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'CONDITION_OCCURRENCE.CONDITION_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.condition_occurrence cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.condition_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.condition_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the CONDITION_SOURCE_CONCEPT_ID field in the CONDITION_OCCURRENCE table that does not exist in the CONCEPT table.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_condition_occurrence_condition_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_SOURCE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'CONDITION_OCCURRENCE.CONDITION_SOURCE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.condition_occurrence cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.condition_source_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.condition_source_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the CONDITION_STATUS_CONCEPT_ID field in the CONDITION_OCCURRENCE table that does not exist in the CONCEPT table.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_STATUS_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_condition_occurrence_condition_status_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_STATUS_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'CONDITION_OCCURRENCE.CONDITION_STATUS_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.condition_occurrence cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.condition_status_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.condition_status_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the CONDITION_TYPE_CONCEPT_ID field in the CONDITION_OCCURRENCE table that does not exist in the CONCEPT table.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_condition_occurrence_condition_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_TYPE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'CONDITION_OCCURRENCE.CONDITION_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.condition_occurrence cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.condition_type_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.condition_type_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PERSON_ID field in the CONDITION_OCCURRENCE table that does not exist in the PERSON table.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_condition_occurrence_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = PERSON_ID
fkTableName = PERSON
fkFieldName = PERSON_ID
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
        select 
            'CONDITION_OCCURRENCE.PERSON_ID' as violating_field, 
            cdmtable.*
        from dataform.condition_occurrence cdmtable
            left join 
                dataform.person fktable 
                on cdmtable.person_id = fktable.person_id
        where fktable.person_id is null 
            and cdmtable.person_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PROVIDER_ID field in the CONDITION_OCCURRENCE table that does not exist in the PROVIDER table.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_condition_occurrence_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = PROVIDER_ID
fkTableName = PROVIDER
fkFieldName = PROVIDER_ID
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
        select 
            'CONDITION_OCCURRENCE.PROVIDER_ID' as violating_field, 
            cdmtable.*
        from dataform.condition_occurrence cdmtable
            left join 
                dataform.provider fktable 
                on cdmtable.provider_id = fktable.provider_id
        where fktable.provider_id is null 
            and cdmtable.provider_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the VISIT_DETAIL_ID field in the CONDITION_OCCURRENCE table that does not exist in the VISIT_DETAIL table.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_condition_occurrence_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = VISIT_DETAIL_ID
fkTableName = VISIT_DETAIL
fkFieldName = VISIT_DETAIL_ID
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
        select 
            'CONDITION_OCCURRENCE.VISIT_DETAIL_ID' as violating_field, 
            cdmtable.*
        from dataform.condition_occurrence cdmtable
            left join 
                dataform.visit_detail fktable 
                on cdmtable.visit_detail_id = fktable.visit_detail_id
        where fktable.visit_detail_id is null 
            and cdmtable.visit_detail_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the VISIT_OCCURRENCE_ID field in the CONDITION_OCCURRENCE table that does not exist in the VISIT_OCCURRENCE table.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_condition_occurrence_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = VISIT_OCCURRENCE_ID
fkTableName = VISIT_OCCURRENCE
fkFieldName = VISIT_OCCURRENCE_ID
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
        select 
            'CONDITION_OCCURRENCE.VISIT_OCCURRENCE_ID' as violating_field, 
            cdmtable.*
        from dataform.condition_occurrence cdmtable
            left join 
                dataform.visit_occurrence fktable 
                on cdmtable.visit_occurrence_id = fktable.visit_occurrence_id
        where fktable.visit_occurrence_id is null 
            and cdmtable.visit_occurrence_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the COST_DOMAIN_ID field in the COST table that does not exist in the DOMAIN table.' as check_description
  ,'COST' as cdm_table_name
  ,'COST_DOMAIN_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_cost_cost_domain_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = COST
cdmFieldName = COST_DOMAIN_ID
fkTableName = DOMAIN
fkFieldName = DOMAIN_ID
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
        select 
            'COST.COST_DOMAIN_ID' as violating_field, 
            cdmtable.*
        from dataform.cost cdmtable
            left join 
                dataform.domain fktable
                on cdmtable.cost_domain_id = fktable.domain_id
        where fktable.domain_id is null 
            and cdmtable.cost_domain_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.cost cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the COST_TYPE_CONCEPT_ID field in the COST table that does not exist in the CONCEPT table.' as check_description
  ,'COST' as cdm_table_name
  ,'COST_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_cost_cost_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = COST
cdmFieldName = COST_TYPE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'COST.COST_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.cost cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.cost_type_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.cost_type_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.cost cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the CURRENCY_CONCEPT_ID field in the COST table that does not exist in the CONCEPT table.' as check_description
  ,'COST' as cdm_table_name
  ,'CURRENCY_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_cost_currency_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = COST
cdmFieldName = CURRENCY_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'COST.CURRENCY_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.cost cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.currency_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.currency_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.cost cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the DRG_CONCEPT_ID field in the COST table that does not exist in the CONCEPT table.' as check_description
  ,'COST' as cdm_table_name
  ,'DRG_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_cost_drg_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = COST
cdmFieldName = DRG_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'COST.DRG_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.cost cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.drg_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.drg_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.cost cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the REVENUE_CODE_CONCEPT_ID field in the COST table that does not exist in the CONCEPT table.' as check_description
  ,'COST' as cdm_table_name
  ,'REVENUE_CODE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_cost_revenue_code_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = COST
cdmFieldName = REVENUE_CODE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'COST.REVENUE_CODE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.cost cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.revenue_code_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.revenue_code_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.cost cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the CAUSE_CONCEPT_ID field in the DEATH table that does not exist in the CONCEPT table.' as check_description
  ,'DEATH' as cdm_table_name
  ,'CAUSE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_death_cause_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = DEATH
cdmFieldName = CAUSE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'DEATH.CAUSE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.death cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.cause_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.cause_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the CAUSE_SOURCE_CONCEPT_ID field in the DEATH table that does not exist in the CONCEPT table.' as check_description
  ,'DEATH' as cdm_table_name
  ,'CAUSE_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_death_cause_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = DEATH
cdmFieldName = CAUSE_SOURCE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'DEATH.CAUSE_SOURCE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.death cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.cause_source_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.cause_source_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the DEATH_TYPE_CONCEPT_ID field in the DEATH table that does not exist in the CONCEPT table.' as check_description
  ,'DEATH' as cdm_table_name
  ,'DEATH_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_death_death_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = DEATH
cdmFieldName = DEATH_TYPE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'DEATH.DEATH_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.death cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.death_type_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.death_type_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PERSON_ID field in the DEATH table that does not exist in the PERSON table.' as check_description
  ,'DEATH' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_death_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = DEATH
cdmFieldName = PERSON_ID
fkTableName = PERSON
fkFieldName = PERSON_ID
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
        select 
            'DEATH.PERSON_ID' as violating_field, 
            cdmtable.*
        from dataform.death cdmtable
            left join 
                dataform.person fktable 
                on cdmtable.person_id = fktable.person_id
        where fktable.person_id is null 
            and cdmtable.person_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the DEVICE_CONCEPT_ID field in the DEVICE_EXPOSURE table that does not exist in the CONCEPT table.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_device_exposure_device_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = DEVICE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'DEVICE_EXPOSURE.DEVICE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.device_exposure cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.device_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.device_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the DEVICE_SOURCE_CONCEPT_ID field in the DEVICE_EXPOSURE table that does not exist in the CONCEPT table.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_device_exposure_device_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = DEVICE_SOURCE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'DEVICE_EXPOSURE.DEVICE_SOURCE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.device_exposure cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.device_source_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.device_source_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the DEVICE_TYPE_CONCEPT_ID field in the DEVICE_EXPOSURE table that does not exist in the CONCEPT table.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_device_exposure_device_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = DEVICE_TYPE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'DEVICE_EXPOSURE.DEVICE_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.device_exposure cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.device_type_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.device_type_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PERSON_ID field in the DEVICE_EXPOSURE table that does not exist in the PERSON table.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_device_exposure_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = PERSON_ID
fkTableName = PERSON
fkFieldName = PERSON_ID
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
        select 
            'DEVICE_EXPOSURE.PERSON_ID' as violating_field, 
            cdmtable.*
        from dataform.device_exposure cdmtable
            left join 
                dataform.person fktable 
                on cdmtable.person_id = fktable.person_id
        where fktable.person_id is null 
            and cdmtable.person_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PROVIDER_ID field in the DEVICE_EXPOSURE table that does not exist in the PROVIDER table.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_device_exposure_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = PROVIDER_ID
fkTableName = PROVIDER
fkFieldName = PROVIDER_ID
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
        select 
            'DEVICE_EXPOSURE.PROVIDER_ID' as violating_field, 
            cdmtable.*
        from dataform.device_exposure cdmtable
            left join 
                dataform.provider fktable 
                on cdmtable.provider_id = fktable.provider_id
        where fktable.provider_id is null 
            and cdmtable.provider_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the UNIT_CONCEPT_ID field in the DEVICE_EXPOSURE table that does not exist in the CONCEPT table.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_device_exposure_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = UNIT_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'DEVICE_EXPOSURE.UNIT_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.device_exposure cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.unit_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.unit_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the UNIT_SOURCE_CONCEPT_ID field in the DEVICE_EXPOSURE table that does not exist in the CONCEPT table.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'UNIT_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_device_exposure_unit_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = UNIT_SOURCE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'DEVICE_EXPOSURE.UNIT_SOURCE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.device_exposure cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.unit_source_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.unit_source_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the VISIT_DETAIL_ID field in the DEVICE_EXPOSURE table that does not exist in the VISIT_DETAIL table.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_device_exposure_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = VISIT_DETAIL_ID
fkTableName = VISIT_DETAIL
fkFieldName = VISIT_DETAIL_ID
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
        select 
            'DEVICE_EXPOSURE.VISIT_DETAIL_ID' as violating_field, 
            cdmtable.*
        from dataform.device_exposure cdmtable
            left join 
                dataform.visit_detail fktable 
                on cdmtable.visit_detail_id = fktable.visit_detail_id
        where fktable.visit_detail_id is null 
            and cdmtable.visit_detail_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the VISIT_OCCURRENCE_ID field in the DEVICE_EXPOSURE table that does not exist in the VISIT_OCCURRENCE table.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_device_exposure_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = VISIT_OCCURRENCE_ID
fkTableName = VISIT_OCCURRENCE
fkFieldName = VISIT_OCCURRENCE_ID
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
        select 
            'DEVICE_EXPOSURE.VISIT_OCCURRENCE_ID' as violating_field, 
            cdmtable.*
        from dataform.device_exposure cdmtable
            left join 
                dataform.visit_occurrence fktable 
                on cdmtable.visit_occurrence_id = fktable.visit_occurrence_id
        where fktable.visit_occurrence_id is null 
            and cdmtable.visit_occurrence_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the DOMAIN_CONCEPT_ID field in the DOMAIN table that does not exist in the CONCEPT table.' as check_description
  ,'DOMAIN' as cdm_table_name
  ,'DOMAIN_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_domain_domain_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = DOMAIN
cdmFieldName = DOMAIN_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'DOMAIN.DOMAIN_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.domain cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.domain_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.domain_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.domain cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the DRUG_CONCEPT_ID field in the DOSE_ERA table that does not exist in the CONCEPT table.' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'DRUG_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_dose_era_drug_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = DOSE_ERA
cdmFieldName = DRUG_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'DOSE_ERA.DRUG_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.dose_era cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.drug_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.drug_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.dose_era cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PERSON_ID field in the DOSE_ERA table that does not exist in the PERSON table.' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_dose_era_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = DOSE_ERA
cdmFieldName = PERSON_ID
fkTableName = PERSON
fkFieldName = PERSON_ID
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
        select 
            'DOSE_ERA.PERSON_ID' as violating_field, 
            cdmtable.*
        from dataform.dose_era cdmtable
            left join 
                dataform.person fktable 
                on cdmtable.person_id = fktable.person_id
        where fktable.person_id is null 
            and cdmtable.person_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.dose_era cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the UNIT_CONCEPT_ID field in the DOSE_ERA table that does not exist in the CONCEPT table.' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_dose_era_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = DOSE_ERA
cdmFieldName = UNIT_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'DOSE_ERA.UNIT_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.dose_era cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.unit_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.unit_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.dose_era cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the DRUG_CONCEPT_ID field in the DRUG_ERA table that does not exist in the CONCEPT table.' as check_description
  ,'DRUG_ERA' as cdm_table_name
  ,'DRUG_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_drug_era_drug_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = DRUG_ERA
cdmFieldName = DRUG_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'DRUG_ERA.DRUG_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.drug_era cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.drug_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.drug_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.drug_era cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PERSON_ID field in the DRUG_ERA table that does not exist in the PERSON table.' as check_description
  ,'DRUG_ERA' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_drug_era_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_ERA
cdmFieldName = PERSON_ID
fkTableName = PERSON
fkFieldName = PERSON_ID
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
        select 
            'DRUG_ERA.PERSON_ID' as violating_field, 
            cdmtable.*
        from dataform.drug_era cdmtable
            left join 
                dataform.person fktable 
                on cdmtable.person_id = fktable.person_id
        where fktable.person_id is null 
            and cdmtable.person_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.drug_era cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the DRUG_CONCEPT_ID field in the DRUG_EXPOSURE table that does not exist in the CONCEPT table.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_drug_exposure_drug_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DRUG_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'DRUG_EXPOSURE.DRUG_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.drug_exposure cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.drug_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.drug_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the DRUG_SOURCE_CONCEPT_ID field in the DRUG_EXPOSURE table that does not exist in the CONCEPT table.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_drug_exposure_drug_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DRUG_SOURCE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'DRUG_EXPOSURE.DRUG_SOURCE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.drug_exposure cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.drug_source_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.drug_source_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the DRUG_TYPE_CONCEPT_ID field in the DRUG_EXPOSURE table that does not exist in the CONCEPT table.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_drug_exposure_drug_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DRUG_TYPE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'DRUG_EXPOSURE.DRUG_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.drug_exposure cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.drug_type_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.drug_type_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PERSON_ID field in the DRUG_EXPOSURE table that does not exist in the PERSON table.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_drug_exposure_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = PERSON_ID
fkTableName = PERSON
fkFieldName = PERSON_ID
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
        select 
            'DRUG_EXPOSURE.PERSON_ID' as violating_field, 
            cdmtable.*
        from dataform.drug_exposure cdmtable
            left join 
                dataform.person fktable 
                on cdmtable.person_id = fktable.person_id
        where fktable.person_id is null 
            and cdmtable.person_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PROVIDER_ID field in the DRUG_EXPOSURE table that does not exist in the PROVIDER table.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_drug_exposure_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = PROVIDER_ID
fkTableName = PROVIDER
fkFieldName = PROVIDER_ID
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
        select 
            'DRUG_EXPOSURE.PROVIDER_ID' as violating_field, 
            cdmtable.*
        from dataform.drug_exposure cdmtable
            left join 
                dataform.provider fktable 
                on cdmtable.provider_id = fktable.provider_id
        where fktable.provider_id is null 
            and cdmtable.provider_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the ROUTE_CONCEPT_ID field in the DRUG_EXPOSURE table that does not exist in the CONCEPT table.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'ROUTE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_drug_exposure_route_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = ROUTE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'DRUG_EXPOSURE.ROUTE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.drug_exposure cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.route_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.route_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the VISIT_DETAIL_ID field in the DRUG_EXPOSURE table that does not exist in the VISIT_DETAIL table.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_drug_exposure_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = VISIT_DETAIL_ID
fkTableName = VISIT_DETAIL
fkFieldName = VISIT_DETAIL_ID
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
        select 
            'DRUG_EXPOSURE.VISIT_DETAIL_ID' as violating_field, 
            cdmtable.*
        from dataform.drug_exposure cdmtable
            left join 
                dataform.visit_detail fktable 
                on cdmtable.visit_detail_id = fktable.visit_detail_id
        where fktable.visit_detail_id is null 
            and cdmtable.visit_detail_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the VISIT_OCCURRENCE_ID field in the DRUG_EXPOSURE table that does not exist in the VISIT_OCCURRENCE table.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_drug_exposure_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = VISIT_OCCURRENCE_ID
fkTableName = VISIT_OCCURRENCE
fkFieldName = VISIT_OCCURRENCE_ID
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
        select 
            'DRUG_EXPOSURE.VISIT_OCCURRENCE_ID' as violating_field, 
            cdmtable.*
        from dataform.drug_exposure cdmtable
            left join 
                dataform.visit_occurrence fktable 
                on cdmtable.visit_occurrence_id = fktable.visit_occurrence_id
        where fktable.visit_occurrence_id is null 
            and cdmtable.visit_occurrence_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the AMOUNT_UNIT_CONCEPT_ID field in the DRUG_STRENGTH table that does not exist in the CONCEPT table.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'AMOUNT_UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_drug_strength_amount_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = DRUG_STRENGTH
cdmFieldName = AMOUNT_UNIT_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'DRUG_STRENGTH.AMOUNT_UNIT_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.drug_strength cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.amount_unit_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.amount_unit_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.drug_strength cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the DENOMINATOR_UNIT_CONCEPT_ID field in the DRUG_STRENGTH table that does not exist in the CONCEPT table.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'DENOMINATOR_UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_drug_strength_denominator_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = DRUG_STRENGTH
cdmFieldName = DENOMINATOR_UNIT_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'DRUG_STRENGTH.DENOMINATOR_UNIT_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.drug_strength cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.denominator_unit_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.denominator_unit_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.drug_strength cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the DRUG_CONCEPT_ID field in the DRUG_STRENGTH table that does not exist in the CONCEPT table.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'DRUG_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_drug_strength_drug_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = DRUG_STRENGTH
cdmFieldName = DRUG_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'DRUG_STRENGTH.DRUG_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.drug_strength cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.drug_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.drug_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.drug_strength cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the INGREDIENT_CONCEPT_ID field in the DRUG_STRENGTH table that does not exist in the CONCEPT table.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'INGREDIENT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_drug_strength_ingredient_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = DRUG_STRENGTH
cdmFieldName = INGREDIENT_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'DRUG_STRENGTH.INGREDIENT_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.drug_strength cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.ingredient_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.ingredient_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.drug_strength cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the NUMERATOR_UNIT_CONCEPT_ID field in the DRUG_STRENGTH table that does not exist in the CONCEPT table.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'NUMERATOR_UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_drug_strength_numerator_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = DRUG_STRENGTH
cdmFieldName = NUMERATOR_UNIT_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'DRUG_STRENGTH.NUMERATOR_UNIT_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.drug_strength cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.numerator_unit_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.numerator_unit_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.drug_strength cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the EPISODE_CONCEPT_ID field in the EPISODE table that does not exist in the CONCEPT table.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_episode_episode_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'EPISODE.EPISODE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.episode cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.episode_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.episode_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.episode cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the EPISODE_OBJECT_CONCEPT_ID field in the EPISODE table that does not exist in the CONCEPT table.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_OBJECT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_episode_episode_object_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_OBJECT_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'EPISODE.EPISODE_OBJECT_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.episode cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.episode_object_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.episode_object_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.episode cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the EPISODE_SOURCE_CONCEPT_ID field in the EPISODE table that does not exist in the CONCEPT table.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_episode_episode_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_SOURCE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'EPISODE.EPISODE_SOURCE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.episode cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.episode_source_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.episode_source_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.episode cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the EPISODE_TYPE_CONCEPT_ID field in the EPISODE table that does not exist in the CONCEPT table.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_episode_episode_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_TYPE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'EPISODE.EPISODE_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.episode cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.episode_type_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.episode_type_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.episode cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PERSON_ID field in the EPISODE table that does not exist in the PERSON table.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_episode_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = EPISODE
cdmFieldName = PERSON_ID
fkTableName = PERSON
fkFieldName = PERSON_ID
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
        select 
            'EPISODE.PERSON_ID' as violating_field, 
            cdmtable.*
        from dataform.episode cdmtable
            left join 
                dataform.person fktable 
                on cdmtable.person_id = fktable.person_id
        where fktable.person_id is null 
            and cdmtable.person_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.episode cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the EPISODE_EVENT_FIELD_CONCEPT_ID field in the EPISODE_EVENT table that does not exist in the CONCEPT table.' as check_description
  ,'EPISODE_EVENT' as cdm_table_name
  ,'EPISODE_EVENT_FIELD_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_episode_event_episode_event_field_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = EPISODE_EVENT
cdmFieldName = EPISODE_EVENT_FIELD_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'EPISODE_EVENT.EPISODE_EVENT_FIELD_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.episode_event cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.episode_event_field_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.episode_event_field_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.episode_event cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the EPISODE_ID field in the EPISODE_EVENT table that does not exist in the EPISODE table.' as check_description
  ,'EPISODE_EVENT' as cdm_table_name
  ,'EPISODE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_episode_event_episode_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = EPISODE_EVENT
cdmFieldName = EPISODE_ID
fkTableName = EPISODE
fkFieldName = EPISODE_ID
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
        select 
            'EPISODE_EVENT.EPISODE_ID' as violating_field, 
            cdmtable.*
        from dataform.episode_event cdmtable
            left join 
                dataform.episode fktable 
                on cdmtable.episode_id = fktable.episode_id
        where fktable.episode_id is null 
            and cdmtable.episode_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.episode_event cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the DOMAIN_CONCEPT_ID_1 field in the FACT_RELATIONSHIP table that does not exist in the CONCEPT table.' as check_description
  ,'FACT_RELATIONSHIP' as cdm_table_name
  ,'DOMAIN_CONCEPT_ID_1' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_fact_relationship_domain_concept_id_1' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = FACT_RELATIONSHIP
cdmFieldName = DOMAIN_CONCEPT_ID_1
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'FACT_RELATIONSHIP.DOMAIN_CONCEPT_ID_1' as violating_field, 
            cdmtable.*
        from dataform.fact_relationship cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.domain_concept_id_1 = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.domain_concept_id_1 is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.fact_relationship cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the DOMAIN_CONCEPT_ID_2 field in the FACT_RELATIONSHIP table that does not exist in the CONCEPT table.' as check_description
  ,'FACT_RELATIONSHIP' as cdm_table_name
  ,'DOMAIN_CONCEPT_ID_2' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_fact_relationship_domain_concept_id_2' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = FACT_RELATIONSHIP
cdmFieldName = DOMAIN_CONCEPT_ID_2
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'FACT_RELATIONSHIP.DOMAIN_CONCEPT_ID_2' as violating_field, 
            cdmtable.*
        from dataform.fact_relationship cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.domain_concept_id_2 = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.domain_concept_id_2 is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.fact_relationship cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the RELATIONSHIP_CONCEPT_ID field in the FACT_RELATIONSHIP table that does not exist in the CONCEPT table.' as check_description
  ,'FACT_RELATIONSHIP' as cdm_table_name
  ,'RELATIONSHIP_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_fact_relationship_relationship_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = FACT_RELATIONSHIP
cdmFieldName = RELATIONSHIP_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'FACT_RELATIONSHIP.RELATIONSHIP_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.fact_relationship cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.relationship_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.relationship_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.fact_relationship cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the COUNTRY_CONCEPT_ID field in the LOCATION table that does not exist in the CONCEPT table.' as check_description
  ,'LOCATION' as cdm_table_name
  ,'COUNTRY_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_location_country_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = LOCATION
cdmFieldName = COUNTRY_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'LOCATION.COUNTRY_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.location cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.country_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.country_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.location cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the MEAS_EVENT_FIELD_CONCEPT_ID field in the MEASUREMENT table that does not exist in the CONCEPT table.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEAS_EVENT_FIELD_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_measurement_meas_event_field_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEAS_EVENT_FIELD_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'MEASUREMENT.MEAS_EVENT_FIELD_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.measurement cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.meas_event_field_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.meas_event_field_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the MEASUREMENT_CONCEPT_ID field in the MEASUREMENT table that does not exist in the CONCEPT table.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_measurement_measurement_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'MEASUREMENT.MEASUREMENT_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.measurement cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.measurement_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.measurement_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the MEASUREMENT_SOURCE_CONCEPT_ID field in the MEASUREMENT table that does not exist in the CONCEPT table.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_measurement_measurement_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_SOURCE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'MEASUREMENT.MEASUREMENT_SOURCE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.measurement cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.measurement_source_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.measurement_source_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the MEASUREMENT_TYPE_CONCEPT_ID field in the MEASUREMENT table that does not exist in the CONCEPT table.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_measurement_measurement_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_TYPE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'MEASUREMENT.MEASUREMENT_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.measurement cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.measurement_type_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.measurement_type_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the OPERATOR_CONCEPT_ID field in the MEASUREMENT table that does not exist in the CONCEPT table.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'OPERATOR_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_measurement_operator_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = OPERATOR_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'MEASUREMENT.OPERATOR_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.measurement cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.operator_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.operator_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PERSON_ID field in the MEASUREMENT table that does not exist in the PERSON table.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_measurement_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = PERSON_ID
fkTableName = PERSON
fkFieldName = PERSON_ID
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
        select 
            'MEASUREMENT.PERSON_ID' as violating_field, 
            cdmtable.*
        from dataform.measurement cdmtable
            left join 
                dataform.person fktable 
                on cdmtable.person_id = fktable.person_id
        where fktable.person_id is null 
            and cdmtable.person_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PROVIDER_ID field in the MEASUREMENT table that does not exist in the PROVIDER table.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_measurement_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = PROVIDER_ID
fkTableName = PROVIDER
fkFieldName = PROVIDER_ID
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
        select 
            'MEASUREMENT.PROVIDER_ID' as violating_field, 
            cdmtable.*
        from dataform.measurement cdmtable
            left join 
                dataform.provider fktable 
                on cdmtable.provider_id = fktable.provider_id
        where fktable.provider_id is null 
            and cdmtable.provider_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the UNIT_CONCEPT_ID field in the MEASUREMENT table that does not exist in the CONCEPT table.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_measurement_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = UNIT_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'MEASUREMENT.UNIT_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.measurement cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.unit_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.unit_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the UNIT_SOURCE_CONCEPT_ID field in the MEASUREMENT table that does not exist in the CONCEPT table.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'UNIT_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_measurement_unit_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = UNIT_SOURCE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'MEASUREMENT.UNIT_SOURCE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.measurement cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.unit_source_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.unit_source_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the VALUE_AS_CONCEPT_ID field in the MEASUREMENT table that does not exist in the CONCEPT table.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'VALUE_AS_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_measurement_value_as_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = VALUE_AS_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'MEASUREMENT.VALUE_AS_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.measurement cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.value_as_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.value_as_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the VISIT_DETAIL_ID field in the MEASUREMENT table that does not exist in the VISIT_DETAIL table.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_measurement_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = VISIT_DETAIL_ID
fkTableName = VISIT_DETAIL
fkFieldName = VISIT_DETAIL_ID
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
        select 
            'MEASUREMENT.VISIT_DETAIL_ID' as violating_field, 
            cdmtable.*
        from dataform.measurement cdmtable
            left join 
                dataform.visit_detail fktable 
                on cdmtable.visit_detail_id = fktable.visit_detail_id
        where fktable.visit_detail_id is null 
            and cdmtable.visit_detail_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the VISIT_OCCURRENCE_ID field in the MEASUREMENT table that does not exist in the VISIT_OCCURRENCE table.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_measurement_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = VISIT_OCCURRENCE_ID
fkTableName = VISIT_OCCURRENCE
fkFieldName = VISIT_OCCURRENCE_ID
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
        select 
            'MEASUREMENT.VISIT_OCCURRENCE_ID' as violating_field, 
            cdmtable.*
        from dataform.measurement cdmtable
            left join 
                dataform.visit_occurrence fktable 
                on cdmtable.visit_occurrence_id = fktable.visit_occurrence_id
        where fktable.visit_occurrence_id is null 
            and cdmtable.visit_occurrence_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the METADATA_CONCEPT_ID field in the METADATA table that does not exist in the CONCEPT table.' as check_description
  ,'METADATA' as cdm_table_name
  ,'METADATA_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_metadata_metadata_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = METADATA
cdmFieldName = METADATA_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'METADATA.METADATA_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.metadata cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.metadata_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.metadata_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.metadata cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the METADATA_TYPE_CONCEPT_ID field in the METADATA table that does not exist in the CONCEPT table.' as check_description
  ,'METADATA' as cdm_table_name
  ,'METADATA_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_metadata_metadata_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = METADATA
cdmFieldName = METADATA_TYPE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'METADATA.METADATA_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.metadata cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.metadata_type_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.metadata_type_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.metadata cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the VALUE_AS_CONCEPT_ID field in the METADATA table that does not exist in the CONCEPT table.' as check_description
  ,'METADATA' as cdm_table_name
  ,'VALUE_AS_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_metadata_value_as_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = METADATA
cdmFieldName = VALUE_AS_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'METADATA.VALUE_AS_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.metadata cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.value_as_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.value_as_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.metadata cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the ENCODING_CONCEPT_ID field in the NOTE table that does not exist in the CONCEPT table.' as check_description
  ,'NOTE' as cdm_table_name
  ,'ENCODING_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_note_encoding_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = NOTE
cdmFieldName = ENCODING_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'NOTE.ENCODING_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.note cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.encoding_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.encoding_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.note cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the LANGUAGE_CONCEPT_ID field in the NOTE table that does not exist in the CONCEPT table.' as check_description
  ,'NOTE' as cdm_table_name
  ,'LANGUAGE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_note_language_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = NOTE
cdmFieldName = LANGUAGE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'NOTE.LANGUAGE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.note cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.language_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.language_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.note cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the NOTE_CLASS_CONCEPT_ID field in the NOTE table that does not exist in the CONCEPT table.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_CLASS_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_note_note_class_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = NOTE
cdmFieldName = NOTE_CLASS_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'NOTE.NOTE_CLASS_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.note cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.note_class_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.note_class_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.note cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the NOTE_EVENT_FIELD_CONCEPT_ID field in the NOTE table that does not exist in the CONCEPT table.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_EVENT_FIELD_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_note_note_event_field_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = NOTE
cdmFieldName = NOTE_EVENT_FIELD_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'NOTE.NOTE_EVENT_FIELD_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.note cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.note_event_field_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.note_event_field_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.note cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the NOTE_TYPE_CONCEPT_ID field in the NOTE table that does not exist in the CONCEPT table.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_note_note_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = NOTE
cdmFieldName = NOTE_TYPE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'NOTE.NOTE_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.note cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.note_type_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.note_type_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.note cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PERSON_ID field in the NOTE table that does not exist in the PERSON table.' as check_description
  ,'NOTE' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_note_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = NOTE
cdmFieldName = PERSON_ID
fkTableName = PERSON
fkFieldName = PERSON_ID
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
        select 
            'NOTE.PERSON_ID' as violating_field, 
            cdmtable.*
        from dataform.note cdmtable
            left join 
                dataform.person fktable 
                on cdmtable.person_id = fktable.person_id
        where fktable.person_id is null 
            and cdmtable.person_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.note cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PROVIDER_ID field in the NOTE table that does not exist in the PROVIDER table.' as check_description
  ,'NOTE' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_note_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = NOTE
cdmFieldName = PROVIDER_ID
fkTableName = PROVIDER
fkFieldName = PROVIDER_ID
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
        select 
            'NOTE.PROVIDER_ID' as violating_field, 
            cdmtable.*
        from dataform.note cdmtable
            left join 
                dataform.provider fktable 
                on cdmtable.provider_id = fktable.provider_id
        where fktable.provider_id is null 
            and cdmtable.provider_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.note cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the VISIT_DETAIL_ID field in the NOTE table that does not exist in the VISIT_DETAIL table.' as check_description
  ,'NOTE' as cdm_table_name
  ,'VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_note_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = NOTE
cdmFieldName = VISIT_DETAIL_ID
fkTableName = VISIT_DETAIL
fkFieldName = VISIT_DETAIL_ID
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
        select 
            'NOTE.VISIT_DETAIL_ID' as violating_field, 
            cdmtable.*
        from dataform.note cdmtable
            left join 
                dataform.visit_detail fktable 
                on cdmtable.visit_detail_id = fktable.visit_detail_id
        where fktable.visit_detail_id is null 
            and cdmtable.visit_detail_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.note cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the VISIT_OCCURRENCE_ID field in the NOTE table that does not exist in the VISIT_OCCURRENCE table.' as check_description
  ,'NOTE' as cdm_table_name
  ,'VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_note_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = NOTE
cdmFieldName = VISIT_OCCURRENCE_ID
fkTableName = VISIT_OCCURRENCE
fkFieldName = VISIT_OCCURRENCE_ID
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
        select 
            'NOTE.VISIT_OCCURRENCE_ID' as violating_field, 
            cdmtable.*
        from dataform.note cdmtable
            left join 
                dataform.visit_occurrence fktable 
                on cdmtable.visit_occurrence_id = fktable.visit_occurrence_id
        where fktable.visit_occurrence_id is null 
            and cdmtable.visit_occurrence_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.note cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the NOTE_NLP_CONCEPT_ID field in the NOTE_NLP table that does not exist in the CONCEPT table.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'NOTE_NLP_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_note_nlp_note_nlp_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = NOTE_NLP
cdmFieldName = NOTE_NLP_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'NOTE_NLP.NOTE_NLP_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.note_nlp cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.note_nlp_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.note_nlp_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.note_nlp cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the NOTE_NLP_SOURCE_CONCEPT_ID field in the NOTE_NLP table that does not exist in the CONCEPT table.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'NOTE_NLP_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_note_nlp_note_nlp_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = NOTE_NLP
cdmFieldName = NOTE_NLP_SOURCE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'NOTE_NLP.NOTE_NLP_SOURCE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.note_nlp cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.note_nlp_source_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.note_nlp_source_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.note_nlp cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the SECTION_CONCEPT_ID field in the NOTE_NLP table that does not exist in the CONCEPT table.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'SECTION_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_note_nlp_section_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = NOTE_NLP
cdmFieldName = SECTION_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'NOTE_NLP.SECTION_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.note_nlp cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.section_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.section_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.note_nlp cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the OBS_EVENT_FIELD_CONCEPT_ID field in the OBSERVATION table that does not exist in the CONCEPT table.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBS_EVENT_FIELD_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_observation_obs_event_field_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = OBSERVATION
cdmFieldName = OBS_EVENT_FIELD_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'OBSERVATION.OBS_EVENT_FIELD_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.observation cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.obs_event_field_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.obs_event_field_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the OBSERVATION_CONCEPT_ID field in the OBSERVATION table that does not exist in the CONCEPT table.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_observation_observation_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = OBSERVATION
cdmFieldName = OBSERVATION_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'OBSERVATION.OBSERVATION_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.observation cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.observation_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.observation_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the OBSERVATION_SOURCE_CONCEPT_ID field in the OBSERVATION table that does not exist in the CONCEPT table.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_observation_observation_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = OBSERVATION
cdmFieldName = OBSERVATION_SOURCE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'OBSERVATION.OBSERVATION_SOURCE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.observation cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.observation_source_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.observation_source_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the OBSERVATION_TYPE_CONCEPT_ID field in the OBSERVATION table that does not exist in the CONCEPT table.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_observation_observation_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = OBSERVATION
cdmFieldName = OBSERVATION_TYPE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'OBSERVATION.OBSERVATION_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.observation cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.observation_type_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.observation_type_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PERSON_ID field in the OBSERVATION table that does not exist in the PERSON table.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_observation_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION
cdmFieldName = PERSON_ID
fkTableName = PERSON
fkFieldName = PERSON_ID
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
        select 
            'OBSERVATION.PERSON_ID' as violating_field, 
            cdmtable.*
        from dataform.observation cdmtable
            left join 
                dataform.person fktable 
                on cdmtable.person_id = fktable.person_id
        where fktable.person_id is null 
            and cdmtable.person_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PROVIDER_ID field in the OBSERVATION table that does not exist in the PROVIDER table.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_observation_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION
cdmFieldName = PROVIDER_ID
fkTableName = PROVIDER
fkFieldName = PROVIDER_ID
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
        select 
            'OBSERVATION.PROVIDER_ID' as violating_field, 
            cdmtable.*
        from dataform.observation cdmtable
            left join 
                dataform.provider fktable 
                on cdmtable.provider_id = fktable.provider_id
        where fktable.provider_id is null 
            and cdmtable.provider_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the QUALIFIER_CONCEPT_ID field in the OBSERVATION table that does not exist in the CONCEPT table.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'QUALIFIER_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_observation_qualifier_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = OBSERVATION
cdmFieldName = QUALIFIER_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'OBSERVATION.QUALIFIER_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.observation cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.qualifier_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.qualifier_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the UNIT_CONCEPT_ID field in the OBSERVATION table that does not exist in the CONCEPT table.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_observation_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = OBSERVATION
cdmFieldName = UNIT_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'OBSERVATION.UNIT_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.observation cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.unit_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.unit_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the VALUE_AS_CONCEPT_ID field in the OBSERVATION table that does not exist in the CONCEPT table.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'VALUE_AS_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_observation_value_as_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = OBSERVATION
cdmFieldName = VALUE_AS_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'OBSERVATION.VALUE_AS_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.observation cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.value_as_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.value_as_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the VISIT_DETAIL_ID field in the OBSERVATION table that does not exist in the VISIT_DETAIL table.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_observation_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION
cdmFieldName = VISIT_DETAIL_ID
fkTableName = VISIT_DETAIL
fkFieldName = VISIT_DETAIL_ID
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
        select 
            'OBSERVATION.VISIT_DETAIL_ID' as violating_field, 
            cdmtable.*
        from dataform.observation cdmtable
            left join 
                dataform.visit_detail fktable 
                on cdmtable.visit_detail_id = fktable.visit_detail_id
        where fktable.visit_detail_id is null 
            and cdmtable.visit_detail_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the VISIT_OCCURRENCE_ID field in the OBSERVATION table that does not exist in the VISIT_OCCURRENCE table.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_observation_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION
cdmFieldName = VISIT_OCCURRENCE_ID
fkTableName = VISIT_OCCURRENCE
fkFieldName = VISIT_OCCURRENCE_ID
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
        select 
            'OBSERVATION.VISIT_OCCURRENCE_ID' as violating_field, 
            cdmtable.*
        from dataform.observation cdmtable
            left join 
                dataform.visit_occurrence fktable 
                on cdmtable.visit_occurrence_id = fktable.visit_occurrence_id
        where fktable.visit_occurrence_id is null 
            and cdmtable.visit_occurrence_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PERIOD_TYPE_CONCEPT_ID field in the OBSERVATION_PERIOD table that does not exist in the CONCEPT table.' as check_description
  ,'OBSERVATION_PERIOD' as cdm_table_name
  ,'PERIOD_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_observation_period_period_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = OBSERVATION_PERIOD
cdmFieldName = PERIOD_TYPE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'OBSERVATION_PERIOD.PERIOD_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.observation_period cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.period_type_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.period_type_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.observation_period cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PERSON_ID field in the OBSERVATION_PERIOD table that does not exist in the PERSON table.' as check_description
  ,'OBSERVATION_PERIOD' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_observation_period_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION_PERIOD
cdmFieldName = PERSON_ID
fkTableName = PERSON
fkFieldName = PERSON_ID
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
        select 
            'OBSERVATION_PERIOD.PERSON_ID' as violating_field, 
            cdmtable.*
        from dataform.observation_period cdmtable
            left join 
                dataform.person fktable 
                on cdmtable.person_id = fktable.person_id
        where fktable.person_id is null 
            and cdmtable.person_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.observation_period cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PAYER_CONCEPT_ID field in the PAYER_PLAN_PERIOD table that does not exist in the CONCEPT table.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PAYER_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_payer_plan_period_payer_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = PAYER_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'PAYER_PLAN_PERIOD.PAYER_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.payer_plan_period cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.payer_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.payer_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PAYER_SOURCE_CONCEPT_ID field in the PAYER_PLAN_PERIOD table that does not exist in the CONCEPT table.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PAYER_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_payer_plan_period_payer_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = PAYER_SOURCE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'PAYER_PLAN_PERIOD.PAYER_SOURCE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.payer_plan_period cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.payer_source_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.payer_source_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PERSON_ID field in the PAYER_PLAN_PERIOD table that does not exist in the PERSON table.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_payer_plan_period_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = PERSON_ID
fkTableName = PERSON
fkFieldName = PERSON_ID
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
        select 
            'PAYER_PLAN_PERIOD.PERSON_ID' as violating_field, 
            cdmtable.*
        from dataform.payer_plan_period cdmtable
            left join 
                dataform.person fktable 
                on cdmtable.person_id = fktable.person_id
        where fktable.person_id is null 
            and cdmtable.person_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PLAN_CONCEPT_ID field in the PAYER_PLAN_PERIOD table that does not exist in the CONCEPT table.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PLAN_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_payer_plan_period_plan_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = PLAN_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'PAYER_PLAN_PERIOD.PLAN_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.payer_plan_period cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.plan_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.plan_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PLAN_SOURCE_CONCEPT_ID field in the PAYER_PLAN_PERIOD table that does not exist in the CONCEPT table.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PLAN_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_payer_plan_period_plan_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = PLAN_SOURCE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'PAYER_PLAN_PERIOD.PLAN_SOURCE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.payer_plan_period cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.plan_source_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.plan_source_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the SPONSOR_CONCEPT_ID field in the PAYER_PLAN_PERIOD table that does not exist in the CONCEPT table.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'SPONSOR_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_payer_plan_period_sponsor_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = SPONSOR_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'PAYER_PLAN_PERIOD.SPONSOR_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.payer_plan_period cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.sponsor_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.sponsor_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the SPONSOR_SOURCE_CONCEPT_ID field in the PAYER_PLAN_PERIOD table that does not exist in the CONCEPT table.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'SPONSOR_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_payer_plan_period_sponsor_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = SPONSOR_SOURCE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'PAYER_PLAN_PERIOD.SPONSOR_SOURCE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.payer_plan_period cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.sponsor_source_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.sponsor_source_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the STOP_REASON_CONCEPT_ID field in the PAYER_PLAN_PERIOD table that does not exist in the CONCEPT table.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'STOP_REASON_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_payer_plan_period_stop_reason_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = STOP_REASON_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'PAYER_PLAN_PERIOD.STOP_REASON_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.payer_plan_period cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.stop_reason_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.stop_reason_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the STOP_REASON_SOURCE_CONCEPT_ID field in the PAYER_PLAN_PERIOD table that does not exist in the CONCEPT table.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'STOP_REASON_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_payer_plan_period_stop_reason_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = STOP_REASON_SOURCE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'PAYER_PLAN_PERIOD.STOP_REASON_SOURCE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.payer_plan_period cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.stop_reason_source_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.stop_reason_source_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the CARE_SITE_ID field in the PERSON table that does not exist in the CARE_SITE table.' as check_description
  ,'PERSON' as cdm_table_name
  ,'CARE_SITE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_person_care_site_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = PERSON
cdmFieldName = CARE_SITE_ID
fkTableName = CARE_SITE
fkFieldName = CARE_SITE_ID
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
        select 
            'PERSON.CARE_SITE_ID' as violating_field, 
            cdmtable.*
        from dataform.person cdmtable
            left join 
                dataform.care_site fktable 
                on cdmtable.care_site_id = fktable.care_site_id
        where fktable.care_site_id is null 
            and cdmtable.care_site_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the ETHNICITY_CONCEPT_ID field in the PERSON table that does not exist in the CONCEPT table.' as check_description
  ,'PERSON' as cdm_table_name
  ,'ETHNICITY_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_person_ethnicity_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = PERSON
cdmFieldName = ETHNICITY_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'PERSON.ETHNICITY_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.person cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.ethnicity_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.ethnicity_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the ETHNICITY_SOURCE_CONCEPT_ID field in the PERSON table that does not exist in the CONCEPT table.' as check_description
  ,'PERSON' as cdm_table_name
  ,'ETHNICITY_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_person_ethnicity_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = PERSON
cdmFieldName = ETHNICITY_SOURCE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'PERSON.ETHNICITY_SOURCE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.person cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.ethnicity_source_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.ethnicity_source_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the GENDER_CONCEPT_ID field in the PERSON table that does not exist in the CONCEPT table.' as check_description
  ,'PERSON' as cdm_table_name
  ,'GENDER_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_person_gender_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = PERSON
cdmFieldName = GENDER_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'PERSON.GENDER_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.person cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.gender_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.gender_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the GENDER_SOURCE_CONCEPT_ID field in the PERSON table that does not exist in the CONCEPT table.' as check_description
  ,'PERSON' as cdm_table_name
  ,'GENDER_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_person_gender_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = PERSON
cdmFieldName = GENDER_SOURCE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'PERSON.GENDER_SOURCE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.person cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.gender_source_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.gender_source_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the LOCATION_ID field in the PERSON table that does not exist in the LOCATION table.' as check_description
  ,'PERSON' as cdm_table_name
  ,'LOCATION_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_person_location_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = PERSON
cdmFieldName = LOCATION_ID
fkTableName = LOCATION
fkFieldName = LOCATION_ID
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
        select 
            'PERSON.LOCATION_ID' as violating_field, 
            cdmtable.*
        from dataform.person cdmtable
            left join 
                dataform.location fktable 
                on cdmtable.location_id = fktable.location_id
        where fktable.location_id is null 
            and cdmtable.location_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PROVIDER_ID field in the PERSON table that does not exist in the PROVIDER table.' as check_description
  ,'PERSON' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_person_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = PERSON
cdmFieldName = PROVIDER_ID
fkTableName = PROVIDER
fkFieldName = PROVIDER_ID
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
        select 
            'PERSON.PROVIDER_ID' as violating_field, 
            cdmtable.*
        from dataform.person cdmtable
            left join 
                dataform.provider fktable 
                on cdmtable.provider_id = fktable.provider_id
        where fktable.provider_id is null 
            and cdmtable.provider_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the RACE_CONCEPT_ID field in the PERSON table that does not exist in the CONCEPT table.' as check_description
  ,'PERSON' as cdm_table_name
  ,'RACE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_person_race_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = PERSON
cdmFieldName = RACE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'PERSON.RACE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.person cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.race_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.race_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the RACE_SOURCE_CONCEPT_ID field in the PERSON table that does not exist in the CONCEPT table.' as check_description
  ,'PERSON' as cdm_table_name
  ,'RACE_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_person_race_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = PERSON
cdmFieldName = RACE_SOURCE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'PERSON.RACE_SOURCE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.person cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.race_source_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.race_source_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the MODIFIER_CONCEPT_ID field in the PROCEDURE_OCCURRENCE table that does not exist in the CONCEPT table.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'MODIFIER_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_procedure_occurrence_modifier_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = MODIFIER_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'PROCEDURE_OCCURRENCE.MODIFIER_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.procedure_occurrence cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.modifier_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.modifier_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PERSON_ID field in the PROCEDURE_OCCURRENCE table that does not exist in the PERSON table.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_procedure_occurrence_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PERSON_ID
fkTableName = PERSON
fkFieldName = PERSON_ID
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
        select 
            'PROCEDURE_OCCURRENCE.PERSON_ID' as violating_field, 
            cdmtable.*
        from dataform.procedure_occurrence cdmtable
            left join 
                dataform.person fktable 
                on cdmtable.person_id = fktable.person_id
        where fktable.person_id is null 
            and cdmtable.person_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PROCEDURE_CONCEPT_ID field in the PROCEDURE_OCCURRENCE table that does not exist in the CONCEPT table.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_procedure_occurrence_procedure_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'PROCEDURE_OCCURRENCE.PROCEDURE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.procedure_occurrence cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.procedure_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.procedure_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PROCEDURE_SOURCE_CONCEPT_ID field in the PROCEDURE_OCCURRENCE table that does not exist in the CONCEPT table.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_procedure_occurrence_procedure_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_SOURCE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'PROCEDURE_OCCURRENCE.PROCEDURE_SOURCE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.procedure_occurrence cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.procedure_source_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.procedure_source_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PROCEDURE_TYPE_CONCEPT_ID field in the PROCEDURE_OCCURRENCE table that does not exist in the CONCEPT table.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_procedure_occurrence_procedure_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_TYPE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'PROCEDURE_OCCURRENCE.PROCEDURE_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.procedure_occurrence cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.procedure_type_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.procedure_type_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PROVIDER_ID field in the PROCEDURE_OCCURRENCE table that does not exist in the PROVIDER table.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_procedure_occurrence_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROVIDER_ID
fkTableName = PROVIDER
fkFieldName = PROVIDER_ID
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
        select 
            'PROCEDURE_OCCURRENCE.PROVIDER_ID' as violating_field, 
            cdmtable.*
        from dataform.procedure_occurrence cdmtable
            left join 
                dataform.provider fktable 
                on cdmtable.provider_id = fktable.provider_id
        where fktable.provider_id is null 
            and cdmtable.provider_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the VISIT_DETAIL_ID field in the PROCEDURE_OCCURRENCE table that does not exist in the VISIT_DETAIL table.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_procedure_occurrence_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = VISIT_DETAIL_ID
fkTableName = VISIT_DETAIL
fkFieldName = VISIT_DETAIL_ID
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
        select 
            'PROCEDURE_OCCURRENCE.VISIT_DETAIL_ID' as violating_field, 
            cdmtable.*
        from dataform.procedure_occurrence cdmtable
            left join 
                dataform.visit_detail fktable 
                on cdmtable.visit_detail_id = fktable.visit_detail_id
        where fktable.visit_detail_id is null 
            and cdmtable.visit_detail_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the VISIT_OCCURRENCE_ID field in the PROCEDURE_OCCURRENCE table that does not exist in the VISIT_OCCURRENCE table.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_procedure_occurrence_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = VISIT_OCCURRENCE_ID
fkTableName = VISIT_OCCURRENCE
fkFieldName = VISIT_OCCURRENCE_ID
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
        select 
            'PROCEDURE_OCCURRENCE.VISIT_OCCURRENCE_ID' as violating_field, 
            cdmtable.*
        from dataform.procedure_occurrence cdmtable
            left join 
                dataform.visit_occurrence fktable 
                on cdmtable.visit_occurrence_id = fktable.visit_occurrence_id
        where fktable.visit_occurrence_id is null 
            and cdmtable.visit_occurrence_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the CARE_SITE_ID field in the PROVIDER table that does not exist in the CARE_SITE table.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'CARE_SITE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_provider_care_site_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = PROVIDER
cdmFieldName = CARE_SITE_ID
fkTableName = CARE_SITE
fkFieldName = CARE_SITE_ID
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
        select 
            'PROVIDER.CARE_SITE_ID' as violating_field, 
            cdmtable.*
        from dataform.provider cdmtable
            left join 
                dataform.care_site fktable 
                on cdmtable.care_site_id = fktable.care_site_id
        where fktable.care_site_id is null 
            and cdmtable.care_site_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the GENDER_CONCEPT_ID field in the PROVIDER table that does not exist in the CONCEPT table.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'GENDER_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_provider_gender_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = PROVIDER
cdmFieldName = GENDER_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'PROVIDER.GENDER_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.provider cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.gender_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.gender_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the GENDER_SOURCE_CONCEPT_ID field in the PROVIDER table that does not exist in the CONCEPT table.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'GENDER_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_provider_gender_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = PROVIDER
cdmFieldName = GENDER_SOURCE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'PROVIDER.GENDER_SOURCE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.provider cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.gender_source_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.gender_source_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the SPECIALTY_CONCEPT_ID field in the PROVIDER table that does not exist in the CONCEPT table.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'SPECIALTY_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_provider_specialty_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = PROVIDER
cdmFieldName = SPECIALTY_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'PROVIDER.SPECIALTY_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.provider cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.specialty_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.specialty_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the SPECIALTY_SOURCE_CONCEPT_ID field in the PROVIDER table that does not exist in the CONCEPT table.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'SPECIALTY_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_provider_specialty_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = PROVIDER
cdmFieldName = SPECIALTY_SOURCE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'PROVIDER.SPECIALTY_SOURCE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.provider cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.specialty_source_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.specialty_source_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the RELATIONSHIP_CONCEPT_ID field in the RELATIONSHIP table that does not exist in the CONCEPT table.' as check_description
  ,'RELATIONSHIP' as cdm_table_name
  ,'RELATIONSHIP_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_relationship_relationship_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = RELATIONSHIP
cdmFieldName = RELATIONSHIP_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'RELATIONSHIP.RELATIONSHIP_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.relationship cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.relationship_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.relationship_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.relationship cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the SOURCE_CONCEPT_ID field in the SOURCE_TO_CONCEPT_MAP table that does not exist in the CONCEPT table.' as check_description
  ,'SOURCE_TO_CONCEPT_MAP' as cdm_table_name
  ,'SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_source_to_concept_map_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = SOURCE_TO_CONCEPT_MAP
cdmFieldName = SOURCE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'SOURCE_TO_CONCEPT_MAP.SOURCE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.source_to_concept_map cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.source_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.source_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.source_to_concept_map cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the TARGET_CONCEPT_ID field in the SOURCE_TO_CONCEPT_MAP table that does not exist in the CONCEPT table.' as check_description
  ,'SOURCE_TO_CONCEPT_MAP' as cdm_table_name
  ,'TARGET_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_source_to_concept_map_target_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = SOURCE_TO_CONCEPT_MAP
cdmFieldName = TARGET_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'SOURCE_TO_CONCEPT_MAP.TARGET_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.source_to_concept_map cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.target_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.target_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.source_to_concept_map cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the TARGET_VOCABULARY_ID field in the SOURCE_TO_CONCEPT_MAP table that does not exist in the VOCABULARY table.' as check_description
  ,'SOURCE_TO_CONCEPT_MAP' as cdm_table_name
  ,'TARGET_VOCABULARY_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_source_to_concept_map_target_vocabulary_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = SOURCE_TO_CONCEPT_MAP
cdmFieldName = TARGET_VOCABULARY_ID
fkTableName = VOCABULARY
fkFieldName = VOCABULARY_ID
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
        select 
            'SOURCE_TO_CONCEPT_MAP.TARGET_VOCABULARY_ID' as violating_field, 
            cdmtable.*
        from dataform.source_to_concept_map cdmtable
            left join 
                dataform.vocabulary fktable
                on cdmtable.target_vocabulary_id = fktable.vocabulary_id
        where fktable.vocabulary_id is null 
            and cdmtable.target_vocabulary_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.source_to_concept_map cdmtable
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the ANATOMIC_SITE_CONCEPT_ID field in the SPECIMEN table that does not exist in the CONCEPT table.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'ANATOMIC_SITE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_specimen_anatomic_site_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = SPECIMEN
cdmFieldName = ANATOMIC_SITE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'SPECIMEN.ANATOMIC_SITE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.specimen cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.anatomic_site_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.anatomic_site_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the DISEASE_STATUS_CONCEPT_ID field in the SPECIMEN table that does not exist in the CONCEPT table.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'DISEASE_STATUS_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_specimen_disease_status_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = SPECIMEN
cdmFieldName = DISEASE_STATUS_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'SPECIMEN.DISEASE_STATUS_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.specimen cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.disease_status_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.disease_status_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PERSON_ID field in the SPECIMEN table that does not exist in the PERSON table.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_specimen_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = SPECIMEN
cdmFieldName = PERSON_ID
fkTableName = PERSON
fkFieldName = PERSON_ID
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
        select 
            'SPECIMEN.PERSON_ID' as violating_field, 
            cdmtable.*
        from dataform.specimen cdmtable
            left join 
                dataform.person fktable 
                on cdmtable.person_id = fktable.person_id
        where fktable.person_id is null 
            and cdmtable.person_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the SPECIMEN_CONCEPT_ID field in the SPECIMEN table that does not exist in the CONCEPT table.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'SPECIMEN_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_specimen_specimen_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = SPECIMEN
cdmFieldName = SPECIMEN_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'SPECIMEN.SPECIMEN_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.specimen cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.specimen_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.specimen_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the SPECIMEN_TYPE_CONCEPT_ID field in the SPECIMEN table that does not exist in the CONCEPT table.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'SPECIMEN_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_specimen_specimen_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = SPECIMEN
cdmFieldName = SPECIMEN_TYPE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'SPECIMEN.SPECIMEN_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.specimen cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.specimen_type_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.specimen_type_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the UNIT_CONCEPT_ID field in the SPECIMEN table that does not exist in the CONCEPT table.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_specimen_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = SPECIMEN
cdmFieldName = UNIT_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'SPECIMEN.UNIT_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.specimen cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.unit_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.unit_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the ADMITTED_FROM_CONCEPT_ID field in the VISIT_DETAIL table that does not exist in the CONCEPT table.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'ADMITTED_FROM_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_visit_detail_admitted_from_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = ADMITTED_FROM_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'VISIT_DETAIL.ADMITTED_FROM_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.visit_detail cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.admitted_from_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.admitted_from_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the CARE_SITE_ID field in the VISIT_DETAIL table that does not exist in the CARE_SITE table.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'CARE_SITE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_visit_detail_care_site_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = CARE_SITE_ID
fkTableName = CARE_SITE
fkFieldName = CARE_SITE_ID
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
        select 
            'VISIT_DETAIL.CARE_SITE_ID' as violating_field, 
            cdmtable.*
        from dataform.visit_detail cdmtable
            left join 
                dataform.care_site fktable 
                on cdmtable.care_site_id = fktable.care_site_id
        where fktable.care_site_id is null 
            and cdmtable.care_site_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the DISCHARGED_TO_CONCEPT_ID field in the VISIT_DETAIL table that does not exist in the CONCEPT table.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'DISCHARGED_TO_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_visit_detail_discharged_to_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = DISCHARGED_TO_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'VISIT_DETAIL.DISCHARGED_TO_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.visit_detail cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.discharged_to_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.discharged_to_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PARENT_VISIT_DETAIL_ID field in the VISIT_DETAIL table that does not exist in the VISIT_DETAIL table.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'PARENT_VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_visit_detail_parent_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = PARENT_VISIT_DETAIL_ID
fkTableName = VISIT_DETAIL
fkFieldName = VISIT_DETAIL_ID
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
        select 
            'VISIT_DETAIL.PARENT_VISIT_DETAIL_ID' as violating_field, 
            cdmtable.*
        from dataform.visit_detail cdmtable
            left join 
                dataform.visit_detail fktable 
                on cdmtable.parent_visit_detail_id = fktable.visit_detail_id
        where fktable.visit_detail_id is null 
            and cdmtable.parent_visit_detail_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PERSON_ID field in the VISIT_DETAIL table that does not exist in the PERSON table.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_visit_detail_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = PERSON_ID
fkTableName = PERSON
fkFieldName = PERSON_ID
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
        select 
            'VISIT_DETAIL.PERSON_ID' as violating_field, 
            cdmtable.*
        from dataform.visit_detail cdmtable
            left join 
                dataform.person fktable 
                on cdmtable.person_id = fktable.person_id
        where fktable.person_id is null 
            and cdmtable.person_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PRECEDING_VISIT_DETAIL_ID field in the VISIT_DETAIL table that does not exist in the VISIT_DETAIL table.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'PRECEDING_VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_visit_detail_preceding_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = PRECEDING_VISIT_DETAIL_ID
fkTableName = VISIT_DETAIL
fkFieldName = VISIT_DETAIL_ID
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
        select 
            'VISIT_DETAIL.PRECEDING_VISIT_DETAIL_ID' as violating_field, 
            cdmtable.*
        from dataform.visit_detail cdmtable
            left join 
                dataform.visit_detail fktable 
                on cdmtable.preceding_visit_detail_id = fktable.visit_detail_id
        where fktable.visit_detail_id is null 
            and cdmtable.preceding_visit_detail_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PROVIDER_ID field in the VISIT_DETAIL table that does not exist in the PROVIDER table.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_visit_detail_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = PROVIDER_ID
fkTableName = PROVIDER
fkFieldName = PROVIDER_ID
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
        select 
            'VISIT_DETAIL.PROVIDER_ID' as violating_field, 
            cdmtable.*
        from dataform.visit_detail cdmtable
            left join 
                dataform.provider fktable 
                on cdmtable.provider_id = fktable.provider_id
        where fktable.provider_id is null 
            and cdmtable.provider_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the VISIT_DETAIL_CONCEPT_ID field in the VISIT_DETAIL table that does not exist in the CONCEPT table.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_visit_detail_visit_detail_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_DETAIL_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'VISIT_DETAIL.VISIT_DETAIL_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.visit_detail cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.visit_detail_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.visit_detail_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the VISIT_DETAIL_SOURCE_CONCEPT_ID field in the VISIT_DETAIL table that does not exist in the CONCEPT table.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_visit_detail_visit_detail_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_DETAIL_SOURCE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'VISIT_DETAIL.VISIT_DETAIL_SOURCE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.visit_detail cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.visit_detail_source_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.visit_detail_source_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the VISIT_DETAIL_TYPE_CONCEPT_ID field in the VISIT_DETAIL table that does not exist in the CONCEPT table.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_visit_detail_visit_detail_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_DETAIL_TYPE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'VISIT_DETAIL.VISIT_DETAIL_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.visit_detail cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.visit_detail_type_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.visit_detail_type_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the VISIT_OCCURRENCE_ID field in the VISIT_DETAIL table that does not exist in the VISIT_OCCURRENCE table.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_visit_detail_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_OCCURRENCE_ID
fkTableName = VISIT_OCCURRENCE
fkFieldName = VISIT_OCCURRENCE_ID
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
        select 
            'VISIT_DETAIL.VISIT_OCCURRENCE_ID' as violating_field, 
            cdmtable.*
        from dataform.visit_detail cdmtable
            left join 
                dataform.visit_occurrence fktable 
                on cdmtable.visit_occurrence_id = fktable.visit_occurrence_id
        where fktable.visit_occurrence_id is null 
            and cdmtable.visit_occurrence_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the ADMITTED_FROM_CONCEPT_ID field in the VISIT_OCCURRENCE table that does not exist in the CONCEPT table.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'ADMITTED_FROM_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_visit_occurrence_admitted_from_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = ADMITTED_FROM_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'VISIT_OCCURRENCE.ADMITTED_FROM_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.visit_occurrence cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.admitted_from_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.admitted_from_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the CARE_SITE_ID field in the VISIT_OCCURRENCE table that does not exist in the CARE_SITE table.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'CARE_SITE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_visit_occurrence_care_site_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = CARE_SITE_ID
fkTableName = CARE_SITE
fkFieldName = CARE_SITE_ID
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
        select 
            'VISIT_OCCURRENCE.CARE_SITE_ID' as violating_field, 
            cdmtable.*
        from dataform.visit_occurrence cdmtable
            left join 
                dataform.care_site fktable 
                on cdmtable.care_site_id = fktable.care_site_id
        where fktable.care_site_id is null 
            and cdmtable.care_site_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the DISCHARGED_TO_CONCEPT_ID field in the VISIT_OCCURRENCE table that does not exist in the CONCEPT table.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'DISCHARGED_TO_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_visit_occurrence_discharged_to_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = DISCHARGED_TO_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'VISIT_OCCURRENCE.DISCHARGED_TO_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.visit_occurrence cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.discharged_to_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.discharged_to_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PERSON_ID field in the VISIT_OCCURRENCE table that does not exist in the PERSON table.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_visit_occurrence_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = PERSON_ID
fkTableName = PERSON
fkFieldName = PERSON_ID
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
        select 
            'VISIT_OCCURRENCE.PERSON_ID' as violating_field, 
            cdmtable.*
        from dataform.visit_occurrence cdmtable
            left join 
                dataform.person fktable 
                on cdmtable.person_id = fktable.person_id
        where fktable.person_id is null 
            and cdmtable.person_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PRECEDING_VISIT_OCCURRENCE_ID field in the VISIT_OCCURRENCE table that does not exist in the VISIT_OCCURRENCE table.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'PRECEDING_VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_visit_occurrence_preceding_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = PRECEDING_VISIT_OCCURRENCE_ID
fkTableName = VISIT_OCCURRENCE
fkFieldName = VISIT_OCCURRENCE_ID
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
        select 
            'VISIT_OCCURRENCE.PRECEDING_VISIT_OCCURRENCE_ID' as violating_field, 
            cdmtable.*
        from dataform.visit_occurrence cdmtable
            left join 
                dataform.visit_occurrence fktable 
                on cdmtable.preceding_visit_occurrence_id = fktable.visit_occurrence_id
        where fktable.visit_occurrence_id is null 
            and cdmtable.preceding_visit_occurrence_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the PROVIDER_ID field in the VISIT_OCCURRENCE table that does not exist in the PROVIDER table.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_visit_occurrence_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = PROVIDER_ID
fkTableName = PROVIDER
fkFieldName = PROVIDER_ID
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
        select 
            'VISIT_OCCURRENCE.PROVIDER_ID' as violating_field, 
            cdmtable.*
        from dataform.visit_occurrence cdmtable
            left join 
                dataform.provider fktable 
                on cdmtable.provider_id = fktable.provider_id
        where fktable.provider_id is null 
            and cdmtable.provider_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the VISIT_CONCEPT_ID field in the VISIT_OCCURRENCE table that does not exist in the CONCEPT table.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_visit_occurrence_visit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = VISIT_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'VISIT_OCCURRENCE.VISIT_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.visit_occurrence cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.visit_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.visit_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the VISIT_SOURCE_CONCEPT_ID field in the VISIT_OCCURRENCE table that does not exist in the CONCEPT table.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_visit_occurrence_visit_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = VISIT_SOURCE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'VISIT_OCCURRENCE.VISIT_SOURCE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.visit_occurrence cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.visit_source_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.visit_source_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
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
  ,'isForeignKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a value in the VISIT_TYPE_CONCEPT_ID field in the VISIT_OCCURRENCE table that does not exist in the CONCEPT table.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'is_foreign_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isforeignkey_visit_occurrence_visit_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
IS_FOREIGN_KEY
Foreign key check.
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = VISIT_TYPE_CONCEPT_ID
fkTableName = CONCEPT
fkFieldName = CONCEPT_ID
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
        select 
            'VISIT_OCCURRENCE.VISIT_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.*
        from dataform.visit_occurrence cdmtable
            left join 
                dataform.concept fktable
                on cdmtable.visit_type_concept_id = fktable.concept_id
        where fktable.concept_id is null 
            and cdmtable.visit_type_concept_id is not null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.visit_occurrence cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

