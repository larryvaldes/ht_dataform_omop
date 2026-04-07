/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the PLACE_OF_SERVICE_CONCEPT_ID field in the CARE_SITE table.' as check_description
  ,'CARE_SITE' as cdm_table_name
  ,'PLACE_OF_SERVICE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_care_site_place_of_service_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.place_of_service_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.care_site cdmtable
	where cdmtable.place_of_service_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the CDM_VERSION_CONCEPT_ID field in the CDM_SOURCE table.' as check_description
  ,'CDM_SOURCE' as cdm_table_name
  ,'CDM_VERSION_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_cdm_source_cdm_version_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.cdm_version_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.cdm_source cdmtable
	where cdmtable.cdm_version_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the DEFINITION_TYPE_CONCEPT_ID field in the COHORT_DEFINITION table.' as check_description
  ,'COHORT_DEFINITION' as cdm_table_name
  ,'DEFINITION_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_cohort_definition_definition_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.definition_type_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.cohort_definition cdmtable
	where cdmtable.definition_type_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the SUBJECT_CONCEPT_ID field in the COHORT_DEFINITION table.' as check_description
  ,'COHORT_DEFINITION' as cdm_table_name
  ,'SUBJECT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_cohort_definition_subject_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.subject_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.cohort_definition cdmtable
	where cdmtable.subject_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the CONDITION_CONCEPT_ID field in the CONDITION_ERA table.' as check_description
  ,'CONDITION_ERA' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_condition_era_condition_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.condition_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_era cdmtable
	where cdmtable.condition_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the CONDITION_CONCEPT_ID field in the CONDITION_OCCURRENCE table.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_condition_occurrence_condition_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.condition_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where cdmtable.condition_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the CONDITION_STATUS_CONCEPT_ID field in the CONDITION_OCCURRENCE table.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_STATUS_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_condition_occurrence_condition_status_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.condition_status_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where cdmtable.condition_status_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the CONDITION_TYPE_CONCEPT_ID field in the CONDITION_OCCURRENCE table.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_condition_occurrence_condition_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.condition_type_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where cdmtable.condition_type_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the COST_TYPE_CONCEPT_ID field in the COST table.' as check_description
  ,'COST' as cdm_table_name
  ,'COST_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_cost_cost_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.cost_type_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.cost cdmtable
	where cdmtable.cost_type_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the CAUSE_CONCEPT_ID field in the DEATH table.' as check_description
  ,'DEATH' as cdm_table_name
  ,'CAUSE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_death_cause_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.cause_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.death cdmtable
	where cdmtable.cause_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the DEATH_TYPE_CONCEPT_ID field in the DEATH table.' as check_description
  ,'DEATH' as cdm_table_name
  ,'DEATH_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_death_death_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.death_type_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.death cdmtable
	where cdmtable.death_type_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the DEVICE_CONCEPT_ID field in the DEVICE_EXPOSURE table.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_device_exposure_device_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.device_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.device_exposure cdmtable
	where cdmtable.device_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the DEVICE_TYPE_CONCEPT_ID field in the DEVICE_EXPOSURE table.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_device_exposure_device_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.device_type_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.device_exposure cdmtable
	where cdmtable.device_type_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the UNIT_CONCEPT_ID field in the DEVICE_EXPOSURE table.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_device_exposure_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.unit_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.device_exposure cdmtable
	where cdmtable.unit_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the DRUG_CONCEPT_ID field in the DOSE_ERA table.' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'DRUG_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_dose_era_drug_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.drug_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.dose_era cdmtable
	where cdmtable.drug_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the UNIT_CONCEPT_ID field in the DOSE_ERA table.' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_dose_era_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.unit_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.dose_era cdmtable
	where cdmtable.unit_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the DRUG_CONCEPT_ID field in the DRUG_ERA table.' as check_description
  ,'DRUG_ERA' as cdm_table_name
  ,'DRUG_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_drug_era_drug_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.drug_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.drug_era cdmtable
	where cdmtable.drug_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the DRUG_CONCEPT_ID field in the DRUG_EXPOSURE table.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_drug_exposure_drug_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.drug_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.drug_exposure cdmtable
	where cdmtable.drug_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the DRUG_TYPE_CONCEPT_ID field in the DRUG_EXPOSURE table.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_drug_exposure_drug_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.drug_type_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.drug_exposure cdmtable
	where cdmtable.drug_type_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the ROUTE_CONCEPT_ID field in the DRUG_EXPOSURE table.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'ROUTE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_drug_exposure_route_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.route_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.drug_exposure cdmtable
	where cdmtable.route_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the EPISODE_CONCEPT_ID field in the EPISODE table.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_episode_episode_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.episode_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.episode cdmtable
	where cdmtable.episode_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the EPISODE_TYPE_CONCEPT_ID field in the EPISODE table.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_episode_episode_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.episode_type_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.episode cdmtable
	where cdmtable.episode_type_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the EPISODE_EVENT_FIELD_CONCEPT_ID field in the EPISODE_EVENT table.' as check_description
  ,'EPISODE_EVENT' as cdm_table_name
  ,'EPISODE_EVENT_FIELD_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_episode_event_episode_event_field_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.episode_event_field_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.episode_event cdmtable
	where cdmtable.episode_event_field_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the COUNTRY_CONCEPT_ID field in the LOCATION table.' as check_description
  ,'LOCATION' as cdm_table_name
  ,'COUNTRY_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_location_country_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.country_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.location cdmtable
	where cdmtable.country_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the MEAS_EVENT_FIELD_CONCEPT_ID field in the MEASUREMENT table.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEAS_EVENT_FIELD_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_measurement_meas_event_field_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.meas_event_field_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.measurement cdmtable
	where cdmtable.meas_event_field_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the MEASUREMENT_CONCEPT_ID field in the MEASUREMENT table.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_measurement_measurement_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.measurement_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.measurement cdmtable
	where cdmtable.measurement_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the MEASUREMENT_TYPE_CONCEPT_ID field in the MEASUREMENT table.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_measurement_measurement_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.measurement_type_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.measurement cdmtable
	where cdmtable.measurement_type_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the OPERATOR_CONCEPT_ID field in the MEASUREMENT table.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'OPERATOR_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_measurement_operator_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.operator_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.measurement cdmtable
	where cdmtable.operator_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the UNIT_CONCEPT_ID field in the MEASUREMENT table.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_measurement_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.unit_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.measurement cdmtable
	where cdmtable.unit_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the ENCODING_CONCEPT_ID field in the NOTE table.' as check_description
  ,'NOTE' as cdm_table_name
  ,'ENCODING_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_note_encoding_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.encoding_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.note cdmtable
	where cdmtable.encoding_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the LANGUAGE_CONCEPT_ID field in the NOTE table.' as check_description
  ,'NOTE' as cdm_table_name
  ,'LANGUAGE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_note_language_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.language_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.note cdmtable
	where cdmtable.language_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the NOTE_CLASS_CONCEPT_ID field in the NOTE table.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_CLASS_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_note_note_class_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.note_class_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.note cdmtable
	where cdmtable.note_class_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the NOTE_EVENT_FIELD_CONCEPT_ID field in the NOTE table.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_EVENT_FIELD_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_note_note_event_field_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.note_event_field_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.note cdmtable
	where cdmtable.note_event_field_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the NOTE_TYPE_CONCEPT_ID field in the NOTE table.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_note_note_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.note_type_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.note cdmtable
	where cdmtable.note_type_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the NOTE_NLP_CONCEPT_ID field in the NOTE_NLP table.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'NOTE_NLP_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_note_nlp_note_nlp_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.note_nlp_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.note_nlp cdmtable
	where cdmtable.note_nlp_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the SECTION_CONCEPT_ID field in the NOTE_NLP table.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'SECTION_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_note_nlp_section_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.section_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.note_nlp cdmtable
	where cdmtable.section_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the OBS_EVENT_FIELD_CONCEPT_ID field in the OBSERVATION table.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBS_EVENT_FIELD_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_observation_obs_event_field_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.obs_event_field_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.observation cdmtable
	where cdmtable.obs_event_field_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the OBSERVATION_CONCEPT_ID field in the OBSERVATION table.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_observation_observation_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.observation_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.observation cdmtable
	where cdmtable.observation_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the OBSERVATION_TYPE_CONCEPT_ID field in the OBSERVATION table.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_observation_observation_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.observation_type_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.observation cdmtable
	where cdmtable.observation_type_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the QUALIFIER_CONCEPT_ID field in the OBSERVATION table.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'QUALIFIER_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_observation_qualifier_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.qualifier_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.observation cdmtable
	where cdmtable.qualifier_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the UNIT_CONCEPT_ID field in the OBSERVATION table.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_observation_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.unit_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.observation cdmtable
	where cdmtable.unit_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the PERIOD_TYPE_CONCEPT_ID field in the OBSERVATION_PERIOD table.' as check_description
  ,'OBSERVATION_PERIOD' as cdm_table_name
  ,'PERIOD_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_observation_period_period_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.period_type_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.observation_period cdmtable
	where cdmtable.period_type_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the ETHNICITY_CONCEPT_ID field in the PERSON table.' as check_description
  ,'PERSON' as cdm_table_name
  ,'ETHNICITY_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_person_ethnicity_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.ethnicity_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.person cdmtable
	where cdmtable.ethnicity_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the GENDER_CONCEPT_ID field in the PERSON table.' as check_description
  ,'PERSON' as cdm_table_name
  ,'GENDER_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_person_gender_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.gender_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.person cdmtable
	where cdmtable.gender_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the RACE_CONCEPT_ID field in the PERSON table.' as check_description
  ,'PERSON' as cdm_table_name
  ,'RACE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_person_race_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.race_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.person cdmtable
	where cdmtable.race_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the MODIFIER_CONCEPT_ID field in the PROCEDURE_OCCURRENCE table.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'MODIFIER_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_procedure_occurrence_modifier_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.modifier_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where cdmtable.modifier_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the PROCEDURE_CONCEPT_ID field in the PROCEDURE_OCCURRENCE table.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_procedure_occurrence_procedure_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.procedure_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where cdmtable.procedure_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the PROCEDURE_TYPE_CONCEPT_ID field in the PROCEDURE_OCCURRENCE table.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_procedure_occurrence_procedure_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.procedure_type_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where cdmtable.procedure_type_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the GENDER_CONCEPT_ID field in the PROVIDER table.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'GENDER_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_provider_gender_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.gender_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.provider cdmtable
	where cdmtable.gender_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the SPECIALTY_CONCEPT_ID field in the PROVIDER table.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'SPECIALTY_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_provider_specialty_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.specialty_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.provider cdmtable
	where cdmtable.specialty_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the TARGET_CONCEPT_ID field in the SOURCE_TO_CONCEPT_MAP table.' as check_description
  ,'SOURCE_TO_CONCEPT_MAP' as cdm_table_name
  ,'TARGET_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_source_to_concept_map_target_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.target_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.source_to_concept_map cdmtable
	where cdmtable.target_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the ANATOMIC_SITE_CONCEPT_ID field in the SPECIMEN table.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'ANATOMIC_SITE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_specimen_anatomic_site_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.anatomic_site_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.specimen cdmtable
	where cdmtable.anatomic_site_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the DISEASE_STATUS_CONCEPT_ID field in the SPECIMEN table.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'DISEASE_STATUS_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_specimen_disease_status_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.disease_status_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.specimen cdmtable
	where cdmtable.disease_status_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the SPECIMEN_CONCEPT_ID field in the SPECIMEN table.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'SPECIMEN_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_specimen_specimen_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.specimen_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.specimen cdmtable
	where cdmtable.specimen_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the SPECIMEN_TYPE_CONCEPT_ID field in the SPECIMEN table.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'SPECIMEN_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_specimen_specimen_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.specimen_type_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.specimen cdmtable
	where cdmtable.specimen_type_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the UNIT_CONCEPT_ID field in the SPECIMEN table.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_specimen_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.unit_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.specimen cdmtable
	where cdmtable.unit_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the ADMITTED_FROM_CONCEPT_ID field in the VISIT_DETAIL table.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'ADMITTED_FROM_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_visit_detail_admitted_from_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.admitted_from_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.visit_detail cdmtable
	where cdmtable.admitted_from_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the DISCHARGED_TO_CONCEPT_ID field in the VISIT_DETAIL table.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'DISCHARGED_TO_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_visit_detail_discharged_to_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.discharged_to_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.visit_detail cdmtable
	where cdmtable.discharged_to_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the VISIT_DETAIL_CONCEPT_ID field in the VISIT_DETAIL table.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_visit_detail_visit_detail_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.visit_detail_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.visit_detail cdmtable
	where cdmtable.visit_detail_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the VISIT_DETAIL_TYPE_CONCEPT_ID field in the VISIT_DETAIL table.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_visit_detail_visit_detail_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.visit_detail_type_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.visit_detail cdmtable
	where cdmtable.visit_detail_type_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the ADMITTED_FROM_CONCEPT_ID field in the VISIT_OCCURRENCE table.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'ADMITTED_FROM_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_visit_occurrence_admitted_from_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.admitted_from_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.visit_occurrence cdmtable
	where cdmtable.admitted_from_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the DISCHARGED_TO_CONCEPT_ID field in the VISIT_OCCURRENCE table.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'DISCHARGED_TO_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_visit_occurrence_discharged_to_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.discharged_to_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.visit_occurrence cdmtable
	where cdmtable.discharged_to_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the VISIT_CONCEPT_ID field in the VISIT_OCCURRENCE table.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_visit_occurrence_visit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.visit_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.visit_occurrence cdmtable
	where cdmtable.visit_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isStandardValidConcept' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that do not have a standard, valid concept in the VISIT_TYPE_CONCEPT_ID field in the VISIT_OCCURRENCE table.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_standard_valid_concept.sql' as sql_file
  ,'Conformance' as category
  ,'Value' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isstandardvalidconcept_visit_occurrence_visit_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_STANDARD_VALID_CONCEPT
all standard concept id fields are standard and valid
Parameters used in this template:
schema = dataform
vocabDatabaseSchema = dataform
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
	  	join dataform.concept co 
	  	    on cdmtable.visit_type_concept_id = co.concept_id
		where co.concept_id != 0 
			and (
				co.standard_concept != 'S' 
				or co.invalid_reason is not null
				or co.standard_concept is null
			)
		/*violatedRowsEnd*/
  ) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.visit_occurrence cdmtable
	where cdmtable.visit_type_concept_id is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

