/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if CARE_SITE_ID is present in the CARE_SITE table as expected based on the specification.' as check_description
  ,'CARE_SITE' as cdm_table_name
  ,'CARE_SITE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_care_site_care_site_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CARE_SITE
cdmFieldName = CARE_SITE_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(care_site_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.care_site cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if CARE_SITE_NAME is present in the CARE_SITE table as expected based on the specification.' as check_description
  ,'CARE_SITE' as cdm_table_name
  ,'CARE_SITE_NAME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_care_site_care_site_name' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CARE_SITE
cdmFieldName = CARE_SITE_NAME
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(care_site_name) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.care_site cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if CARE_SITE_SOURCE_VALUE is present in the CARE_SITE table as expected based on the specification.' as check_description
  ,'CARE_SITE' as cdm_table_name
  ,'CARE_SITE_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_care_site_care_site_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CARE_SITE
cdmFieldName = CARE_SITE_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(care_site_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.care_site cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if LOCATION_ID is present in the CARE_SITE table as expected based on the specification.' as check_description
  ,'CARE_SITE' as cdm_table_name
  ,'LOCATION_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_care_site_location_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CARE_SITE
cdmFieldName = LOCATION_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(location_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.care_site cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PLACE_OF_SERVICE_CONCEPT_ID is present in the CARE_SITE table as expected based on the specification.' as check_description
  ,'CARE_SITE' as cdm_table_name
  ,'PLACE_OF_SERVICE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_care_site_place_of_service_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CARE_SITE
cdmFieldName = PLACE_OF_SERVICE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(place_of_service_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.care_site cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PLACE_OF_SERVICE_SOURCE_VALUE is present in the CARE_SITE table as expected based on the specification.' as check_description
  ,'CARE_SITE' as cdm_table_name
  ,'PLACE_OF_SERVICE_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_care_site_place_of_service_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CARE_SITE
cdmFieldName = PLACE_OF_SERVICE_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(place_of_service_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.care_site cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if CDM_ETL_REFERENCE is present in the CDM_SOURCE table as expected based on the specification.' as check_description
  ,'CDM_SOURCE' as cdm_table_name
  ,'CDM_ETL_REFERENCE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cdm_source_cdm_etl_reference' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CDM_SOURCE
cdmFieldName = CDM_ETL_REFERENCE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(cdm_etl_reference) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cdm_source cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if CDM_HOLDER is present in the CDM_SOURCE table as expected based on the specification.' as check_description
  ,'CDM_SOURCE' as cdm_table_name
  ,'CDM_HOLDER' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cdm_source_cdm_holder' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CDM_SOURCE
cdmFieldName = CDM_HOLDER
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(cdm_holder) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cdm_source cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if CDM_RELEASE_DATE is present in the CDM_SOURCE table as expected based on the specification.' as check_description
  ,'CDM_SOURCE' as cdm_table_name
  ,'CDM_RELEASE_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cdm_source_cdm_release_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CDM_SOURCE
cdmFieldName = CDM_RELEASE_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(cdm_release_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cdm_source cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if CDM_SOURCE_ABBREVIATION is present in the CDM_SOURCE table as expected based on the specification.' as check_description
  ,'CDM_SOURCE' as cdm_table_name
  ,'CDM_SOURCE_ABBREVIATION' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cdm_source_cdm_source_abbreviation' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CDM_SOURCE
cdmFieldName = CDM_SOURCE_ABBREVIATION
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(cdm_source_abbreviation) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cdm_source cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if CDM_SOURCE_NAME is present in the CDM_SOURCE table as expected based on the specification.' as check_description
  ,'CDM_SOURCE' as cdm_table_name
  ,'CDM_SOURCE_NAME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cdm_source_cdm_source_name' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CDM_SOURCE
cdmFieldName = CDM_SOURCE_NAME
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(cdm_source_name) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cdm_source cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if CDM_VERSION is present in the CDM_SOURCE table as expected based on the specification.' as check_description
  ,'CDM_SOURCE' as cdm_table_name
  ,'CDM_VERSION' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cdm_source_cdm_version' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CDM_SOURCE
cdmFieldName = CDM_VERSION
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(cdm_version) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cdm_source cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if CDM_VERSION_CONCEPT_ID is present in the CDM_SOURCE table as expected based on the specification.' as check_description
  ,'CDM_SOURCE' as cdm_table_name
  ,'CDM_VERSION_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cdm_source_cdm_version_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CDM_SOURCE
cdmFieldName = CDM_VERSION_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(cdm_version_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cdm_source cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if SOURCE_DESCRIPTION is present in the CDM_SOURCE table as expected based on the specification.' as check_description
  ,'CDM_SOURCE' as cdm_table_name
  ,'SOURCE_DESCRIPTION' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cdm_source_source_description' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CDM_SOURCE
cdmFieldName = SOURCE_DESCRIPTION
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(source_description) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cdm_source cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if SOURCE_DOCUMENTATION_REFERENCE is present in the CDM_SOURCE table as expected based on the specification.' as check_description
  ,'CDM_SOURCE' as cdm_table_name
  ,'SOURCE_DOCUMENTATION_REFERENCE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cdm_source_source_documentation_reference' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CDM_SOURCE
cdmFieldName = SOURCE_DOCUMENTATION_REFERENCE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(source_documentation_reference) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cdm_source cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if SOURCE_RELEASE_DATE is present in the CDM_SOURCE table as expected based on the specification.' as check_description
  ,'CDM_SOURCE' as cdm_table_name
  ,'SOURCE_RELEASE_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cdm_source_source_release_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CDM_SOURCE
cdmFieldName = SOURCE_RELEASE_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(source_release_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cdm_source cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VOCABULARY_VERSION is present in the CDM_SOURCE table as expected based on the specification.' as check_description
  ,'CDM_SOURCE' as cdm_table_name
  ,'VOCABULARY_VERSION' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cdm_source_vocabulary_version' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CDM_SOURCE
cdmFieldName = VOCABULARY_VERSION
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(vocabulary_version) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cdm_source cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if COHORT_DEFINITION_ID is present in the COHORT table as expected based on the specification.' as check_description
  ,'COHORT' as cdm_table_name
  ,'COHORT_DEFINITION_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cohort_cohort_definition_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = COHORT
cdmFieldName = COHORT_DEFINITION_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(cohort_definition_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cohort cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if COHORT_END_DATE is present in the COHORT table as expected based on the specification.' as check_description
  ,'COHORT' as cdm_table_name
  ,'COHORT_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cohort_cohort_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = COHORT
cdmFieldName = COHORT_END_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(cohort_end_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cohort cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if COHORT_START_DATE is present in the COHORT table as expected based on the specification.' as check_description
  ,'COHORT' as cdm_table_name
  ,'COHORT_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cohort_cohort_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = COHORT
cdmFieldName = COHORT_START_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(cohort_start_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cohort cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if SUBJECT_ID is present in the COHORT table as expected based on the specification.' as check_description
  ,'COHORT' as cdm_table_name
  ,'SUBJECT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cohort_subject_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = COHORT
cdmFieldName = SUBJECT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(subject_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cohort cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if COHORT_DEFINITION_DESCRIPTION is present in the COHORT_DEFINITION table as expected based on the specification.' as check_description
  ,'COHORT_DEFINITION' as cdm_table_name
  ,'COHORT_DEFINITION_DESCRIPTION' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cohort_definition_cohort_definition_description' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = COHORT_DEFINITION
cdmFieldName = COHORT_DEFINITION_DESCRIPTION
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(cohort_definition_description) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cohort_definition cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if COHORT_DEFINITION_ID is present in the COHORT_DEFINITION table as expected based on the specification.' as check_description
  ,'COHORT_DEFINITION' as cdm_table_name
  ,'COHORT_DEFINITION_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cohort_definition_cohort_definition_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = COHORT_DEFINITION
cdmFieldName = COHORT_DEFINITION_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(cohort_definition_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cohort_definition cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if COHORT_DEFINITION_NAME is present in the COHORT_DEFINITION table as expected based on the specification.' as check_description
  ,'COHORT_DEFINITION' as cdm_table_name
  ,'COHORT_DEFINITION_NAME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cohort_definition_cohort_definition_name' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = COHORT_DEFINITION
cdmFieldName = COHORT_DEFINITION_NAME
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(cohort_definition_name) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cohort_definition cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if COHORT_DEFINITION_SYNTAX is present in the COHORT_DEFINITION table as expected based on the specification.' as check_description
  ,'COHORT_DEFINITION' as cdm_table_name
  ,'COHORT_DEFINITION_SYNTAX' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cohort_definition_cohort_definition_syntax' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = COHORT_DEFINITION
cdmFieldName = COHORT_DEFINITION_SYNTAX
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(cohort_definition_syntax) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cohort_definition cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if COHORT_INITIATION_DATE is present in the COHORT_DEFINITION table as expected based on the specification.' as check_description
  ,'COHORT_DEFINITION' as cdm_table_name
  ,'COHORT_INITIATION_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cohort_definition_cohort_initiation_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = COHORT_DEFINITION
cdmFieldName = COHORT_INITIATION_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(cohort_initiation_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cohort_definition cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DEFINITION_TYPE_CONCEPT_ID is present in the COHORT_DEFINITION table as expected based on the specification.' as check_description
  ,'COHORT_DEFINITION' as cdm_table_name
  ,'DEFINITION_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cohort_definition_definition_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = COHORT_DEFINITION
cdmFieldName = DEFINITION_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(definition_type_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cohort_definition cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if SUBJECT_CONCEPT_ID is present in the COHORT_DEFINITION table as expected based on the specification.' as check_description
  ,'COHORT_DEFINITION' as cdm_table_name
  ,'SUBJECT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cohort_definition_subject_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = COHORT_DEFINITION
cdmFieldName = SUBJECT_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(subject_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cohort_definition cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if CONCEPT_ID is present in the CONCEPT_SYNONYM table as expected based on the specification.' as check_description
  ,'CONCEPT_SYNONYM' as cdm_table_name
  ,'CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_concept_synonym_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CONCEPT_SYNONYM
cdmFieldName = CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.concept_synonym cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if CONCEPT_SYNONYM_NAME is present in the CONCEPT_SYNONYM table as expected based on the specification.' as check_description
  ,'CONCEPT_SYNONYM' as cdm_table_name
  ,'CONCEPT_SYNONYM_NAME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_concept_synonym_concept_synonym_name' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CONCEPT_SYNONYM
cdmFieldName = CONCEPT_SYNONYM_NAME
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(concept_synonym_name) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.concept_synonym cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if LANGUAGE_CONCEPT_ID is present in the CONCEPT_SYNONYM table as expected based on the specification.' as check_description
  ,'CONCEPT_SYNONYM' as cdm_table_name
  ,'LANGUAGE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_concept_synonym_language_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CONCEPT_SYNONYM
cdmFieldName = LANGUAGE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(language_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.concept_synonym cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if CONDITION_CONCEPT_ID is present in the CONDITION_ERA table as expected based on the specification.' as check_description
  ,'CONDITION_ERA' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_condition_era_condition_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_ERA
cdmFieldName = CONDITION_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(condition_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.condition_era cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if CONDITION_ERA_END_DATE is present in the CONDITION_ERA table as expected based on the specification.' as check_description
  ,'CONDITION_ERA' as cdm_table_name
  ,'CONDITION_ERA_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_condition_era_condition_era_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_ERA
cdmFieldName = CONDITION_ERA_END_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(condition_era_end_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.condition_era cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if CONDITION_ERA_ID is present in the CONDITION_ERA table as expected based on the specification.' as check_description
  ,'CONDITION_ERA' as cdm_table_name
  ,'CONDITION_ERA_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_condition_era_condition_era_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_ERA
cdmFieldName = CONDITION_ERA_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(condition_era_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.condition_era cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if CONDITION_ERA_START_DATE is present in the CONDITION_ERA table as expected based on the specification.' as check_description
  ,'CONDITION_ERA' as cdm_table_name
  ,'CONDITION_ERA_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_condition_era_condition_era_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_ERA
cdmFieldName = CONDITION_ERA_START_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(condition_era_start_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.condition_era cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if CONDITION_OCCURRENCE_COUNT is present in the CONDITION_ERA table as expected based on the specification.' as check_description
  ,'CONDITION_ERA' as cdm_table_name
  ,'CONDITION_OCCURRENCE_COUNT' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_condition_era_condition_occurrence_count' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_ERA
cdmFieldName = CONDITION_OCCURRENCE_COUNT
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(condition_occurrence_count) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.condition_era cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PERSON_ID is present in the CONDITION_ERA table as expected based on the specification.' as check_description
  ,'CONDITION_ERA' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_condition_era_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_ERA
cdmFieldName = PERSON_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(person_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.condition_era cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if CONDITION_CONCEPT_ID is present in the CONDITION_OCCURRENCE table as expected based on the specification.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_condition_occurrence_condition_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(condition_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.condition_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if CONDITION_END_DATE is present in the CONDITION_OCCURRENCE table as expected based on the specification.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_condition_occurrence_condition_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_END_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(condition_end_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.condition_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if CONDITION_END_DATETIME is present in the CONDITION_OCCURRENCE table as expected based on the specification.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_END_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_condition_occurrence_condition_end_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_END_DATETIME
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(condition_end_datetime) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.condition_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if CONDITION_OCCURRENCE_ID is present in the CONDITION_OCCURRENCE table as expected based on the specification.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_condition_occurrence_condition_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_OCCURRENCE_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(condition_occurrence_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.condition_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if CONDITION_SOURCE_CONCEPT_ID is present in the CONDITION_OCCURRENCE table as expected based on the specification.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_condition_occurrence_condition_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_SOURCE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(condition_source_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.condition_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if CONDITION_SOURCE_VALUE is present in the CONDITION_OCCURRENCE table as expected based on the specification.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_condition_occurrence_condition_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(condition_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.condition_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if CONDITION_START_DATE is present in the CONDITION_OCCURRENCE table as expected based on the specification.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_condition_occurrence_condition_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_START_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(condition_start_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.condition_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if CONDITION_START_DATETIME is present in the CONDITION_OCCURRENCE table as expected based on the specification.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_START_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_condition_occurrence_condition_start_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_START_DATETIME
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(condition_start_datetime) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.condition_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if CONDITION_STATUS_CONCEPT_ID is present in the CONDITION_OCCURRENCE table as expected based on the specification.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_STATUS_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_condition_occurrence_condition_status_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_STATUS_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(condition_status_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.condition_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if CONDITION_STATUS_SOURCE_VALUE is present in the CONDITION_OCCURRENCE table as expected based on the specification.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_STATUS_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_condition_occurrence_condition_status_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_STATUS_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(condition_status_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.condition_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if CONDITION_TYPE_CONCEPT_ID is present in the CONDITION_OCCURRENCE table as expected based on the specification.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_condition_occurrence_condition_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(condition_type_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.condition_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PERSON_ID is present in the CONDITION_OCCURRENCE table as expected based on the specification.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_condition_occurrence_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = PERSON_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(person_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.condition_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PROVIDER_ID is present in the CONDITION_OCCURRENCE table as expected based on the specification.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_condition_occurrence_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = PROVIDER_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(provider_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.condition_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if STOP_REASON is present in the CONDITION_OCCURRENCE table as expected based on the specification.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'STOP_REASON' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_condition_occurrence_stop_reason' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = STOP_REASON
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(stop_reason) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.condition_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VISIT_DETAIL_ID is present in the CONDITION_OCCURRENCE table as expected based on the specification.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_condition_occurrence_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = VISIT_DETAIL_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(visit_detail_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.condition_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VISIT_OCCURRENCE_ID is present in the CONDITION_OCCURRENCE table as expected based on the specification.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_condition_occurrence_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = VISIT_OCCURRENCE_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(visit_occurrence_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.condition_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if AMOUNT_ALLOWED is present in the COST table as expected based on the specification.' as check_description
  ,'COST' as cdm_table_name
  ,'AMOUNT_ALLOWED' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cost_amount_allowed' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = COST
cdmFieldName = AMOUNT_ALLOWED
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(amount_allowed) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cost cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if COST_DOMAIN_ID is present in the COST table as expected based on the specification.' as check_description
  ,'COST' as cdm_table_name
  ,'COST_DOMAIN_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cost_cost_domain_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = COST
cdmFieldName = COST_DOMAIN_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(cost_domain_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cost cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if COST_EVENT_ID is present in the COST table as expected based on the specification.' as check_description
  ,'COST' as cdm_table_name
  ,'COST_EVENT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cost_cost_event_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = COST
cdmFieldName = COST_EVENT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(cost_event_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cost cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if COST_ID is present in the COST table as expected based on the specification.' as check_description
  ,'COST' as cdm_table_name
  ,'COST_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cost_cost_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = COST
cdmFieldName = COST_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(cost_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cost cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if COST_TYPE_CONCEPT_ID is present in the COST table as expected based on the specification.' as check_description
  ,'COST' as cdm_table_name
  ,'COST_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cost_cost_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = COST
cdmFieldName = COST_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(cost_type_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cost cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if CURRENCY_CONCEPT_ID is present in the COST table as expected based on the specification.' as check_description
  ,'COST' as cdm_table_name
  ,'CURRENCY_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cost_currency_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = COST
cdmFieldName = CURRENCY_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(currency_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cost cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DRG_CONCEPT_ID is present in the COST table as expected based on the specification.' as check_description
  ,'COST' as cdm_table_name
  ,'DRG_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cost_drg_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = COST
cdmFieldName = DRG_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(drg_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cost cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DRG_SOURCE_VALUE is present in the COST table as expected based on the specification.' as check_description
  ,'COST' as cdm_table_name
  ,'DRG_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cost_drg_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = COST
cdmFieldName = DRG_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(drg_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cost cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PAID_BY_PATIENT is present in the COST table as expected based on the specification.' as check_description
  ,'COST' as cdm_table_name
  ,'PAID_BY_PATIENT' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cost_paid_by_patient' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = COST
cdmFieldName = PAID_BY_PATIENT
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(paid_by_patient) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cost cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PAID_BY_PAYER is present in the COST table as expected based on the specification.' as check_description
  ,'COST' as cdm_table_name
  ,'PAID_BY_PAYER' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cost_paid_by_payer' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = COST
cdmFieldName = PAID_BY_PAYER
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(paid_by_payer) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cost cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PAID_BY_PRIMARY is present in the COST table as expected based on the specification.' as check_description
  ,'COST' as cdm_table_name
  ,'PAID_BY_PRIMARY' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cost_paid_by_primary' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = COST
cdmFieldName = PAID_BY_PRIMARY
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(paid_by_primary) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cost cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PAID_DISPENSING_FEE is present in the COST table as expected based on the specification.' as check_description
  ,'COST' as cdm_table_name
  ,'PAID_DISPENSING_FEE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cost_paid_dispensing_fee' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = COST
cdmFieldName = PAID_DISPENSING_FEE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(paid_dispensing_fee) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cost cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PAID_INGREDIENT_COST is present in the COST table as expected based on the specification.' as check_description
  ,'COST' as cdm_table_name
  ,'PAID_INGREDIENT_COST' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cost_paid_ingredient_cost' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = COST
cdmFieldName = PAID_INGREDIENT_COST
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(paid_ingredient_cost) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cost cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PAID_PATIENT_COINSURANCE is present in the COST table as expected based on the specification.' as check_description
  ,'COST' as cdm_table_name
  ,'PAID_PATIENT_COINSURANCE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cost_paid_patient_coinsurance' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = COST
cdmFieldName = PAID_PATIENT_COINSURANCE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(paid_patient_coinsurance) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cost cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PAID_PATIENT_COPAY is present in the COST table as expected based on the specification.' as check_description
  ,'COST' as cdm_table_name
  ,'PAID_PATIENT_COPAY' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cost_paid_patient_copay' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = COST
cdmFieldName = PAID_PATIENT_COPAY
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(paid_patient_copay) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cost cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PAID_PATIENT_DEDUCTIBLE is present in the COST table as expected based on the specification.' as check_description
  ,'COST' as cdm_table_name
  ,'PAID_PATIENT_DEDUCTIBLE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cost_paid_patient_deductible' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = COST
cdmFieldName = PAID_PATIENT_DEDUCTIBLE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(paid_patient_deductible) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cost cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PAYER_PLAN_PERIOD_ID is present in the COST table as expected based on the specification.' as check_description
  ,'COST' as cdm_table_name
  ,'PAYER_PLAN_PERIOD_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cost_payer_plan_period_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = COST
cdmFieldName = PAYER_PLAN_PERIOD_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(payer_plan_period_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cost cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if REVENUE_CODE_CONCEPT_ID is present in the COST table as expected based on the specification.' as check_description
  ,'COST' as cdm_table_name
  ,'REVENUE_CODE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cost_revenue_code_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = COST
cdmFieldName = REVENUE_CODE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(revenue_code_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cost cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if REVENUE_CODE_SOURCE_VALUE is present in the COST table as expected based on the specification.' as check_description
  ,'COST' as cdm_table_name
  ,'REVENUE_CODE_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cost_revenue_code_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = COST
cdmFieldName = REVENUE_CODE_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(revenue_code_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cost cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if TOTAL_CHARGE is present in the COST table as expected based on the specification.' as check_description
  ,'COST' as cdm_table_name
  ,'TOTAL_CHARGE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cost_total_charge' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = COST
cdmFieldName = TOTAL_CHARGE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(total_charge) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cost cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if TOTAL_COST is present in the COST table as expected based on the specification.' as check_description
  ,'COST' as cdm_table_name
  ,'TOTAL_COST' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cost_total_cost' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = COST
cdmFieldName = TOTAL_COST
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(total_cost) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cost cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if TOTAL_PAID is present in the COST table as expected based on the specification.' as check_description
  ,'COST' as cdm_table_name
  ,'TOTAL_PAID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_cost_total_paid' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = COST
cdmFieldName = TOTAL_PAID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(total_paid) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.cost cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if CAUSE_CONCEPT_ID is present in the DEATH table as expected based on the specification.' as check_description
  ,'DEATH' as cdm_table_name
  ,'CAUSE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_death_cause_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DEATH
cdmFieldName = CAUSE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(cause_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.death cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if CAUSE_SOURCE_CONCEPT_ID is present in the DEATH table as expected based on the specification.' as check_description
  ,'DEATH' as cdm_table_name
  ,'CAUSE_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_death_cause_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DEATH
cdmFieldName = CAUSE_SOURCE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(cause_source_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.death cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if CAUSE_SOURCE_VALUE is present in the DEATH table as expected based on the specification.' as check_description
  ,'DEATH' as cdm_table_name
  ,'CAUSE_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_death_cause_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DEATH
cdmFieldName = CAUSE_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(cause_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.death cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DEATH_DATE is present in the DEATH table as expected based on the specification.' as check_description
  ,'DEATH' as cdm_table_name
  ,'DEATH_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_death_death_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DEATH
cdmFieldName = DEATH_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(death_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.death cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DEATH_DATETIME is present in the DEATH table as expected based on the specification.' as check_description
  ,'DEATH' as cdm_table_name
  ,'DEATH_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_death_death_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DEATH
cdmFieldName = DEATH_DATETIME
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(death_datetime) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.death cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DEATH_TYPE_CONCEPT_ID is present in the DEATH table as expected based on the specification.' as check_description
  ,'DEATH' as cdm_table_name
  ,'DEATH_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_death_death_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DEATH
cdmFieldName = DEATH_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(death_type_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.death cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PERSON_ID is present in the DEATH table as expected based on the specification.' as check_description
  ,'DEATH' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_death_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DEATH
cdmFieldName = PERSON_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(person_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.death cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DEVICE_CONCEPT_ID is present in the DEVICE_EXPOSURE table as expected based on the specification.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_device_exposure_device_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = DEVICE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(device_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.device_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DEVICE_EXPOSURE_END_DATE is present in the DEVICE_EXPOSURE table as expected based on the specification.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_EXPOSURE_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_device_exposure_device_exposure_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = DEVICE_EXPOSURE_END_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(device_exposure_end_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.device_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DEVICE_EXPOSURE_END_DATETIME is present in the DEVICE_EXPOSURE table as expected based on the specification.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_EXPOSURE_END_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_device_exposure_device_exposure_end_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = DEVICE_EXPOSURE_END_DATETIME
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(device_exposure_end_datetime) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.device_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DEVICE_EXPOSURE_ID is present in the DEVICE_EXPOSURE table as expected based on the specification.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_EXPOSURE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_device_exposure_device_exposure_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = DEVICE_EXPOSURE_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(device_exposure_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.device_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DEVICE_EXPOSURE_START_DATE is present in the DEVICE_EXPOSURE table as expected based on the specification.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_EXPOSURE_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_device_exposure_device_exposure_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = DEVICE_EXPOSURE_START_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(device_exposure_start_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.device_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DEVICE_EXPOSURE_START_DATETIME is present in the DEVICE_EXPOSURE table as expected based on the specification.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_EXPOSURE_START_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_device_exposure_device_exposure_start_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = DEVICE_EXPOSURE_START_DATETIME
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(device_exposure_start_datetime) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.device_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DEVICE_SOURCE_CONCEPT_ID is present in the DEVICE_EXPOSURE table as expected based on the specification.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_device_exposure_device_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = DEVICE_SOURCE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(device_source_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.device_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DEVICE_SOURCE_VALUE is present in the DEVICE_EXPOSURE table as expected based on the specification.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_device_exposure_device_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = DEVICE_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(device_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.device_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DEVICE_TYPE_CONCEPT_ID is present in the DEVICE_EXPOSURE table as expected based on the specification.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_device_exposure_device_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = DEVICE_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(device_type_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.device_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PERSON_ID is present in the DEVICE_EXPOSURE table as expected based on the specification.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_device_exposure_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = PERSON_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(person_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.device_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PRODUCTION_ID is present in the DEVICE_EXPOSURE table as expected based on the specification.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'PRODUCTION_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_device_exposure_production_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = PRODUCTION_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(production_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.device_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PROVIDER_ID is present in the DEVICE_EXPOSURE table as expected based on the specification.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_device_exposure_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = PROVIDER_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(provider_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.device_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if QUANTITY is present in the DEVICE_EXPOSURE table as expected based on the specification.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'QUANTITY' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_device_exposure_quantity' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = QUANTITY
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(quantity) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.device_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if UNIQUE_DEVICE_ID is present in the DEVICE_EXPOSURE table as expected based on the specification.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'UNIQUE_DEVICE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_device_exposure_unique_device_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = UNIQUE_DEVICE_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(unique_device_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.device_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if UNIT_CONCEPT_ID is present in the DEVICE_EXPOSURE table as expected based on the specification.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_device_exposure_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = UNIT_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(unit_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.device_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if UNIT_SOURCE_CONCEPT_ID is present in the DEVICE_EXPOSURE table as expected based on the specification.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'UNIT_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_device_exposure_unit_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = UNIT_SOURCE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(unit_source_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.device_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if UNIT_SOURCE_VALUE is present in the DEVICE_EXPOSURE table as expected based on the specification.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'UNIT_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_device_exposure_unit_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = UNIT_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(unit_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.device_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VISIT_DETAIL_ID is present in the DEVICE_EXPOSURE table as expected based on the specification.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_device_exposure_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = VISIT_DETAIL_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(visit_detail_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.device_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VISIT_OCCURRENCE_ID is present in the DEVICE_EXPOSURE table as expected based on the specification.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_device_exposure_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = VISIT_OCCURRENCE_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(visit_occurrence_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.device_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DOMAIN_CONCEPT_ID is present in the DOMAIN table as expected based on the specification.' as check_description
  ,'DOMAIN' as cdm_table_name
  ,'DOMAIN_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_domain_domain_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DOMAIN
cdmFieldName = DOMAIN_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(domain_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.domain cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DOMAIN_ID is present in the DOMAIN table as expected based on the specification.' as check_description
  ,'DOMAIN' as cdm_table_name
  ,'DOMAIN_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_domain_domain_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DOMAIN
cdmFieldName = DOMAIN_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(domain_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.domain cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DOMAIN_NAME is present in the DOMAIN table as expected based on the specification.' as check_description
  ,'DOMAIN' as cdm_table_name
  ,'DOMAIN_NAME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_domain_domain_name' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DOMAIN
cdmFieldName = DOMAIN_NAME
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(domain_name) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.domain cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DOSE_ERA_END_DATE is present in the DOSE_ERA table as expected based on the specification.' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'DOSE_ERA_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_dose_era_dose_era_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DOSE_ERA
cdmFieldName = DOSE_ERA_END_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(dose_era_end_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.dose_era cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DOSE_ERA_ID is present in the DOSE_ERA table as expected based on the specification.' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'DOSE_ERA_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_dose_era_dose_era_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DOSE_ERA
cdmFieldName = DOSE_ERA_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(dose_era_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.dose_era cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DOSE_ERA_START_DATE is present in the DOSE_ERA table as expected based on the specification.' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'DOSE_ERA_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_dose_era_dose_era_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DOSE_ERA
cdmFieldName = DOSE_ERA_START_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(dose_era_start_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.dose_era cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DOSE_VALUE is present in the DOSE_ERA table as expected based on the specification.' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'DOSE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_dose_era_dose_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DOSE_ERA
cdmFieldName = DOSE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(dose_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.dose_era cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DRUG_CONCEPT_ID is present in the DOSE_ERA table as expected based on the specification.' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'DRUG_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_dose_era_drug_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DOSE_ERA
cdmFieldName = DRUG_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(drug_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.dose_era cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PERSON_ID is present in the DOSE_ERA table as expected based on the specification.' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_dose_era_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DOSE_ERA
cdmFieldName = PERSON_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(person_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.dose_era cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if UNIT_CONCEPT_ID is present in the DOSE_ERA table as expected based on the specification.' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_dose_era_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DOSE_ERA
cdmFieldName = UNIT_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(unit_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.dose_era cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DRUG_CONCEPT_ID is present in the DRUG_ERA table as expected based on the specification.' as check_description
  ,'DRUG_ERA' as cdm_table_name
  ,'DRUG_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_era_drug_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_ERA
cdmFieldName = DRUG_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(drug_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_era cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DRUG_ERA_END_DATE is present in the DRUG_ERA table as expected based on the specification.' as check_description
  ,'DRUG_ERA' as cdm_table_name
  ,'DRUG_ERA_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_era_drug_era_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_ERA
cdmFieldName = DRUG_ERA_END_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(drug_era_end_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_era cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DRUG_ERA_ID is present in the DRUG_ERA table as expected based on the specification.' as check_description
  ,'DRUG_ERA' as cdm_table_name
  ,'DRUG_ERA_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_era_drug_era_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_ERA
cdmFieldName = DRUG_ERA_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(drug_era_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_era cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DRUG_ERA_START_DATE is present in the DRUG_ERA table as expected based on the specification.' as check_description
  ,'DRUG_ERA' as cdm_table_name
  ,'DRUG_ERA_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_era_drug_era_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_ERA
cdmFieldName = DRUG_ERA_START_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(drug_era_start_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_era cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DRUG_EXPOSURE_COUNT is present in the DRUG_ERA table as expected based on the specification.' as check_description
  ,'DRUG_ERA' as cdm_table_name
  ,'DRUG_EXPOSURE_COUNT' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_era_drug_exposure_count' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_ERA
cdmFieldName = DRUG_EXPOSURE_COUNT
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(drug_exposure_count) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_era cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if GAP_DAYS is present in the DRUG_ERA table as expected based on the specification.' as check_description
  ,'DRUG_ERA' as cdm_table_name
  ,'GAP_DAYS' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_era_gap_days' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_ERA
cdmFieldName = GAP_DAYS
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(gap_days) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_era cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PERSON_ID is present in the DRUG_ERA table as expected based on the specification.' as check_description
  ,'DRUG_ERA' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_era_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_ERA
cdmFieldName = PERSON_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(person_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_era cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DAYS_SUPPLY is present in the DRUG_EXPOSURE table as expected based on the specification.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DAYS_SUPPLY' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_exposure_days_supply' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DAYS_SUPPLY
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(days_supply) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DOSE_UNIT_SOURCE_VALUE is present in the DRUG_EXPOSURE table as expected based on the specification.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DOSE_UNIT_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_exposure_dose_unit_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DOSE_UNIT_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(dose_unit_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DRUG_CONCEPT_ID is present in the DRUG_EXPOSURE table as expected based on the specification.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_exposure_drug_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DRUG_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(drug_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DRUG_EXPOSURE_END_DATE is present in the DRUG_EXPOSURE table as expected based on the specification.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_EXPOSURE_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_exposure_drug_exposure_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DRUG_EXPOSURE_END_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(drug_exposure_end_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DRUG_EXPOSURE_END_DATETIME is present in the DRUG_EXPOSURE table as expected based on the specification.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_EXPOSURE_END_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_exposure_drug_exposure_end_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DRUG_EXPOSURE_END_DATETIME
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(drug_exposure_end_datetime) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DRUG_EXPOSURE_ID is present in the DRUG_EXPOSURE table as expected based on the specification.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_EXPOSURE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_exposure_drug_exposure_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DRUG_EXPOSURE_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(drug_exposure_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DRUG_EXPOSURE_START_DATE is present in the DRUG_EXPOSURE table as expected based on the specification.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_EXPOSURE_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_exposure_drug_exposure_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DRUG_EXPOSURE_START_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(drug_exposure_start_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DRUG_EXPOSURE_START_DATETIME is present in the DRUG_EXPOSURE table as expected based on the specification.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_EXPOSURE_START_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_exposure_drug_exposure_start_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DRUG_EXPOSURE_START_DATETIME
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(drug_exposure_start_datetime) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DRUG_SOURCE_CONCEPT_ID is present in the DRUG_EXPOSURE table as expected based on the specification.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_exposure_drug_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DRUG_SOURCE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(drug_source_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DRUG_SOURCE_VALUE is present in the DRUG_EXPOSURE table as expected based on the specification.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_exposure_drug_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DRUG_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(drug_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DRUG_TYPE_CONCEPT_ID is present in the DRUG_EXPOSURE table as expected based on the specification.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_exposure_drug_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DRUG_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(drug_type_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if LOT_NUMBER is present in the DRUG_EXPOSURE table as expected based on the specification.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'LOT_NUMBER' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_exposure_lot_number' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = LOT_NUMBER
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(lot_number) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PERSON_ID is present in the DRUG_EXPOSURE table as expected based on the specification.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_exposure_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = PERSON_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(person_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PROVIDER_ID is present in the DRUG_EXPOSURE table as expected based on the specification.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_exposure_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = PROVIDER_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(provider_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if QUANTITY is present in the DRUG_EXPOSURE table as expected based on the specification.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'QUANTITY' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_exposure_quantity' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = QUANTITY
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(quantity) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if REFILLS is present in the DRUG_EXPOSURE table as expected based on the specification.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'REFILLS' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_exposure_refills' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = REFILLS
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(refills) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if ROUTE_CONCEPT_ID is present in the DRUG_EXPOSURE table as expected based on the specification.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'ROUTE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_exposure_route_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = ROUTE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(route_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if ROUTE_SOURCE_VALUE is present in the DRUG_EXPOSURE table as expected based on the specification.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'ROUTE_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_exposure_route_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = ROUTE_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(route_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if SIG is present in the DRUG_EXPOSURE table as expected based on the specification.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'SIG' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_exposure_sig' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = SIG
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(sig) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if STOP_REASON is present in the DRUG_EXPOSURE table as expected based on the specification.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'STOP_REASON' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_exposure_stop_reason' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = STOP_REASON
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(stop_reason) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VERBATIM_END_DATE is present in the DRUG_EXPOSURE table as expected based on the specification.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'VERBATIM_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_exposure_verbatim_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = VERBATIM_END_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(verbatim_end_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VISIT_DETAIL_ID is present in the DRUG_EXPOSURE table as expected based on the specification.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_exposure_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = VISIT_DETAIL_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(visit_detail_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VISIT_OCCURRENCE_ID is present in the DRUG_EXPOSURE table as expected based on the specification.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_exposure_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = VISIT_OCCURRENCE_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(visit_occurrence_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_exposure cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if AMOUNT_UNIT_CONCEPT_ID is present in the DRUG_STRENGTH table as expected based on the specification.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'AMOUNT_UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_strength_amount_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_STRENGTH
cdmFieldName = AMOUNT_UNIT_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(amount_unit_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_strength cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if AMOUNT_VALUE is present in the DRUG_STRENGTH table as expected based on the specification.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'AMOUNT_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_strength_amount_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_STRENGTH
cdmFieldName = AMOUNT_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(amount_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_strength cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if BOX_SIZE is present in the DRUG_STRENGTH table as expected based on the specification.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'BOX_SIZE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_strength_box_size' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_STRENGTH
cdmFieldName = BOX_SIZE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(box_size) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_strength cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DENOMINATOR_UNIT_CONCEPT_ID is present in the DRUG_STRENGTH table as expected based on the specification.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'DENOMINATOR_UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_strength_denominator_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_STRENGTH
cdmFieldName = DENOMINATOR_UNIT_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(denominator_unit_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_strength cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DENOMINATOR_VALUE is present in the DRUG_STRENGTH table as expected based on the specification.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'DENOMINATOR_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_strength_denominator_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_STRENGTH
cdmFieldName = DENOMINATOR_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(denominator_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_strength cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DRUG_CONCEPT_ID is present in the DRUG_STRENGTH table as expected based on the specification.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'DRUG_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_strength_drug_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_STRENGTH
cdmFieldName = DRUG_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(drug_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_strength cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if INGREDIENT_CONCEPT_ID is present in the DRUG_STRENGTH table as expected based on the specification.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'INGREDIENT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_strength_ingredient_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_STRENGTH
cdmFieldName = INGREDIENT_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(ingredient_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_strength cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if INVALID_REASON is present in the DRUG_STRENGTH table as expected based on the specification.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'INVALID_REASON' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_strength_invalid_reason' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_STRENGTH
cdmFieldName = INVALID_REASON
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(invalid_reason) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_strength cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if NUMERATOR_UNIT_CONCEPT_ID is present in the DRUG_STRENGTH table as expected based on the specification.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'NUMERATOR_UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_strength_numerator_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_STRENGTH
cdmFieldName = NUMERATOR_UNIT_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(numerator_unit_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_strength cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if NUMERATOR_VALUE is present in the DRUG_STRENGTH table as expected based on the specification.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'NUMERATOR_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_strength_numerator_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_STRENGTH
cdmFieldName = NUMERATOR_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(numerator_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_strength cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VALID_END_DATE is present in the DRUG_STRENGTH table as expected based on the specification.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'VALID_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_strength_valid_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_STRENGTH
cdmFieldName = VALID_END_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(valid_end_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_strength cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VALID_START_DATE is present in the DRUG_STRENGTH table as expected based on the specification.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'VALID_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_drug_strength_valid_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_STRENGTH
cdmFieldName = VALID_START_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(valid_start_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.drug_strength cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if EPISODE_CONCEPT_ID is present in the EPISODE table as expected based on the specification.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_episode_episode_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(episode_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.episode cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if EPISODE_END_DATE is present in the EPISODE table as expected based on the specification.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_episode_episode_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_END_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(episode_end_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.episode cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if EPISODE_END_DATETIME is present in the EPISODE table as expected based on the specification.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_END_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_episode_episode_end_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_END_DATETIME
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(episode_end_datetime) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.episode cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if EPISODE_ID is present in the EPISODE table as expected based on the specification.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_episode_episode_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(episode_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.episode cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if EPISODE_NUMBER is present in the EPISODE table as expected based on the specification.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_NUMBER' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_episode_episode_number' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_NUMBER
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(episode_number) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.episode cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if EPISODE_OBJECT_CONCEPT_ID is present in the EPISODE table as expected based on the specification.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_OBJECT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_episode_episode_object_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_OBJECT_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(episode_object_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.episode cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if EPISODE_PARENT_ID is present in the EPISODE table as expected based on the specification.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_PARENT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_episode_episode_parent_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_PARENT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(episode_parent_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.episode cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if EPISODE_SOURCE_CONCEPT_ID is present in the EPISODE table as expected based on the specification.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_episode_episode_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_SOURCE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(episode_source_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.episode cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if EPISODE_SOURCE_VALUE is present in the EPISODE table as expected based on the specification.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_episode_episode_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(episode_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.episode cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if EPISODE_START_DATE is present in the EPISODE table as expected based on the specification.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_episode_episode_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_START_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(episode_start_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.episode cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if EPISODE_START_DATETIME is present in the EPISODE table as expected based on the specification.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_START_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_episode_episode_start_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_START_DATETIME
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(episode_start_datetime) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.episode cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if EPISODE_TYPE_CONCEPT_ID is present in the EPISODE table as expected based on the specification.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_episode_episode_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(episode_type_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.episode cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PERSON_ID is present in the EPISODE table as expected based on the specification.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_episode_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = EPISODE
cdmFieldName = PERSON_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(person_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.episode cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if EPISODE_EVENT_FIELD_CONCEPT_ID is present in the EPISODE_EVENT table as expected based on the specification.' as check_description
  ,'EPISODE_EVENT' as cdm_table_name
  ,'EPISODE_EVENT_FIELD_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_episode_event_episode_event_field_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = EPISODE_EVENT
cdmFieldName = EPISODE_EVENT_FIELD_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(episode_event_field_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.episode_event cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if EPISODE_ID is present in the EPISODE_EVENT table as expected based on the specification.' as check_description
  ,'EPISODE_EVENT' as cdm_table_name
  ,'EPISODE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_episode_event_episode_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = EPISODE_EVENT
cdmFieldName = EPISODE_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(episode_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.episode_event cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if EVENT_ID is present in the EPISODE_EVENT table as expected based on the specification.' as check_description
  ,'EPISODE_EVENT' as cdm_table_name
  ,'EVENT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_episode_event_event_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = EPISODE_EVENT
cdmFieldName = EVENT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(event_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.episode_event cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DOMAIN_CONCEPT_ID_1 is present in the FACT_RELATIONSHIP table as expected based on the specification.' as check_description
  ,'FACT_RELATIONSHIP' as cdm_table_name
  ,'DOMAIN_CONCEPT_ID_1' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_fact_relationship_domain_concept_id_1' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = FACT_RELATIONSHIP
cdmFieldName = DOMAIN_CONCEPT_ID_1
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(domain_concept_id_1) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.fact_relationship cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DOMAIN_CONCEPT_ID_2 is present in the FACT_RELATIONSHIP table as expected based on the specification.' as check_description
  ,'FACT_RELATIONSHIP' as cdm_table_name
  ,'DOMAIN_CONCEPT_ID_2' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_fact_relationship_domain_concept_id_2' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = FACT_RELATIONSHIP
cdmFieldName = DOMAIN_CONCEPT_ID_2
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(domain_concept_id_2) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.fact_relationship cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if FACT_ID_1 is present in the FACT_RELATIONSHIP table as expected based on the specification.' as check_description
  ,'FACT_RELATIONSHIP' as cdm_table_name
  ,'FACT_ID_1' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_fact_relationship_fact_id_1' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = FACT_RELATIONSHIP
cdmFieldName = FACT_ID_1
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(fact_id_1) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.fact_relationship cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if FACT_ID_2 is present in the FACT_RELATIONSHIP table as expected based on the specification.' as check_description
  ,'FACT_RELATIONSHIP' as cdm_table_name
  ,'FACT_ID_2' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_fact_relationship_fact_id_2' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = FACT_RELATIONSHIP
cdmFieldName = FACT_ID_2
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(fact_id_2) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.fact_relationship cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if RELATIONSHIP_CONCEPT_ID is present in the FACT_RELATIONSHIP table as expected based on the specification.' as check_description
  ,'FACT_RELATIONSHIP' as cdm_table_name
  ,'RELATIONSHIP_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_fact_relationship_relationship_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = FACT_RELATIONSHIP
cdmFieldName = RELATIONSHIP_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(relationship_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.fact_relationship cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if ADDRESS_1 is present in the LOCATION table as expected based on the specification.' as check_description
  ,'LOCATION' as cdm_table_name
  ,'ADDRESS_1' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_location_address_1' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = LOCATION
cdmFieldName = ADDRESS_1
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(address_1) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.location cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if ADDRESS_2 is present in the LOCATION table as expected based on the specification.' as check_description
  ,'LOCATION' as cdm_table_name
  ,'ADDRESS_2' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_location_address_2' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = LOCATION
cdmFieldName = ADDRESS_2
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(address_2) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.location cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if CITY is present in the LOCATION table as expected based on the specification.' as check_description
  ,'LOCATION' as cdm_table_name
  ,'CITY' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_location_city' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = LOCATION
cdmFieldName = CITY
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(city) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.location cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if COUNTRY_CONCEPT_ID is present in the LOCATION table as expected based on the specification.' as check_description
  ,'LOCATION' as cdm_table_name
  ,'COUNTRY_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_location_country_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = LOCATION
cdmFieldName = COUNTRY_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(country_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.location cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if COUNTRY_SOURCE_VALUE is present in the LOCATION table as expected based on the specification.' as check_description
  ,'LOCATION' as cdm_table_name
  ,'COUNTRY_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_location_country_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = LOCATION
cdmFieldName = COUNTRY_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(country_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.location cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if COUNTY is present in the LOCATION table as expected based on the specification.' as check_description
  ,'LOCATION' as cdm_table_name
  ,'COUNTY' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_location_county' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = LOCATION
cdmFieldName = COUNTY
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(county) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.location cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if LATITUDE is present in the LOCATION table as expected based on the specification.' as check_description
  ,'LOCATION' as cdm_table_name
  ,'LATITUDE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_location_latitude' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = LOCATION
cdmFieldName = LATITUDE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(latitude) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.location cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if LOCATION_ID is present in the LOCATION table as expected based on the specification.' as check_description
  ,'LOCATION' as cdm_table_name
  ,'LOCATION_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_location_location_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = LOCATION
cdmFieldName = LOCATION_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(location_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.location cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if LOCATION_SOURCE_VALUE is present in the LOCATION table as expected based on the specification.' as check_description
  ,'LOCATION' as cdm_table_name
  ,'LOCATION_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_location_location_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = LOCATION
cdmFieldName = LOCATION_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(location_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.location cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if LONGITUDE is present in the LOCATION table as expected based on the specification.' as check_description
  ,'LOCATION' as cdm_table_name
  ,'LONGITUDE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_location_longitude' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = LOCATION
cdmFieldName = LONGITUDE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(longitude) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.location cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if STATE is present in the LOCATION table as expected based on the specification.' as check_description
  ,'LOCATION' as cdm_table_name
  ,'STATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_location_state' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = LOCATION
cdmFieldName = STATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(state) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.location cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if ZIP is present in the LOCATION table as expected based on the specification.' as check_description
  ,'LOCATION' as cdm_table_name
  ,'ZIP' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_location_zip' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = LOCATION
cdmFieldName = ZIP
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(zip) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.location cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if MEAS_EVENT_FIELD_CONCEPT_ID is present in the MEASUREMENT table as expected based on the specification.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEAS_EVENT_FIELD_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_measurement_meas_event_field_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEAS_EVENT_FIELD_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(meas_event_field_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.measurement cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if MEASUREMENT_CONCEPT_ID is present in the MEASUREMENT table as expected based on the specification.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_measurement_measurement_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(measurement_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.measurement cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if MEASUREMENT_DATE is present in the MEASUREMENT table as expected based on the specification.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_measurement_measurement_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(measurement_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.measurement cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if MEASUREMENT_DATETIME is present in the MEASUREMENT table as expected based on the specification.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_measurement_measurement_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_DATETIME
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(measurement_datetime) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.measurement cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if MEASUREMENT_EVENT_ID is present in the MEASUREMENT table as expected based on the specification.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_EVENT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_measurement_measurement_event_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_EVENT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(measurement_event_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.measurement cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if MEASUREMENT_ID is present in the MEASUREMENT table as expected based on the specification.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_measurement_measurement_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(measurement_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.measurement cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if MEASUREMENT_SOURCE_CONCEPT_ID is present in the MEASUREMENT table as expected based on the specification.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_measurement_measurement_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_SOURCE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(measurement_source_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.measurement cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if MEASUREMENT_SOURCE_VALUE is present in the MEASUREMENT table as expected based on the specification.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_measurement_measurement_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(measurement_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.measurement cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if MEASUREMENT_TIME is present in the MEASUREMENT table as expected based on the specification.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_TIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_measurement_measurement_time' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_TIME
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(measurement_time) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.measurement cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if MEASUREMENT_TYPE_CONCEPT_ID is present in the MEASUREMENT table as expected based on the specification.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_measurement_measurement_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(measurement_type_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.measurement cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if OPERATOR_CONCEPT_ID is present in the MEASUREMENT table as expected based on the specification.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'OPERATOR_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_measurement_operator_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = OPERATOR_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(operator_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.measurement cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PERSON_ID is present in the MEASUREMENT table as expected based on the specification.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_measurement_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = PERSON_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(person_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.measurement cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PROVIDER_ID is present in the MEASUREMENT table as expected based on the specification.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_measurement_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = PROVIDER_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(provider_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.measurement cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if RANGE_HIGH is present in the MEASUREMENT table as expected based on the specification.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'RANGE_HIGH' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_measurement_range_high' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = RANGE_HIGH
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(range_high) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.measurement cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if RANGE_LOW is present in the MEASUREMENT table as expected based on the specification.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'RANGE_LOW' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_measurement_range_low' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = RANGE_LOW
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(range_low) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.measurement cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if UNIT_CONCEPT_ID is present in the MEASUREMENT table as expected based on the specification.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_measurement_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = UNIT_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(unit_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.measurement cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if UNIT_SOURCE_CONCEPT_ID is present in the MEASUREMENT table as expected based on the specification.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'UNIT_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_measurement_unit_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = UNIT_SOURCE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(unit_source_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.measurement cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if UNIT_SOURCE_VALUE is present in the MEASUREMENT table as expected based on the specification.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'UNIT_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_measurement_unit_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = UNIT_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(unit_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.measurement cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VALUE_AS_CONCEPT_ID is present in the MEASUREMENT table as expected based on the specification.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'VALUE_AS_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_measurement_value_as_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = VALUE_AS_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(value_as_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.measurement cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VALUE_AS_NUMBER is present in the MEASUREMENT table as expected based on the specification.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'VALUE_AS_NUMBER' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_measurement_value_as_number' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = VALUE_AS_NUMBER
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(value_as_number) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.measurement cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VALUE_SOURCE_VALUE is present in the MEASUREMENT table as expected based on the specification.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'VALUE_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_measurement_value_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = VALUE_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(value_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.measurement cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VISIT_DETAIL_ID is present in the MEASUREMENT table as expected based on the specification.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_measurement_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = VISIT_DETAIL_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(visit_detail_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.measurement cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VISIT_OCCURRENCE_ID is present in the MEASUREMENT table as expected based on the specification.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_measurement_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = VISIT_OCCURRENCE_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(visit_occurrence_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.measurement cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if METADATA_CONCEPT_ID is present in the METADATA table as expected based on the specification.' as check_description
  ,'METADATA' as cdm_table_name
  ,'METADATA_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_metadata_metadata_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = METADATA
cdmFieldName = METADATA_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(metadata_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.metadata cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if METADATA_DATE is present in the METADATA table as expected based on the specification.' as check_description
  ,'METADATA' as cdm_table_name
  ,'METADATA_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_metadata_metadata_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = METADATA
cdmFieldName = METADATA_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(metadata_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.metadata cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if METADATA_DATETIME is present in the METADATA table as expected based on the specification.' as check_description
  ,'METADATA' as cdm_table_name
  ,'METADATA_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_metadata_metadata_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = METADATA
cdmFieldName = METADATA_DATETIME
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(metadata_datetime) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.metadata cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if METADATA_ID is present in the METADATA table as expected based on the specification.' as check_description
  ,'METADATA' as cdm_table_name
  ,'METADATA_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_metadata_metadata_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = METADATA
cdmFieldName = METADATA_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(metadata_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.metadata cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if METADATA_TYPE_CONCEPT_ID is present in the METADATA table as expected based on the specification.' as check_description
  ,'METADATA' as cdm_table_name
  ,'METADATA_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_metadata_metadata_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = METADATA
cdmFieldName = METADATA_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(metadata_type_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.metadata cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if NAME is present in the METADATA table as expected based on the specification.' as check_description
  ,'METADATA' as cdm_table_name
  ,'NAME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_metadata_name' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = METADATA
cdmFieldName = NAME
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(name) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.metadata cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VALUE_AS_CONCEPT_ID is present in the METADATA table as expected based on the specification.' as check_description
  ,'METADATA' as cdm_table_name
  ,'VALUE_AS_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_metadata_value_as_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = METADATA
cdmFieldName = VALUE_AS_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(value_as_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.metadata cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VALUE_AS_NUMBER is present in the METADATA table as expected based on the specification.' as check_description
  ,'METADATA' as cdm_table_name
  ,'VALUE_AS_NUMBER' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_metadata_value_as_number' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = METADATA
cdmFieldName = VALUE_AS_NUMBER
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(value_as_number) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.metadata cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VALUE_AS_STRING is present in the METADATA table as expected based on the specification.' as check_description
  ,'METADATA' as cdm_table_name
  ,'VALUE_AS_STRING' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_metadata_value_as_string' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = METADATA
cdmFieldName = VALUE_AS_STRING
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(value_as_string) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.metadata cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if ENCODING_CONCEPT_ID is present in the NOTE table as expected based on the specification.' as check_description
  ,'NOTE' as cdm_table_name
  ,'ENCODING_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_note_encoding_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = NOTE
cdmFieldName = ENCODING_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(encoding_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.note cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if LANGUAGE_CONCEPT_ID is present in the NOTE table as expected based on the specification.' as check_description
  ,'NOTE' as cdm_table_name
  ,'LANGUAGE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_note_language_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = NOTE
cdmFieldName = LANGUAGE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(language_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.note cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if NOTE_CLASS_CONCEPT_ID is present in the NOTE table as expected based on the specification.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_CLASS_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_note_note_class_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = NOTE
cdmFieldName = NOTE_CLASS_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(note_class_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.note cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if NOTE_DATE is present in the NOTE table as expected based on the specification.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_note_note_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = NOTE
cdmFieldName = NOTE_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(note_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.note cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if NOTE_DATETIME is present in the NOTE table as expected based on the specification.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_note_note_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = NOTE
cdmFieldName = NOTE_DATETIME
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(note_datetime) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.note cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if NOTE_EVENT_FIELD_CONCEPT_ID is present in the NOTE table as expected based on the specification.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_EVENT_FIELD_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_note_note_event_field_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = NOTE
cdmFieldName = NOTE_EVENT_FIELD_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(note_event_field_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.note cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if NOTE_EVENT_ID is present in the NOTE table as expected based on the specification.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_EVENT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_note_note_event_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = NOTE
cdmFieldName = NOTE_EVENT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(note_event_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.note cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if NOTE_ID is present in the NOTE table as expected based on the specification.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_note_note_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = NOTE
cdmFieldName = NOTE_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(note_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.note cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if NOTE_SOURCE_VALUE is present in the NOTE table as expected based on the specification.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_note_note_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = NOTE
cdmFieldName = NOTE_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(note_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.note cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if NOTE_TEXT is present in the NOTE table as expected based on the specification.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_TEXT' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_note_note_text' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = NOTE
cdmFieldName = NOTE_TEXT
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(note_text) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.note cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if NOTE_TITLE is present in the NOTE table as expected based on the specification.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_TITLE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_note_note_title' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = NOTE
cdmFieldName = NOTE_TITLE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(note_title) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.note cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if NOTE_TYPE_CONCEPT_ID is present in the NOTE table as expected based on the specification.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_note_note_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = NOTE
cdmFieldName = NOTE_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(note_type_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.note cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PERSON_ID is present in the NOTE table as expected based on the specification.' as check_description
  ,'NOTE' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_note_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = NOTE
cdmFieldName = PERSON_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(person_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.note cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PROVIDER_ID is present in the NOTE table as expected based on the specification.' as check_description
  ,'NOTE' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_note_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = NOTE
cdmFieldName = PROVIDER_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(provider_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.note cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VISIT_DETAIL_ID is present in the NOTE table as expected based on the specification.' as check_description
  ,'NOTE' as cdm_table_name
  ,'VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_note_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = NOTE
cdmFieldName = VISIT_DETAIL_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(visit_detail_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.note cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VISIT_OCCURRENCE_ID is present in the NOTE table as expected based on the specification.' as check_description
  ,'NOTE' as cdm_table_name
  ,'VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_note_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = NOTE
cdmFieldName = VISIT_OCCURRENCE_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(visit_occurrence_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.note cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if LEXICAL_VARIANT is present in the NOTE_NLP table as expected based on the specification.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'LEXICAL_VARIANT' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_note_nlp_lexical_variant' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = NOTE_NLP
cdmFieldName = LEXICAL_VARIANT
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(lexical_variant) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.note_nlp cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if NLP_DATE is present in the NOTE_NLP table as expected based on the specification.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'NLP_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_note_nlp_nlp_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = NOTE_NLP
cdmFieldName = NLP_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(nlp_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.note_nlp cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if NLP_DATETIME is present in the NOTE_NLP table as expected based on the specification.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'NLP_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_note_nlp_nlp_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = NOTE_NLP
cdmFieldName = NLP_DATETIME
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(nlp_datetime) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.note_nlp cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if NLP_SYSTEM is present in the NOTE_NLP table as expected based on the specification.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'NLP_SYSTEM' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_note_nlp_nlp_system' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = NOTE_NLP
cdmFieldName = NLP_SYSTEM
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(nlp_system) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.note_nlp cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if NOTE_ID is present in the NOTE_NLP table as expected based on the specification.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'NOTE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_note_nlp_note_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = NOTE_NLP
cdmFieldName = NOTE_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(note_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.note_nlp cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if NOTE_NLP_CONCEPT_ID is present in the NOTE_NLP table as expected based on the specification.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'NOTE_NLP_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_note_nlp_note_nlp_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = NOTE_NLP
cdmFieldName = NOTE_NLP_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(note_nlp_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.note_nlp cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if NOTE_NLP_ID is present in the NOTE_NLP table as expected based on the specification.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'NOTE_NLP_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_note_nlp_note_nlp_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = NOTE_NLP
cdmFieldName = NOTE_NLP_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(note_nlp_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.note_nlp cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if NOTE_NLP_SOURCE_CONCEPT_ID is present in the NOTE_NLP table as expected based on the specification.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'NOTE_NLP_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_note_nlp_note_nlp_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = NOTE_NLP
cdmFieldName = NOTE_NLP_SOURCE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(note_nlp_source_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.note_nlp cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if SECTION_CONCEPT_ID is present in the NOTE_NLP table as expected based on the specification.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'SECTION_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_note_nlp_section_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = NOTE_NLP
cdmFieldName = SECTION_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(section_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.note_nlp cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if SNIPPET is present in the NOTE_NLP table as expected based on the specification.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'SNIPPET' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_note_nlp_snippet' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = NOTE_NLP
cdmFieldName = SNIPPET
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(snippet) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.note_nlp cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if TERM_EXISTS is present in the NOTE_NLP table as expected based on the specification.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'TERM_EXISTS' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_note_nlp_term_exists' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = NOTE_NLP
cdmFieldName = TERM_EXISTS
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(term_exists) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.note_nlp cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if TERM_MODIFIERS is present in the NOTE_NLP table as expected based on the specification.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'TERM_MODIFIERS' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_note_nlp_term_modifiers' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = NOTE_NLP
cdmFieldName = TERM_MODIFIERS
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(term_modifiers) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.note_nlp cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if TERM_TEMPORAL is present in the NOTE_NLP table as expected based on the specification.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'TERM_TEMPORAL' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_note_nlp_term_temporal' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = NOTE_NLP
cdmFieldName = TERM_TEMPORAL
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(term_temporal) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.note_nlp cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if OBS_EVENT_FIELD_CONCEPT_ID is present in the OBSERVATION table as expected based on the specification.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBS_EVENT_FIELD_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_observation_obs_event_field_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION
cdmFieldName = OBS_EVENT_FIELD_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(obs_event_field_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.observation cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if OBSERVATION_CONCEPT_ID is present in the OBSERVATION table as expected based on the specification.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_observation_observation_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION
cdmFieldName = OBSERVATION_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(observation_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.observation cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if OBSERVATION_DATE is present in the OBSERVATION table as expected based on the specification.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_observation_observation_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION
cdmFieldName = OBSERVATION_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(observation_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.observation cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if OBSERVATION_DATETIME is present in the OBSERVATION table as expected based on the specification.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_observation_observation_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION
cdmFieldName = OBSERVATION_DATETIME
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(observation_datetime) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.observation cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if OBSERVATION_EVENT_ID is present in the OBSERVATION table as expected based on the specification.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_EVENT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_observation_observation_event_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION
cdmFieldName = OBSERVATION_EVENT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(observation_event_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.observation cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if OBSERVATION_ID is present in the OBSERVATION table as expected based on the specification.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_observation_observation_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION
cdmFieldName = OBSERVATION_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(observation_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.observation cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if OBSERVATION_SOURCE_CONCEPT_ID is present in the OBSERVATION table as expected based on the specification.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_observation_observation_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION
cdmFieldName = OBSERVATION_SOURCE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(observation_source_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.observation cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if OBSERVATION_SOURCE_VALUE is present in the OBSERVATION table as expected based on the specification.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_observation_observation_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION
cdmFieldName = OBSERVATION_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(observation_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.observation cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if OBSERVATION_TYPE_CONCEPT_ID is present in the OBSERVATION table as expected based on the specification.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_observation_observation_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION
cdmFieldName = OBSERVATION_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(observation_type_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.observation cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PERSON_ID is present in the OBSERVATION table as expected based on the specification.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_observation_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION
cdmFieldName = PERSON_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(person_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.observation cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PROVIDER_ID is present in the OBSERVATION table as expected based on the specification.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_observation_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION
cdmFieldName = PROVIDER_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(provider_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.observation cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if QUALIFIER_CONCEPT_ID is present in the OBSERVATION table as expected based on the specification.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'QUALIFIER_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_observation_qualifier_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION
cdmFieldName = QUALIFIER_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(qualifier_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.observation cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if QUALIFIER_SOURCE_VALUE is present in the OBSERVATION table as expected based on the specification.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'QUALIFIER_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_observation_qualifier_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION
cdmFieldName = QUALIFIER_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(qualifier_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.observation cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if UNIT_CONCEPT_ID is present in the OBSERVATION table as expected based on the specification.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_observation_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION
cdmFieldName = UNIT_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(unit_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.observation cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if UNIT_SOURCE_VALUE is present in the OBSERVATION table as expected based on the specification.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'UNIT_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_observation_unit_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION
cdmFieldName = UNIT_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(unit_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.observation cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VALUE_AS_CONCEPT_ID is present in the OBSERVATION table as expected based on the specification.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'VALUE_AS_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_observation_value_as_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION
cdmFieldName = VALUE_AS_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(value_as_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.observation cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VALUE_AS_NUMBER is present in the OBSERVATION table as expected based on the specification.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'VALUE_AS_NUMBER' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_observation_value_as_number' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION
cdmFieldName = VALUE_AS_NUMBER
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(value_as_number) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.observation cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VALUE_AS_STRING is present in the OBSERVATION table as expected based on the specification.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'VALUE_AS_STRING' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_observation_value_as_string' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION
cdmFieldName = VALUE_AS_STRING
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(value_as_string) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.observation cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VALUE_SOURCE_VALUE is present in the OBSERVATION table as expected based on the specification.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'VALUE_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_observation_value_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION
cdmFieldName = VALUE_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(value_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.observation cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VISIT_DETAIL_ID is present in the OBSERVATION table as expected based on the specification.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_observation_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION
cdmFieldName = VISIT_DETAIL_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(visit_detail_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.observation cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VISIT_OCCURRENCE_ID is present in the OBSERVATION table as expected based on the specification.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_observation_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION
cdmFieldName = VISIT_OCCURRENCE_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(visit_occurrence_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.observation cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if OBSERVATION_PERIOD_END_DATE is present in the OBSERVATION_PERIOD table as expected based on the specification.' as check_description
  ,'OBSERVATION_PERIOD' as cdm_table_name
  ,'OBSERVATION_PERIOD_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_observation_period_observation_period_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION_PERIOD
cdmFieldName = OBSERVATION_PERIOD_END_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(observation_period_end_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.observation_period cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if OBSERVATION_PERIOD_ID is present in the OBSERVATION_PERIOD table as expected based on the specification.' as check_description
  ,'OBSERVATION_PERIOD' as cdm_table_name
  ,'OBSERVATION_PERIOD_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_observation_period_observation_period_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION_PERIOD
cdmFieldName = OBSERVATION_PERIOD_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(observation_period_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.observation_period cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if OBSERVATION_PERIOD_START_DATE is present in the OBSERVATION_PERIOD table as expected based on the specification.' as check_description
  ,'OBSERVATION_PERIOD' as cdm_table_name
  ,'OBSERVATION_PERIOD_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_observation_period_observation_period_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION_PERIOD
cdmFieldName = OBSERVATION_PERIOD_START_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(observation_period_start_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.observation_period cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PERIOD_TYPE_CONCEPT_ID is present in the OBSERVATION_PERIOD table as expected based on the specification.' as check_description
  ,'OBSERVATION_PERIOD' as cdm_table_name
  ,'PERIOD_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_observation_period_period_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION_PERIOD
cdmFieldName = PERIOD_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(period_type_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.observation_period cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PERSON_ID is present in the OBSERVATION_PERIOD table as expected based on the specification.' as check_description
  ,'OBSERVATION_PERIOD' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_observation_period_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION_PERIOD
cdmFieldName = PERSON_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(person_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.observation_period cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if FAMILY_SOURCE_VALUE is present in the PAYER_PLAN_PERIOD table as expected based on the specification.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'FAMILY_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_payer_plan_period_family_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = FAMILY_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(family_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.payer_plan_period cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PAYER_CONCEPT_ID is present in the PAYER_PLAN_PERIOD table as expected based on the specification.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PAYER_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_payer_plan_period_payer_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = PAYER_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(payer_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.payer_plan_period cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PAYER_PLAN_PERIOD_END_DATE is present in the PAYER_PLAN_PERIOD table as expected based on the specification.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PAYER_PLAN_PERIOD_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_payer_plan_period_payer_plan_period_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = PAYER_PLAN_PERIOD_END_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(payer_plan_period_end_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.payer_plan_period cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PAYER_PLAN_PERIOD_ID is present in the PAYER_PLAN_PERIOD table as expected based on the specification.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PAYER_PLAN_PERIOD_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_payer_plan_period_payer_plan_period_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = PAYER_PLAN_PERIOD_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(payer_plan_period_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.payer_plan_period cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PAYER_PLAN_PERIOD_START_DATE is present in the PAYER_PLAN_PERIOD table as expected based on the specification.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PAYER_PLAN_PERIOD_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_payer_plan_period_payer_plan_period_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = PAYER_PLAN_PERIOD_START_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(payer_plan_period_start_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.payer_plan_period cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PAYER_SOURCE_CONCEPT_ID is present in the PAYER_PLAN_PERIOD table as expected based on the specification.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PAYER_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_payer_plan_period_payer_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = PAYER_SOURCE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(payer_source_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.payer_plan_period cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PAYER_SOURCE_VALUE is present in the PAYER_PLAN_PERIOD table as expected based on the specification.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PAYER_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_payer_plan_period_payer_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = PAYER_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(payer_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.payer_plan_period cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PERSON_ID is present in the PAYER_PLAN_PERIOD table as expected based on the specification.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_payer_plan_period_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = PERSON_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(person_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.payer_plan_period cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PLAN_CONCEPT_ID is present in the PAYER_PLAN_PERIOD table as expected based on the specification.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PLAN_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_payer_plan_period_plan_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = PLAN_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(plan_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.payer_plan_period cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PLAN_SOURCE_CONCEPT_ID is present in the PAYER_PLAN_PERIOD table as expected based on the specification.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PLAN_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_payer_plan_period_plan_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = PLAN_SOURCE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(plan_source_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.payer_plan_period cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PLAN_SOURCE_VALUE is present in the PAYER_PLAN_PERIOD table as expected based on the specification.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PLAN_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_payer_plan_period_plan_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = PLAN_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(plan_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.payer_plan_period cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if SPONSOR_CONCEPT_ID is present in the PAYER_PLAN_PERIOD table as expected based on the specification.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'SPONSOR_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_payer_plan_period_sponsor_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = SPONSOR_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(sponsor_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.payer_plan_period cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if SPONSOR_SOURCE_CONCEPT_ID is present in the PAYER_PLAN_PERIOD table as expected based on the specification.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'SPONSOR_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_payer_plan_period_sponsor_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = SPONSOR_SOURCE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(sponsor_source_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.payer_plan_period cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if SPONSOR_SOURCE_VALUE is present in the PAYER_PLAN_PERIOD table as expected based on the specification.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'SPONSOR_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_payer_plan_period_sponsor_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = SPONSOR_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(sponsor_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.payer_plan_period cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if STOP_REASON_CONCEPT_ID is present in the PAYER_PLAN_PERIOD table as expected based on the specification.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'STOP_REASON_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_payer_plan_period_stop_reason_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = STOP_REASON_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(stop_reason_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.payer_plan_period cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if STOP_REASON_SOURCE_CONCEPT_ID is present in the PAYER_PLAN_PERIOD table as expected based on the specification.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'STOP_REASON_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_payer_plan_period_stop_reason_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = STOP_REASON_SOURCE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(stop_reason_source_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.payer_plan_period cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if STOP_REASON_SOURCE_VALUE is present in the PAYER_PLAN_PERIOD table as expected based on the specification.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'STOP_REASON_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_payer_plan_period_stop_reason_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = STOP_REASON_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(stop_reason_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.payer_plan_period cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if BIRTH_DATETIME is present in the PERSON table as expected based on the specification.' as check_description
  ,'PERSON' as cdm_table_name
  ,'BIRTH_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_person_birth_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PERSON
cdmFieldName = BIRTH_DATETIME
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(birth_datetime) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.person cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if CARE_SITE_ID is present in the PERSON table as expected based on the specification.' as check_description
  ,'PERSON' as cdm_table_name
  ,'CARE_SITE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_person_care_site_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PERSON
cdmFieldName = CARE_SITE_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(care_site_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.person cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DAY_OF_BIRTH is present in the PERSON table as expected based on the specification.' as check_description
  ,'PERSON' as cdm_table_name
  ,'DAY_OF_BIRTH' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_person_day_of_birth' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PERSON
cdmFieldName = DAY_OF_BIRTH
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(day_of_birth) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.person cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if ETHNICITY_CONCEPT_ID is present in the PERSON table as expected based on the specification.' as check_description
  ,'PERSON' as cdm_table_name
  ,'ETHNICITY_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_person_ethnicity_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PERSON
cdmFieldName = ETHNICITY_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(ethnicity_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.person cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if ETHNICITY_SOURCE_CONCEPT_ID is present in the PERSON table as expected based on the specification.' as check_description
  ,'PERSON' as cdm_table_name
  ,'ETHNICITY_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_person_ethnicity_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PERSON
cdmFieldName = ETHNICITY_SOURCE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(ethnicity_source_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.person cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if ETHNICITY_SOURCE_VALUE is present in the PERSON table as expected based on the specification.' as check_description
  ,'PERSON' as cdm_table_name
  ,'ETHNICITY_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_person_ethnicity_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PERSON
cdmFieldName = ETHNICITY_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(ethnicity_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.person cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if GENDER_CONCEPT_ID is present in the PERSON table as expected based on the specification.' as check_description
  ,'PERSON' as cdm_table_name
  ,'GENDER_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_person_gender_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PERSON
cdmFieldName = GENDER_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(gender_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.person cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if GENDER_SOURCE_CONCEPT_ID is present in the PERSON table as expected based on the specification.' as check_description
  ,'PERSON' as cdm_table_name
  ,'GENDER_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_person_gender_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PERSON
cdmFieldName = GENDER_SOURCE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(gender_source_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.person cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if GENDER_SOURCE_VALUE is present in the PERSON table as expected based on the specification.' as check_description
  ,'PERSON' as cdm_table_name
  ,'GENDER_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_person_gender_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PERSON
cdmFieldName = GENDER_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(gender_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.person cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if LOCATION_ID is present in the PERSON table as expected based on the specification.' as check_description
  ,'PERSON' as cdm_table_name
  ,'LOCATION_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_person_location_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PERSON
cdmFieldName = LOCATION_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(location_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.person cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if MONTH_OF_BIRTH is present in the PERSON table as expected based on the specification.' as check_description
  ,'PERSON' as cdm_table_name
  ,'MONTH_OF_BIRTH' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_person_month_of_birth' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PERSON
cdmFieldName = MONTH_OF_BIRTH
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(month_of_birth) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.person cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PERSON_ID is present in the PERSON table as expected based on the specification.' as check_description
  ,'PERSON' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_person_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PERSON
cdmFieldName = PERSON_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(person_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.person cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PERSON_SOURCE_VALUE is present in the PERSON table as expected based on the specification.' as check_description
  ,'PERSON' as cdm_table_name
  ,'PERSON_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_person_person_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PERSON
cdmFieldName = PERSON_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(person_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.person cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PROVIDER_ID is present in the PERSON table as expected based on the specification.' as check_description
  ,'PERSON' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_person_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PERSON
cdmFieldName = PROVIDER_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(provider_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.person cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if RACE_CONCEPT_ID is present in the PERSON table as expected based on the specification.' as check_description
  ,'PERSON' as cdm_table_name
  ,'RACE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_person_race_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PERSON
cdmFieldName = RACE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(race_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.person cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if RACE_SOURCE_CONCEPT_ID is present in the PERSON table as expected based on the specification.' as check_description
  ,'PERSON' as cdm_table_name
  ,'RACE_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_person_race_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PERSON
cdmFieldName = RACE_SOURCE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(race_source_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.person cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if RACE_SOURCE_VALUE is present in the PERSON table as expected based on the specification.' as check_description
  ,'PERSON' as cdm_table_name
  ,'RACE_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_person_race_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PERSON
cdmFieldName = RACE_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(race_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.person cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if YEAR_OF_BIRTH is present in the PERSON table as expected based on the specification.' as check_description
  ,'PERSON' as cdm_table_name
  ,'YEAR_OF_BIRTH' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_person_year_of_birth' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PERSON
cdmFieldName = YEAR_OF_BIRTH
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(year_of_birth) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.person cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if MODIFIER_CONCEPT_ID is present in the PROCEDURE_OCCURRENCE table as expected based on the specification.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'MODIFIER_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_procedure_occurrence_modifier_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = MODIFIER_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(modifier_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.procedure_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if MODIFIER_SOURCE_VALUE is present in the PROCEDURE_OCCURRENCE table as expected based on the specification.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'MODIFIER_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_procedure_occurrence_modifier_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = MODIFIER_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(modifier_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.procedure_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PERSON_ID is present in the PROCEDURE_OCCURRENCE table as expected based on the specification.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_procedure_occurrence_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PERSON_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(person_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.procedure_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PROCEDURE_CONCEPT_ID is present in the PROCEDURE_OCCURRENCE table as expected based on the specification.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_procedure_occurrence_procedure_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(procedure_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.procedure_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PROCEDURE_DATE is present in the PROCEDURE_OCCURRENCE table as expected based on the specification.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_procedure_occurrence_procedure_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(procedure_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.procedure_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PROCEDURE_DATETIME is present in the PROCEDURE_OCCURRENCE table as expected based on the specification.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_procedure_occurrence_procedure_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_DATETIME
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(procedure_datetime) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.procedure_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PROCEDURE_END_DATE is present in the PROCEDURE_OCCURRENCE table as expected based on the specification.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_procedure_occurrence_procedure_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_END_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(procedure_end_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.procedure_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PROCEDURE_END_DATETIME is present in the PROCEDURE_OCCURRENCE table as expected based on the specification.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_END_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_procedure_occurrence_procedure_end_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_END_DATETIME
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(procedure_end_datetime) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.procedure_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PROCEDURE_OCCURRENCE_ID is present in the PROCEDURE_OCCURRENCE table as expected based on the specification.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_procedure_occurrence_procedure_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_OCCURRENCE_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(procedure_occurrence_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.procedure_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PROCEDURE_SOURCE_CONCEPT_ID is present in the PROCEDURE_OCCURRENCE table as expected based on the specification.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_procedure_occurrence_procedure_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_SOURCE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(procedure_source_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.procedure_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PROCEDURE_SOURCE_VALUE is present in the PROCEDURE_OCCURRENCE table as expected based on the specification.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_procedure_occurrence_procedure_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(procedure_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.procedure_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PROCEDURE_TYPE_CONCEPT_ID is present in the PROCEDURE_OCCURRENCE table as expected based on the specification.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_procedure_occurrence_procedure_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(procedure_type_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.procedure_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PROVIDER_ID is present in the PROCEDURE_OCCURRENCE table as expected based on the specification.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_procedure_occurrence_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROVIDER_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(provider_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.procedure_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if QUANTITY is present in the PROCEDURE_OCCURRENCE table as expected based on the specification.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'QUANTITY' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_procedure_occurrence_quantity' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = QUANTITY
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(quantity) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.procedure_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VISIT_DETAIL_ID is present in the PROCEDURE_OCCURRENCE table as expected based on the specification.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_procedure_occurrence_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = VISIT_DETAIL_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(visit_detail_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.procedure_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VISIT_OCCURRENCE_ID is present in the PROCEDURE_OCCURRENCE table as expected based on the specification.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_procedure_occurrence_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = VISIT_OCCURRENCE_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(visit_occurrence_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.procedure_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if CARE_SITE_ID is present in the PROVIDER table as expected based on the specification.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'CARE_SITE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_provider_care_site_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PROVIDER
cdmFieldName = CARE_SITE_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(care_site_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.provider cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DEA is present in the PROVIDER table as expected based on the specification.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'DEA' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_provider_dea' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PROVIDER
cdmFieldName = DEA
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(dea) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.provider cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if GENDER_CONCEPT_ID is present in the PROVIDER table as expected based on the specification.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'GENDER_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_provider_gender_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PROVIDER
cdmFieldName = GENDER_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(gender_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.provider cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if GENDER_SOURCE_CONCEPT_ID is present in the PROVIDER table as expected based on the specification.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'GENDER_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_provider_gender_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PROVIDER
cdmFieldName = GENDER_SOURCE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(gender_source_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.provider cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if GENDER_SOURCE_VALUE is present in the PROVIDER table as expected based on the specification.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'GENDER_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_provider_gender_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PROVIDER
cdmFieldName = GENDER_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(gender_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.provider cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if NPI is present in the PROVIDER table as expected based on the specification.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'NPI' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_provider_npi' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PROVIDER
cdmFieldName = NPI
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(npi) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.provider cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PROVIDER_ID is present in the PROVIDER table as expected based on the specification.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_provider_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PROVIDER
cdmFieldName = PROVIDER_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(provider_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.provider cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PROVIDER_NAME is present in the PROVIDER table as expected based on the specification.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'PROVIDER_NAME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_provider_provider_name' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PROVIDER
cdmFieldName = PROVIDER_NAME
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(provider_name) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.provider cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PROVIDER_SOURCE_VALUE is present in the PROVIDER table as expected based on the specification.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'PROVIDER_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_provider_provider_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PROVIDER
cdmFieldName = PROVIDER_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(provider_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.provider cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if SPECIALTY_CONCEPT_ID is present in the PROVIDER table as expected based on the specification.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'SPECIALTY_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_provider_specialty_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PROVIDER
cdmFieldName = SPECIALTY_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(specialty_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.provider cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if SPECIALTY_SOURCE_CONCEPT_ID is present in the PROVIDER table as expected based on the specification.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'SPECIALTY_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_provider_specialty_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PROVIDER
cdmFieldName = SPECIALTY_SOURCE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(specialty_source_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.provider cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if SPECIALTY_SOURCE_VALUE is present in the PROVIDER table as expected based on the specification.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'SPECIALTY_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_provider_specialty_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PROVIDER
cdmFieldName = SPECIALTY_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(specialty_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.provider cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if YEAR_OF_BIRTH is present in the PROVIDER table as expected based on the specification.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'YEAR_OF_BIRTH' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_provider_year_of_birth' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = PROVIDER
cdmFieldName = YEAR_OF_BIRTH
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(year_of_birth) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.provider cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DEFINES_ANCESTRY is present in the RELATIONSHIP table as expected based on the specification.' as check_description
  ,'RELATIONSHIP' as cdm_table_name
  ,'DEFINES_ANCESTRY' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_relationship_defines_ancestry' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = RELATIONSHIP
cdmFieldName = DEFINES_ANCESTRY
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(defines_ancestry) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.relationship cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if IS_HIERARCHICAL is present in the RELATIONSHIP table as expected based on the specification.' as check_description
  ,'RELATIONSHIP' as cdm_table_name
  ,'IS_HIERARCHICAL' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_relationship_is_hierarchical' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = RELATIONSHIP
cdmFieldName = IS_HIERARCHICAL
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(is_hierarchical) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.relationship cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if RELATIONSHIP_CONCEPT_ID is present in the RELATIONSHIP table as expected based on the specification.' as check_description
  ,'RELATIONSHIP' as cdm_table_name
  ,'RELATIONSHIP_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_relationship_relationship_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = RELATIONSHIP
cdmFieldName = RELATIONSHIP_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(relationship_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.relationship cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if RELATIONSHIP_ID is present in the RELATIONSHIP table as expected based on the specification.' as check_description
  ,'RELATIONSHIP' as cdm_table_name
  ,'RELATIONSHIP_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_relationship_relationship_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = RELATIONSHIP
cdmFieldName = RELATIONSHIP_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(relationship_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.relationship cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if RELATIONSHIP_NAME is present in the RELATIONSHIP table as expected based on the specification.' as check_description
  ,'RELATIONSHIP' as cdm_table_name
  ,'RELATIONSHIP_NAME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_relationship_relationship_name' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = RELATIONSHIP
cdmFieldName = RELATIONSHIP_NAME
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(relationship_name) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.relationship cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if REVERSE_RELATIONSHIP_ID is present in the RELATIONSHIP table as expected based on the specification.' as check_description
  ,'RELATIONSHIP' as cdm_table_name
  ,'REVERSE_RELATIONSHIP_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_relationship_reverse_relationship_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = RELATIONSHIP
cdmFieldName = REVERSE_RELATIONSHIP_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(reverse_relationship_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.relationship cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if INVALID_REASON is present in the SOURCE_TO_CONCEPT_MAP table as expected based on the specification.' as check_description
  ,'SOURCE_TO_CONCEPT_MAP' as cdm_table_name
  ,'INVALID_REASON' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_source_to_concept_map_invalid_reason' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = SOURCE_TO_CONCEPT_MAP
cdmFieldName = INVALID_REASON
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(invalid_reason) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.source_to_concept_map cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if SOURCE_CODE is present in the SOURCE_TO_CONCEPT_MAP table as expected based on the specification.' as check_description
  ,'SOURCE_TO_CONCEPT_MAP' as cdm_table_name
  ,'SOURCE_CODE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_source_to_concept_map_source_code' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = SOURCE_TO_CONCEPT_MAP
cdmFieldName = SOURCE_CODE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(source_code) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.source_to_concept_map cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if SOURCE_CODE_DESCRIPTION is present in the SOURCE_TO_CONCEPT_MAP table as expected based on the specification.' as check_description
  ,'SOURCE_TO_CONCEPT_MAP' as cdm_table_name
  ,'SOURCE_CODE_DESCRIPTION' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_source_to_concept_map_source_code_description' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = SOURCE_TO_CONCEPT_MAP
cdmFieldName = SOURCE_CODE_DESCRIPTION
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(source_code_description) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.source_to_concept_map cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if SOURCE_CONCEPT_ID is present in the SOURCE_TO_CONCEPT_MAP table as expected based on the specification.' as check_description
  ,'SOURCE_TO_CONCEPT_MAP' as cdm_table_name
  ,'SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_source_to_concept_map_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = SOURCE_TO_CONCEPT_MAP
cdmFieldName = SOURCE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(source_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.source_to_concept_map cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if SOURCE_VOCABULARY_ID is present in the SOURCE_TO_CONCEPT_MAP table as expected based on the specification.' as check_description
  ,'SOURCE_TO_CONCEPT_MAP' as cdm_table_name
  ,'SOURCE_VOCABULARY_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_source_to_concept_map_source_vocabulary_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = SOURCE_TO_CONCEPT_MAP
cdmFieldName = SOURCE_VOCABULARY_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(source_vocabulary_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.source_to_concept_map cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if TARGET_CONCEPT_ID is present in the SOURCE_TO_CONCEPT_MAP table as expected based on the specification.' as check_description
  ,'SOURCE_TO_CONCEPT_MAP' as cdm_table_name
  ,'TARGET_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_source_to_concept_map_target_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = SOURCE_TO_CONCEPT_MAP
cdmFieldName = TARGET_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(target_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.source_to_concept_map cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if TARGET_VOCABULARY_ID is present in the SOURCE_TO_CONCEPT_MAP table as expected based on the specification.' as check_description
  ,'SOURCE_TO_CONCEPT_MAP' as cdm_table_name
  ,'TARGET_VOCABULARY_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_source_to_concept_map_target_vocabulary_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = SOURCE_TO_CONCEPT_MAP
cdmFieldName = TARGET_VOCABULARY_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(target_vocabulary_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.source_to_concept_map cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VALID_END_DATE is present in the SOURCE_TO_CONCEPT_MAP table as expected based on the specification.' as check_description
  ,'SOURCE_TO_CONCEPT_MAP' as cdm_table_name
  ,'VALID_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_source_to_concept_map_valid_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = SOURCE_TO_CONCEPT_MAP
cdmFieldName = VALID_END_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(valid_end_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.source_to_concept_map cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VALID_START_DATE is present in the SOURCE_TO_CONCEPT_MAP table as expected based on the specification.' as check_description
  ,'SOURCE_TO_CONCEPT_MAP' as cdm_table_name
  ,'VALID_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_source_to_concept_map_valid_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = SOURCE_TO_CONCEPT_MAP
cdmFieldName = VALID_START_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(valid_start_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.source_to_concept_map cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if ANATOMIC_SITE_CONCEPT_ID is present in the SPECIMEN table as expected based on the specification.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'ANATOMIC_SITE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_specimen_anatomic_site_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = SPECIMEN
cdmFieldName = ANATOMIC_SITE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(anatomic_site_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.specimen cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if ANATOMIC_SITE_SOURCE_VALUE is present in the SPECIMEN table as expected based on the specification.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'ANATOMIC_SITE_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_specimen_anatomic_site_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = SPECIMEN
cdmFieldName = ANATOMIC_SITE_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(anatomic_site_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.specimen cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DISEASE_STATUS_CONCEPT_ID is present in the SPECIMEN table as expected based on the specification.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'DISEASE_STATUS_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_specimen_disease_status_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = SPECIMEN
cdmFieldName = DISEASE_STATUS_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(disease_status_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.specimen cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DISEASE_STATUS_SOURCE_VALUE is present in the SPECIMEN table as expected based on the specification.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'DISEASE_STATUS_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_specimen_disease_status_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = SPECIMEN
cdmFieldName = DISEASE_STATUS_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(disease_status_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.specimen cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PERSON_ID is present in the SPECIMEN table as expected based on the specification.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_specimen_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = SPECIMEN
cdmFieldName = PERSON_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(person_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.specimen cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if QUANTITY is present in the SPECIMEN table as expected based on the specification.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'QUANTITY' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_specimen_quantity' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = SPECIMEN
cdmFieldName = QUANTITY
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(quantity) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.specimen cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if SPECIMEN_CONCEPT_ID is present in the SPECIMEN table as expected based on the specification.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'SPECIMEN_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_specimen_specimen_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = SPECIMEN
cdmFieldName = SPECIMEN_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(specimen_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.specimen cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if SPECIMEN_DATE is present in the SPECIMEN table as expected based on the specification.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'SPECIMEN_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_specimen_specimen_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = SPECIMEN
cdmFieldName = SPECIMEN_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(specimen_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.specimen cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if SPECIMEN_DATETIME is present in the SPECIMEN table as expected based on the specification.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'SPECIMEN_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_specimen_specimen_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = SPECIMEN
cdmFieldName = SPECIMEN_DATETIME
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(specimen_datetime) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.specimen cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if SPECIMEN_ID is present in the SPECIMEN table as expected based on the specification.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'SPECIMEN_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_specimen_specimen_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = SPECIMEN
cdmFieldName = SPECIMEN_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(specimen_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.specimen cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if SPECIMEN_SOURCE_ID is present in the SPECIMEN table as expected based on the specification.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'SPECIMEN_SOURCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_specimen_specimen_source_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = SPECIMEN
cdmFieldName = SPECIMEN_SOURCE_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(specimen_source_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.specimen cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if SPECIMEN_SOURCE_VALUE is present in the SPECIMEN table as expected based on the specification.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'SPECIMEN_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_specimen_specimen_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = SPECIMEN
cdmFieldName = SPECIMEN_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(specimen_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.specimen cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if SPECIMEN_TYPE_CONCEPT_ID is present in the SPECIMEN table as expected based on the specification.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'SPECIMEN_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_specimen_specimen_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = SPECIMEN
cdmFieldName = SPECIMEN_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(specimen_type_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.specimen cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if UNIT_CONCEPT_ID is present in the SPECIMEN table as expected based on the specification.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_specimen_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = SPECIMEN
cdmFieldName = UNIT_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(unit_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.specimen cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if UNIT_SOURCE_VALUE is present in the SPECIMEN table as expected based on the specification.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'UNIT_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_specimen_unit_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = SPECIMEN
cdmFieldName = UNIT_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(unit_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.specimen cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if ADMITTED_FROM_CONCEPT_ID is present in the VISIT_DETAIL table as expected based on the specification.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'ADMITTED_FROM_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_visit_detail_admitted_from_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = ADMITTED_FROM_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(admitted_from_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.visit_detail cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if ADMITTED_FROM_SOURCE_VALUE is present in the VISIT_DETAIL table as expected based on the specification.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'ADMITTED_FROM_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_visit_detail_admitted_from_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = ADMITTED_FROM_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(admitted_from_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.visit_detail cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if CARE_SITE_ID is present in the VISIT_DETAIL table as expected based on the specification.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'CARE_SITE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_visit_detail_care_site_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = CARE_SITE_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(care_site_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.visit_detail cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DISCHARGED_TO_CONCEPT_ID is present in the VISIT_DETAIL table as expected based on the specification.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'DISCHARGED_TO_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_visit_detail_discharged_to_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = DISCHARGED_TO_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(discharged_to_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.visit_detail cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DISCHARGED_TO_SOURCE_VALUE is present in the VISIT_DETAIL table as expected based on the specification.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'DISCHARGED_TO_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_visit_detail_discharged_to_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = DISCHARGED_TO_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(discharged_to_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.visit_detail cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PARENT_VISIT_DETAIL_ID is present in the VISIT_DETAIL table as expected based on the specification.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'PARENT_VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_visit_detail_parent_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = PARENT_VISIT_DETAIL_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(parent_visit_detail_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.visit_detail cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PERSON_ID is present in the VISIT_DETAIL table as expected based on the specification.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_visit_detail_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = PERSON_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(person_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.visit_detail cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PRECEDING_VISIT_DETAIL_ID is present in the VISIT_DETAIL table as expected based on the specification.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'PRECEDING_VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_visit_detail_preceding_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = PRECEDING_VISIT_DETAIL_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(preceding_visit_detail_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.visit_detail cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PROVIDER_ID is present in the VISIT_DETAIL table as expected based on the specification.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_visit_detail_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = PROVIDER_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(provider_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.visit_detail cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VISIT_DETAIL_CONCEPT_ID is present in the VISIT_DETAIL table as expected based on the specification.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_visit_detail_visit_detail_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_DETAIL_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(visit_detail_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.visit_detail cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VISIT_DETAIL_END_DATE is present in the VISIT_DETAIL table as expected based on the specification.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_visit_detail_visit_detail_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_DETAIL_END_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(visit_detail_end_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.visit_detail cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VISIT_DETAIL_END_DATETIME is present in the VISIT_DETAIL table as expected based on the specification.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_END_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_visit_detail_visit_detail_end_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_DETAIL_END_DATETIME
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(visit_detail_end_datetime) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.visit_detail cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VISIT_DETAIL_ID is present in the VISIT_DETAIL table as expected based on the specification.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_visit_detail_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_DETAIL_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(visit_detail_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.visit_detail cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VISIT_DETAIL_SOURCE_CONCEPT_ID is present in the VISIT_DETAIL table as expected based on the specification.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_visit_detail_visit_detail_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_DETAIL_SOURCE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(visit_detail_source_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.visit_detail cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VISIT_DETAIL_SOURCE_VALUE is present in the VISIT_DETAIL table as expected based on the specification.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_visit_detail_visit_detail_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_DETAIL_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(visit_detail_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.visit_detail cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VISIT_DETAIL_START_DATE is present in the VISIT_DETAIL table as expected based on the specification.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_visit_detail_visit_detail_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_DETAIL_START_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(visit_detail_start_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.visit_detail cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VISIT_DETAIL_START_DATETIME is present in the VISIT_DETAIL table as expected based on the specification.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_START_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_visit_detail_visit_detail_start_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_DETAIL_START_DATETIME
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(visit_detail_start_datetime) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.visit_detail cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VISIT_DETAIL_TYPE_CONCEPT_ID is present in the VISIT_DETAIL table as expected based on the specification.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_visit_detail_visit_detail_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_DETAIL_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(visit_detail_type_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.visit_detail cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VISIT_OCCURRENCE_ID is present in the VISIT_DETAIL table as expected based on the specification.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_visit_detail_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_OCCURRENCE_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(visit_occurrence_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.visit_detail cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if ADMITTED_FROM_CONCEPT_ID is present in the VISIT_OCCURRENCE table as expected based on the specification.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'ADMITTED_FROM_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_visit_occurrence_admitted_from_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = ADMITTED_FROM_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(admitted_from_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.visit_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if ADMITTED_FROM_SOURCE_VALUE is present in the VISIT_OCCURRENCE table as expected based on the specification.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'ADMITTED_FROM_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_visit_occurrence_admitted_from_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = ADMITTED_FROM_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(admitted_from_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.visit_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if CARE_SITE_ID is present in the VISIT_OCCURRENCE table as expected based on the specification.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'CARE_SITE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_visit_occurrence_care_site_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = CARE_SITE_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(care_site_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.visit_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DISCHARGED_TO_CONCEPT_ID is present in the VISIT_OCCURRENCE table as expected based on the specification.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'DISCHARGED_TO_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_visit_occurrence_discharged_to_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = DISCHARGED_TO_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(discharged_to_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.visit_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if DISCHARGED_TO_SOURCE_VALUE is present in the VISIT_OCCURRENCE table as expected based on the specification.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'DISCHARGED_TO_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_visit_occurrence_discharged_to_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = DISCHARGED_TO_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(discharged_to_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.visit_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PERSON_ID is present in the VISIT_OCCURRENCE table as expected based on the specification.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_visit_occurrence_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = PERSON_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(person_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.visit_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PRECEDING_VISIT_OCCURRENCE_ID is present in the VISIT_OCCURRENCE table as expected based on the specification.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'PRECEDING_VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_visit_occurrence_preceding_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = PRECEDING_VISIT_OCCURRENCE_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(preceding_visit_occurrence_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.visit_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if PROVIDER_ID is present in the VISIT_OCCURRENCE table as expected based on the specification.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_visit_occurrence_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = PROVIDER_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(provider_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.visit_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VISIT_CONCEPT_ID is present in the VISIT_OCCURRENCE table as expected based on the specification.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_visit_occurrence_visit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = VISIT_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(visit_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.visit_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VISIT_END_DATE is present in the VISIT_OCCURRENCE table as expected based on the specification.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_visit_occurrence_visit_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = VISIT_END_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(visit_end_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.visit_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VISIT_END_DATETIME is present in the VISIT_OCCURRENCE table as expected based on the specification.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_END_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_visit_occurrence_visit_end_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = VISIT_END_DATETIME
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(visit_end_datetime) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.visit_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VISIT_OCCURRENCE_ID is present in the VISIT_OCCURRENCE table as expected based on the specification.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_visit_occurrence_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = VISIT_OCCURRENCE_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(visit_occurrence_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.visit_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VISIT_SOURCE_CONCEPT_ID is present in the VISIT_OCCURRENCE table as expected based on the specification.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_visit_occurrence_visit_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = VISIT_SOURCE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(visit_source_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.visit_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VISIT_SOURCE_VALUE is present in the VISIT_OCCURRENCE table as expected based on the specification.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_visit_occurrence_visit_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = VISIT_SOURCE_VALUE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(visit_source_value) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.visit_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VISIT_START_DATE is present in the VISIT_OCCURRENCE table as expected based on the specification.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_visit_occurrence_visit_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = VISIT_START_DATE
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(visit_start_date) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.visit_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VISIT_START_DATETIME is present in the VISIT_OCCURRENCE table as expected based on the specification.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_START_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_visit_occurrence_visit_start_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = VISIT_START_DATETIME
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(visit_start_datetime) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.visit_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
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
  ,'cdmField' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if VISIT_TYPE_CONCEPT_ID is present in the VISIT_OCCURRENCE table as expected based on the specification.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_field.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmfield_visit_occurrence_visit_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
CDM_FIELD
Verify the field exists.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = VISIT_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
    case 
        when denominator.num_rows = 0 then 0 else 1.0*num_violated_rows/denominator.num_rows 
    end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from (
    select num_violated_rows from (
        select
            case 
                when count(visit_type_concept_id) = 0 then 0
                else 0
            end as num_violated_rows
        from dataform.visit_occurrence cdmtable
    ) violated_rows
) violated_row_count,
( 
    select 1 as num_rows
) denominator
) cte
)
 SELECT *
from cte_all
;

