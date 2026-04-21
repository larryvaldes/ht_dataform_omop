/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CARE_SITE_ID of the CARE_SITE.' as check_description
  ,'CARE_SITE' as cdm_table_name
  ,'CARE_SITE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_care_site_care_site_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CARE_SITE
cdmFieldName = CARE_SITE_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CARE_SITE.CARE_SITE_ID' as violating_field, 
			cdmtable.* 
		from dataform.care_site cdmtable
		where cdmtable.care_site_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CARE_SITE_NAME of the CARE_SITE.' as check_description
  ,'CARE_SITE' as cdm_table_name
  ,'CARE_SITE_NAME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_care_site_care_site_name' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CARE_SITE
cdmFieldName = CARE_SITE_NAME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CARE_SITE.CARE_SITE_NAME' as violating_field, 
			cdmtable.* 
		from dataform.care_site cdmtable
		where cdmtable.care_site_name is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CARE_SITE_SOURCE_VALUE of the CARE_SITE.' as check_description
  ,'CARE_SITE' as cdm_table_name
  ,'CARE_SITE_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_care_site_care_site_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CARE_SITE
cdmFieldName = CARE_SITE_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CARE_SITE.CARE_SITE_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.care_site cdmtable
		where cdmtable.care_site_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the LOCATION_ID of the CARE_SITE.' as check_description
  ,'CARE_SITE' as cdm_table_name
  ,'LOCATION_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_care_site_location_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CARE_SITE
cdmFieldName = LOCATION_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CARE_SITE.LOCATION_ID' as violating_field, 
			cdmtable.* 
		from dataform.care_site cdmtable
		where cdmtable.location_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PLACE_OF_SERVICE_CONCEPT_ID of the CARE_SITE.' as check_description
  ,'CARE_SITE' as cdm_table_name
  ,'PLACE_OF_SERVICE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_care_site_place_of_service_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CARE_SITE.PLACE_OF_SERVICE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.care_site cdmtable
		where cdmtable.place_of_service_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PLACE_OF_SERVICE_SOURCE_VALUE of the CARE_SITE.' as check_description
  ,'CARE_SITE' as cdm_table_name
  ,'PLACE_OF_SERVICE_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_care_site_place_of_service_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CARE_SITE
cdmFieldName = PLACE_OF_SERVICE_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CARE_SITE.PLACE_OF_SERVICE_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.care_site cdmtable
		where cdmtable.place_of_service_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CDM_ETL_REFERENCE of the CDM_SOURCE.' as check_description
  ,'CDM_SOURCE' as cdm_table_name
  ,'CDM_ETL_REFERENCE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cdm_source_cdm_etl_reference' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CDM_SOURCE
cdmFieldName = CDM_ETL_REFERENCE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CDM_SOURCE.CDM_ETL_REFERENCE' as violating_field, 
			cdmtable.* 
		from dataform.cdm_source cdmtable
		where cdmtable.cdm_etl_reference is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CDM_HOLDER of the CDM_SOURCE.' as check_description
  ,'CDM_SOURCE' as cdm_table_name
  ,'CDM_HOLDER' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cdm_source_cdm_holder' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CDM_SOURCE
cdmFieldName = CDM_HOLDER
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CDM_SOURCE.CDM_HOLDER' as violating_field, 
			cdmtable.* 
		from dataform.cdm_source cdmtable
		where cdmtable.cdm_holder is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CDM_RELEASE_DATE of the CDM_SOURCE.' as check_description
  ,'CDM_SOURCE' as cdm_table_name
  ,'CDM_RELEASE_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cdm_source_cdm_release_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CDM_SOURCE
cdmFieldName = CDM_RELEASE_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CDM_SOURCE.CDM_RELEASE_DATE' as violating_field, 
			cdmtable.* 
		from dataform.cdm_source cdmtable
		where cdmtable.cdm_release_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CDM_SOURCE_ABBREVIATION of the CDM_SOURCE.' as check_description
  ,'CDM_SOURCE' as cdm_table_name
  ,'CDM_SOURCE_ABBREVIATION' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cdm_source_cdm_source_abbreviation' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CDM_SOURCE
cdmFieldName = CDM_SOURCE_ABBREVIATION
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CDM_SOURCE.CDM_SOURCE_ABBREVIATION' as violating_field, 
			cdmtable.* 
		from dataform.cdm_source cdmtable
		where cdmtable.cdm_source_abbreviation is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CDM_SOURCE_NAME of the CDM_SOURCE.' as check_description
  ,'CDM_SOURCE' as cdm_table_name
  ,'CDM_SOURCE_NAME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cdm_source_cdm_source_name' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CDM_SOURCE
cdmFieldName = CDM_SOURCE_NAME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CDM_SOURCE.CDM_SOURCE_NAME' as violating_field, 
			cdmtable.* 
		from dataform.cdm_source cdmtable
		where cdmtable.cdm_source_name is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CDM_VERSION of the CDM_SOURCE.' as check_description
  ,'CDM_SOURCE' as cdm_table_name
  ,'CDM_VERSION' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cdm_source_cdm_version' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CDM_SOURCE
cdmFieldName = CDM_VERSION
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CDM_SOURCE.CDM_VERSION' as violating_field, 
			cdmtable.* 
		from dataform.cdm_source cdmtable
		where cdmtable.cdm_version is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CDM_VERSION_CONCEPT_ID of the CDM_SOURCE.' as check_description
  ,'CDM_SOURCE' as cdm_table_name
  ,'CDM_VERSION_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cdm_source_cdm_version_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CDM_SOURCE
cdmFieldName = CDM_VERSION_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CDM_SOURCE.CDM_VERSION_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.cdm_source cdmtable
		where cdmtable.cdm_version_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the SOURCE_DESCRIPTION of the CDM_SOURCE.' as check_description
  ,'CDM_SOURCE' as cdm_table_name
  ,'SOURCE_DESCRIPTION' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cdm_source_source_description' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CDM_SOURCE
cdmFieldName = SOURCE_DESCRIPTION
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CDM_SOURCE.SOURCE_DESCRIPTION' as violating_field, 
			cdmtable.* 
		from dataform.cdm_source cdmtable
		where cdmtable.source_description is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the SOURCE_DOCUMENTATION_REFERENCE of the CDM_SOURCE.' as check_description
  ,'CDM_SOURCE' as cdm_table_name
  ,'SOURCE_DOCUMENTATION_REFERENCE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cdm_source_source_documentation_reference' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CDM_SOURCE
cdmFieldName = SOURCE_DOCUMENTATION_REFERENCE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CDM_SOURCE.SOURCE_DOCUMENTATION_REFERENCE' as violating_field, 
			cdmtable.* 
		from dataform.cdm_source cdmtable
		where cdmtable.source_documentation_reference is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the SOURCE_RELEASE_DATE of the CDM_SOURCE.' as check_description
  ,'CDM_SOURCE' as cdm_table_name
  ,'SOURCE_RELEASE_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cdm_source_source_release_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CDM_SOURCE
cdmFieldName = SOURCE_RELEASE_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CDM_SOURCE.SOURCE_RELEASE_DATE' as violating_field, 
			cdmtable.* 
		from dataform.cdm_source cdmtable
		where cdmtable.source_release_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VOCABULARY_VERSION of the CDM_SOURCE.' as check_description
  ,'CDM_SOURCE' as cdm_table_name
  ,'VOCABULARY_VERSION' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cdm_source_vocabulary_version' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CDM_SOURCE
cdmFieldName = VOCABULARY_VERSION
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CDM_SOURCE.VOCABULARY_VERSION' as violating_field, 
			cdmtable.* 
		from dataform.cdm_source cdmtable
		where cdmtable.vocabulary_version is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the COHORT_DEFINITION_ID of the COHORT.' as check_description
  ,'COHORT' as cdm_table_name
  ,'COHORT_DEFINITION_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cohort_cohort_definition_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = COHORT
cdmFieldName = COHORT_DEFINITION_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'COHORT.COHORT_DEFINITION_ID' as violating_field, 
			cdmtable.* 
		from dataform.cohort cdmtable
		where cdmtable.cohort_definition_id is null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.cohort cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the COHORT_END_DATE of the COHORT.' as check_description
  ,'COHORT' as cdm_table_name
  ,'COHORT_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cohort_cohort_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = COHORT
cdmFieldName = COHORT_END_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'COHORT.COHORT_END_DATE' as violating_field, 
			cdmtable.* 
		from dataform.cohort cdmtable
		where cdmtable.cohort_end_date is null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.cohort cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the COHORT_START_DATE of the COHORT.' as check_description
  ,'COHORT' as cdm_table_name
  ,'COHORT_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cohort_cohort_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = COHORT
cdmFieldName = COHORT_START_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'COHORT.COHORT_START_DATE' as violating_field, 
			cdmtable.* 
		from dataform.cohort cdmtable
		where cdmtable.cohort_start_date is null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.cohort cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the SUBJECT_ID of the COHORT.' as check_description
  ,'COHORT' as cdm_table_name
  ,'SUBJECT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cohort_subject_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = COHORT
cdmFieldName = SUBJECT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'COHORT.SUBJECT_ID' as violating_field, 
			cdmtable.* 
		from dataform.cohort cdmtable
		where cdmtable.subject_id is null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.cohort cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the COHORT_DEFINITION_DESCRIPTION of the COHORT_DEFINITION.' as check_description
  ,'COHORT_DEFINITION' as cdm_table_name
  ,'COHORT_DEFINITION_DESCRIPTION' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cohort_definition_cohort_definition_description' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = COHORT_DEFINITION
cdmFieldName = COHORT_DEFINITION_DESCRIPTION
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'COHORT_DEFINITION.COHORT_DEFINITION_DESCRIPTION' as violating_field, 
			cdmtable.* 
		from dataform.cohort_definition cdmtable
		where cdmtable.cohort_definition_description is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the COHORT_DEFINITION_ID of the COHORT_DEFINITION.' as check_description
  ,'COHORT_DEFINITION' as cdm_table_name
  ,'COHORT_DEFINITION_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cohort_definition_cohort_definition_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = COHORT_DEFINITION
cdmFieldName = COHORT_DEFINITION_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'COHORT_DEFINITION.COHORT_DEFINITION_ID' as violating_field, 
			cdmtable.* 
		from dataform.cohort_definition cdmtable
		where cdmtable.cohort_definition_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the COHORT_DEFINITION_NAME of the COHORT_DEFINITION.' as check_description
  ,'COHORT_DEFINITION' as cdm_table_name
  ,'COHORT_DEFINITION_NAME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cohort_definition_cohort_definition_name' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = COHORT_DEFINITION
cdmFieldName = COHORT_DEFINITION_NAME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'COHORT_DEFINITION.COHORT_DEFINITION_NAME' as violating_field, 
			cdmtable.* 
		from dataform.cohort_definition cdmtable
		where cdmtable.cohort_definition_name is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the COHORT_DEFINITION_SYNTAX of the COHORT_DEFINITION.' as check_description
  ,'COHORT_DEFINITION' as cdm_table_name
  ,'COHORT_DEFINITION_SYNTAX' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cohort_definition_cohort_definition_syntax' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = COHORT_DEFINITION
cdmFieldName = COHORT_DEFINITION_SYNTAX
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'COHORT_DEFINITION.COHORT_DEFINITION_SYNTAX' as violating_field, 
			cdmtable.* 
		from dataform.cohort_definition cdmtable
		where cdmtable.cohort_definition_syntax is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the COHORT_INITIATION_DATE of the COHORT_DEFINITION.' as check_description
  ,'COHORT_DEFINITION' as cdm_table_name
  ,'COHORT_INITIATION_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cohort_definition_cohort_initiation_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = COHORT_DEFINITION
cdmFieldName = COHORT_INITIATION_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'COHORT_DEFINITION.COHORT_INITIATION_DATE' as violating_field, 
			cdmtable.* 
		from dataform.cohort_definition cdmtable
		where cdmtable.cohort_initiation_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DEFINITION_TYPE_CONCEPT_ID of the COHORT_DEFINITION.' as check_description
  ,'COHORT_DEFINITION' as cdm_table_name
  ,'DEFINITION_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cohort_definition_definition_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = COHORT_DEFINITION
cdmFieldName = DEFINITION_TYPE_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'COHORT_DEFINITION.DEFINITION_TYPE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.cohort_definition cdmtable
		where cdmtable.definition_type_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the SUBJECT_CONCEPT_ID of the COHORT_DEFINITION.' as check_description
  ,'COHORT_DEFINITION' as cdm_table_name
  ,'SUBJECT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cohort_definition_subject_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = COHORT_DEFINITION
cdmFieldName = SUBJECT_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'COHORT_DEFINITION.SUBJECT_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.cohort_definition cdmtable
		where cdmtable.subject_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CONCEPT_ID of the CONCEPT_SYNONYM.' as check_description
  ,'CONCEPT_SYNONYM' as cdm_table_name
  ,'CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_concept_synonym_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONCEPT_SYNONYM
cdmFieldName = CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CONCEPT_SYNONYM.CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.concept_synonym cdmtable
		where cdmtable.concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CONCEPT_SYNONYM_NAME of the CONCEPT_SYNONYM.' as check_description
  ,'CONCEPT_SYNONYM' as cdm_table_name
  ,'CONCEPT_SYNONYM_NAME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_concept_synonym_concept_synonym_name' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONCEPT_SYNONYM
cdmFieldName = CONCEPT_SYNONYM_NAME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CONCEPT_SYNONYM.CONCEPT_SYNONYM_NAME' as violating_field, 
			cdmtable.* 
		from dataform.concept_synonym cdmtable
		where cdmtable.concept_synonym_name is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the LANGUAGE_CONCEPT_ID of the CONCEPT_SYNONYM.' as check_description
  ,'CONCEPT_SYNONYM' as cdm_table_name
  ,'LANGUAGE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_concept_synonym_language_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONCEPT_SYNONYM
cdmFieldName = LANGUAGE_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CONCEPT_SYNONYM.LANGUAGE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.concept_synonym cdmtable
		where cdmtable.language_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CONDITION_CONCEPT_ID of the CONDITION_ERA.' as check_description
  ,'CONDITION_ERA' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_condition_era_condition_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CONDITION_ERA.CONDITION_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.condition_era cdmtable
		where cdmtable.condition_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CONDITION_ERA_END_DATE of the CONDITION_ERA.' as check_description
  ,'CONDITION_ERA' as cdm_table_name
  ,'CONDITION_ERA_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_condition_era_condition_era_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_ERA
cdmFieldName = CONDITION_ERA_END_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CONDITION_ERA.CONDITION_ERA_END_DATE' as violating_field, 
			cdmtable.* 
		from dataform.condition_era cdmtable
		where cdmtable.condition_era_end_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CONDITION_ERA_ID of the CONDITION_ERA.' as check_description
  ,'CONDITION_ERA' as cdm_table_name
  ,'CONDITION_ERA_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_condition_era_condition_era_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_ERA
cdmFieldName = CONDITION_ERA_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CONDITION_ERA.CONDITION_ERA_ID' as violating_field, 
			cdmtable.* 
		from dataform.condition_era cdmtable
		where cdmtable.condition_era_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CONDITION_ERA_START_DATE of the CONDITION_ERA.' as check_description
  ,'CONDITION_ERA' as cdm_table_name
  ,'CONDITION_ERA_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_condition_era_condition_era_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_ERA
cdmFieldName = CONDITION_ERA_START_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CONDITION_ERA.CONDITION_ERA_START_DATE' as violating_field, 
			cdmtable.* 
		from dataform.condition_era cdmtable
		where cdmtable.condition_era_start_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CONDITION_OCCURRENCE_COUNT of the CONDITION_ERA.' as check_description
  ,'CONDITION_ERA' as cdm_table_name
  ,'CONDITION_OCCURRENCE_COUNT' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_condition_era_condition_occurrence_count' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_ERA
cdmFieldName = CONDITION_OCCURRENCE_COUNT
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CONDITION_ERA.CONDITION_OCCURRENCE_COUNT' as violating_field, 
			cdmtable.* 
		from dataform.condition_era cdmtable
		where cdmtable.condition_occurrence_count is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERSON_ID of the CONDITION_ERA.' as check_description
  ,'CONDITION_ERA' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_condition_era_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_ERA
cdmFieldName = PERSON_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CONDITION_ERA.PERSON_ID' as violating_field, 
			cdmtable.* 
		from dataform.condition_era cdmtable
		where cdmtable.person_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CONDITION_CONCEPT_ID of the CONDITION_OCCURRENCE.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_condition_occurrence_condition_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CONDITION_OCCURRENCE.CONDITION_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.condition_occurrence cdmtable
		where cdmtable.condition_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CONDITION_END_DATE of the CONDITION_OCCURRENCE.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_condition_occurrence_condition_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_END_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CONDITION_OCCURRENCE.CONDITION_END_DATE' as violating_field, 
			cdmtable.* 
		from dataform.condition_occurrence cdmtable
		where cdmtable.condition_end_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CONDITION_END_DATETIME of the CONDITION_OCCURRENCE.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_END_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_condition_occurrence_condition_end_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_END_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CONDITION_OCCURRENCE.CONDITION_END_DATETIME' as violating_field, 
			cdmtable.* 
		from dataform.condition_occurrence cdmtable
		where cdmtable.condition_end_datetime is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CONDITION_OCCURRENCE_ID of the CONDITION_OCCURRENCE.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_condition_occurrence_condition_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_OCCURRENCE_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CONDITION_OCCURRENCE.CONDITION_OCCURRENCE_ID' as violating_field, 
			cdmtable.* 
		from dataform.condition_occurrence cdmtable
		where cdmtable.condition_occurrence_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CONDITION_SOURCE_CONCEPT_ID of the CONDITION_OCCURRENCE.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_condition_occurrence_condition_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CONDITION_OCCURRENCE.CONDITION_SOURCE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.condition_occurrence cdmtable
		where cdmtable.condition_source_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CONDITION_SOURCE_VALUE of the CONDITION_OCCURRENCE.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_condition_occurrence_condition_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CONDITION_OCCURRENCE.CONDITION_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.condition_occurrence cdmtable
		where cdmtable.condition_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CONDITION_START_DATE of the CONDITION_OCCURRENCE.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_condition_occurrence_condition_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_START_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CONDITION_OCCURRENCE.CONDITION_START_DATE' as violating_field, 
			cdmtable.* 
		from dataform.condition_occurrence cdmtable
		where cdmtable.condition_start_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CONDITION_START_DATETIME of the CONDITION_OCCURRENCE.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_START_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_condition_occurrence_condition_start_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_START_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CONDITION_OCCURRENCE.CONDITION_START_DATETIME' as violating_field, 
			cdmtable.* 
		from dataform.condition_occurrence cdmtable
		where cdmtable.condition_start_datetime is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CONDITION_STATUS_CONCEPT_ID of the CONDITION_OCCURRENCE.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_STATUS_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_condition_occurrence_condition_status_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CONDITION_OCCURRENCE.CONDITION_STATUS_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.condition_occurrence cdmtable
		where cdmtable.condition_status_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CONDITION_STATUS_SOURCE_VALUE of the CONDITION_OCCURRENCE.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_STATUS_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_condition_occurrence_condition_status_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_STATUS_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CONDITION_OCCURRENCE.CONDITION_STATUS_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.condition_occurrence cdmtable
		where cdmtable.condition_status_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CONDITION_TYPE_CONCEPT_ID of the CONDITION_OCCURRENCE.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_condition_occurrence_condition_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CONDITION_OCCURRENCE.CONDITION_TYPE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.condition_occurrence cdmtable
		where cdmtable.condition_type_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERSON_ID of the CONDITION_OCCURRENCE.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_condition_occurrence_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = PERSON_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CONDITION_OCCURRENCE.PERSON_ID' as violating_field, 
			cdmtable.* 
		from dataform.condition_occurrence cdmtable
		where cdmtable.person_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PROVIDER_ID of the CONDITION_OCCURRENCE.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_condition_occurrence_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = PROVIDER_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CONDITION_OCCURRENCE.PROVIDER_ID' as violating_field, 
			cdmtable.* 
		from dataform.condition_occurrence cdmtable
		where cdmtable.provider_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the STOP_REASON of the CONDITION_OCCURRENCE.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'STOP_REASON' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_condition_occurrence_stop_reason' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = STOP_REASON
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CONDITION_OCCURRENCE.STOP_REASON' as violating_field, 
			cdmtable.* 
		from dataform.condition_occurrence cdmtable
		where cdmtable.stop_reason is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_DETAIL_ID of the CONDITION_OCCURRENCE.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_condition_occurrence_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = VISIT_DETAIL_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CONDITION_OCCURRENCE.VISIT_DETAIL_ID' as violating_field, 
			cdmtable.* 
		from dataform.condition_occurrence cdmtable
		where cdmtable.visit_detail_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_OCCURRENCE_ID of the CONDITION_OCCURRENCE.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_condition_occurrence_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = VISIT_OCCURRENCE_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'CONDITION_OCCURRENCE.VISIT_OCCURRENCE_ID' as violating_field, 
			cdmtable.* 
		from dataform.condition_occurrence cdmtable
		where cdmtable.visit_occurrence_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the AMOUNT_ALLOWED of the COST.' as check_description
  ,'COST' as cdm_table_name
  ,'AMOUNT_ALLOWED' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cost_amount_allowed' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = COST
cdmFieldName = AMOUNT_ALLOWED
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'COST.AMOUNT_ALLOWED' as violating_field, 
			cdmtable.* 
		from dataform.cost cdmtable
		where cdmtable.amount_allowed is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the COST_DOMAIN_ID of the COST.' as check_description
  ,'COST' as cdm_table_name
  ,'COST_DOMAIN_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cost_cost_domain_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = COST
cdmFieldName = COST_DOMAIN_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'COST.COST_DOMAIN_ID' as violating_field, 
			cdmtable.* 
		from dataform.cost cdmtable
		where cdmtable.cost_domain_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the COST_EVENT_ID of the COST.' as check_description
  ,'COST' as cdm_table_name
  ,'COST_EVENT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cost_cost_event_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = COST
cdmFieldName = COST_EVENT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'COST.COST_EVENT_ID' as violating_field, 
			cdmtable.* 
		from dataform.cost cdmtable
		where cdmtable.cost_event_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the COST_ID of the COST.' as check_description
  ,'COST' as cdm_table_name
  ,'COST_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cost_cost_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = COST
cdmFieldName = COST_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'COST.COST_ID' as violating_field, 
			cdmtable.* 
		from dataform.cost cdmtable
		where cdmtable.cost_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the COST_TYPE_CONCEPT_ID of the COST.' as check_description
  ,'COST' as cdm_table_name
  ,'COST_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cost_cost_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'COST.COST_TYPE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.cost cdmtable
		where cdmtable.cost_type_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CURRENCY_CONCEPT_ID of the COST.' as check_description
  ,'COST' as cdm_table_name
  ,'CURRENCY_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cost_currency_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = COST
cdmFieldName = CURRENCY_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'COST.CURRENCY_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.cost cdmtable
		where cdmtable.currency_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DRG_CONCEPT_ID of the COST.' as check_description
  ,'COST' as cdm_table_name
  ,'DRG_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cost_drg_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = COST
cdmFieldName = DRG_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'COST.DRG_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.cost cdmtable
		where cdmtable.drg_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DRG_SOURCE_VALUE of the COST.' as check_description
  ,'COST' as cdm_table_name
  ,'DRG_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cost_drg_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = COST
cdmFieldName = DRG_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'COST.DRG_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.cost cdmtable
		where cdmtable.drg_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PAID_BY_PATIENT of the COST.' as check_description
  ,'COST' as cdm_table_name
  ,'PAID_BY_PATIENT' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cost_paid_by_patient' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = COST
cdmFieldName = PAID_BY_PATIENT
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'COST.PAID_BY_PATIENT' as violating_field, 
			cdmtable.* 
		from dataform.cost cdmtable
		where cdmtable.paid_by_patient is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PAID_BY_PAYER of the COST.' as check_description
  ,'COST' as cdm_table_name
  ,'PAID_BY_PAYER' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cost_paid_by_payer' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = COST
cdmFieldName = PAID_BY_PAYER
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'COST.PAID_BY_PAYER' as violating_field, 
			cdmtable.* 
		from dataform.cost cdmtable
		where cdmtable.paid_by_payer is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PAID_BY_PRIMARY of the COST.' as check_description
  ,'COST' as cdm_table_name
  ,'PAID_BY_PRIMARY' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cost_paid_by_primary' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = COST
cdmFieldName = PAID_BY_PRIMARY
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'COST.PAID_BY_PRIMARY' as violating_field, 
			cdmtable.* 
		from dataform.cost cdmtable
		where cdmtable.paid_by_primary is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PAID_DISPENSING_FEE of the COST.' as check_description
  ,'COST' as cdm_table_name
  ,'PAID_DISPENSING_FEE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cost_paid_dispensing_fee' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = COST
cdmFieldName = PAID_DISPENSING_FEE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'COST.PAID_DISPENSING_FEE' as violating_field, 
			cdmtable.* 
		from dataform.cost cdmtable
		where cdmtable.paid_dispensing_fee is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PAID_INGREDIENT_COST of the COST.' as check_description
  ,'COST' as cdm_table_name
  ,'PAID_INGREDIENT_COST' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cost_paid_ingredient_cost' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = COST
cdmFieldName = PAID_INGREDIENT_COST
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'COST.PAID_INGREDIENT_COST' as violating_field, 
			cdmtable.* 
		from dataform.cost cdmtable
		where cdmtable.paid_ingredient_cost is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PAID_PATIENT_COINSURANCE of the COST.' as check_description
  ,'COST' as cdm_table_name
  ,'PAID_PATIENT_COINSURANCE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cost_paid_patient_coinsurance' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = COST
cdmFieldName = PAID_PATIENT_COINSURANCE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'COST.PAID_PATIENT_COINSURANCE' as violating_field, 
			cdmtable.* 
		from dataform.cost cdmtable
		where cdmtable.paid_patient_coinsurance is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PAID_PATIENT_COPAY of the COST.' as check_description
  ,'COST' as cdm_table_name
  ,'PAID_PATIENT_COPAY' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cost_paid_patient_copay' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = COST
cdmFieldName = PAID_PATIENT_COPAY
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'COST.PAID_PATIENT_COPAY' as violating_field, 
			cdmtable.* 
		from dataform.cost cdmtable
		where cdmtable.paid_patient_copay is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PAID_PATIENT_DEDUCTIBLE of the COST.' as check_description
  ,'COST' as cdm_table_name
  ,'PAID_PATIENT_DEDUCTIBLE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cost_paid_patient_deductible' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = COST
cdmFieldName = PAID_PATIENT_DEDUCTIBLE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'COST.PAID_PATIENT_DEDUCTIBLE' as violating_field, 
			cdmtable.* 
		from dataform.cost cdmtable
		where cdmtable.paid_patient_deductible is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PAYER_PLAN_PERIOD_ID of the COST.' as check_description
  ,'COST' as cdm_table_name
  ,'PAYER_PLAN_PERIOD_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cost_payer_plan_period_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = COST
cdmFieldName = PAYER_PLAN_PERIOD_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'COST.PAYER_PLAN_PERIOD_ID' as violating_field, 
			cdmtable.* 
		from dataform.cost cdmtable
		where cdmtable.payer_plan_period_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the REVENUE_CODE_CONCEPT_ID of the COST.' as check_description
  ,'COST' as cdm_table_name
  ,'REVENUE_CODE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cost_revenue_code_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = COST
cdmFieldName = REVENUE_CODE_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'COST.REVENUE_CODE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.cost cdmtable
		where cdmtable.revenue_code_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the REVENUE_CODE_SOURCE_VALUE of the COST.' as check_description
  ,'COST' as cdm_table_name
  ,'REVENUE_CODE_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cost_revenue_code_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = COST
cdmFieldName = REVENUE_CODE_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'COST.REVENUE_CODE_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.cost cdmtable
		where cdmtable.revenue_code_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the TOTAL_CHARGE of the COST.' as check_description
  ,'COST' as cdm_table_name
  ,'TOTAL_CHARGE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cost_total_charge' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = COST
cdmFieldName = TOTAL_CHARGE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'COST.TOTAL_CHARGE' as violating_field, 
			cdmtable.* 
		from dataform.cost cdmtable
		where cdmtable.total_charge is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the TOTAL_COST of the COST.' as check_description
  ,'COST' as cdm_table_name
  ,'TOTAL_COST' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cost_total_cost' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = COST
cdmFieldName = TOTAL_COST
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'COST.TOTAL_COST' as violating_field, 
			cdmtable.* 
		from dataform.cost cdmtable
		where cdmtable.total_cost is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the TOTAL_PAID of the COST.' as check_description
  ,'COST' as cdm_table_name
  ,'TOTAL_PAID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_cost_total_paid' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = COST
cdmFieldName = TOTAL_PAID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'COST.TOTAL_PAID' as violating_field, 
			cdmtable.* 
		from dataform.cost cdmtable
		where cdmtable.total_paid is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CAUSE_CONCEPT_ID of the DEATH.' as check_description
  ,'DEATH' as cdm_table_name
  ,'CAUSE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_death_cause_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DEATH.CAUSE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.death cdmtable
		where cdmtable.cause_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CAUSE_SOURCE_CONCEPT_ID of the DEATH.' as check_description
  ,'DEATH' as cdm_table_name
  ,'CAUSE_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_death_cause_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DEATH.CAUSE_SOURCE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.death cdmtable
		where cdmtable.cause_source_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CAUSE_SOURCE_VALUE of the DEATH.' as check_description
  ,'DEATH' as cdm_table_name
  ,'CAUSE_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_death_cause_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DEATH
cdmFieldName = CAUSE_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DEATH.CAUSE_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.death cdmtable
		where cdmtable.cause_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DEATH_DATE of the DEATH.' as check_description
  ,'DEATH' as cdm_table_name
  ,'DEATH_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_death_death_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DEATH
cdmFieldName = DEATH_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DEATH.DEATH_DATE' as violating_field, 
			cdmtable.* 
		from dataform.death cdmtable
		where cdmtable.death_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DEATH_DATETIME of the DEATH.' as check_description
  ,'DEATH' as cdm_table_name
  ,'DEATH_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_death_death_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DEATH
cdmFieldName = DEATH_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DEATH.DEATH_DATETIME' as violating_field, 
			cdmtable.* 
		from dataform.death cdmtable
		where cdmtable.death_datetime is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DEATH_TYPE_CONCEPT_ID of the DEATH.' as check_description
  ,'DEATH' as cdm_table_name
  ,'DEATH_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_death_death_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DEATH.DEATH_TYPE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.death cdmtable
		where cdmtable.death_type_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERSON_ID of the DEATH.' as check_description
  ,'DEATH' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_death_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DEATH
cdmFieldName = PERSON_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DEATH.PERSON_ID' as violating_field, 
			cdmtable.* 
		from dataform.death cdmtable
		where cdmtable.person_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DEVICE_CONCEPT_ID of the DEVICE_EXPOSURE.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_device_exposure_device_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DEVICE_EXPOSURE.DEVICE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.device_exposure cdmtable
		where cdmtable.device_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DEVICE_EXPOSURE_END_DATE of the DEVICE_EXPOSURE.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_EXPOSURE_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_device_exposure_device_exposure_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = DEVICE_EXPOSURE_END_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DEVICE_EXPOSURE.DEVICE_EXPOSURE_END_DATE' as violating_field, 
			cdmtable.* 
		from dataform.device_exposure cdmtable
		where cdmtable.device_exposure_end_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DEVICE_EXPOSURE_END_DATETIME of the DEVICE_EXPOSURE.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_EXPOSURE_END_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_device_exposure_device_exposure_end_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = DEVICE_EXPOSURE_END_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DEVICE_EXPOSURE.DEVICE_EXPOSURE_END_DATETIME' as violating_field, 
			cdmtable.* 
		from dataform.device_exposure cdmtable
		where cdmtable.device_exposure_end_datetime is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DEVICE_EXPOSURE_ID of the DEVICE_EXPOSURE.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_EXPOSURE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_device_exposure_device_exposure_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = DEVICE_EXPOSURE_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DEVICE_EXPOSURE.DEVICE_EXPOSURE_ID' as violating_field, 
			cdmtable.* 
		from dataform.device_exposure cdmtable
		where cdmtable.device_exposure_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DEVICE_EXPOSURE_START_DATE of the DEVICE_EXPOSURE.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_EXPOSURE_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_device_exposure_device_exposure_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = DEVICE_EXPOSURE_START_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DEVICE_EXPOSURE.DEVICE_EXPOSURE_START_DATE' as violating_field, 
			cdmtable.* 
		from dataform.device_exposure cdmtable
		where cdmtable.device_exposure_start_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DEVICE_EXPOSURE_START_DATETIME of the DEVICE_EXPOSURE.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_EXPOSURE_START_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_device_exposure_device_exposure_start_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = DEVICE_EXPOSURE_START_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DEVICE_EXPOSURE.DEVICE_EXPOSURE_START_DATETIME' as violating_field, 
			cdmtable.* 
		from dataform.device_exposure cdmtable
		where cdmtable.device_exposure_start_datetime is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DEVICE_SOURCE_CONCEPT_ID of the DEVICE_EXPOSURE.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_device_exposure_device_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DEVICE_EXPOSURE.DEVICE_SOURCE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.device_exposure cdmtable
		where cdmtable.device_source_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DEVICE_SOURCE_VALUE of the DEVICE_EXPOSURE.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_device_exposure_device_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = DEVICE_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DEVICE_EXPOSURE.DEVICE_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.device_exposure cdmtable
		where cdmtable.device_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DEVICE_TYPE_CONCEPT_ID of the DEVICE_EXPOSURE.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_device_exposure_device_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DEVICE_EXPOSURE.DEVICE_TYPE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.device_exposure cdmtable
		where cdmtable.device_type_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERSON_ID of the DEVICE_EXPOSURE.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_device_exposure_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = PERSON_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DEVICE_EXPOSURE.PERSON_ID' as violating_field, 
			cdmtable.* 
		from dataform.device_exposure cdmtable
		where cdmtable.person_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PRODUCTION_ID of the DEVICE_EXPOSURE.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'PRODUCTION_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_device_exposure_production_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = PRODUCTION_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DEVICE_EXPOSURE.PRODUCTION_ID' as violating_field, 
			cdmtable.* 
		from dataform.device_exposure cdmtable
		where cdmtable.production_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PROVIDER_ID of the DEVICE_EXPOSURE.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_device_exposure_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = PROVIDER_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DEVICE_EXPOSURE.PROVIDER_ID' as violating_field, 
			cdmtable.* 
		from dataform.device_exposure cdmtable
		where cdmtable.provider_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the QUANTITY of the DEVICE_EXPOSURE.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'QUANTITY' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_device_exposure_quantity' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = QUANTITY
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DEVICE_EXPOSURE.QUANTITY' as violating_field, 
			cdmtable.* 
		from dataform.device_exposure cdmtable
		where cdmtable.quantity is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the UNIQUE_DEVICE_ID of the DEVICE_EXPOSURE.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'UNIQUE_DEVICE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_device_exposure_unique_device_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = UNIQUE_DEVICE_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DEVICE_EXPOSURE.UNIQUE_DEVICE_ID' as violating_field, 
			cdmtable.* 
		from dataform.device_exposure cdmtable
		where cdmtable.unique_device_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the UNIT_CONCEPT_ID of the DEVICE_EXPOSURE.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_device_exposure_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DEVICE_EXPOSURE.UNIT_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.device_exposure cdmtable
		where cdmtable.unit_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the UNIT_SOURCE_CONCEPT_ID of the DEVICE_EXPOSURE.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'UNIT_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_device_exposure_unit_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DEVICE_EXPOSURE.UNIT_SOURCE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.device_exposure cdmtable
		where cdmtable.unit_source_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the UNIT_SOURCE_VALUE of the DEVICE_EXPOSURE.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'UNIT_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_device_exposure_unit_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = UNIT_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DEVICE_EXPOSURE.UNIT_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.device_exposure cdmtable
		where cdmtable.unit_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_DETAIL_ID of the DEVICE_EXPOSURE.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_device_exposure_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = VISIT_DETAIL_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DEVICE_EXPOSURE.VISIT_DETAIL_ID' as violating_field, 
			cdmtable.* 
		from dataform.device_exposure cdmtable
		where cdmtable.visit_detail_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_OCCURRENCE_ID of the DEVICE_EXPOSURE.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_device_exposure_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = VISIT_OCCURRENCE_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DEVICE_EXPOSURE.VISIT_OCCURRENCE_ID' as violating_field, 
			cdmtable.* 
		from dataform.device_exposure cdmtable
		where cdmtable.visit_occurrence_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DOMAIN_CONCEPT_ID of the DOMAIN.' as check_description
  ,'DOMAIN' as cdm_table_name
  ,'DOMAIN_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_domain_domain_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DOMAIN
cdmFieldName = DOMAIN_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DOMAIN.DOMAIN_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.domain cdmtable
		where cdmtable.domain_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DOMAIN_ID of the DOMAIN.' as check_description
  ,'DOMAIN' as cdm_table_name
  ,'DOMAIN_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_domain_domain_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DOMAIN
cdmFieldName = DOMAIN_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DOMAIN.DOMAIN_ID' as violating_field, 
			cdmtable.* 
		from dataform.domain cdmtable
		where cdmtable.domain_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DOMAIN_NAME of the DOMAIN.' as check_description
  ,'DOMAIN' as cdm_table_name
  ,'DOMAIN_NAME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_domain_domain_name' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DOMAIN
cdmFieldName = DOMAIN_NAME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DOMAIN.DOMAIN_NAME' as violating_field, 
			cdmtable.* 
		from dataform.domain cdmtable
		where cdmtable.domain_name is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DOSE_ERA_END_DATE of the DOSE_ERA.' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'DOSE_ERA_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_dose_era_dose_era_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DOSE_ERA
cdmFieldName = DOSE_ERA_END_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DOSE_ERA.DOSE_ERA_END_DATE' as violating_field, 
			cdmtable.* 
		from dataform.dose_era cdmtable
		where cdmtable.dose_era_end_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DOSE_ERA_ID of the DOSE_ERA.' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'DOSE_ERA_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_dose_era_dose_era_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DOSE_ERA
cdmFieldName = DOSE_ERA_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DOSE_ERA.DOSE_ERA_ID' as violating_field, 
			cdmtable.* 
		from dataform.dose_era cdmtable
		where cdmtable.dose_era_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DOSE_ERA_START_DATE of the DOSE_ERA.' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'DOSE_ERA_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_dose_era_dose_era_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DOSE_ERA
cdmFieldName = DOSE_ERA_START_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DOSE_ERA.DOSE_ERA_START_DATE' as violating_field, 
			cdmtable.* 
		from dataform.dose_era cdmtable
		where cdmtable.dose_era_start_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DOSE_VALUE of the DOSE_ERA.' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'DOSE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_dose_era_dose_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DOSE_ERA
cdmFieldName = DOSE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DOSE_ERA.DOSE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.dose_era cdmtable
		where cdmtable.dose_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DRUG_CONCEPT_ID of the DOSE_ERA.' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'DRUG_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_dose_era_drug_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DOSE_ERA.DRUG_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.dose_era cdmtable
		where cdmtable.drug_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERSON_ID of the DOSE_ERA.' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_dose_era_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DOSE_ERA
cdmFieldName = PERSON_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DOSE_ERA.PERSON_ID' as violating_field, 
			cdmtable.* 
		from dataform.dose_era cdmtable
		where cdmtable.person_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the UNIT_CONCEPT_ID of the DOSE_ERA.' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_dose_era_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DOSE_ERA.UNIT_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.dose_era cdmtable
		where cdmtable.unit_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DRUG_CONCEPT_ID of the DRUG_ERA.' as check_description
  ,'DRUG_ERA' as cdm_table_name
  ,'DRUG_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_era_drug_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_ERA.DRUG_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.drug_era cdmtable
		where cdmtable.drug_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DRUG_ERA_END_DATE of the DRUG_ERA.' as check_description
  ,'DRUG_ERA' as cdm_table_name
  ,'DRUG_ERA_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_era_drug_era_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_ERA
cdmFieldName = DRUG_ERA_END_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_ERA.DRUG_ERA_END_DATE' as violating_field, 
			cdmtable.* 
		from dataform.drug_era cdmtable
		where cdmtable.drug_era_end_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DRUG_ERA_ID of the DRUG_ERA.' as check_description
  ,'DRUG_ERA' as cdm_table_name
  ,'DRUG_ERA_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_era_drug_era_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_ERA
cdmFieldName = DRUG_ERA_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_ERA.DRUG_ERA_ID' as violating_field, 
			cdmtable.* 
		from dataform.drug_era cdmtable
		where cdmtable.drug_era_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DRUG_ERA_START_DATE of the DRUG_ERA.' as check_description
  ,'DRUG_ERA' as cdm_table_name
  ,'DRUG_ERA_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_era_drug_era_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_ERA
cdmFieldName = DRUG_ERA_START_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_ERA.DRUG_ERA_START_DATE' as violating_field, 
			cdmtable.* 
		from dataform.drug_era cdmtable
		where cdmtable.drug_era_start_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DRUG_EXPOSURE_COUNT of the DRUG_ERA.' as check_description
  ,'DRUG_ERA' as cdm_table_name
  ,'DRUG_EXPOSURE_COUNT' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_era_drug_exposure_count' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_ERA
cdmFieldName = DRUG_EXPOSURE_COUNT
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_ERA.DRUG_EXPOSURE_COUNT' as violating_field, 
			cdmtable.* 
		from dataform.drug_era cdmtable
		where cdmtable.drug_exposure_count is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the GAP_DAYS of the DRUG_ERA.' as check_description
  ,'DRUG_ERA' as cdm_table_name
  ,'GAP_DAYS' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_era_gap_days' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_ERA
cdmFieldName = GAP_DAYS
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_ERA.GAP_DAYS' as violating_field, 
			cdmtable.* 
		from dataform.drug_era cdmtable
		where cdmtable.gap_days is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERSON_ID of the DRUG_ERA.' as check_description
  ,'DRUG_ERA' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_era_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_ERA
cdmFieldName = PERSON_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_ERA.PERSON_ID' as violating_field, 
			cdmtable.* 
		from dataform.drug_era cdmtable
		where cdmtable.person_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DAYS_SUPPLY of the DRUG_EXPOSURE.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DAYS_SUPPLY' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_exposure_days_supply' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DAYS_SUPPLY
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_EXPOSURE.DAYS_SUPPLY' as violating_field, 
			cdmtable.* 
		from dataform.drug_exposure cdmtable
		where cdmtable.days_supply is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DOSE_UNIT_SOURCE_VALUE of the DRUG_EXPOSURE.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DOSE_UNIT_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_exposure_dose_unit_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DOSE_UNIT_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_EXPOSURE.DOSE_UNIT_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.drug_exposure cdmtable
		where cdmtable.dose_unit_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DRUG_CONCEPT_ID of the DRUG_EXPOSURE.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_exposure_drug_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_EXPOSURE.DRUG_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.drug_exposure cdmtable
		where cdmtable.drug_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DRUG_EXPOSURE_END_DATE of the DRUG_EXPOSURE.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_EXPOSURE_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_exposure_drug_exposure_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DRUG_EXPOSURE_END_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_EXPOSURE.DRUG_EXPOSURE_END_DATE' as violating_field, 
			cdmtable.* 
		from dataform.drug_exposure cdmtable
		where cdmtable.drug_exposure_end_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DRUG_EXPOSURE_END_DATETIME of the DRUG_EXPOSURE.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_EXPOSURE_END_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_exposure_drug_exposure_end_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DRUG_EXPOSURE_END_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_EXPOSURE.DRUG_EXPOSURE_END_DATETIME' as violating_field, 
			cdmtable.* 
		from dataform.drug_exposure cdmtable
		where cdmtable.drug_exposure_end_datetime is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DRUG_EXPOSURE_ID of the DRUG_EXPOSURE.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_EXPOSURE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_exposure_drug_exposure_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DRUG_EXPOSURE_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_EXPOSURE.DRUG_EXPOSURE_ID' as violating_field, 
			cdmtable.* 
		from dataform.drug_exposure cdmtable
		where cdmtable.drug_exposure_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DRUG_EXPOSURE_START_DATE of the DRUG_EXPOSURE.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_EXPOSURE_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_exposure_drug_exposure_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DRUG_EXPOSURE_START_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_EXPOSURE.DRUG_EXPOSURE_START_DATE' as violating_field, 
			cdmtable.* 
		from dataform.drug_exposure cdmtable
		where cdmtable.drug_exposure_start_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DRUG_EXPOSURE_START_DATETIME of the DRUG_EXPOSURE.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_EXPOSURE_START_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_exposure_drug_exposure_start_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DRUG_EXPOSURE_START_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_EXPOSURE.DRUG_EXPOSURE_START_DATETIME' as violating_field, 
			cdmtable.* 
		from dataform.drug_exposure cdmtable
		where cdmtable.drug_exposure_start_datetime is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DRUG_SOURCE_CONCEPT_ID of the DRUG_EXPOSURE.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_exposure_drug_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_EXPOSURE.DRUG_SOURCE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.drug_exposure cdmtable
		where cdmtable.drug_source_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DRUG_SOURCE_VALUE of the DRUG_EXPOSURE.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_exposure_drug_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DRUG_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_EXPOSURE.DRUG_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.drug_exposure cdmtable
		where cdmtable.drug_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DRUG_TYPE_CONCEPT_ID of the DRUG_EXPOSURE.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_exposure_drug_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_EXPOSURE.DRUG_TYPE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.drug_exposure cdmtable
		where cdmtable.drug_type_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the LOT_NUMBER of the DRUG_EXPOSURE.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'LOT_NUMBER' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_exposure_lot_number' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = LOT_NUMBER
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_EXPOSURE.LOT_NUMBER' as violating_field, 
			cdmtable.* 
		from dataform.drug_exposure cdmtable
		where cdmtable.lot_number is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERSON_ID of the DRUG_EXPOSURE.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_exposure_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = PERSON_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_EXPOSURE.PERSON_ID' as violating_field, 
			cdmtable.* 
		from dataform.drug_exposure cdmtable
		where cdmtable.person_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PROVIDER_ID of the DRUG_EXPOSURE.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_exposure_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = PROVIDER_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_EXPOSURE.PROVIDER_ID' as violating_field, 
			cdmtable.* 
		from dataform.drug_exposure cdmtable
		where cdmtable.provider_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the QUANTITY of the DRUG_EXPOSURE.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'QUANTITY' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_exposure_quantity' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = QUANTITY
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_EXPOSURE.QUANTITY' as violating_field, 
			cdmtable.* 
		from dataform.drug_exposure cdmtable
		where cdmtable.quantity is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the REFILLS of the DRUG_EXPOSURE.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'REFILLS' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_exposure_refills' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = REFILLS
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_EXPOSURE.REFILLS' as violating_field, 
			cdmtable.* 
		from dataform.drug_exposure cdmtable
		where cdmtable.refills is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the ROUTE_CONCEPT_ID of the DRUG_EXPOSURE.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'ROUTE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_exposure_route_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_EXPOSURE.ROUTE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.drug_exposure cdmtable
		where cdmtable.route_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the ROUTE_SOURCE_VALUE of the DRUG_EXPOSURE.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'ROUTE_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_exposure_route_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = ROUTE_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_EXPOSURE.ROUTE_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.drug_exposure cdmtable
		where cdmtable.route_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the SIG of the DRUG_EXPOSURE.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'SIG' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_exposure_sig' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = SIG
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_EXPOSURE.SIG' as violating_field, 
			cdmtable.* 
		from dataform.drug_exposure cdmtable
		where cdmtable.sig is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the STOP_REASON of the DRUG_EXPOSURE.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'STOP_REASON' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_exposure_stop_reason' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = STOP_REASON
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_EXPOSURE.STOP_REASON' as violating_field, 
			cdmtable.* 
		from dataform.drug_exposure cdmtable
		where cdmtable.stop_reason is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VERBATIM_END_DATE of the DRUG_EXPOSURE.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'VERBATIM_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_exposure_verbatim_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = VERBATIM_END_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_EXPOSURE.VERBATIM_END_DATE' as violating_field, 
			cdmtable.* 
		from dataform.drug_exposure cdmtable
		where cdmtable.verbatim_end_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_DETAIL_ID of the DRUG_EXPOSURE.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_exposure_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = VISIT_DETAIL_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_EXPOSURE.VISIT_DETAIL_ID' as violating_field, 
			cdmtable.* 
		from dataform.drug_exposure cdmtable
		where cdmtable.visit_detail_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_OCCURRENCE_ID of the DRUG_EXPOSURE.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_exposure_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = VISIT_OCCURRENCE_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_EXPOSURE.VISIT_OCCURRENCE_ID' as violating_field, 
			cdmtable.* 
		from dataform.drug_exposure cdmtable
		where cdmtable.visit_occurrence_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the AMOUNT_UNIT_CONCEPT_ID of the DRUG_STRENGTH.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'AMOUNT_UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_strength_amount_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_STRENGTH
cdmFieldName = AMOUNT_UNIT_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_STRENGTH.AMOUNT_UNIT_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.drug_strength cdmtable
		where cdmtable.amount_unit_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the AMOUNT_VALUE of the DRUG_STRENGTH.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'AMOUNT_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_strength_amount_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_STRENGTH
cdmFieldName = AMOUNT_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_STRENGTH.AMOUNT_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.drug_strength cdmtable
		where cdmtable.amount_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the BOX_SIZE of the DRUG_STRENGTH.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'BOX_SIZE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_strength_box_size' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_STRENGTH
cdmFieldName = BOX_SIZE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_STRENGTH.BOX_SIZE' as violating_field, 
			cdmtable.* 
		from dataform.drug_strength cdmtable
		where cdmtable.box_size is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DENOMINATOR_UNIT_CONCEPT_ID of the DRUG_STRENGTH.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'DENOMINATOR_UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_strength_denominator_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_STRENGTH
cdmFieldName = DENOMINATOR_UNIT_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_STRENGTH.DENOMINATOR_UNIT_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.drug_strength cdmtable
		where cdmtable.denominator_unit_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DENOMINATOR_VALUE of the DRUG_STRENGTH.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'DENOMINATOR_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_strength_denominator_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_STRENGTH
cdmFieldName = DENOMINATOR_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_STRENGTH.DENOMINATOR_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.drug_strength cdmtable
		where cdmtable.denominator_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DRUG_CONCEPT_ID of the DRUG_STRENGTH.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'DRUG_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_strength_drug_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_STRENGTH
cdmFieldName = DRUG_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_STRENGTH.DRUG_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.drug_strength cdmtable
		where cdmtable.drug_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the INGREDIENT_CONCEPT_ID of the DRUG_STRENGTH.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'INGREDIENT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_strength_ingredient_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_STRENGTH
cdmFieldName = INGREDIENT_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_STRENGTH.INGREDIENT_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.drug_strength cdmtable
		where cdmtable.ingredient_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the INVALID_REASON of the DRUG_STRENGTH.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'INVALID_REASON' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_strength_invalid_reason' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_STRENGTH
cdmFieldName = INVALID_REASON
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_STRENGTH.INVALID_REASON' as violating_field, 
			cdmtable.* 
		from dataform.drug_strength cdmtable
		where cdmtable.invalid_reason is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the NUMERATOR_UNIT_CONCEPT_ID of the DRUG_STRENGTH.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'NUMERATOR_UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_strength_numerator_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_STRENGTH
cdmFieldName = NUMERATOR_UNIT_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_STRENGTH.NUMERATOR_UNIT_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.drug_strength cdmtable
		where cdmtable.numerator_unit_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the NUMERATOR_VALUE of the DRUG_STRENGTH.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'NUMERATOR_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_strength_numerator_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_STRENGTH
cdmFieldName = NUMERATOR_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_STRENGTH.NUMERATOR_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.drug_strength cdmtable
		where cdmtable.numerator_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VALID_END_DATE of the DRUG_STRENGTH.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'VALID_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_strength_valid_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_STRENGTH
cdmFieldName = VALID_END_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_STRENGTH.VALID_END_DATE' as violating_field, 
			cdmtable.* 
		from dataform.drug_strength cdmtable
		where cdmtable.valid_end_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VALID_START_DATE of the DRUG_STRENGTH.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'VALID_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_drug_strength_valid_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_STRENGTH
cdmFieldName = VALID_START_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'DRUG_STRENGTH.VALID_START_DATE' as violating_field, 
			cdmtable.* 
		from dataform.drug_strength cdmtable
		where cdmtable.valid_start_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the EPISODE_CONCEPT_ID of the EPISODE.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_episode_episode_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'EPISODE.EPISODE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.episode cdmtable
		where cdmtable.episode_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the EPISODE_END_DATE of the EPISODE.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_episode_episode_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_END_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'EPISODE.EPISODE_END_DATE' as violating_field, 
			cdmtable.* 
		from dataform.episode cdmtable
		where cdmtable.episode_end_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the EPISODE_END_DATETIME of the EPISODE.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_END_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_episode_episode_end_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_END_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'EPISODE.EPISODE_END_DATETIME' as violating_field, 
			cdmtable.* 
		from dataform.episode cdmtable
		where cdmtable.episode_end_datetime is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the EPISODE_ID of the EPISODE.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_episode_episode_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'EPISODE.EPISODE_ID' as violating_field, 
			cdmtable.* 
		from dataform.episode cdmtable
		where cdmtable.episode_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the EPISODE_NUMBER of the EPISODE.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_NUMBER' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_episode_episode_number' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_NUMBER
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'EPISODE.EPISODE_NUMBER' as violating_field, 
			cdmtable.* 
		from dataform.episode cdmtable
		where cdmtable.episode_number is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the EPISODE_OBJECT_CONCEPT_ID of the EPISODE.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_OBJECT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_episode_episode_object_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_OBJECT_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'EPISODE.EPISODE_OBJECT_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.episode cdmtable
		where cdmtable.episode_object_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the EPISODE_PARENT_ID of the EPISODE.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_PARENT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_episode_episode_parent_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_PARENT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'EPISODE.EPISODE_PARENT_ID' as violating_field, 
			cdmtable.* 
		from dataform.episode cdmtable
		where cdmtable.episode_parent_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the EPISODE_SOURCE_CONCEPT_ID of the EPISODE.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_episode_episode_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'EPISODE.EPISODE_SOURCE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.episode cdmtable
		where cdmtable.episode_source_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the EPISODE_SOURCE_VALUE of the EPISODE.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_episode_episode_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'EPISODE.EPISODE_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.episode cdmtable
		where cdmtable.episode_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the EPISODE_START_DATE of the EPISODE.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_episode_episode_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_START_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'EPISODE.EPISODE_START_DATE' as violating_field, 
			cdmtable.* 
		from dataform.episode cdmtable
		where cdmtable.episode_start_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the EPISODE_START_DATETIME of the EPISODE.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_START_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_episode_episode_start_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_START_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'EPISODE.EPISODE_START_DATETIME' as violating_field, 
			cdmtable.* 
		from dataform.episode cdmtable
		where cdmtable.episode_start_datetime is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the EPISODE_TYPE_CONCEPT_ID of the EPISODE.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_episode_episode_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_TYPE_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'EPISODE.EPISODE_TYPE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.episode cdmtable
		where cdmtable.episode_type_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERSON_ID of the EPISODE.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_episode_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = EPISODE
cdmFieldName = PERSON_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'EPISODE.PERSON_ID' as violating_field, 
			cdmtable.* 
		from dataform.episode cdmtable
		where cdmtable.person_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the EPISODE_EVENT_FIELD_CONCEPT_ID of the EPISODE_EVENT.' as check_description
  ,'EPISODE_EVENT' as cdm_table_name
  ,'EPISODE_EVENT_FIELD_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_episode_event_episode_event_field_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = EPISODE_EVENT
cdmFieldName = EPISODE_EVENT_FIELD_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'EPISODE_EVENT.EPISODE_EVENT_FIELD_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.episode_event cdmtable
		where cdmtable.episode_event_field_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the EPISODE_ID of the EPISODE_EVENT.' as check_description
  ,'EPISODE_EVENT' as cdm_table_name
  ,'EPISODE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_episode_event_episode_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = EPISODE_EVENT
cdmFieldName = EPISODE_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'EPISODE_EVENT.EPISODE_ID' as violating_field, 
			cdmtable.* 
		from dataform.episode_event cdmtable
		where cdmtable.episode_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the EVENT_ID of the EPISODE_EVENT.' as check_description
  ,'EPISODE_EVENT' as cdm_table_name
  ,'EVENT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_episode_event_event_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = EPISODE_EVENT
cdmFieldName = EVENT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'EPISODE_EVENT.EVENT_ID' as violating_field, 
			cdmtable.* 
		from dataform.episode_event cdmtable
		where cdmtable.event_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DOMAIN_CONCEPT_ID_1 of the FACT_RELATIONSHIP.' as check_description
  ,'FACT_RELATIONSHIP' as cdm_table_name
  ,'DOMAIN_CONCEPT_ID_1' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_fact_relationship_domain_concept_id_1' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'FACT_RELATIONSHIP.DOMAIN_CONCEPT_ID_1' as violating_field, 
			cdmtable.* 
		from dataform.fact_relationship cdmtable
		where cdmtable.domain_concept_id_1 is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DOMAIN_CONCEPT_ID_2 of the FACT_RELATIONSHIP.' as check_description
  ,'FACT_RELATIONSHIP' as cdm_table_name
  ,'DOMAIN_CONCEPT_ID_2' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_fact_relationship_domain_concept_id_2' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'FACT_RELATIONSHIP.DOMAIN_CONCEPT_ID_2' as violating_field, 
			cdmtable.* 
		from dataform.fact_relationship cdmtable
		where cdmtable.domain_concept_id_2 is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the FACT_ID_1 of the FACT_RELATIONSHIP.' as check_description
  ,'FACT_RELATIONSHIP' as cdm_table_name
  ,'FACT_ID_1' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_fact_relationship_fact_id_1' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = FACT_RELATIONSHIP
cdmFieldName = FACT_ID_1
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'FACT_RELATIONSHIP.FACT_ID_1' as violating_field, 
			cdmtable.* 
		from dataform.fact_relationship cdmtable
		where cdmtable.fact_id_1 is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the FACT_ID_2 of the FACT_RELATIONSHIP.' as check_description
  ,'FACT_RELATIONSHIP' as cdm_table_name
  ,'FACT_ID_2' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_fact_relationship_fact_id_2' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = FACT_RELATIONSHIP
cdmFieldName = FACT_ID_2
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'FACT_RELATIONSHIP.FACT_ID_2' as violating_field, 
			cdmtable.* 
		from dataform.fact_relationship cdmtable
		where cdmtable.fact_id_2 is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the RELATIONSHIP_CONCEPT_ID of the FACT_RELATIONSHIP.' as check_description
  ,'FACT_RELATIONSHIP' as cdm_table_name
  ,'RELATIONSHIP_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_fact_relationship_relationship_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'FACT_RELATIONSHIP.RELATIONSHIP_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.fact_relationship cdmtable
		where cdmtable.relationship_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the ADDRESS_1 of the LOCATION.' as check_description
  ,'LOCATION' as cdm_table_name
  ,'ADDRESS_1' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_location_address_1' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = LOCATION
cdmFieldName = ADDRESS_1
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'LOCATION.ADDRESS_1' as violating_field, 
			cdmtable.* 
		from dataform.location cdmtable
		where cdmtable.address_1 is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the ADDRESS_2 of the LOCATION.' as check_description
  ,'LOCATION' as cdm_table_name
  ,'ADDRESS_2' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_location_address_2' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = LOCATION
cdmFieldName = ADDRESS_2
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'LOCATION.ADDRESS_2' as violating_field, 
			cdmtable.* 
		from dataform.location cdmtable
		where cdmtable.address_2 is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CITY of the LOCATION.' as check_description
  ,'LOCATION' as cdm_table_name
  ,'CITY' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_location_city' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = LOCATION
cdmFieldName = CITY
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'LOCATION.CITY' as violating_field, 
			cdmtable.* 
		from dataform.location cdmtable
		where cdmtable.city is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the COUNTRY_CONCEPT_ID of the LOCATION.' as check_description
  ,'LOCATION' as cdm_table_name
  ,'COUNTRY_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_location_country_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'LOCATION.COUNTRY_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.location cdmtable
		where cdmtable.country_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the COUNTRY_SOURCE_VALUE of the LOCATION.' as check_description
  ,'LOCATION' as cdm_table_name
  ,'COUNTRY_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_location_country_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = LOCATION
cdmFieldName = COUNTRY_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'LOCATION.COUNTRY_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.location cdmtable
		where cdmtable.country_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the COUNTY of the LOCATION.' as check_description
  ,'LOCATION' as cdm_table_name
  ,'COUNTY' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_location_county' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = LOCATION
cdmFieldName = COUNTY
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'LOCATION.COUNTY' as violating_field, 
			cdmtable.* 
		from dataform.location cdmtable
		where cdmtable.county is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the LATITUDE of the LOCATION.' as check_description
  ,'LOCATION' as cdm_table_name
  ,'LATITUDE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_location_latitude' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = LOCATION
cdmFieldName = LATITUDE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'LOCATION.LATITUDE' as violating_field, 
			cdmtable.* 
		from dataform.location cdmtable
		where cdmtable.latitude is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the LOCATION_ID of the LOCATION.' as check_description
  ,'LOCATION' as cdm_table_name
  ,'LOCATION_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_location_location_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = LOCATION
cdmFieldName = LOCATION_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'LOCATION.LOCATION_ID' as violating_field, 
			cdmtable.* 
		from dataform.location cdmtable
		where cdmtable.location_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the LOCATION_SOURCE_VALUE of the LOCATION.' as check_description
  ,'LOCATION' as cdm_table_name
  ,'LOCATION_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_location_location_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = LOCATION
cdmFieldName = LOCATION_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'LOCATION.LOCATION_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.location cdmtable
		where cdmtable.location_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the LONGITUDE of the LOCATION.' as check_description
  ,'LOCATION' as cdm_table_name
  ,'LONGITUDE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_location_longitude' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = LOCATION
cdmFieldName = LONGITUDE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'LOCATION.LONGITUDE' as violating_field, 
			cdmtable.* 
		from dataform.location cdmtable
		where cdmtable.longitude is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the STATE of the LOCATION.' as check_description
  ,'LOCATION' as cdm_table_name
  ,'STATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_location_state' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = LOCATION
cdmFieldName = STATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'LOCATION.STATE' as violating_field, 
			cdmtable.* 
		from dataform.location cdmtable
		where cdmtable.state is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the ZIP of the LOCATION.' as check_description
  ,'LOCATION' as cdm_table_name
  ,'ZIP' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_location_zip' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = LOCATION
cdmFieldName = ZIP
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'LOCATION.ZIP' as violating_field, 
			cdmtable.* 
		from dataform.location cdmtable
		where cdmtable.zip is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the MEAS_EVENT_FIELD_CONCEPT_ID of the MEASUREMENT.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEAS_EVENT_FIELD_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_measurement_meas_event_field_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEAS_EVENT_FIELD_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'MEASUREMENT.MEAS_EVENT_FIELD_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.measurement cdmtable
		where cdmtable.meas_event_field_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the MEASUREMENT_CONCEPT_ID of the MEASUREMENT.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_measurement_measurement_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'MEASUREMENT.MEASUREMENT_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.measurement cdmtable
		where cdmtable.measurement_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the MEASUREMENT_DATE of the MEASUREMENT.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_measurement_measurement_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'MEASUREMENT.MEASUREMENT_DATE' as violating_field, 
			cdmtable.* 
		from dataform.measurement cdmtable
		where cdmtable.measurement_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the MEASUREMENT_DATETIME of the MEASUREMENT.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_measurement_measurement_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'MEASUREMENT.MEASUREMENT_DATETIME' as violating_field, 
			cdmtable.* 
		from dataform.measurement cdmtable
		where cdmtable.measurement_datetime is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the MEASUREMENT_EVENT_ID of the MEASUREMENT.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_EVENT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_measurement_measurement_event_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_EVENT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'MEASUREMENT.MEASUREMENT_EVENT_ID' as violating_field, 
			cdmtable.* 
		from dataform.measurement cdmtable
		where cdmtable.measurement_event_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the MEASUREMENT_ID of the MEASUREMENT.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_measurement_measurement_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'MEASUREMENT.MEASUREMENT_ID' as violating_field, 
			cdmtable.* 
		from dataform.measurement cdmtable
		where cdmtable.measurement_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the MEASUREMENT_SOURCE_CONCEPT_ID of the MEASUREMENT.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_measurement_measurement_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'MEASUREMENT.MEASUREMENT_SOURCE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.measurement cdmtable
		where cdmtable.measurement_source_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the MEASUREMENT_SOURCE_VALUE of the MEASUREMENT.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_measurement_measurement_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'MEASUREMENT.MEASUREMENT_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.measurement cdmtable
		where cdmtable.measurement_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the MEASUREMENT_TIME of the MEASUREMENT.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_TIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_measurement_measurement_time' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_TIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'MEASUREMENT.MEASUREMENT_TIME' as violating_field, 
			cdmtable.* 
		from dataform.measurement cdmtable
		where cdmtable.measurement_time is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the MEASUREMENT_TYPE_CONCEPT_ID of the MEASUREMENT.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_measurement_measurement_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'MEASUREMENT.MEASUREMENT_TYPE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.measurement cdmtable
		where cdmtable.measurement_type_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the OPERATOR_CONCEPT_ID of the MEASUREMENT.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'OPERATOR_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_measurement_operator_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = OPERATOR_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'MEASUREMENT.OPERATOR_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.measurement cdmtable
		where cdmtable.operator_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERSON_ID of the MEASUREMENT.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_measurement_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = PERSON_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'MEASUREMENT.PERSON_ID' as violating_field, 
			cdmtable.* 
		from dataform.measurement cdmtable
		where cdmtable.person_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PROVIDER_ID of the MEASUREMENT.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_measurement_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = PROVIDER_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'MEASUREMENT.PROVIDER_ID' as violating_field, 
			cdmtable.* 
		from dataform.measurement cdmtable
		where cdmtable.provider_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the RANGE_HIGH of the MEASUREMENT.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'RANGE_HIGH' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_measurement_range_high' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = RANGE_HIGH
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'MEASUREMENT.RANGE_HIGH' as violating_field, 
			cdmtable.* 
		from dataform.measurement cdmtable
		where cdmtable.range_high is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the RANGE_LOW of the MEASUREMENT.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'RANGE_LOW' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_measurement_range_low' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = RANGE_LOW
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'MEASUREMENT.RANGE_LOW' as violating_field, 
			cdmtable.* 
		from dataform.measurement cdmtable
		where cdmtable.range_low is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the UNIT_CONCEPT_ID of the MEASUREMENT.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_measurement_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'MEASUREMENT.UNIT_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.measurement cdmtable
		where cdmtable.unit_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the UNIT_SOURCE_CONCEPT_ID of the MEASUREMENT.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'UNIT_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_measurement_unit_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'MEASUREMENT.UNIT_SOURCE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.measurement cdmtable
		where cdmtable.unit_source_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the UNIT_SOURCE_VALUE of the MEASUREMENT.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'UNIT_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_measurement_unit_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = UNIT_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'MEASUREMENT.UNIT_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.measurement cdmtable
		where cdmtable.unit_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VALUE_AS_CONCEPT_ID of the MEASUREMENT.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'VALUE_AS_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_measurement_value_as_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = VALUE_AS_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'MEASUREMENT.VALUE_AS_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.measurement cdmtable
		where cdmtable.value_as_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VALUE_AS_NUMBER of the MEASUREMENT.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'VALUE_AS_NUMBER' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_measurement_value_as_number' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = VALUE_AS_NUMBER
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'MEASUREMENT.VALUE_AS_NUMBER' as violating_field, 
			cdmtable.* 
		from dataform.measurement cdmtable
		where cdmtable.value_as_number is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VALUE_SOURCE_VALUE of the MEASUREMENT.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'VALUE_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_measurement_value_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = VALUE_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'MEASUREMENT.VALUE_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.measurement cdmtable
		where cdmtable.value_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_DETAIL_ID of the MEASUREMENT.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_measurement_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = VISIT_DETAIL_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'MEASUREMENT.VISIT_DETAIL_ID' as violating_field, 
			cdmtable.* 
		from dataform.measurement cdmtable
		where cdmtable.visit_detail_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_OCCURRENCE_ID of the MEASUREMENT.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_measurement_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = VISIT_OCCURRENCE_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'MEASUREMENT.VISIT_OCCURRENCE_ID' as violating_field, 
			cdmtable.* 
		from dataform.measurement cdmtable
		where cdmtable.visit_occurrence_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the METADATA_CONCEPT_ID of the METADATA.' as check_description
  ,'METADATA' as cdm_table_name
  ,'METADATA_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_metadata_metadata_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = METADATA
cdmFieldName = METADATA_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'METADATA.METADATA_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.metadata cdmtable
		where cdmtable.metadata_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the METADATA_DATE of the METADATA.' as check_description
  ,'METADATA' as cdm_table_name
  ,'METADATA_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_metadata_metadata_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = METADATA
cdmFieldName = METADATA_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'METADATA.METADATA_DATE' as violating_field, 
			cdmtable.* 
		from dataform.metadata cdmtable
		where cdmtable.metadata_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the METADATA_DATETIME of the METADATA.' as check_description
  ,'METADATA' as cdm_table_name
  ,'METADATA_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_metadata_metadata_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = METADATA
cdmFieldName = METADATA_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'METADATA.METADATA_DATETIME' as violating_field, 
			cdmtable.* 
		from dataform.metadata cdmtable
		where cdmtable.metadata_datetime is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the METADATA_ID of the METADATA.' as check_description
  ,'METADATA' as cdm_table_name
  ,'METADATA_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_metadata_metadata_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = METADATA
cdmFieldName = METADATA_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'METADATA.METADATA_ID' as violating_field, 
			cdmtable.* 
		from dataform.metadata cdmtable
		where cdmtable.metadata_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the METADATA_TYPE_CONCEPT_ID of the METADATA.' as check_description
  ,'METADATA' as cdm_table_name
  ,'METADATA_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_metadata_metadata_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = METADATA
cdmFieldName = METADATA_TYPE_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'METADATA.METADATA_TYPE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.metadata cdmtable
		where cdmtable.metadata_type_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the NAME of the METADATA.' as check_description
  ,'METADATA' as cdm_table_name
  ,'NAME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_metadata_name' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = METADATA
cdmFieldName = NAME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'METADATA.NAME' as violating_field, 
			cdmtable.* 
		from dataform.metadata cdmtable
		where cdmtable.name is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VALUE_AS_CONCEPT_ID of the METADATA.' as check_description
  ,'METADATA' as cdm_table_name
  ,'VALUE_AS_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_metadata_value_as_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = METADATA
cdmFieldName = VALUE_AS_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'METADATA.VALUE_AS_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.metadata cdmtable
		where cdmtable.value_as_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VALUE_AS_NUMBER of the METADATA.' as check_description
  ,'METADATA' as cdm_table_name
  ,'VALUE_AS_NUMBER' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_metadata_value_as_number' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = METADATA
cdmFieldName = VALUE_AS_NUMBER
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'METADATA.VALUE_AS_NUMBER' as violating_field, 
			cdmtable.* 
		from dataform.metadata cdmtable
		where cdmtable.value_as_number is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VALUE_AS_STRING of the METADATA.' as check_description
  ,'METADATA' as cdm_table_name
  ,'VALUE_AS_STRING' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_metadata_value_as_string' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = METADATA
cdmFieldName = VALUE_AS_STRING
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'METADATA.VALUE_AS_STRING' as violating_field, 
			cdmtable.* 
		from dataform.metadata cdmtable
		where cdmtable.value_as_string is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the ENCODING_CONCEPT_ID of the NOTE.' as check_description
  ,'NOTE' as cdm_table_name
  ,'ENCODING_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_note_encoding_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = NOTE
cdmFieldName = ENCODING_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'NOTE.ENCODING_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.note cdmtable
		where cdmtable.encoding_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the LANGUAGE_CONCEPT_ID of the NOTE.' as check_description
  ,'NOTE' as cdm_table_name
  ,'LANGUAGE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_note_language_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = NOTE
cdmFieldName = LANGUAGE_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'NOTE.LANGUAGE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.note cdmtable
		where cdmtable.language_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the NOTE_CLASS_CONCEPT_ID of the NOTE.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_CLASS_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_note_note_class_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = NOTE
cdmFieldName = NOTE_CLASS_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'NOTE.NOTE_CLASS_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.note cdmtable
		where cdmtable.note_class_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the NOTE_DATE of the NOTE.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_note_note_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = NOTE
cdmFieldName = NOTE_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'NOTE.NOTE_DATE' as violating_field, 
			cdmtable.* 
		from dataform.note cdmtable
		where cdmtable.note_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the NOTE_DATETIME of the NOTE.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_note_note_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = NOTE
cdmFieldName = NOTE_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'NOTE.NOTE_DATETIME' as violating_field, 
			cdmtable.* 
		from dataform.note cdmtable
		where cdmtable.note_datetime is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the NOTE_EVENT_FIELD_CONCEPT_ID of the NOTE.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_EVENT_FIELD_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_note_note_event_field_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = NOTE
cdmFieldName = NOTE_EVENT_FIELD_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'NOTE.NOTE_EVENT_FIELD_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.note cdmtable
		where cdmtable.note_event_field_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the NOTE_EVENT_ID of the NOTE.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_EVENT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_note_note_event_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = NOTE
cdmFieldName = NOTE_EVENT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'NOTE.NOTE_EVENT_ID' as violating_field, 
			cdmtable.* 
		from dataform.note cdmtable
		where cdmtable.note_event_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the NOTE_ID of the NOTE.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_note_note_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = NOTE
cdmFieldName = NOTE_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'NOTE.NOTE_ID' as violating_field, 
			cdmtable.* 
		from dataform.note cdmtable
		where cdmtable.note_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the NOTE_SOURCE_VALUE of the NOTE.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_note_note_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = NOTE
cdmFieldName = NOTE_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'NOTE.NOTE_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.note cdmtable
		where cdmtable.note_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the NOTE_TEXT of the NOTE.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_TEXT' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_note_note_text' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = NOTE
cdmFieldName = NOTE_TEXT
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'NOTE.NOTE_TEXT' as violating_field, 
			cdmtable.* 
		from dataform.note cdmtable
		where cdmtable.note_text is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the NOTE_TITLE of the NOTE.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_TITLE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_note_note_title' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = NOTE
cdmFieldName = NOTE_TITLE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'NOTE.NOTE_TITLE' as violating_field, 
			cdmtable.* 
		from dataform.note cdmtable
		where cdmtable.note_title is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the NOTE_TYPE_CONCEPT_ID of the NOTE.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_note_note_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = NOTE
cdmFieldName = NOTE_TYPE_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'NOTE.NOTE_TYPE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.note cdmtable
		where cdmtable.note_type_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERSON_ID of the NOTE.' as check_description
  ,'NOTE' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_note_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = NOTE
cdmFieldName = PERSON_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'NOTE.PERSON_ID' as violating_field, 
			cdmtable.* 
		from dataform.note cdmtable
		where cdmtable.person_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PROVIDER_ID of the NOTE.' as check_description
  ,'NOTE' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_note_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = NOTE
cdmFieldName = PROVIDER_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'NOTE.PROVIDER_ID' as violating_field, 
			cdmtable.* 
		from dataform.note cdmtable
		where cdmtable.provider_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_DETAIL_ID of the NOTE.' as check_description
  ,'NOTE' as cdm_table_name
  ,'VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_note_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = NOTE
cdmFieldName = VISIT_DETAIL_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'NOTE.VISIT_DETAIL_ID' as violating_field, 
			cdmtable.* 
		from dataform.note cdmtable
		where cdmtable.visit_detail_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_OCCURRENCE_ID of the NOTE.' as check_description
  ,'NOTE' as cdm_table_name
  ,'VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_note_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = NOTE
cdmFieldName = VISIT_OCCURRENCE_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'NOTE.VISIT_OCCURRENCE_ID' as violating_field, 
			cdmtable.* 
		from dataform.note cdmtable
		where cdmtable.visit_occurrence_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the LEXICAL_VARIANT of the NOTE_NLP.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'LEXICAL_VARIANT' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_note_nlp_lexical_variant' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = NOTE_NLP
cdmFieldName = LEXICAL_VARIANT
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'NOTE_NLP.LEXICAL_VARIANT' as violating_field, 
			cdmtable.* 
		from dataform.note_nlp cdmtable
		where cdmtable.lexical_variant is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the NLP_DATE of the NOTE_NLP.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'NLP_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_note_nlp_nlp_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = NOTE_NLP
cdmFieldName = NLP_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'NOTE_NLP.NLP_DATE' as violating_field, 
			cdmtable.* 
		from dataform.note_nlp cdmtable
		where cdmtable.nlp_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the NLP_DATETIME of the NOTE_NLP.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'NLP_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_note_nlp_nlp_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = NOTE_NLP
cdmFieldName = NLP_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'NOTE_NLP.NLP_DATETIME' as violating_field, 
			cdmtable.* 
		from dataform.note_nlp cdmtable
		where cdmtable.nlp_datetime is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the NLP_SYSTEM of the NOTE_NLP.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'NLP_SYSTEM' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_note_nlp_nlp_system' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = NOTE_NLP
cdmFieldName = NLP_SYSTEM
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'NOTE_NLP.NLP_SYSTEM' as violating_field, 
			cdmtable.* 
		from dataform.note_nlp cdmtable
		where cdmtable.nlp_system is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the NOTE_ID of the NOTE_NLP.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'NOTE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_note_nlp_note_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = NOTE_NLP
cdmFieldName = NOTE_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'NOTE_NLP.NOTE_ID' as violating_field, 
			cdmtable.* 
		from dataform.note_nlp cdmtable
		where cdmtable.note_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the NOTE_NLP_CONCEPT_ID of the NOTE_NLP.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'NOTE_NLP_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_note_nlp_note_nlp_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = NOTE_NLP
cdmFieldName = NOTE_NLP_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'NOTE_NLP.NOTE_NLP_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.note_nlp cdmtable
		where cdmtable.note_nlp_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the NOTE_NLP_ID of the NOTE_NLP.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'NOTE_NLP_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_note_nlp_note_nlp_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = NOTE_NLP
cdmFieldName = NOTE_NLP_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'NOTE_NLP.NOTE_NLP_ID' as violating_field, 
			cdmtable.* 
		from dataform.note_nlp cdmtable
		where cdmtable.note_nlp_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the NOTE_NLP_SOURCE_CONCEPT_ID of the NOTE_NLP.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'NOTE_NLP_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_note_nlp_note_nlp_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = NOTE_NLP
cdmFieldName = NOTE_NLP_SOURCE_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'NOTE_NLP.NOTE_NLP_SOURCE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.note_nlp cdmtable
		where cdmtable.note_nlp_source_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the SECTION_CONCEPT_ID of the NOTE_NLP.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'SECTION_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_note_nlp_section_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = NOTE_NLP
cdmFieldName = SECTION_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'NOTE_NLP.SECTION_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.note_nlp cdmtable
		where cdmtable.section_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the SNIPPET of the NOTE_NLP.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'SNIPPET' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_note_nlp_snippet' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = NOTE_NLP
cdmFieldName = SNIPPET
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'NOTE_NLP.SNIPPET' as violating_field, 
			cdmtable.* 
		from dataform.note_nlp cdmtable
		where cdmtable.snippet is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the TERM_EXISTS of the NOTE_NLP.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'TERM_EXISTS' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_note_nlp_term_exists' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = NOTE_NLP
cdmFieldName = TERM_EXISTS
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'NOTE_NLP.TERM_EXISTS' as violating_field, 
			cdmtable.* 
		from dataform.note_nlp cdmtable
		where cdmtable.term_exists is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the TERM_MODIFIERS of the NOTE_NLP.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'TERM_MODIFIERS' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_note_nlp_term_modifiers' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = NOTE_NLP
cdmFieldName = TERM_MODIFIERS
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'NOTE_NLP.TERM_MODIFIERS' as violating_field, 
			cdmtable.* 
		from dataform.note_nlp cdmtable
		where cdmtable.term_modifiers is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the TERM_TEMPORAL of the NOTE_NLP.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'TERM_TEMPORAL' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_note_nlp_term_temporal' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = NOTE_NLP
cdmFieldName = TERM_TEMPORAL
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'NOTE_NLP.TERM_TEMPORAL' as violating_field, 
			cdmtable.* 
		from dataform.note_nlp cdmtable
		where cdmtable.term_temporal is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the OBS_EVENT_FIELD_CONCEPT_ID of the OBSERVATION.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBS_EVENT_FIELD_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_observation_obs_event_field_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = OBSERVATION
cdmFieldName = OBS_EVENT_FIELD_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'OBSERVATION.OBS_EVENT_FIELD_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.observation cdmtable
		where cdmtable.obs_event_field_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the OBSERVATION_CONCEPT_ID of the OBSERVATION.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_observation_observation_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'OBSERVATION.OBSERVATION_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.observation cdmtable
		where cdmtable.observation_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the OBSERVATION_DATE of the OBSERVATION.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_observation_observation_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = OBSERVATION
cdmFieldName = OBSERVATION_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'OBSERVATION.OBSERVATION_DATE' as violating_field, 
			cdmtable.* 
		from dataform.observation cdmtable
		where cdmtable.observation_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the OBSERVATION_DATETIME of the OBSERVATION.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_observation_observation_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = OBSERVATION
cdmFieldName = OBSERVATION_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'OBSERVATION.OBSERVATION_DATETIME' as violating_field, 
			cdmtable.* 
		from dataform.observation cdmtable
		where cdmtable.observation_datetime is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the OBSERVATION_EVENT_ID of the OBSERVATION.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_EVENT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_observation_observation_event_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = OBSERVATION
cdmFieldName = OBSERVATION_EVENT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'OBSERVATION.OBSERVATION_EVENT_ID' as violating_field, 
			cdmtable.* 
		from dataform.observation cdmtable
		where cdmtable.observation_event_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the OBSERVATION_ID of the OBSERVATION.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_observation_observation_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = OBSERVATION
cdmFieldName = OBSERVATION_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'OBSERVATION.OBSERVATION_ID' as violating_field, 
			cdmtable.* 
		from dataform.observation cdmtable
		where cdmtable.observation_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the OBSERVATION_SOURCE_CONCEPT_ID of the OBSERVATION.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_observation_observation_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'OBSERVATION.OBSERVATION_SOURCE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.observation cdmtable
		where cdmtable.observation_source_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the OBSERVATION_SOURCE_VALUE of the OBSERVATION.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_observation_observation_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = OBSERVATION
cdmFieldName = OBSERVATION_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'OBSERVATION.OBSERVATION_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.observation cdmtable
		where cdmtable.observation_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the OBSERVATION_TYPE_CONCEPT_ID of the OBSERVATION.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_observation_observation_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'OBSERVATION.OBSERVATION_TYPE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.observation cdmtable
		where cdmtable.observation_type_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERSON_ID of the OBSERVATION.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_observation_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = OBSERVATION
cdmFieldName = PERSON_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'OBSERVATION.PERSON_ID' as violating_field, 
			cdmtable.* 
		from dataform.observation cdmtable
		where cdmtable.person_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PROVIDER_ID of the OBSERVATION.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_observation_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = OBSERVATION
cdmFieldName = PROVIDER_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'OBSERVATION.PROVIDER_ID' as violating_field, 
			cdmtable.* 
		from dataform.observation cdmtable
		where cdmtable.provider_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the QUALIFIER_CONCEPT_ID of the OBSERVATION.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'QUALIFIER_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_observation_qualifier_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = OBSERVATION
cdmFieldName = QUALIFIER_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'OBSERVATION.QUALIFIER_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.observation cdmtable
		where cdmtable.qualifier_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the QUALIFIER_SOURCE_VALUE of the OBSERVATION.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'QUALIFIER_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_observation_qualifier_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = OBSERVATION
cdmFieldName = QUALIFIER_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'OBSERVATION.QUALIFIER_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.observation cdmtable
		where cdmtable.qualifier_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the UNIT_CONCEPT_ID of the OBSERVATION.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_observation_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'OBSERVATION.UNIT_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.observation cdmtable
		where cdmtable.unit_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the UNIT_SOURCE_VALUE of the OBSERVATION.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'UNIT_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_observation_unit_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = OBSERVATION
cdmFieldName = UNIT_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'OBSERVATION.UNIT_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.observation cdmtable
		where cdmtable.unit_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VALUE_AS_CONCEPT_ID of the OBSERVATION.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'VALUE_AS_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_observation_value_as_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = OBSERVATION
cdmFieldName = VALUE_AS_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'OBSERVATION.VALUE_AS_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.observation cdmtable
		where cdmtable.value_as_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VALUE_AS_NUMBER of the OBSERVATION.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'VALUE_AS_NUMBER' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_observation_value_as_number' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = OBSERVATION
cdmFieldName = VALUE_AS_NUMBER
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'OBSERVATION.VALUE_AS_NUMBER' as violating_field, 
			cdmtable.* 
		from dataform.observation cdmtable
		where cdmtable.value_as_number is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VALUE_AS_STRING of the OBSERVATION.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'VALUE_AS_STRING' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_observation_value_as_string' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = OBSERVATION
cdmFieldName = VALUE_AS_STRING
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'OBSERVATION.VALUE_AS_STRING' as violating_field, 
			cdmtable.* 
		from dataform.observation cdmtable
		where cdmtable.value_as_string is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VALUE_SOURCE_VALUE of the OBSERVATION.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'VALUE_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_observation_value_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = OBSERVATION
cdmFieldName = VALUE_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'OBSERVATION.VALUE_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.observation cdmtable
		where cdmtable.value_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_DETAIL_ID of the OBSERVATION.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_observation_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = OBSERVATION
cdmFieldName = VISIT_DETAIL_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'OBSERVATION.VISIT_DETAIL_ID' as violating_field, 
			cdmtable.* 
		from dataform.observation cdmtable
		where cdmtable.visit_detail_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_OCCURRENCE_ID of the OBSERVATION.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_observation_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = OBSERVATION
cdmFieldName = VISIT_OCCURRENCE_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'OBSERVATION.VISIT_OCCURRENCE_ID' as violating_field, 
			cdmtable.* 
		from dataform.observation cdmtable
		where cdmtable.visit_occurrence_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the OBSERVATION_PERIOD_END_DATE of the OBSERVATION_PERIOD.' as check_description
  ,'OBSERVATION_PERIOD' as cdm_table_name
  ,'OBSERVATION_PERIOD_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_observation_period_observation_period_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = OBSERVATION_PERIOD
cdmFieldName = OBSERVATION_PERIOD_END_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'OBSERVATION_PERIOD.OBSERVATION_PERIOD_END_DATE' as violating_field, 
			cdmtable.* 
		from dataform.observation_period cdmtable
		where cdmtable.observation_period_end_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the OBSERVATION_PERIOD_ID of the OBSERVATION_PERIOD.' as check_description
  ,'OBSERVATION_PERIOD' as cdm_table_name
  ,'OBSERVATION_PERIOD_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_observation_period_observation_period_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = OBSERVATION_PERIOD
cdmFieldName = OBSERVATION_PERIOD_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'OBSERVATION_PERIOD.OBSERVATION_PERIOD_ID' as violating_field, 
			cdmtable.* 
		from dataform.observation_period cdmtable
		where cdmtable.observation_period_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the OBSERVATION_PERIOD_START_DATE of the OBSERVATION_PERIOD.' as check_description
  ,'OBSERVATION_PERIOD' as cdm_table_name
  ,'OBSERVATION_PERIOD_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_observation_period_observation_period_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = OBSERVATION_PERIOD
cdmFieldName = OBSERVATION_PERIOD_START_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'OBSERVATION_PERIOD.OBSERVATION_PERIOD_START_DATE' as violating_field, 
			cdmtable.* 
		from dataform.observation_period cdmtable
		where cdmtable.observation_period_start_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERIOD_TYPE_CONCEPT_ID of the OBSERVATION_PERIOD.' as check_description
  ,'OBSERVATION_PERIOD' as cdm_table_name
  ,'PERIOD_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_observation_period_period_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'OBSERVATION_PERIOD.PERIOD_TYPE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.observation_period cdmtable
		where cdmtable.period_type_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERSON_ID of the OBSERVATION_PERIOD.' as check_description
  ,'OBSERVATION_PERIOD' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_observation_period_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = OBSERVATION_PERIOD
cdmFieldName = PERSON_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'OBSERVATION_PERIOD.PERSON_ID' as violating_field, 
			cdmtable.* 
		from dataform.observation_period cdmtable
		where cdmtable.person_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the FAMILY_SOURCE_VALUE of the PAYER_PLAN_PERIOD.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'FAMILY_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_payer_plan_period_family_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = FAMILY_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PAYER_PLAN_PERIOD.FAMILY_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.payer_plan_period cdmtable
		where cdmtable.family_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PAYER_CONCEPT_ID of the PAYER_PLAN_PERIOD.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PAYER_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_payer_plan_period_payer_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = PAYER_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PAYER_PLAN_PERIOD.PAYER_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.payer_plan_period cdmtable
		where cdmtable.payer_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PAYER_PLAN_PERIOD_END_DATE of the PAYER_PLAN_PERIOD.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PAYER_PLAN_PERIOD_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_payer_plan_period_payer_plan_period_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = PAYER_PLAN_PERIOD_END_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PAYER_PLAN_PERIOD.PAYER_PLAN_PERIOD_END_DATE' as violating_field, 
			cdmtable.* 
		from dataform.payer_plan_period cdmtable
		where cdmtable.payer_plan_period_end_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PAYER_PLAN_PERIOD_ID of the PAYER_PLAN_PERIOD.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PAYER_PLAN_PERIOD_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_payer_plan_period_payer_plan_period_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = PAYER_PLAN_PERIOD_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PAYER_PLAN_PERIOD.PAYER_PLAN_PERIOD_ID' as violating_field, 
			cdmtable.* 
		from dataform.payer_plan_period cdmtable
		where cdmtable.payer_plan_period_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PAYER_PLAN_PERIOD_START_DATE of the PAYER_PLAN_PERIOD.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PAYER_PLAN_PERIOD_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_payer_plan_period_payer_plan_period_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = PAYER_PLAN_PERIOD_START_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PAYER_PLAN_PERIOD.PAYER_PLAN_PERIOD_START_DATE' as violating_field, 
			cdmtable.* 
		from dataform.payer_plan_period cdmtable
		where cdmtable.payer_plan_period_start_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PAYER_SOURCE_CONCEPT_ID of the PAYER_PLAN_PERIOD.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PAYER_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_payer_plan_period_payer_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = PAYER_SOURCE_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PAYER_PLAN_PERIOD.PAYER_SOURCE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.payer_plan_period cdmtable
		where cdmtable.payer_source_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PAYER_SOURCE_VALUE of the PAYER_PLAN_PERIOD.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PAYER_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_payer_plan_period_payer_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = PAYER_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PAYER_PLAN_PERIOD.PAYER_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.payer_plan_period cdmtable
		where cdmtable.payer_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERSON_ID of the PAYER_PLAN_PERIOD.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_payer_plan_period_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = PERSON_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PAYER_PLAN_PERIOD.PERSON_ID' as violating_field, 
			cdmtable.* 
		from dataform.payer_plan_period cdmtable
		where cdmtable.person_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PLAN_CONCEPT_ID of the PAYER_PLAN_PERIOD.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PLAN_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_payer_plan_period_plan_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = PLAN_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PAYER_PLAN_PERIOD.PLAN_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.payer_plan_period cdmtable
		where cdmtable.plan_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PLAN_SOURCE_CONCEPT_ID of the PAYER_PLAN_PERIOD.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PLAN_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_payer_plan_period_plan_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = PLAN_SOURCE_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PAYER_PLAN_PERIOD.PLAN_SOURCE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.payer_plan_period cdmtable
		where cdmtable.plan_source_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PLAN_SOURCE_VALUE of the PAYER_PLAN_PERIOD.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PLAN_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_payer_plan_period_plan_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = PLAN_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PAYER_PLAN_PERIOD.PLAN_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.payer_plan_period cdmtable
		where cdmtable.plan_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the SPONSOR_CONCEPT_ID of the PAYER_PLAN_PERIOD.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'SPONSOR_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_payer_plan_period_sponsor_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = SPONSOR_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PAYER_PLAN_PERIOD.SPONSOR_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.payer_plan_period cdmtable
		where cdmtable.sponsor_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the SPONSOR_SOURCE_CONCEPT_ID of the PAYER_PLAN_PERIOD.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'SPONSOR_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_payer_plan_period_sponsor_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = SPONSOR_SOURCE_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PAYER_PLAN_PERIOD.SPONSOR_SOURCE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.payer_plan_period cdmtable
		where cdmtable.sponsor_source_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the SPONSOR_SOURCE_VALUE of the PAYER_PLAN_PERIOD.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'SPONSOR_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_payer_plan_period_sponsor_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = SPONSOR_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PAYER_PLAN_PERIOD.SPONSOR_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.payer_plan_period cdmtable
		where cdmtable.sponsor_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the STOP_REASON_CONCEPT_ID of the PAYER_PLAN_PERIOD.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'STOP_REASON_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_payer_plan_period_stop_reason_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = STOP_REASON_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PAYER_PLAN_PERIOD.STOP_REASON_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.payer_plan_period cdmtable
		where cdmtable.stop_reason_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the STOP_REASON_SOURCE_CONCEPT_ID of the PAYER_PLAN_PERIOD.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'STOP_REASON_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_payer_plan_period_stop_reason_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = STOP_REASON_SOURCE_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PAYER_PLAN_PERIOD.STOP_REASON_SOURCE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.payer_plan_period cdmtable
		where cdmtable.stop_reason_source_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the STOP_REASON_SOURCE_VALUE of the PAYER_PLAN_PERIOD.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'STOP_REASON_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_payer_plan_period_stop_reason_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = STOP_REASON_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PAYER_PLAN_PERIOD.STOP_REASON_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.payer_plan_period cdmtable
		where cdmtable.stop_reason_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the BIRTH_DATETIME of the PERSON.' as check_description
  ,'PERSON' as cdm_table_name
  ,'BIRTH_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_person_birth_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PERSON
cdmFieldName = BIRTH_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PERSON.BIRTH_DATETIME' as violating_field, 
			cdmtable.* 
		from dataform.person cdmtable
		where cdmtable.birth_datetime is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CARE_SITE_ID of the PERSON.' as check_description
  ,'PERSON' as cdm_table_name
  ,'CARE_SITE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_person_care_site_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PERSON
cdmFieldName = CARE_SITE_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PERSON.CARE_SITE_ID' as violating_field, 
			cdmtable.* 
		from dataform.person cdmtable
		where cdmtable.care_site_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DAY_OF_BIRTH of the PERSON.' as check_description
  ,'PERSON' as cdm_table_name
  ,'DAY_OF_BIRTH' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_person_day_of_birth' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PERSON
cdmFieldName = DAY_OF_BIRTH
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PERSON.DAY_OF_BIRTH' as violating_field, 
			cdmtable.* 
		from dataform.person cdmtable
		where cdmtable.day_of_birth is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the ETHNICITY_CONCEPT_ID of the PERSON.' as check_description
  ,'PERSON' as cdm_table_name
  ,'ETHNICITY_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_person_ethnicity_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PERSON.ETHNICITY_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.person cdmtable
		where cdmtable.ethnicity_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the ETHNICITY_SOURCE_CONCEPT_ID of the PERSON.' as check_description
  ,'PERSON' as cdm_table_name
  ,'ETHNICITY_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_person_ethnicity_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PERSON
cdmFieldName = ETHNICITY_SOURCE_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PERSON.ETHNICITY_SOURCE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.person cdmtable
		where cdmtable.ethnicity_source_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the ETHNICITY_SOURCE_VALUE of the PERSON.' as check_description
  ,'PERSON' as cdm_table_name
  ,'ETHNICITY_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_person_ethnicity_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PERSON
cdmFieldName = ETHNICITY_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PERSON.ETHNICITY_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.person cdmtable
		where cdmtable.ethnicity_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the GENDER_CONCEPT_ID of the PERSON.' as check_description
  ,'PERSON' as cdm_table_name
  ,'GENDER_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_person_gender_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PERSON.GENDER_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.person cdmtable
		where cdmtable.gender_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the GENDER_SOURCE_CONCEPT_ID of the PERSON.' as check_description
  ,'PERSON' as cdm_table_name
  ,'GENDER_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_person_gender_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PERSON
cdmFieldName = GENDER_SOURCE_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PERSON.GENDER_SOURCE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.person cdmtable
		where cdmtable.gender_source_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the GENDER_SOURCE_VALUE of the PERSON.' as check_description
  ,'PERSON' as cdm_table_name
  ,'GENDER_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_person_gender_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PERSON
cdmFieldName = GENDER_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PERSON.GENDER_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.person cdmtable
		where cdmtable.gender_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the LOCATION_ID of the PERSON.' as check_description
  ,'PERSON' as cdm_table_name
  ,'LOCATION_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_person_location_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PERSON
cdmFieldName = LOCATION_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PERSON.LOCATION_ID' as violating_field, 
			cdmtable.* 
		from dataform.person cdmtable
		where cdmtable.location_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the MONTH_OF_BIRTH of the PERSON.' as check_description
  ,'PERSON' as cdm_table_name
  ,'MONTH_OF_BIRTH' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_person_month_of_birth' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PERSON
cdmFieldName = MONTH_OF_BIRTH
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PERSON.MONTH_OF_BIRTH' as violating_field, 
			cdmtable.* 
		from dataform.person cdmtable
		where cdmtable.month_of_birth is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERSON_ID of the PERSON.' as check_description
  ,'PERSON' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_person_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PERSON
cdmFieldName = PERSON_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PERSON.PERSON_ID' as violating_field, 
			cdmtable.* 
		from dataform.person cdmtable
		where cdmtable.person_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERSON_SOURCE_VALUE of the PERSON.' as check_description
  ,'PERSON' as cdm_table_name
  ,'PERSON_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_person_person_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PERSON
cdmFieldName = PERSON_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PERSON.PERSON_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.person cdmtable
		where cdmtable.person_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PROVIDER_ID of the PERSON.' as check_description
  ,'PERSON' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_person_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PERSON
cdmFieldName = PROVIDER_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PERSON.PROVIDER_ID' as violating_field, 
			cdmtable.* 
		from dataform.person cdmtable
		where cdmtable.provider_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the RACE_CONCEPT_ID of the PERSON.' as check_description
  ,'PERSON' as cdm_table_name
  ,'RACE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_person_race_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PERSON.RACE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.person cdmtable
		where cdmtable.race_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the RACE_SOURCE_CONCEPT_ID of the PERSON.' as check_description
  ,'PERSON' as cdm_table_name
  ,'RACE_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_person_race_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PERSON
cdmFieldName = RACE_SOURCE_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PERSON.RACE_SOURCE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.person cdmtable
		where cdmtable.race_source_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the RACE_SOURCE_VALUE of the PERSON.' as check_description
  ,'PERSON' as cdm_table_name
  ,'RACE_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_person_race_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PERSON
cdmFieldName = RACE_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PERSON.RACE_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.person cdmtable
		where cdmtable.race_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the YEAR_OF_BIRTH of the PERSON.' as check_description
  ,'PERSON' as cdm_table_name
  ,'YEAR_OF_BIRTH' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_person_year_of_birth' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PERSON
cdmFieldName = YEAR_OF_BIRTH
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PERSON.YEAR_OF_BIRTH' as violating_field, 
			cdmtable.* 
		from dataform.person cdmtable
		where cdmtable.year_of_birth is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the MODIFIER_CONCEPT_ID of the PROCEDURE_OCCURRENCE.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'MODIFIER_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_procedure_occurrence_modifier_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PROCEDURE_OCCURRENCE.MODIFIER_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.procedure_occurrence cdmtable
		where cdmtable.modifier_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the MODIFIER_SOURCE_VALUE of the PROCEDURE_OCCURRENCE.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'MODIFIER_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_procedure_occurrence_modifier_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = MODIFIER_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PROCEDURE_OCCURRENCE.MODIFIER_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.procedure_occurrence cdmtable
		where cdmtable.modifier_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERSON_ID of the PROCEDURE_OCCURRENCE.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_procedure_occurrence_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PERSON_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PROCEDURE_OCCURRENCE.PERSON_ID' as violating_field, 
			cdmtable.* 
		from dataform.procedure_occurrence cdmtable
		where cdmtable.person_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PROCEDURE_CONCEPT_ID of the PROCEDURE_OCCURRENCE.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_procedure_occurrence_procedure_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PROCEDURE_OCCURRENCE.PROCEDURE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.procedure_occurrence cdmtable
		where cdmtable.procedure_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PROCEDURE_DATE of the PROCEDURE_OCCURRENCE.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_procedure_occurrence_procedure_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PROCEDURE_OCCURRENCE.PROCEDURE_DATE' as violating_field, 
			cdmtable.* 
		from dataform.procedure_occurrence cdmtable
		where cdmtable.procedure_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PROCEDURE_DATETIME of the PROCEDURE_OCCURRENCE.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_procedure_occurrence_procedure_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PROCEDURE_OCCURRENCE.PROCEDURE_DATETIME' as violating_field, 
			cdmtable.* 
		from dataform.procedure_occurrence cdmtable
		where cdmtable.procedure_datetime is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PROCEDURE_END_DATE of the PROCEDURE_OCCURRENCE.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_procedure_occurrence_procedure_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_END_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PROCEDURE_OCCURRENCE.PROCEDURE_END_DATE' as violating_field, 
			cdmtable.* 
		from dataform.procedure_occurrence cdmtable
		where cdmtable.procedure_end_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PROCEDURE_END_DATETIME of the PROCEDURE_OCCURRENCE.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_END_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_procedure_occurrence_procedure_end_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_END_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PROCEDURE_OCCURRENCE.PROCEDURE_END_DATETIME' as violating_field, 
			cdmtable.* 
		from dataform.procedure_occurrence cdmtable
		where cdmtable.procedure_end_datetime is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PROCEDURE_OCCURRENCE_ID of the PROCEDURE_OCCURRENCE.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_procedure_occurrence_procedure_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_OCCURRENCE_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PROCEDURE_OCCURRENCE.PROCEDURE_OCCURRENCE_ID' as violating_field, 
			cdmtable.* 
		from dataform.procedure_occurrence cdmtable
		where cdmtable.procedure_occurrence_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PROCEDURE_SOURCE_CONCEPT_ID of the PROCEDURE_OCCURRENCE.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_procedure_occurrence_procedure_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PROCEDURE_OCCURRENCE.PROCEDURE_SOURCE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.procedure_occurrence cdmtable
		where cdmtable.procedure_source_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PROCEDURE_SOURCE_VALUE of the PROCEDURE_OCCURRENCE.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_procedure_occurrence_procedure_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PROCEDURE_OCCURRENCE.PROCEDURE_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.procedure_occurrence cdmtable
		where cdmtable.procedure_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PROCEDURE_TYPE_CONCEPT_ID of the PROCEDURE_OCCURRENCE.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_procedure_occurrence_procedure_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PROCEDURE_OCCURRENCE.PROCEDURE_TYPE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.procedure_occurrence cdmtable
		where cdmtable.procedure_type_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PROVIDER_ID of the PROCEDURE_OCCURRENCE.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_procedure_occurrence_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROVIDER_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PROCEDURE_OCCURRENCE.PROVIDER_ID' as violating_field, 
			cdmtable.* 
		from dataform.procedure_occurrence cdmtable
		where cdmtable.provider_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the QUANTITY of the PROCEDURE_OCCURRENCE.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'QUANTITY' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_procedure_occurrence_quantity' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = QUANTITY
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PROCEDURE_OCCURRENCE.QUANTITY' as violating_field, 
			cdmtable.* 
		from dataform.procedure_occurrence cdmtable
		where cdmtable.quantity is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_DETAIL_ID of the PROCEDURE_OCCURRENCE.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_procedure_occurrence_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = VISIT_DETAIL_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PROCEDURE_OCCURRENCE.VISIT_DETAIL_ID' as violating_field, 
			cdmtable.* 
		from dataform.procedure_occurrence cdmtable
		where cdmtable.visit_detail_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_OCCURRENCE_ID of the PROCEDURE_OCCURRENCE.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_procedure_occurrence_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = VISIT_OCCURRENCE_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PROCEDURE_OCCURRENCE.VISIT_OCCURRENCE_ID' as violating_field, 
			cdmtable.* 
		from dataform.procedure_occurrence cdmtable
		where cdmtable.visit_occurrence_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CARE_SITE_ID of the PROVIDER.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'CARE_SITE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_provider_care_site_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROVIDER
cdmFieldName = CARE_SITE_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PROVIDER.CARE_SITE_ID' as violating_field, 
			cdmtable.* 
		from dataform.provider cdmtable
		where cdmtable.care_site_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DEA of the PROVIDER.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'DEA' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_provider_dea' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROVIDER
cdmFieldName = DEA
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PROVIDER.DEA' as violating_field, 
			cdmtable.* 
		from dataform.provider cdmtable
		where cdmtable.dea is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the GENDER_CONCEPT_ID of the PROVIDER.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'GENDER_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_provider_gender_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PROVIDER.GENDER_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.provider cdmtable
		where cdmtable.gender_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the GENDER_SOURCE_CONCEPT_ID of the PROVIDER.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'GENDER_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_provider_gender_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROVIDER
cdmFieldName = GENDER_SOURCE_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PROVIDER.GENDER_SOURCE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.provider cdmtable
		where cdmtable.gender_source_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the GENDER_SOURCE_VALUE of the PROVIDER.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'GENDER_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_provider_gender_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROVIDER
cdmFieldName = GENDER_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PROVIDER.GENDER_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.provider cdmtable
		where cdmtable.gender_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the NPI of the PROVIDER.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'NPI' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_provider_npi' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROVIDER
cdmFieldName = NPI
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PROVIDER.NPI' as violating_field, 
			cdmtable.* 
		from dataform.provider cdmtable
		where cdmtable.npi is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PROVIDER_ID of the PROVIDER.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_provider_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROVIDER
cdmFieldName = PROVIDER_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PROVIDER.PROVIDER_ID' as violating_field, 
			cdmtable.* 
		from dataform.provider cdmtable
		where cdmtable.provider_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PROVIDER_NAME of the PROVIDER.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'PROVIDER_NAME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_provider_provider_name' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROVIDER
cdmFieldName = PROVIDER_NAME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PROVIDER.PROVIDER_NAME' as violating_field, 
			cdmtable.* 
		from dataform.provider cdmtable
		where cdmtable.provider_name is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PROVIDER_SOURCE_VALUE of the PROVIDER.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'PROVIDER_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_provider_provider_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROVIDER
cdmFieldName = PROVIDER_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PROVIDER.PROVIDER_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.provider cdmtable
		where cdmtable.provider_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the SPECIALTY_CONCEPT_ID of the PROVIDER.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'SPECIALTY_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_provider_specialty_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PROVIDER.SPECIALTY_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.provider cdmtable
		where cdmtable.specialty_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the SPECIALTY_SOURCE_CONCEPT_ID of the PROVIDER.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'SPECIALTY_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_provider_specialty_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PROVIDER.SPECIALTY_SOURCE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.provider cdmtable
		where cdmtable.specialty_source_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the SPECIALTY_SOURCE_VALUE of the PROVIDER.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'SPECIALTY_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_provider_specialty_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROVIDER
cdmFieldName = SPECIALTY_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PROVIDER.SPECIALTY_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.provider cdmtable
		where cdmtable.specialty_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the YEAR_OF_BIRTH of the PROVIDER.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'YEAR_OF_BIRTH' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_provider_year_of_birth' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROVIDER
cdmFieldName = YEAR_OF_BIRTH
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'PROVIDER.YEAR_OF_BIRTH' as violating_field, 
			cdmtable.* 
		from dataform.provider cdmtable
		where cdmtable.year_of_birth is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DEFINES_ANCESTRY of the RELATIONSHIP.' as check_description
  ,'RELATIONSHIP' as cdm_table_name
  ,'DEFINES_ANCESTRY' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_relationship_defines_ancestry' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = RELATIONSHIP
cdmFieldName = DEFINES_ANCESTRY
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'RELATIONSHIP.DEFINES_ANCESTRY' as violating_field, 
			cdmtable.* 
		from dataform.relationship cdmtable
		where cdmtable.defines_ancestry is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the IS_HIERARCHICAL of the RELATIONSHIP.' as check_description
  ,'RELATIONSHIP' as cdm_table_name
  ,'IS_HIERARCHICAL' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_relationship_is_hierarchical' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = RELATIONSHIP
cdmFieldName = IS_HIERARCHICAL
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'RELATIONSHIP.IS_HIERARCHICAL' as violating_field, 
			cdmtable.* 
		from dataform.relationship cdmtable
		where cdmtable.is_hierarchical is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the RELATIONSHIP_CONCEPT_ID of the RELATIONSHIP.' as check_description
  ,'RELATIONSHIP' as cdm_table_name
  ,'RELATIONSHIP_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_relationship_relationship_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = RELATIONSHIP
cdmFieldName = RELATIONSHIP_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'RELATIONSHIP.RELATIONSHIP_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.relationship cdmtable
		where cdmtable.relationship_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the RELATIONSHIP_ID of the RELATIONSHIP.' as check_description
  ,'RELATIONSHIP' as cdm_table_name
  ,'RELATIONSHIP_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_relationship_relationship_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = RELATIONSHIP
cdmFieldName = RELATIONSHIP_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'RELATIONSHIP.RELATIONSHIP_ID' as violating_field, 
			cdmtable.* 
		from dataform.relationship cdmtable
		where cdmtable.relationship_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the RELATIONSHIP_NAME of the RELATIONSHIP.' as check_description
  ,'RELATIONSHIP' as cdm_table_name
  ,'RELATIONSHIP_NAME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_relationship_relationship_name' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = RELATIONSHIP
cdmFieldName = RELATIONSHIP_NAME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'RELATIONSHIP.RELATIONSHIP_NAME' as violating_field, 
			cdmtable.* 
		from dataform.relationship cdmtable
		where cdmtable.relationship_name is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the REVERSE_RELATIONSHIP_ID of the RELATIONSHIP.' as check_description
  ,'RELATIONSHIP' as cdm_table_name
  ,'REVERSE_RELATIONSHIP_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_relationship_reverse_relationship_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = RELATIONSHIP
cdmFieldName = REVERSE_RELATIONSHIP_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'RELATIONSHIP.REVERSE_RELATIONSHIP_ID' as violating_field, 
			cdmtable.* 
		from dataform.relationship cdmtable
		where cdmtable.reverse_relationship_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the INVALID_REASON of the SOURCE_TO_CONCEPT_MAP.' as check_description
  ,'SOURCE_TO_CONCEPT_MAP' as cdm_table_name
  ,'INVALID_REASON' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_source_to_concept_map_invalid_reason' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = SOURCE_TO_CONCEPT_MAP
cdmFieldName = INVALID_REASON
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'SOURCE_TO_CONCEPT_MAP.INVALID_REASON' as violating_field, 
			cdmtable.* 
		from dataform.source_to_concept_map cdmtable
		where cdmtable.invalid_reason is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the SOURCE_CODE of the SOURCE_TO_CONCEPT_MAP.' as check_description
  ,'SOURCE_TO_CONCEPT_MAP' as cdm_table_name
  ,'SOURCE_CODE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_source_to_concept_map_source_code' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = SOURCE_TO_CONCEPT_MAP
cdmFieldName = SOURCE_CODE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'SOURCE_TO_CONCEPT_MAP.SOURCE_CODE' as violating_field, 
			cdmtable.* 
		from dataform.source_to_concept_map cdmtable
		where cdmtable.source_code is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the SOURCE_CODE_DESCRIPTION of the SOURCE_TO_CONCEPT_MAP.' as check_description
  ,'SOURCE_TO_CONCEPT_MAP' as cdm_table_name
  ,'SOURCE_CODE_DESCRIPTION' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_source_to_concept_map_source_code_description' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = SOURCE_TO_CONCEPT_MAP
cdmFieldName = SOURCE_CODE_DESCRIPTION
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'SOURCE_TO_CONCEPT_MAP.SOURCE_CODE_DESCRIPTION' as violating_field, 
			cdmtable.* 
		from dataform.source_to_concept_map cdmtable
		where cdmtable.source_code_description is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the SOURCE_CONCEPT_ID of the SOURCE_TO_CONCEPT_MAP.' as check_description
  ,'SOURCE_TO_CONCEPT_MAP' as cdm_table_name
  ,'SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_source_to_concept_map_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = SOURCE_TO_CONCEPT_MAP
cdmFieldName = SOURCE_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'SOURCE_TO_CONCEPT_MAP.SOURCE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.source_to_concept_map cdmtable
		where cdmtable.source_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the SOURCE_VOCABULARY_ID of the SOURCE_TO_CONCEPT_MAP.' as check_description
  ,'SOURCE_TO_CONCEPT_MAP' as cdm_table_name
  ,'SOURCE_VOCABULARY_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_source_to_concept_map_source_vocabulary_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = SOURCE_TO_CONCEPT_MAP
cdmFieldName = SOURCE_VOCABULARY_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'SOURCE_TO_CONCEPT_MAP.SOURCE_VOCABULARY_ID' as violating_field, 
			cdmtable.* 
		from dataform.source_to_concept_map cdmtable
		where cdmtable.source_vocabulary_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the TARGET_CONCEPT_ID of the SOURCE_TO_CONCEPT_MAP.' as check_description
  ,'SOURCE_TO_CONCEPT_MAP' as cdm_table_name
  ,'TARGET_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_source_to_concept_map_target_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = SOURCE_TO_CONCEPT_MAP
cdmFieldName = TARGET_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'SOURCE_TO_CONCEPT_MAP.TARGET_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.source_to_concept_map cdmtable
		where cdmtable.target_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the TARGET_VOCABULARY_ID of the SOURCE_TO_CONCEPT_MAP.' as check_description
  ,'SOURCE_TO_CONCEPT_MAP' as cdm_table_name
  ,'TARGET_VOCABULARY_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_source_to_concept_map_target_vocabulary_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = SOURCE_TO_CONCEPT_MAP
cdmFieldName = TARGET_VOCABULARY_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'SOURCE_TO_CONCEPT_MAP.TARGET_VOCABULARY_ID' as violating_field, 
			cdmtable.* 
		from dataform.source_to_concept_map cdmtable
		where cdmtable.target_vocabulary_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VALID_END_DATE of the SOURCE_TO_CONCEPT_MAP.' as check_description
  ,'SOURCE_TO_CONCEPT_MAP' as cdm_table_name
  ,'VALID_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_source_to_concept_map_valid_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = SOURCE_TO_CONCEPT_MAP
cdmFieldName = VALID_END_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'SOURCE_TO_CONCEPT_MAP.VALID_END_DATE' as violating_field, 
			cdmtable.* 
		from dataform.source_to_concept_map cdmtable
		where cdmtable.valid_end_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VALID_START_DATE of the SOURCE_TO_CONCEPT_MAP.' as check_description
  ,'SOURCE_TO_CONCEPT_MAP' as cdm_table_name
  ,'VALID_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_source_to_concept_map_valid_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = SOURCE_TO_CONCEPT_MAP
cdmFieldName = VALID_START_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'SOURCE_TO_CONCEPT_MAP.VALID_START_DATE' as violating_field, 
			cdmtable.* 
		from dataform.source_to_concept_map cdmtable
		where cdmtable.valid_start_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the ANATOMIC_SITE_CONCEPT_ID of the SPECIMEN.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'ANATOMIC_SITE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_specimen_anatomic_site_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = SPECIMEN
cdmFieldName = ANATOMIC_SITE_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'SPECIMEN.ANATOMIC_SITE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.specimen cdmtable
		where cdmtable.anatomic_site_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the ANATOMIC_SITE_SOURCE_VALUE of the SPECIMEN.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'ANATOMIC_SITE_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_specimen_anatomic_site_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = SPECIMEN
cdmFieldName = ANATOMIC_SITE_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'SPECIMEN.ANATOMIC_SITE_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.specimen cdmtable
		where cdmtable.anatomic_site_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DISEASE_STATUS_CONCEPT_ID of the SPECIMEN.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'DISEASE_STATUS_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_specimen_disease_status_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = SPECIMEN
cdmFieldName = DISEASE_STATUS_CONCEPT_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'SPECIMEN.DISEASE_STATUS_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.specimen cdmtable
		where cdmtable.disease_status_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DISEASE_STATUS_SOURCE_VALUE of the SPECIMEN.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'DISEASE_STATUS_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_specimen_disease_status_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = SPECIMEN
cdmFieldName = DISEASE_STATUS_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'SPECIMEN.DISEASE_STATUS_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.specimen cdmtable
		where cdmtable.disease_status_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERSON_ID of the SPECIMEN.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_specimen_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = SPECIMEN
cdmFieldName = PERSON_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'SPECIMEN.PERSON_ID' as violating_field, 
			cdmtable.* 
		from dataform.specimen cdmtable
		where cdmtable.person_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the QUANTITY of the SPECIMEN.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'QUANTITY' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_specimen_quantity' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = SPECIMEN
cdmFieldName = QUANTITY
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'SPECIMEN.QUANTITY' as violating_field, 
			cdmtable.* 
		from dataform.specimen cdmtable
		where cdmtable.quantity is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the SPECIMEN_CONCEPT_ID of the SPECIMEN.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'SPECIMEN_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_specimen_specimen_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'SPECIMEN.SPECIMEN_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.specimen cdmtable
		where cdmtable.specimen_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the SPECIMEN_DATE of the SPECIMEN.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'SPECIMEN_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_specimen_specimen_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = SPECIMEN
cdmFieldName = SPECIMEN_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'SPECIMEN.SPECIMEN_DATE' as violating_field, 
			cdmtable.* 
		from dataform.specimen cdmtable
		where cdmtable.specimen_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the SPECIMEN_DATETIME of the SPECIMEN.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'SPECIMEN_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_specimen_specimen_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = SPECIMEN
cdmFieldName = SPECIMEN_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'SPECIMEN.SPECIMEN_DATETIME' as violating_field, 
			cdmtable.* 
		from dataform.specimen cdmtable
		where cdmtable.specimen_datetime is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the SPECIMEN_ID of the SPECIMEN.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'SPECIMEN_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_specimen_specimen_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = SPECIMEN
cdmFieldName = SPECIMEN_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'SPECIMEN.SPECIMEN_ID' as violating_field, 
			cdmtable.* 
		from dataform.specimen cdmtable
		where cdmtable.specimen_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the SPECIMEN_SOURCE_ID of the SPECIMEN.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'SPECIMEN_SOURCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_specimen_specimen_source_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = SPECIMEN
cdmFieldName = SPECIMEN_SOURCE_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'SPECIMEN.SPECIMEN_SOURCE_ID' as violating_field, 
			cdmtable.* 
		from dataform.specimen cdmtable
		where cdmtable.specimen_source_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the SPECIMEN_SOURCE_VALUE of the SPECIMEN.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'SPECIMEN_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_specimen_specimen_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = SPECIMEN
cdmFieldName = SPECIMEN_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'SPECIMEN.SPECIMEN_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.specimen cdmtable
		where cdmtable.specimen_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the SPECIMEN_TYPE_CONCEPT_ID of the SPECIMEN.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'SPECIMEN_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_specimen_specimen_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'SPECIMEN.SPECIMEN_TYPE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.specimen cdmtable
		where cdmtable.specimen_type_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the UNIT_CONCEPT_ID of the SPECIMEN.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_specimen_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'SPECIMEN.UNIT_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.specimen cdmtable
		where cdmtable.unit_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the UNIT_SOURCE_VALUE of the SPECIMEN.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'UNIT_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_specimen_unit_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = SPECIMEN
cdmFieldName = UNIT_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'SPECIMEN.UNIT_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.specimen cdmtable
		where cdmtable.unit_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the ADMITTED_FROM_CONCEPT_ID of the VISIT_DETAIL.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'ADMITTED_FROM_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_visit_detail_admitted_from_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'VISIT_DETAIL.ADMITTED_FROM_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.visit_detail cdmtable
		where cdmtable.admitted_from_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the ADMITTED_FROM_SOURCE_VALUE of the VISIT_DETAIL.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'ADMITTED_FROM_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_visit_detail_admitted_from_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = ADMITTED_FROM_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'VISIT_DETAIL.ADMITTED_FROM_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.visit_detail cdmtable
		where cdmtable.admitted_from_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CARE_SITE_ID of the VISIT_DETAIL.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'CARE_SITE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_visit_detail_care_site_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = CARE_SITE_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'VISIT_DETAIL.CARE_SITE_ID' as violating_field, 
			cdmtable.* 
		from dataform.visit_detail cdmtable
		where cdmtable.care_site_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DISCHARGED_TO_CONCEPT_ID of the VISIT_DETAIL.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'DISCHARGED_TO_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_visit_detail_discharged_to_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'VISIT_DETAIL.DISCHARGED_TO_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.visit_detail cdmtable
		where cdmtable.discharged_to_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DISCHARGED_TO_SOURCE_VALUE of the VISIT_DETAIL.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'DISCHARGED_TO_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_visit_detail_discharged_to_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = DISCHARGED_TO_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'VISIT_DETAIL.DISCHARGED_TO_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.visit_detail cdmtable
		where cdmtable.discharged_to_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PARENT_VISIT_DETAIL_ID of the VISIT_DETAIL.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'PARENT_VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_visit_detail_parent_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = PARENT_VISIT_DETAIL_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'VISIT_DETAIL.PARENT_VISIT_DETAIL_ID' as violating_field, 
			cdmtable.* 
		from dataform.visit_detail cdmtable
		where cdmtable.parent_visit_detail_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERSON_ID of the VISIT_DETAIL.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_visit_detail_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = PERSON_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'VISIT_DETAIL.PERSON_ID' as violating_field, 
			cdmtable.* 
		from dataform.visit_detail cdmtable
		where cdmtable.person_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PRECEDING_VISIT_DETAIL_ID of the VISIT_DETAIL.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'PRECEDING_VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_visit_detail_preceding_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = PRECEDING_VISIT_DETAIL_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'VISIT_DETAIL.PRECEDING_VISIT_DETAIL_ID' as violating_field, 
			cdmtable.* 
		from dataform.visit_detail cdmtable
		where cdmtable.preceding_visit_detail_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PROVIDER_ID of the VISIT_DETAIL.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_visit_detail_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = PROVIDER_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'VISIT_DETAIL.PROVIDER_ID' as violating_field, 
			cdmtable.* 
		from dataform.visit_detail cdmtable
		where cdmtable.provider_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_DETAIL_CONCEPT_ID of the VISIT_DETAIL.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_visit_detail_visit_detail_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'VISIT_DETAIL.VISIT_DETAIL_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.visit_detail cdmtable
		where cdmtable.visit_detail_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_DETAIL_END_DATE of the VISIT_DETAIL.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_visit_detail_visit_detail_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_DETAIL_END_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'VISIT_DETAIL.VISIT_DETAIL_END_DATE' as violating_field, 
			cdmtable.* 
		from dataform.visit_detail cdmtable
		where cdmtable.visit_detail_end_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_DETAIL_END_DATETIME of the VISIT_DETAIL.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_END_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_visit_detail_visit_detail_end_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_DETAIL_END_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'VISIT_DETAIL.VISIT_DETAIL_END_DATETIME' as violating_field, 
			cdmtable.* 
		from dataform.visit_detail cdmtable
		where cdmtable.visit_detail_end_datetime is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_DETAIL_ID of the VISIT_DETAIL.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_visit_detail_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_DETAIL_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'VISIT_DETAIL.VISIT_DETAIL_ID' as violating_field, 
			cdmtable.* 
		from dataform.visit_detail cdmtable
		where cdmtable.visit_detail_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_DETAIL_SOURCE_CONCEPT_ID of the VISIT_DETAIL.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_visit_detail_visit_detail_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'VISIT_DETAIL.VISIT_DETAIL_SOURCE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.visit_detail cdmtable
		where cdmtable.visit_detail_source_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_DETAIL_SOURCE_VALUE of the VISIT_DETAIL.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_visit_detail_visit_detail_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_DETAIL_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'VISIT_DETAIL.VISIT_DETAIL_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.visit_detail cdmtable
		where cdmtable.visit_detail_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_DETAIL_START_DATE of the VISIT_DETAIL.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_visit_detail_visit_detail_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_DETAIL_START_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'VISIT_DETAIL.VISIT_DETAIL_START_DATE' as violating_field, 
			cdmtable.* 
		from dataform.visit_detail cdmtable
		where cdmtable.visit_detail_start_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_DETAIL_START_DATETIME of the VISIT_DETAIL.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_START_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_visit_detail_visit_detail_start_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_DETAIL_START_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'VISIT_DETAIL.VISIT_DETAIL_START_DATETIME' as violating_field, 
			cdmtable.* 
		from dataform.visit_detail cdmtable
		where cdmtable.visit_detail_start_datetime is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_DETAIL_TYPE_CONCEPT_ID of the VISIT_DETAIL.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_visit_detail_visit_detail_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'VISIT_DETAIL.VISIT_DETAIL_TYPE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.visit_detail cdmtable
		where cdmtable.visit_detail_type_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_OCCURRENCE_ID of the VISIT_DETAIL.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_visit_detail_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_OCCURRENCE_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'VISIT_DETAIL.VISIT_OCCURRENCE_ID' as violating_field, 
			cdmtable.* 
		from dataform.visit_detail cdmtable
		where cdmtable.visit_occurrence_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the ADMITTED_FROM_CONCEPT_ID of the VISIT_OCCURRENCE.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'ADMITTED_FROM_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_visit_occurrence_admitted_from_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'VISIT_OCCURRENCE.ADMITTED_FROM_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.visit_occurrence cdmtable
		where cdmtable.admitted_from_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the ADMITTED_FROM_SOURCE_VALUE of the VISIT_OCCURRENCE.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'ADMITTED_FROM_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_visit_occurrence_admitted_from_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = ADMITTED_FROM_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'VISIT_OCCURRENCE.ADMITTED_FROM_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.visit_occurrence cdmtable
		where cdmtable.admitted_from_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CARE_SITE_ID of the VISIT_OCCURRENCE.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'CARE_SITE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_visit_occurrence_care_site_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = CARE_SITE_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'VISIT_OCCURRENCE.CARE_SITE_ID' as violating_field, 
			cdmtable.* 
		from dataform.visit_occurrence cdmtable
		where cdmtable.care_site_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DISCHARGED_TO_CONCEPT_ID of the VISIT_OCCURRENCE.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'DISCHARGED_TO_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_visit_occurrence_discharged_to_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'VISIT_OCCURRENCE.DISCHARGED_TO_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.visit_occurrence cdmtable
		where cdmtable.discharged_to_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DISCHARGED_TO_SOURCE_VALUE of the VISIT_OCCURRENCE.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'DISCHARGED_TO_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_visit_occurrence_discharged_to_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = DISCHARGED_TO_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'VISIT_OCCURRENCE.DISCHARGED_TO_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.visit_occurrence cdmtable
		where cdmtable.discharged_to_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERSON_ID of the VISIT_OCCURRENCE.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_visit_occurrence_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = PERSON_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'VISIT_OCCURRENCE.PERSON_ID' as violating_field, 
			cdmtable.* 
		from dataform.visit_occurrence cdmtable
		where cdmtable.person_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PRECEDING_VISIT_OCCURRENCE_ID of the VISIT_OCCURRENCE.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'PRECEDING_VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_visit_occurrence_preceding_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = PRECEDING_VISIT_OCCURRENCE_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'VISIT_OCCURRENCE.PRECEDING_VISIT_OCCURRENCE_ID' as violating_field, 
			cdmtable.* 
		from dataform.visit_occurrence cdmtable
		where cdmtable.preceding_visit_occurrence_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PROVIDER_ID of the VISIT_OCCURRENCE.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_visit_occurrence_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = PROVIDER_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'VISIT_OCCURRENCE.PROVIDER_ID' as violating_field, 
			cdmtable.* 
		from dataform.visit_occurrence cdmtable
		where cdmtable.provider_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_CONCEPT_ID of the VISIT_OCCURRENCE.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_visit_occurrence_visit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'VISIT_OCCURRENCE.VISIT_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.visit_occurrence cdmtable
		where cdmtable.visit_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_END_DATE of the VISIT_OCCURRENCE.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_visit_occurrence_visit_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = VISIT_END_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'VISIT_OCCURRENCE.VISIT_END_DATE' as violating_field, 
			cdmtable.* 
		from dataform.visit_occurrence cdmtable
		where cdmtable.visit_end_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_END_DATETIME of the VISIT_OCCURRENCE.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_END_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_visit_occurrence_visit_end_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = VISIT_END_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'VISIT_OCCURRENCE.VISIT_END_DATETIME' as violating_field, 
			cdmtable.* 
		from dataform.visit_occurrence cdmtable
		where cdmtable.visit_end_datetime is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_OCCURRENCE_ID of the VISIT_OCCURRENCE.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_visit_occurrence_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = VISIT_OCCURRENCE_ID
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'VISIT_OCCURRENCE.VISIT_OCCURRENCE_ID' as violating_field, 
			cdmtable.* 
		from dataform.visit_occurrence cdmtable
		where cdmtable.visit_occurrence_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_SOURCE_CONCEPT_ID of the VISIT_OCCURRENCE.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_visit_occurrence_visit_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'VISIT_OCCURRENCE.VISIT_SOURCE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.visit_occurrence cdmtable
		where cdmtable.visit_source_concept_id is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_SOURCE_VALUE of the VISIT_OCCURRENCE.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_SOURCE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_visit_occurrence_visit_source_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = VISIT_SOURCE_VALUE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'VISIT_OCCURRENCE.VISIT_SOURCE_VALUE' as violating_field, 
			cdmtable.* 
		from dataform.visit_occurrence cdmtable
		where cdmtable.visit_source_value is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_START_DATE of the VISIT_OCCURRENCE.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_visit_occurrence_visit_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = VISIT_START_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'VISIT_OCCURRENCE.VISIT_START_DATE' as violating_field, 
			cdmtable.* 
		from dataform.visit_occurrence cdmtable
		where cdmtable.visit_start_date is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_START_DATETIME of the VISIT_OCCURRENCE.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_START_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_visit_occurrence_visit_start_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = VISIT_START_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'VISIT_OCCURRENCE.VISIT_START_DATETIME' as violating_field, 
			cdmtable.* 
		from dataform.visit_occurrence cdmtable
		where cdmtable.visit_start_datetime is null
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
  ,'measureValueCompleteness' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_TYPE_CONCEPT_ID of the VISIT_OCCURRENCE.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_measure_value_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_measurevaluecompleteness_visit_occurrence_visit_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field
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
from
(
	select 
		count(violated_rows.violating_field) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			'VISIT_OCCURRENCE.VISIT_TYPE_CONCEPT_ID' as violating_field, 
			cdmtable.* 
		from dataform.visit_occurrence cdmtable
		where cdmtable.visit_type_concept_id is null
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

