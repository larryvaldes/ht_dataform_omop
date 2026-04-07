/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the CARE_SITE_ID in the CARE_SITE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'CARE_SITE' as cdm_table_name
  ,'CARE_SITE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_care_site_care_site_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.care_site_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.care_site_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.care_site_id) as string),'.') != 0))
			and cdmtable.care_site_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.care_site
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the LOCATION_ID in the CARE_SITE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'CARE_SITE' as cdm_table_name
  ,'LOCATION_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_care_site_location_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.location_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.location_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.location_id) as string),'.') != 0))
			and cdmtable.location_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.care_site
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PLACE_OF_SERVICE_CONCEPT_ID in the CARE_SITE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'CARE_SITE' as cdm_table_name
  ,'PLACE_OF_SERVICE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_care_site_place_of_service_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.place_of_service_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.place_of_service_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.place_of_service_concept_id) as string),'.') != 0))
			and cdmtable.place_of_service_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.care_site
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the CDM_VERSION_CONCEPT_ID in the CDM_SOURCE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'CDM_SOURCE' as cdm_table_name
  ,'CDM_VERSION_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_cdm_source_cdm_version_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.cdm_version_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.cdm_version_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.cdm_version_concept_id) as string),'.') != 0))
			and cdmtable.cdm_version_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.cdm_source
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the COHORT_DEFINITION_ID in the COHORT is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'COHORT' as cdm_table_name
  ,'COHORT_DEFINITION_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_cohort_cohort_definition_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.cohort_definition_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.cohort_definition_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.cohort_definition_id) as string),'.') != 0))
			and cdmtable.cohort_definition_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.cohort
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the SUBJECT_ID in the COHORT is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'COHORT' as cdm_table_name
  ,'SUBJECT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_cohort_subject_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.subject_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.subject_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.subject_id) as string),'.') != 0))
			and cdmtable.subject_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.cohort
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the COHORT_DEFINITION_ID in the COHORT_DEFINITION is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'COHORT_DEFINITION' as cdm_table_name
  ,'COHORT_DEFINITION_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_cohort_definition_cohort_definition_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.cohort_definition_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.cohort_definition_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.cohort_definition_id) as string),'.') != 0))
			and cdmtable.cohort_definition_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.cohort_definition
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the DEFINITION_TYPE_CONCEPT_ID in the COHORT_DEFINITION is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'COHORT_DEFINITION' as cdm_table_name
  ,'DEFINITION_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_cohort_definition_definition_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.definition_type_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.definition_type_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.definition_type_concept_id) as string),'.') != 0))
			and cdmtable.definition_type_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.cohort_definition
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the SUBJECT_CONCEPT_ID in the COHORT_DEFINITION is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'COHORT_DEFINITION' as cdm_table_name
  ,'SUBJECT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_cohort_definition_subject_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.subject_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.subject_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.subject_concept_id) as string),'.') != 0))
			and cdmtable.subject_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.cohort_definition
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the CONCEPT_ID in the CONCEPT_SYNONYM is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'CONCEPT_SYNONYM' as cdm_table_name
  ,'CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_concept_synonym_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.concept_id) as string),'.') != 0))
			and cdmtable.concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.concept_synonym
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the LANGUAGE_CONCEPT_ID in the CONCEPT_SYNONYM is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'CONCEPT_SYNONYM' as cdm_table_name
  ,'LANGUAGE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_concept_synonym_language_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.language_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.language_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.language_concept_id) as string),'.') != 0))
			and cdmtable.language_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.concept_synonym
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the CONDITION_CONCEPT_ID in the CONDITION_ERA is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'CONDITION_ERA' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_condition_era_condition_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.condition_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.condition_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.condition_concept_id) as string),'.') != 0))
			and cdmtable.condition_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_era
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the CONDITION_ERA_ID in the CONDITION_ERA is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'CONDITION_ERA' as cdm_table_name
  ,'CONDITION_ERA_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_condition_era_condition_era_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.condition_era_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.condition_era_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.condition_era_id) as string),'.') != 0))
			and cdmtable.condition_era_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_era
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the CONDITION_OCCURRENCE_COUNT in the CONDITION_ERA is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'CONDITION_ERA' as cdm_table_name
  ,'CONDITION_OCCURRENCE_COUNT' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_condition_era_condition_occurrence_count' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.condition_occurrence_count as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.condition_occurrence_count as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.condition_occurrence_count) as string),'.') != 0))
			and cdmtable.condition_occurrence_count is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_era
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PERSON_ID in the CONDITION_ERA is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'CONDITION_ERA' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_condition_era_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.person_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.person_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.person_id) as string),'.') != 0))
			and cdmtable.person_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_era
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the CONDITION_CONCEPT_ID in the CONDITION_OCCURRENCE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_condition_occurrence_condition_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.condition_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.condition_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.condition_concept_id) as string),'.') != 0))
			and cdmtable.condition_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the CONDITION_OCCURRENCE_ID in the CONDITION_OCCURRENCE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_condition_occurrence_condition_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.condition_occurrence_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.condition_occurrence_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.condition_occurrence_id) as string),'.') != 0))
			and cdmtable.condition_occurrence_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the CONDITION_SOURCE_CONCEPT_ID in the CONDITION_OCCURRENCE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_condition_occurrence_condition_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.condition_source_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.condition_source_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.condition_source_concept_id) as string),'.') != 0))
			and cdmtable.condition_source_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the CONDITION_STATUS_CONCEPT_ID in the CONDITION_OCCURRENCE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_STATUS_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_condition_occurrence_condition_status_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.condition_status_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.condition_status_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.condition_status_concept_id) as string),'.') != 0))
			and cdmtable.condition_status_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the CONDITION_TYPE_CONCEPT_ID in the CONDITION_OCCURRENCE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_condition_occurrence_condition_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.condition_type_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.condition_type_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.condition_type_concept_id) as string),'.') != 0))
			and cdmtable.condition_type_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PERSON_ID in the CONDITION_OCCURRENCE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_condition_occurrence_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.person_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.person_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.person_id) as string),'.') != 0))
			and cdmtable.person_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PROVIDER_ID in the CONDITION_OCCURRENCE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_condition_occurrence_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.provider_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.provider_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.provider_id) as string),'.') != 0))
			and cdmtable.provider_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the VISIT_DETAIL_ID in the CONDITION_OCCURRENCE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_condition_occurrence_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.visit_detail_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.visit_detail_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.visit_detail_id) as string),'.') != 0))
			and cdmtable.visit_detail_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the VISIT_OCCURRENCE_ID in the CONDITION_OCCURRENCE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_condition_occurrence_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.visit_occurrence_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.visit_occurrence_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.visit_occurrence_id) as string),'.') != 0))
			and cdmtable.visit_occurrence_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the COST_EVENT_ID in the COST is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'COST' as cdm_table_name
  ,'COST_EVENT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_cost_cost_event_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.cost_event_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.cost_event_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.cost_event_id) as string),'.') != 0))
			and cdmtable.cost_event_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.cost
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the COST_ID in the COST is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'COST' as cdm_table_name
  ,'COST_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_cost_cost_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.cost_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.cost_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.cost_id) as string),'.') != 0))
			and cdmtable.cost_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.cost
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the COST_TYPE_CONCEPT_ID in the COST is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'COST' as cdm_table_name
  ,'COST_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_cost_cost_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.cost_type_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.cost_type_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.cost_type_concept_id) as string),'.') != 0))
			and cdmtable.cost_type_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.cost
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the CURRENCY_CONCEPT_ID in the COST is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'COST' as cdm_table_name
  ,'CURRENCY_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_cost_currency_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.currency_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.currency_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.currency_concept_id) as string),'.') != 0))
			and cdmtable.currency_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.cost
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the DRG_CONCEPT_ID in the COST is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'COST' as cdm_table_name
  ,'DRG_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_cost_drg_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.drg_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.drg_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.drg_concept_id) as string),'.') != 0))
			and cdmtable.drg_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.cost
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PAYER_PLAN_PERIOD_ID in the COST is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'COST' as cdm_table_name
  ,'PAYER_PLAN_PERIOD_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_cost_payer_plan_period_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.payer_plan_period_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.payer_plan_period_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.payer_plan_period_id) as string),'.') != 0))
			and cdmtable.payer_plan_period_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.cost
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the REVENUE_CODE_CONCEPT_ID in the COST is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'COST' as cdm_table_name
  ,'REVENUE_CODE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_cost_revenue_code_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.revenue_code_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.revenue_code_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.revenue_code_concept_id) as string),'.') != 0))
			and cdmtable.revenue_code_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.cost
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the CAUSE_CONCEPT_ID in the DEATH is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DEATH' as cdm_table_name
  ,'CAUSE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_death_cause_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.cause_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.cause_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.cause_concept_id) as string),'.') != 0))
			and cdmtable.cause_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.death
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the CAUSE_SOURCE_CONCEPT_ID in the DEATH is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DEATH' as cdm_table_name
  ,'CAUSE_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_death_cause_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.cause_source_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.cause_source_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.cause_source_concept_id) as string),'.') != 0))
			and cdmtable.cause_source_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.death
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the DEATH_TYPE_CONCEPT_ID in the DEATH is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DEATH' as cdm_table_name
  ,'DEATH_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_death_death_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.death_type_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.death_type_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.death_type_concept_id) as string),'.') != 0))
			and cdmtable.death_type_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.death
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PERSON_ID in the DEATH is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DEATH' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_death_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.person_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.person_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.person_id) as string),'.') != 0))
			and cdmtable.person_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.death
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the DEVICE_CONCEPT_ID in the DEVICE_EXPOSURE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_device_exposure_device_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.device_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.device_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.device_concept_id) as string),'.') != 0))
			and cdmtable.device_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.device_exposure
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the DEVICE_EXPOSURE_ID in the DEVICE_EXPOSURE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_EXPOSURE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_device_exposure_device_exposure_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.device_exposure_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.device_exposure_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.device_exposure_id) as string),'.') != 0))
			and cdmtable.device_exposure_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.device_exposure
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the DEVICE_SOURCE_CONCEPT_ID in the DEVICE_EXPOSURE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_device_exposure_device_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.device_source_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.device_source_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.device_source_concept_id) as string),'.') != 0))
			and cdmtable.device_source_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.device_exposure
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the DEVICE_TYPE_CONCEPT_ID in the DEVICE_EXPOSURE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_device_exposure_device_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.device_type_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.device_type_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.device_type_concept_id) as string),'.') != 0))
			and cdmtable.device_type_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.device_exposure
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PERSON_ID in the DEVICE_EXPOSURE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_device_exposure_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.person_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.person_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.person_id) as string),'.') != 0))
			and cdmtable.person_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.device_exposure
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PROVIDER_ID in the DEVICE_EXPOSURE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_device_exposure_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.provider_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.provider_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.provider_id) as string),'.') != 0))
			and cdmtable.provider_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.device_exposure
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the QUANTITY in the DEVICE_EXPOSURE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'QUANTITY' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_device_exposure_quantity' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.quantity as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.quantity as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.quantity) as string),'.') != 0))
			and cdmtable.quantity is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.device_exposure
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the UNIT_CONCEPT_ID in the DEVICE_EXPOSURE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_device_exposure_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.unit_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.unit_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.unit_concept_id) as string),'.') != 0))
			and cdmtable.unit_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.device_exposure
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the UNIT_SOURCE_CONCEPT_ID in the DEVICE_EXPOSURE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'UNIT_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_device_exposure_unit_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.unit_source_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.unit_source_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.unit_source_concept_id) as string),'.') != 0))
			and cdmtable.unit_source_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.device_exposure
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the VISIT_DETAIL_ID in the DEVICE_EXPOSURE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_device_exposure_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.visit_detail_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.visit_detail_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.visit_detail_id) as string),'.') != 0))
			and cdmtable.visit_detail_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.device_exposure
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the VISIT_OCCURRENCE_ID in the DEVICE_EXPOSURE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_device_exposure_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.visit_occurrence_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.visit_occurrence_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.visit_occurrence_id) as string),'.') != 0))
			and cdmtable.visit_occurrence_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.device_exposure
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the DOMAIN_CONCEPT_ID in the DOMAIN is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DOMAIN' as cdm_table_name
  ,'DOMAIN_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_domain_domain_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.domain_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.domain_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.domain_concept_id) as string),'.') != 0))
			and cdmtable.domain_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.domain
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the DOSE_ERA_ID in the DOSE_ERA is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'DOSE_ERA_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_dose_era_dose_era_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.dose_era_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.dose_era_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.dose_era_id) as string),'.') != 0))
			and cdmtable.dose_era_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.dose_era
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the DRUG_CONCEPT_ID in the DOSE_ERA is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'DRUG_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_dose_era_drug_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.drug_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.drug_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.drug_concept_id) as string),'.') != 0))
			and cdmtable.drug_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.dose_era
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PERSON_ID in the DOSE_ERA is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_dose_era_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.person_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.person_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.person_id) as string),'.') != 0))
			and cdmtable.person_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.dose_era
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the UNIT_CONCEPT_ID in the DOSE_ERA is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_dose_era_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.unit_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.unit_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.unit_concept_id) as string),'.') != 0))
			and cdmtable.unit_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.dose_era
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the DRUG_CONCEPT_ID in the DRUG_ERA is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DRUG_ERA' as cdm_table_name
  ,'DRUG_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_drug_era_drug_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.drug_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.drug_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.drug_concept_id) as string),'.') != 0))
			and cdmtable.drug_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.drug_era
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the DRUG_ERA_ID in the DRUG_ERA is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DRUG_ERA' as cdm_table_name
  ,'DRUG_ERA_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_drug_era_drug_era_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.drug_era_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.drug_era_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.drug_era_id) as string),'.') != 0))
			and cdmtable.drug_era_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.drug_era
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the DRUG_EXPOSURE_COUNT in the DRUG_ERA is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DRUG_ERA' as cdm_table_name
  ,'DRUG_EXPOSURE_COUNT' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_drug_era_drug_exposure_count' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.drug_exposure_count as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.drug_exposure_count as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.drug_exposure_count) as string),'.') != 0))
			and cdmtable.drug_exposure_count is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.drug_era
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the GAP_DAYS in the DRUG_ERA is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DRUG_ERA' as cdm_table_name
  ,'GAP_DAYS' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_drug_era_gap_days' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.gap_days as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.gap_days as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.gap_days) as string),'.') != 0))
			and cdmtable.gap_days is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.drug_era
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PERSON_ID in the DRUG_ERA is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DRUG_ERA' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_drug_era_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.person_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.person_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.person_id) as string),'.') != 0))
			and cdmtable.person_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.drug_era
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the DAYS_SUPPLY in the DRUG_EXPOSURE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DAYS_SUPPLY' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_drug_exposure_days_supply' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.days_supply as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.days_supply as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.days_supply) as string),'.') != 0))
			and cdmtable.days_supply is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.drug_exposure
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the DRUG_CONCEPT_ID in the DRUG_EXPOSURE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_drug_exposure_drug_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.drug_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.drug_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.drug_concept_id) as string),'.') != 0))
			and cdmtable.drug_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.drug_exposure
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the DRUG_EXPOSURE_ID in the DRUG_EXPOSURE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_EXPOSURE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_drug_exposure_drug_exposure_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.drug_exposure_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.drug_exposure_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.drug_exposure_id) as string),'.') != 0))
			and cdmtable.drug_exposure_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.drug_exposure
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the DRUG_SOURCE_CONCEPT_ID in the DRUG_EXPOSURE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_drug_exposure_drug_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.drug_source_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.drug_source_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.drug_source_concept_id) as string),'.') != 0))
			and cdmtable.drug_source_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.drug_exposure
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the DRUG_TYPE_CONCEPT_ID in the DRUG_EXPOSURE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_drug_exposure_drug_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.drug_type_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.drug_type_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.drug_type_concept_id) as string),'.') != 0))
			and cdmtable.drug_type_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.drug_exposure
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PERSON_ID in the DRUG_EXPOSURE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_drug_exposure_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.person_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.person_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.person_id) as string),'.') != 0))
			and cdmtable.person_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.drug_exposure
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PROVIDER_ID in the DRUG_EXPOSURE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_drug_exposure_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.provider_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.provider_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.provider_id) as string),'.') != 0))
			and cdmtable.provider_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.drug_exposure
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the REFILLS in the DRUG_EXPOSURE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'REFILLS' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_drug_exposure_refills' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.refills as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.refills as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.refills) as string),'.') != 0))
			and cdmtable.refills is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.drug_exposure
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the ROUTE_CONCEPT_ID in the DRUG_EXPOSURE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'ROUTE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_drug_exposure_route_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.route_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.route_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.route_concept_id) as string),'.') != 0))
			and cdmtable.route_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.drug_exposure
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the VISIT_DETAIL_ID in the DRUG_EXPOSURE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_drug_exposure_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.visit_detail_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.visit_detail_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.visit_detail_id) as string),'.') != 0))
			and cdmtable.visit_detail_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.drug_exposure
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the VISIT_OCCURRENCE_ID in the DRUG_EXPOSURE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_drug_exposure_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.visit_occurrence_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.visit_occurrence_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.visit_occurrence_id) as string),'.') != 0))
			and cdmtable.visit_occurrence_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.drug_exposure
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the AMOUNT_UNIT_CONCEPT_ID in the DRUG_STRENGTH is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'AMOUNT_UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_drug_strength_amount_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.amount_unit_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.amount_unit_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.amount_unit_concept_id) as string),'.') != 0))
			and cdmtable.amount_unit_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.drug_strength
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the BOX_SIZE in the DRUG_STRENGTH is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'BOX_SIZE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_drug_strength_box_size' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.box_size as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.box_size as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.box_size) as string),'.') != 0))
			and cdmtable.box_size is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.drug_strength
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the DENOMINATOR_UNIT_CONCEPT_ID in the DRUG_STRENGTH is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'DENOMINATOR_UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_drug_strength_denominator_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.denominator_unit_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.denominator_unit_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.denominator_unit_concept_id) as string),'.') != 0))
			and cdmtable.denominator_unit_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.drug_strength
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the DRUG_CONCEPT_ID in the DRUG_STRENGTH is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'DRUG_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_drug_strength_drug_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.drug_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.drug_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.drug_concept_id) as string),'.') != 0))
			and cdmtable.drug_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.drug_strength
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the INGREDIENT_CONCEPT_ID in the DRUG_STRENGTH is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'INGREDIENT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_drug_strength_ingredient_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.ingredient_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.ingredient_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.ingredient_concept_id) as string),'.') != 0))
			and cdmtable.ingredient_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.drug_strength
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the NUMERATOR_UNIT_CONCEPT_ID in the DRUG_STRENGTH is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'NUMERATOR_UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_drug_strength_numerator_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.numerator_unit_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.numerator_unit_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.numerator_unit_concept_id) as string),'.') != 0))
			and cdmtable.numerator_unit_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.drug_strength
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the EPISODE_CONCEPT_ID in the EPISODE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_episode_episode_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.episode_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.episode_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.episode_concept_id) as string),'.') != 0))
			and cdmtable.episode_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.episode
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the EPISODE_NUMBER in the EPISODE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_NUMBER' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_episode_episode_number' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.episode_number as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.episode_number as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.episode_number) as string),'.') != 0))
			and cdmtable.episode_number is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.episode
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the EPISODE_OBJECT_CONCEPT_ID in the EPISODE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_OBJECT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_episode_episode_object_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.episode_object_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.episode_object_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.episode_object_concept_id) as string),'.') != 0))
			and cdmtable.episode_object_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.episode
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the EPISODE_SOURCE_CONCEPT_ID in the EPISODE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_episode_episode_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.episode_source_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.episode_source_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.episode_source_concept_id) as string),'.') != 0))
			and cdmtable.episode_source_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.episode
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the EPISODE_TYPE_CONCEPT_ID in the EPISODE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_episode_episode_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.episode_type_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.episode_type_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.episode_type_concept_id) as string),'.') != 0))
			and cdmtable.episode_type_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.episode
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the EPISODE_EVENT_FIELD_CONCEPT_ID in the EPISODE_EVENT is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'EPISODE_EVENT' as cdm_table_name
  ,'EPISODE_EVENT_FIELD_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_episode_event_episode_event_field_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.episode_event_field_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.episode_event_field_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.episode_event_field_concept_id) as string),'.') != 0))
			and cdmtable.episode_event_field_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.episode_event
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the DOMAIN_CONCEPT_ID_1 in the FACT_RELATIONSHIP is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'FACT_RELATIONSHIP' as cdm_table_name
  ,'DOMAIN_CONCEPT_ID_1' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_fact_relationship_domain_concept_id_1' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.domain_concept_id_1 as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.domain_concept_id_1 as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.domain_concept_id_1) as string),'.') != 0))
			and cdmtable.domain_concept_id_1 is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.fact_relationship
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the DOMAIN_CONCEPT_ID_2 in the FACT_RELATIONSHIP is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'FACT_RELATIONSHIP' as cdm_table_name
  ,'DOMAIN_CONCEPT_ID_2' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_fact_relationship_domain_concept_id_2' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.domain_concept_id_2 as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.domain_concept_id_2 as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.domain_concept_id_2) as string),'.') != 0))
			and cdmtable.domain_concept_id_2 is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.fact_relationship
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the FACT_ID_1 in the FACT_RELATIONSHIP is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'FACT_RELATIONSHIP' as cdm_table_name
  ,'FACT_ID_1' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_fact_relationship_fact_id_1' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.fact_id_1 as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.fact_id_1 as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.fact_id_1) as string),'.') != 0))
			and cdmtable.fact_id_1 is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.fact_relationship
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the FACT_ID_2 in the FACT_RELATIONSHIP is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'FACT_RELATIONSHIP' as cdm_table_name
  ,'FACT_ID_2' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_fact_relationship_fact_id_2' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.fact_id_2 as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.fact_id_2 as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.fact_id_2) as string),'.') != 0))
			and cdmtable.fact_id_2 is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.fact_relationship
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the RELATIONSHIP_CONCEPT_ID in the FACT_RELATIONSHIP is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'FACT_RELATIONSHIP' as cdm_table_name
  ,'RELATIONSHIP_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_fact_relationship_relationship_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.relationship_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.relationship_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.relationship_concept_id) as string),'.') != 0))
			and cdmtable.relationship_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.fact_relationship
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the COUNTRY_CONCEPT_ID in the LOCATION is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'LOCATION' as cdm_table_name
  ,'COUNTRY_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_location_country_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.country_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.country_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.country_concept_id) as string),'.') != 0))
			and cdmtable.country_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.location
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the LOCATION_ID in the LOCATION is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'LOCATION' as cdm_table_name
  ,'LOCATION_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_location_location_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.location_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.location_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.location_id) as string),'.') != 0))
			and cdmtable.location_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.location
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the MEAS_EVENT_FIELD_CONCEPT_ID in the MEASUREMENT is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEAS_EVENT_FIELD_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_measurement_meas_event_field_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.meas_event_field_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.meas_event_field_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.meas_event_field_concept_id) as string),'.') != 0))
			and cdmtable.meas_event_field_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.measurement
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the MEASUREMENT_CONCEPT_ID in the MEASUREMENT is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_measurement_measurement_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.measurement_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.measurement_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.measurement_concept_id) as string),'.') != 0))
			and cdmtable.measurement_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.measurement
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the MEASUREMENT_ID in the MEASUREMENT is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_measurement_measurement_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.measurement_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.measurement_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.measurement_id) as string),'.') != 0))
			and cdmtable.measurement_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.measurement
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the MEASUREMENT_SOURCE_CONCEPT_ID in the MEASUREMENT is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_measurement_measurement_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.measurement_source_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.measurement_source_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.measurement_source_concept_id) as string),'.') != 0))
			and cdmtable.measurement_source_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.measurement
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the MEASUREMENT_TYPE_CONCEPT_ID in the MEASUREMENT is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_measurement_measurement_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.measurement_type_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.measurement_type_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.measurement_type_concept_id) as string),'.') != 0))
			and cdmtable.measurement_type_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.measurement
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the OPERATOR_CONCEPT_ID in the MEASUREMENT is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'OPERATOR_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_measurement_operator_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.operator_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.operator_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.operator_concept_id) as string),'.') != 0))
			and cdmtable.operator_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.measurement
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PERSON_ID in the MEASUREMENT is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_measurement_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.person_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.person_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.person_id) as string),'.') != 0))
			and cdmtable.person_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.measurement
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PROVIDER_ID in the MEASUREMENT is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_measurement_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.provider_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.provider_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.provider_id) as string),'.') != 0))
			and cdmtable.provider_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.measurement
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the UNIT_CONCEPT_ID in the MEASUREMENT is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_measurement_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.unit_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.unit_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.unit_concept_id) as string),'.') != 0))
			and cdmtable.unit_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.measurement
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the UNIT_SOURCE_CONCEPT_ID in the MEASUREMENT is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'UNIT_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_measurement_unit_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.unit_source_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.unit_source_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.unit_source_concept_id) as string),'.') != 0))
			and cdmtable.unit_source_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.measurement
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the VALUE_AS_CONCEPT_ID in the MEASUREMENT is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'VALUE_AS_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_measurement_value_as_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.value_as_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.value_as_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.value_as_concept_id) as string),'.') != 0))
			and cdmtable.value_as_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.measurement
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the VISIT_DETAIL_ID in the MEASUREMENT is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_measurement_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.visit_detail_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.visit_detail_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.visit_detail_id) as string),'.') != 0))
			and cdmtable.visit_detail_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.measurement
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the VISIT_OCCURRENCE_ID in the MEASUREMENT is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_measurement_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.visit_occurrence_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.visit_occurrence_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.visit_occurrence_id) as string),'.') != 0))
			and cdmtable.visit_occurrence_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.measurement
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the METADATA_CONCEPT_ID in the METADATA is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'METADATA' as cdm_table_name
  ,'METADATA_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_metadata_metadata_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.metadata_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.metadata_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.metadata_concept_id) as string),'.') != 0))
			and cdmtable.metadata_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.metadata
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the METADATA_ID in the METADATA is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'METADATA' as cdm_table_name
  ,'METADATA_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_metadata_metadata_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.metadata_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.metadata_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.metadata_id) as string),'.') != 0))
			and cdmtable.metadata_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.metadata
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the METADATA_TYPE_CONCEPT_ID in the METADATA is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'METADATA' as cdm_table_name
  ,'METADATA_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_metadata_metadata_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.metadata_type_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.metadata_type_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.metadata_type_concept_id) as string),'.') != 0))
			and cdmtable.metadata_type_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.metadata
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the VALUE_AS_CONCEPT_ID in the METADATA is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'METADATA' as cdm_table_name
  ,'VALUE_AS_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_metadata_value_as_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.value_as_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.value_as_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.value_as_concept_id) as string),'.') != 0))
			and cdmtable.value_as_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.metadata
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the ENCODING_CONCEPT_ID in the NOTE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'NOTE' as cdm_table_name
  ,'ENCODING_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_note_encoding_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.encoding_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.encoding_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.encoding_concept_id) as string),'.') != 0))
			and cdmtable.encoding_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.note
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the LANGUAGE_CONCEPT_ID in the NOTE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'NOTE' as cdm_table_name
  ,'LANGUAGE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_note_language_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.language_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.language_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.language_concept_id) as string),'.') != 0))
			and cdmtable.language_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.note
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the NOTE_CLASS_CONCEPT_ID in the NOTE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_CLASS_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_note_note_class_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.note_class_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.note_class_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.note_class_concept_id) as string),'.') != 0))
			and cdmtable.note_class_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.note
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the NOTE_EVENT_FIELD_CONCEPT_ID in the NOTE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_EVENT_FIELD_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_note_note_event_field_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.note_event_field_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.note_event_field_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.note_event_field_concept_id) as string),'.') != 0))
			and cdmtable.note_event_field_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.note
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the NOTE_ID in the NOTE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_note_note_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.note_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.note_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.note_id) as string),'.') != 0))
			and cdmtable.note_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.note
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the NOTE_TYPE_CONCEPT_ID in the NOTE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_note_note_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.note_type_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.note_type_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.note_type_concept_id) as string),'.') != 0))
			and cdmtable.note_type_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.note
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PERSON_ID in the NOTE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'NOTE' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_note_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.person_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.person_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.person_id) as string),'.') != 0))
			and cdmtable.person_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.note
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PROVIDER_ID in the NOTE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'NOTE' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_note_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.provider_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.provider_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.provider_id) as string),'.') != 0))
			and cdmtable.provider_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.note
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the VISIT_DETAIL_ID in the NOTE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'NOTE' as cdm_table_name
  ,'VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_note_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.visit_detail_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.visit_detail_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.visit_detail_id) as string),'.') != 0))
			and cdmtable.visit_detail_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.note
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the VISIT_OCCURRENCE_ID in the NOTE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'NOTE' as cdm_table_name
  ,'VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_note_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.visit_occurrence_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.visit_occurrence_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.visit_occurrence_id) as string),'.') != 0))
			and cdmtable.visit_occurrence_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.note
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the NOTE_ID in the NOTE_NLP is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'NOTE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_note_nlp_note_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.note_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.note_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.note_id) as string),'.') != 0))
			and cdmtable.note_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.note_nlp
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the NOTE_NLP_CONCEPT_ID in the NOTE_NLP is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'NOTE_NLP_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_note_nlp_note_nlp_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.note_nlp_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.note_nlp_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.note_nlp_concept_id) as string),'.') != 0))
			and cdmtable.note_nlp_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.note_nlp
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the NOTE_NLP_ID in the NOTE_NLP is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'NOTE_NLP_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_note_nlp_note_nlp_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.note_nlp_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.note_nlp_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.note_nlp_id) as string),'.') != 0))
			and cdmtable.note_nlp_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.note_nlp
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the NOTE_NLP_SOURCE_CONCEPT_ID in the NOTE_NLP is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'NOTE_NLP_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_note_nlp_note_nlp_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.note_nlp_source_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.note_nlp_source_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.note_nlp_source_concept_id) as string),'.') != 0))
			and cdmtable.note_nlp_source_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.note_nlp
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the SECTION_CONCEPT_ID in the NOTE_NLP is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'SECTION_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_note_nlp_section_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.section_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.section_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.section_concept_id) as string),'.') != 0))
			and cdmtable.section_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.note_nlp
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the OBS_EVENT_FIELD_CONCEPT_ID in the OBSERVATION is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBS_EVENT_FIELD_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_observation_obs_event_field_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.obs_event_field_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.obs_event_field_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.obs_event_field_concept_id) as string),'.') != 0))
			and cdmtable.obs_event_field_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.observation
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the OBSERVATION_CONCEPT_ID in the OBSERVATION is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_observation_observation_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.observation_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.observation_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.observation_concept_id) as string),'.') != 0))
			and cdmtable.observation_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.observation
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the OBSERVATION_ID in the OBSERVATION is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_observation_observation_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.observation_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.observation_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.observation_id) as string),'.') != 0))
			and cdmtable.observation_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.observation
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the OBSERVATION_SOURCE_CONCEPT_ID in the OBSERVATION is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_observation_observation_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.observation_source_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.observation_source_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.observation_source_concept_id) as string),'.') != 0))
			and cdmtable.observation_source_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.observation
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the OBSERVATION_TYPE_CONCEPT_ID in the OBSERVATION is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_observation_observation_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.observation_type_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.observation_type_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.observation_type_concept_id) as string),'.') != 0))
			and cdmtable.observation_type_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.observation
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PERSON_ID in the OBSERVATION is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_observation_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.person_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.person_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.person_id) as string),'.') != 0))
			and cdmtable.person_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.observation
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PROVIDER_ID in the OBSERVATION is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_observation_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.provider_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.provider_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.provider_id) as string),'.') != 0))
			and cdmtable.provider_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.observation
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the QUALIFIER_CONCEPT_ID in the OBSERVATION is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'QUALIFIER_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_observation_qualifier_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.qualifier_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.qualifier_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.qualifier_concept_id) as string),'.') != 0))
			and cdmtable.qualifier_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.observation
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the UNIT_CONCEPT_ID in the OBSERVATION is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_observation_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.unit_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.unit_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.unit_concept_id) as string),'.') != 0))
			and cdmtable.unit_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.observation
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the VISIT_DETAIL_ID in the OBSERVATION is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_observation_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.visit_detail_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.visit_detail_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.visit_detail_id) as string),'.') != 0))
			and cdmtable.visit_detail_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.observation
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the VISIT_OCCURRENCE_ID in the OBSERVATION is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_observation_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.visit_occurrence_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.visit_occurrence_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.visit_occurrence_id) as string),'.') != 0))
			and cdmtable.visit_occurrence_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.observation
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the OBSERVATION_PERIOD_ID in the OBSERVATION_PERIOD is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'OBSERVATION_PERIOD' as cdm_table_name
  ,'OBSERVATION_PERIOD_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_observation_period_observation_period_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.observation_period_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.observation_period_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.observation_period_id) as string),'.') != 0))
			and cdmtable.observation_period_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.observation_period
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PERIOD_TYPE_CONCEPT_ID in the OBSERVATION_PERIOD is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'OBSERVATION_PERIOD' as cdm_table_name
  ,'PERIOD_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_observation_period_period_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.period_type_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.period_type_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.period_type_concept_id) as string),'.') != 0))
			and cdmtable.period_type_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.observation_period
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PERSON_ID in the OBSERVATION_PERIOD is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'OBSERVATION_PERIOD' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_observation_period_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.person_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.person_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.person_id) as string),'.') != 0))
			and cdmtable.person_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.observation_period
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PAYER_CONCEPT_ID in the PAYER_PLAN_PERIOD is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PAYER_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_payer_plan_period_payer_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.payer_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.payer_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.payer_concept_id) as string),'.') != 0))
			and cdmtable.payer_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.payer_plan_period
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PAYER_PLAN_PERIOD_ID in the PAYER_PLAN_PERIOD is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PAYER_PLAN_PERIOD_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_payer_plan_period_payer_plan_period_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.payer_plan_period_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.payer_plan_period_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.payer_plan_period_id) as string),'.') != 0))
			and cdmtable.payer_plan_period_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.payer_plan_period
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PAYER_SOURCE_CONCEPT_ID in the PAYER_PLAN_PERIOD is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PAYER_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_payer_plan_period_payer_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.payer_source_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.payer_source_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.payer_source_concept_id) as string),'.') != 0))
			and cdmtable.payer_source_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.payer_plan_period
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PERSON_ID in the PAYER_PLAN_PERIOD is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_payer_plan_period_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.person_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.person_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.person_id) as string),'.') != 0))
			and cdmtable.person_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.payer_plan_period
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PLAN_CONCEPT_ID in the PAYER_PLAN_PERIOD is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PLAN_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_payer_plan_period_plan_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.plan_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.plan_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.plan_concept_id) as string),'.') != 0))
			and cdmtable.plan_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.payer_plan_period
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PLAN_SOURCE_CONCEPT_ID in the PAYER_PLAN_PERIOD is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PLAN_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_payer_plan_period_plan_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.plan_source_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.plan_source_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.plan_source_concept_id) as string),'.') != 0))
			and cdmtable.plan_source_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.payer_plan_period
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the SPONSOR_CONCEPT_ID in the PAYER_PLAN_PERIOD is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'SPONSOR_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_payer_plan_period_sponsor_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.sponsor_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.sponsor_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.sponsor_concept_id) as string),'.') != 0))
			and cdmtable.sponsor_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.payer_plan_period
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the SPONSOR_SOURCE_CONCEPT_ID in the PAYER_PLAN_PERIOD is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'SPONSOR_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_payer_plan_period_sponsor_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.sponsor_source_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.sponsor_source_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.sponsor_source_concept_id) as string),'.') != 0))
			and cdmtable.sponsor_source_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.payer_plan_period
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the STOP_REASON_CONCEPT_ID in the PAYER_PLAN_PERIOD is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'STOP_REASON_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_payer_plan_period_stop_reason_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.stop_reason_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.stop_reason_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.stop_reason_concept_id) as string),'.') != 0))
			and cdmtable.stop_reason_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.payer_plan_period
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the STOP_REASON_SOURCE_CONCEPT_ID in the PAYER_PLAN_PERIOD is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'STOP_REASON_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_payer_plan_period_stop_reason_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.stop_reason_source_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.stop_reason_source_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.stop_reason_source_concept_id) as string),'.') != 0))
			and cdmtable.stop_reason_source_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.payer_plan_period
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the CARE_SITE_ID in the PERSON is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PERSON' as cdm_table_name
  ,'CARE_SITE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_person_care_site_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.care_site_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.care_site_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.care_site_id) as string),'.') != 0))
			and cdmtable.care_site_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.person
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the DAY_OF_BIRTH in the PERSON is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PERSON' as cdm_table_name
  ,'DAY_OF_BIRTH' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_person_day_of_birth' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.day_of_birth as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.day_of_birth as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.day_of_birth) as string),'.') != 0))
			and cdmtable.day_of_birth is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.person
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the ETHNICITY_CONCEPT_ID in the PERSON is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PERSON' as cdm_table_name
  ,'ETHNICITY_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_person_ethnicity_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.ethnicity_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.ethnicity_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.ethnicity_concept_id) as string),'.') != 0))
			and cdmtable.ethnicity_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.person
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the ETHNICITY_SOURCE_CONCEPT_ID in the PERSON is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PERSON' as cdm_table_name
  ,'ETHNICITY_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_person_ethnicity_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.ethnicity_source_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.ethnicity_source_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.ethnicity_source_concept_id) as string),'.') != 0))
			and cdmtable.ethnicity_source_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.person
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the GENDER_CONCEPT_ID in the PERSON is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PERSON' as cdm_table_name
  ,'GENDER_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_person_gender_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.gender_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.gender_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.gender_concept_id) as string),'.') != 0))
			and cdmtable.gender_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.person
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the GENDER_SOURCE_CONCEPT_ID in the PERSON is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PERSON' as cdm_table_name
  ,'GENDER_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_person_gender_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.gender_source_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.gender_source_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.gender_source_concept_id) as string),'.') != 0))
			and cdmtable.gender_source_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.person
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the LOCATION_ID in the PERSON is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PERSON' as cdm_table_name
  ,'LOCATION_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_person_location_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.location_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.location_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.location_id) as string),'.') != 0))
			and cdmtable.location_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.person
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the MONTH_OF_BIRTH in the PERSON is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PERSON' as cdm_table_name
  ,'MONTH_OF_BIRTH' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_person_month_of_birth' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.month_of_birth as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.month_of_birth as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.month_of_birth) as string),'.') != 0))
			and cdmtable.month_of_birth is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.person
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PERSON_ID in the PERSON is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PERSON' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_person_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.person_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.person_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.person_id) as string),'.') != 0))
			and cdmtable.person_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.person
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PROVIDER_ID in the PERSON is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PERSON' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_person_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.provider_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.provider_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.provider_id) as string),'.') != 0))
			and cdmtable.provider_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.person
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the RACE_CONCEPT_ID in the PERSON is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PERSON' as cdm_table_name
  ,'RACE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_person_race_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.race_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.race_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.race_concept_id) as string),'.') != 0))
			and cdmtable.race_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.person
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the RACE_SOURCE_CONCEPT_ID in the PERSON is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PERSON' as cdm_table_name
  ,'RACE_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_person_race_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.race_source_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.race_source_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.race_source_concept_id) as string),'.') != 0))
			and cdmtable.race_source_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.person
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the YEAR_OF_BIRTH in the PERSON is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PERSON' as cdm_table_name
  ,'YEAR_OF_BIRTH' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_person_year_of_birth' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.year_of_birth as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.year_of_birth as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.year_of_birth) as string),'.') != 0))
			and cdmtable.year_of_birth is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.person
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the MODIFIER_CONCEPT_ID in the PROCEDURE_OCCURRENCE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'MODIFIER_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_procedure_occurrence_modifier_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.modifier_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.modifier_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.modifier_concept_id) as string),'.') != 0))
			and cdmtable.modifier_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PERSON_ID in the PROCEDURE_OCCURRENCE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_procedure_occurrence_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.person_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.person_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.person_id) as string),'.') != 0))
			and cdmtable.person_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PROCEDURE_CONCEPT_ID in the PROCEDURE_OCCURRENCE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_procedure_occurrence_procedure_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.procedure_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.procedure_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.procedure_concept_id) as string),'.') != 0))
			and cdmtable.procedure_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PROCEDURE_OCCURRENCE_ID in the PROCEDURE_OCCURRENCE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_procedure_occurrence_procedure_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.procedure_occurrence_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.procedure_occurrence_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.procedure_occurrence_id) as string),'.') != 0))
			and cdmtable.procedure_occurrence_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PROCEDURE_SOURCE_CONCEPT_ID in the PROCEDURE_OCCURRENCE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_procedure_occurrence_procedure_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.procedure_source_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.procedure_source_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.procedure_source_concept_id) as string),'.') != 0))
			and cdmtable.procedure_source_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PROCEDURE_TYPE_CONCEPT_ID in the PROCEDURE_OCCURRENCE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_procedure_occurrence_procedure_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.procedure_type_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.procedure_type_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.procedure_type_concept_id) as string),'.') != 0))
			and cdmtable.procedure_type_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PROVIDER_ID in the PROCEDURE_OCCURRENCE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_procedure_occurrence_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.provider_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.provider_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.provider_id) as string),'.') != 0))
			and cdmtable.provider_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the QUANTITY in the PROCEDURE_OCCURRENCE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'QUANTITY' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_procedure_occurrence_quantity' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.quantity as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.quantity as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.quantity) as string),'.') != 0))
			and cdmtable.quantity is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the VISIT_DETAIL_ID in the PROCEDURE_OCCURRENCE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_procedure_occurrence_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.visit_detail_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.visit_detail_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.visit_detail_id) as string),'.') != 0))
			and cdmtable.visit_detail_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the VISIT_OCCURRENCE_ID in the PROCEDURE_OCCURRENCE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_procedure_occurrence_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.visit_occurrence_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.visit_occurrence_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.visit_occurrence_id) as string),'.') != 0))
			and cdmtable.visit_occurrence_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the CARE_SITE_ID in the PROVIDER is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'CARE_SITE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_provider_care_site_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.care_site_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.care_site_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.care_site_id) as string),'.') != 0))
			and cdmtable.care_site_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.provider
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the GENDER_CONCEPT_ID in the PROVIDER is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'GENDER_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_provider_gender_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.gender_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.gender_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.gender_concept_id) as string),'.') != 0))
			and cdmtable.gender_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.provider
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the GENDER_SOURCE_CONCEPT_ID in the PROVIDER is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'GENDER_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_provider_gender_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.gender_source_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.gender_source_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.gender_source_concept_id) as string),'.') != 0))
			and cdmtable.gender_source_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.provider
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PROVIDER_ID in the PROVIDER is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_provider_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.provider_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.provider_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.provider_id) as string),'.') != 0))
			and cdmtable.provider_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.provider
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the SPECIALTY_CONCEPT_ID in the PROVIDER is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'SPECIALTY_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_provider_specialty_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.specialty_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.specialty_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.specialty_concept_id) as string),'.') != 0))
			and cdmtable.specialty_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.provider
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the SPECIALTY_SOURCE_CONCEPT_ID in the PROVIDER is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'SPECIALTY_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_provider_specialty_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.specialty_source_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.specialty_source_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.specialty_source_concept_id) as string),'.') != 0))
			and cdmtable.specialty_source_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.provider
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the YEAR_OF_BIRTH in the PROVIDER is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'YEAR_OF_BIRTH' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_provider_year_of_birth' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.year_of_birth as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.year_of_birth as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.year_of_birth) as string),'.') != 0))
			and cdmtable.year_of_birth is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.provider
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the RELATIONSHIP_CONCEPT_ID in the RELATIONSHIP is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'RELATIONSHIP' as cdm_table_name
  ,'RELATIONSHIP_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_relationship_relationship_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.relationship_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.relationship_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.relationship_concept_id) as string),'.') != 0))
			and cdmtable.relationship_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.relationship
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the SOURCE_CONCEPT_ID in the SOURCE_TO_CONCEPT_MAP is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'SOURCE_TO_CONCEPT_MAP' as cdm_table_name
  ,'SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_source_to_concept_map_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.source_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.source_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.source_concept_id) as string),'.') != 0))
			and cdmtable.source_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.source_to_concept_map
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the TARGET_CONCEPT_ID in the SOURCE_TO_CONCEPT_MAP is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'SOURCE_TO_CONCEPT_MAP' as cdm_table_name
  ,'TARGET_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_source_to_concept_map_target_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.target_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.target_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.target_concept_id) as string),'.') != 0))
			and cdmtable.target_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.source_to_concept_map
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the ANATOMIC_SITE_CONCEPT_ID in the SPECIMEN is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'ANATOMIC_SITE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_specimen_anatomic_site_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.anatomic_site_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.anatomic_site_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.anatomic_site_concept_id) as string),'.') != 0))
			and cdmtable.anatomic_site_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.specimen
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the DISEASE_STATUS_CONCEPT_ID in the SPECIMEN is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'DISEASE_STATUS_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_specimen_disease_status_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.disease_status_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.disease_status_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.disease_status_concept_id) as string),'.') != 0))
			and cdmtable.disease_status_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.specimen
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PERSON_ID in the SPECIMEN is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_specimen_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.person_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.person_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.person_id) as string),'.') != 0))
			and cdmtable.person_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.specimen
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the SPECIMEN_CONCEPT_ID in the SPECIMEN is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'SPECIMEN_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_specimen_specimen_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.specimen_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.specimen_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.specimen_concept_id) as string),'.') != 0))
			and cdmtable.specimen_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.specimen
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the SPECIMEN_ID in the SPECIMEN is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'SPECIMEN_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_specimen_specimen_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.specimen_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.specimen_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.specimen_id) as string),'.') != 0))
			and cdmtable.specimen_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.specimen
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the SPECIMEN_TYPE_CONCEPT_ID in the SPECIMEN is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'SPECIMEN_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_specimen_specimen_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.specimen_type_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.specimen_type_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.specimen_type_concept_id) as string),'.') != 0))
			and cdmtable.specimen_type_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.specimen
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the UNIT_CONCEPT_ID in the SPECIMEN is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_specimen_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.unit_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.unit_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.unit_concept_id) as string),'.') != 0))
			and cdmtable.unit_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.specimen
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the CARE_SITE_ID in the VISIT_DETAIL is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'CARE_SITE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_visit_detail_care_site_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.care_site_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.care_site_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.care_site_id) as string),'.') != 0))
			and cdmtable.care_site_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.visit_detail
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the DISCHARGED_TO_CONCEPT_ID in the VISIT_DETAIL is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'DISCHARGED_TO_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_visit_detail_discharged_to_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.discharged_to_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.discharged_to_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.discharged_to_concept_id) as string),'.') != 0))
			and cdmtable.discharged_to_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.visit_detail
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PARENT_VISIT_DETAIL_ID in the VISIT_DETAIL is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'PARENT_VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_visit_detail_parent_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.parent_visit_detail_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.parent_visit_detail_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.parent_visit_detail_id) as string),'.') != 0))
			and cdmtable.parent_visit_detail_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.visit_detail
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PERSON_ID in the VISIT_DETAIL is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_visit_detail_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.person_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.person_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.person_id) as string),'.') != 0))
			and cdmtable.person_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.visit_detail
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PRECEDING_VISIT_DETAIL_ID in the VISIT_DETAIL is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'PRECEDING_VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_visit_detail_preceding_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.preceding_visit_detail_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.preceding_visit_detail_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.preceding_visit_detail_id) as string),'.') != 0))
			and cdmtable.preceding_visit_detail_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.visit_detail
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PROVIDER_ID in the VISIT_DETAIL is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_visit_detail_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.provider_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.provider_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.provider_id) as string),'.') != 0))
			and cdmtable.provider_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.visit_detail
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the VISIT_DETAIL_CONCEPT_ID in the VISIT_DETAIL is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_visit_detail_visit_detail_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.visit_detail_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.visit_detail_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.visit_detail_concept_id) as string),'.') != 0))
			and cdmtable.visit_detail_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.visit_detail
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the VISIT_DETAIL_ID in the VISIT_DETAIL is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_visit_detail_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.visit_detail_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.visit_detail_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.visit_detail_id) as string),'.') != 0))
			and cdmtable.visit_detail_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.visit_detail
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the VISIT_DETAIL_TYPE_CONCEPT_ID in the VISIT_DETAIL is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_visit_detail_visit_detail_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.visit_detail_type_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.visit_detail_type_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.visit_detail_type_concept_id) as string),'.') != 0))
			and cdmtable.visit_detail_type_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.visit_detail
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the VISIT_OCCURRENCE_ID in the VISIT_DETAIL is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_visit_detail_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.visit_occurrence_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.visit_occurrence_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.visit_occurrence_id) as string),'.') != 0))
			and cdmtable.visit_occurrence_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.visit_detail
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the ADMITTED_FROM_CONCEPT_ID in the VISIT_OCCURRENCE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'ADMITTED_FROM_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_visit_occurrence_admitted_from_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.admitted_from_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.admitted_from_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.admitted_from_concept_id) as string),'.') != 0))
			and cdmtable.admitted_from_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.visit_occurrence
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the CARE_SITE_ID in the VISIT_OCCURRENCE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'CARE_SITE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_visit_occurrence_care_site_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.care_site_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.care_site_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.care_site_id) as string),'.') != 0))
			and cdmtable.care_site_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.visit_occurrence
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the DISCHARGED_TO_CONCEPT_ID in the VISIT_OCCURRENCE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'DISCHARGED_TO_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_visit_occurrence_discharged_to_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.discharged_to_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.discharged_to_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.discharged_to_concept_id) as string),'.') != 0))
			and cdmtable.discharged_to_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.visit_occurrence
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PERSON_ID in the VISIT_OCCURRENCE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_visit_occurrence_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.person_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.person_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.person_id) as string),'.') != 0))
			and cdmtable.person_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.visit_occurrence
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PRECEDING_VISIT_OCCURRENCE_ID in the VISIT_OCCURRENCE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'PRECEDING_VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_visit_occurrence_preceding_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.preceding_visit_occurrence_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.preceding_visit_occurrence_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.preceding_visit_occurrence_id) as string),'.') != 0))
			and cdmtable.preceding_visit_occurrence_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.visit_occurrence
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the PROVIDER_ID in the VISIT_OCCURRENCE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_visit_occurrence_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.provider_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.provider_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.provider_id) as string),'.') != 0))
			and cdmtable.provider_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.visit_occurrence
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the VISIT_CONCEPT_ID in the VISIT_OCCURRENCE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_visit_occurrence_visit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.visit_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.visit_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.visit_concept_id) as string),'.') != 0))
			and cdmtable.visit_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.visit_occurrence
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the VISIT_OCCURRENCE_ID in the VISIT_OCCURRENCE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_visit_occurrence_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.visit_occurrence_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.visit_occurrence_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.visit_occurrence_id) as string),'.') != 0))
			and cdmtable.visit_occurrence_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.visit_occurrence
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'cdmDatatype' as check_name
  ,'FIELD' as check_level
  ,'A yes or no value indicating if the VISIT_SOURCE_CONCEPT_ID in the VISIT_OCCURRENCE is the expected data type based on the specification.  Only checks integer fields.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_cdm_datatype.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_cdmdatatype_visit_occurrence_visit_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_CDM_DATATYPE
In some SQL dialects, check that integer fields only contain digits.
In others, check that integer fields are numeric and contain no decimal points
Parameters used in this template:
schema = dataform
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
		where 
			(case when safe_cast(cdmtable.visit_source_concept_id as float64) is null then 0 else 1 end = 0 
			or (case when safe_cast(cdmtable.visit_source_concept_id as float64) is null then 0 else 1 end = 1 
				and strpos(cast(abs(cdmtable.visit_source_concept_id) as string),'.') != 0))
			and cdmtable.visit_source_concept_id is not null
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.visit_occurrence
) denominator
) cte
)
 SELECT *
from cte_all
;

