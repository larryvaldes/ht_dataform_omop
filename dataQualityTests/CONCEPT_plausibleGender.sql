/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 26662 (TESTICULAR HYPOFUNCTION), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'26662' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_26662' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 26662
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 26662
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 26662
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 26935 (DISORDER OF ENDOCRINE TESTIS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'26935' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_26935' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 26935
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 26935
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 26935
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 30969 (TESTICULAR HYPERFUNCTION), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'30969' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_30969' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 30969
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 30969
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 30969
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 73801 (SCROTAL VARICES), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'73801' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_73801' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 73801
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 73801
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 73801
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 74322 (BENIGN NEOPLASM OF SCROTUM), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'74322' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_74322' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 74322
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 74322
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 74322
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 78193 (ORCHITIS AND EPIDIDYMITIS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'78193' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_78193' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 78193
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 78193
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 78193
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 79758 (PRIMARY MALIGNANT NEOPLASM OF SCROTUM), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'79758' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_79758' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 79758
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 79758
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 79758
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 141917 (BALANITIS XEROTICA OBLITERANS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'141917' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_141917' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 141917
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 141917
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 141917
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 192367 (DYSPLASIA OF CERVIX), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'192367' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_192367' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 192367
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 192367
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 192367
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 192676 (CERVICAL INTRAEPITHELIAL NEOPLASIA GRADE 1), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'192676' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_192676' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 192676
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 192676
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 192676
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 192683 (UTEROVAGINAL PROLAPSE), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'192683' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_192683' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 192683
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 192683
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 192683
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 192854 (INTRAMURAL LEIOMYOMA OF UTERUS), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'192854' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_192854' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 192854
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 192854
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 192854
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 192858 (OVARIAN HYPERFUNCTION), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'192858' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_192858' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 192858
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 192858
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 192858
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 193254 (DISORDER OF VAGINA), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'193254' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_193254' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 193254
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 193254
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 193254
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 193261 (VAGINOSPASM), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'193261' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_193261' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 193261
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 193261
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 193261
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 193262 (INFLAMMATORY DISORDER OF PENIS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'193262' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_193262' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 193262
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 193262
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 193262
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 193277 (DELIVERIES BY CESAREAN), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'193277' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_193277' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 193277
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 193277
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 193277
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 193437 (NEOPLASM OF UNCERTAIN BEHAVIOR OF FEMALE GENITAL ORGAN), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'193437' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_193437' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 193437
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 193437
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 193437
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 193439 (BENIGN NEOPLASM OF BODY OF UTERUS), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'193439' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_193439' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 193439
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 193439
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 193439
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 193522 (ACUTE PROSTATITIS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'193522' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_193522' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 193522
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 193522
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 193522
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 193530 (FOLLICULAR CYST OF OVARY), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'193530' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_193530' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 193530
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 193530
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 193530
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 193739 (OVARIAN FAILURE), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'193739' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_193739' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 193739
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 193739
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 193739
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 193818 (CALCULUS OF PROSTATE), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'193818' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_193818' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 193818
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 193818
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 193818
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 194092 (UTERINE PROLAPSE WITHOUT VAGINAL WALL PROLAPSE), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'194092' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_194092' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 194092
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 194092
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 194092
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 194286 (MALIGNANT NEOPLASM OF CORPUS UTERI, EXCLUDING ISTHMUS), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'194286' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_194286' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 194286
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 194286
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 194286
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 194412 (DYSPLASIA OF VAGINA), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'194412' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_194412' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 194412
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 194412
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 194412
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 194420 (ENDOMETRIOSIS OF FALLOPIAN TUBE), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'194420' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_194420' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 194420
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 194420
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 194420
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 194611 (CARCINOMA IN SITU OF UTERINE CERVIX), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'194611' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_194611' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 194611
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 194611
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 194611
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 194696 (DYSMENORRHEA), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'194696' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_194696' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 194696
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 194696
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 194696
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 194871 (TRICHOMONAL VULVOVAGINITIS), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'194871' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_194871' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 194871
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 194871
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 194871
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 194997 (PROSTATITIS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'194997' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_194997' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 194997
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 194997
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 194997
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 195009 (LEUKOPLAKIA OF PENIS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'195009' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_195009' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 195009
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 195009
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 195009
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 195012 (INTERMENSTRUAL BLEEDING - IRREGULAR), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'195012' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_195012' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 195012
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 195012
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 195012
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 195197 (PRIMARY MALIGNANT NEOPLASM OF VULVA), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'195197' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_195197' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 195197
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 195197
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 195197
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 195316 (ATYPICAL ENDOMETRIAL HYPERPLASIA), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'195316' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_195316' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 195316
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 195316
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 195316
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 195321 (POSTMENOPAUSAL BLEEDING), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'195321' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_195321' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 195321
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 195321
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 195321
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 195483 (PRIMARY MALIGNANT NEOPLASM OF PENIS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'195483' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_195483' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 195483
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 195483
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 195483
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 195500 (BENIGN NEOPLASM OF UTERUS), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'195500' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_195500' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 195500
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 195500
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 195500
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 195501 (POLYCYSTIC OVARIES), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'195501' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_195501' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 195501
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 195501
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 195501
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 195683 (OPEN WOUND OF PENIS WITHOUT COMPLICATION), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'195683' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_195683' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 195683
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 195683
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 195683
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 195769 (SUBMUCOUS LEIOMYOMA OF UTERUS), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'195769' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_195769' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 195769
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 195769
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 195769
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 195770 (SUBSEROUS LEIOMYOMA OF UTERUS), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'195770' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_195770' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 195770
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 195770
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 195770
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 195793 (NEOPLASM OF UNCERTAIN BEHAVIOR OF UTERUS), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'195793' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_195793' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 195793
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 195793
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 195793
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 195867 (NONINFLAMMATORY DISORDER OF THE VAGINA), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'195867' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_195867' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 195867
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 195867
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 195867
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 195873 (LEUKORRHEA), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'195873' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_195873' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 195873
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 195873
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 195873
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 196048 (PRIMARY MALIGNANT NEOPLASM OF VAGINA), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'196048' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_196048' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 196048
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 196048
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 196048
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 196051 (OVERLAPPING MALIGNANT NEOPLASM OF FEMALE GENITAL ORGANS), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'196051' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_196051' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 196051
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 196051
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 196051
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 196068 (CARCINOMA IN SITU OF MALE GENITAL ORGAN), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'196068' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_196068' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 196068
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 196068
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 196068
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 196157 (INDURATIO PENIS PLASTICA), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'196157' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_196157' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 196157
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 196157
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 196157
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 196158 (DISORDER OF PENIS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'196158' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_196158' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 196158
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 196158
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 196158
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 196163 (CERVICITIS AND ENDOCERVICITIS), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'196163' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_196163' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 196163
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 196163
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 196163
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 196165 (CERVICAL INTRAEPITHELIAL NEOPLASIA GRADE 2), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'196165' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_196165' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 196165
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 196165
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 196165
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 196168 (IRREGULAR PERIODS), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'196168' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_196168' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 196168
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 196168
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 196168
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 196359 (PRIMARY MALIGNANT NEOPLASM OF UTERINE CERVIX), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'196359' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_196359' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 196359
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 196359
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 196359
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 196364 (BENIGN NEOPLASM OF UTERINE CERVIX), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'196364' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_196364' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 196364
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 196364
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 196364
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 196473 (HYPERTROPHY OF UTERUS), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'196473' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_196473' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 196473
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 196473
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 196473
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 196734 (DISORDER OF PROSTATE), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'196734' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_196734' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 196734
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 196734
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 196734
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 196738 (DISORDER OF MALE GENITAL ORGAN), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'196738' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_196738' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 196738
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 196738
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 196738
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 196758 (TUMOR OF BODY OF UTERUS AFFECTING PREGNANCY), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'196758' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_196758' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 196758
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 196758
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 196758
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 197032 (HYPERPLASIA OF PROSTATE), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'197032' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_197032' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 197032
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 197032
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 197032
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 197039 (MALE GENITAL ORGAN VASCULAR DISEASES), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'197039' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_197039' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 197039
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 197039
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 197039
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 197044 (FEMALE INFERTILITY ASSOCIATED WITH ANOVULATION), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'197044' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_197044' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 197044
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 197044
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 197044
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 197236 (UTERINE LEIOMYOMA), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'197236' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_197236' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 197236
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 197236
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 197236
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 197237 (BENIGN NEOPLASM OF PROSTATE), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'197237' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_197237' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 197237
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 197237
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 197237
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 197507 (PRIMARY MALIGNANT NEOPLASM OF MALE GENITAL ORGAN), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'197507' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_197507' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 197507
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 197507
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 197507
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 197601 (SPERMATOCELE), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'197601' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_197601' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 197601
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 197601
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 197601
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 197605 (INFLAMMATORY DISORDER OF MALE GENITAL ORGAN), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'197605' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_197605' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 197605
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 197605
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 197605
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 197606 (FEMALE INFERTILITY OF TUBAL ORIGIN), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'197606' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_197606' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 197606
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 197606
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 197606
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 197607 (EXCESSIVE AND FREQUENT MENSTRUATION), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'197607' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_197607' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 197607
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 197607
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 197607
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 197609 (CERVICAL, VAGINAL AND VULVAL INFLAMMATORY DISEASES), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'197609' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_197609' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 197609
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 197609
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 197609
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 197610 (CYST OF OVARY), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'197610' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_197610' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 197610
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 197610
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 197610
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 197938 (UTERINE INERTIA), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'197938' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_197938' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 197938
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 197938
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 197938
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 198082 (OVERLAPPING MALIGNANT NEOPLASM OF BODY OF UTERUS), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'198082' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_198082' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 198082
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 198082
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 198082
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 198108 (BENIGN NEOPLASM OF FALLOPIAN TUBES AND UTERINE LIGAMENTS), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'198108' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_198108' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 198108
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 198108
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 198108
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 198194 (FEMALE GENITAL ORGAN SYMPTOMS), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'198194' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_198194' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 198194
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 198194
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 198194
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 198197 (MALE INFERTILITY), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'198197' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_198197' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 198197
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 198197
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 198197
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 198198 (POLYP OF VAGINA), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'198198' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_198198' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 198198
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 198198
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 198198
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 198202 (CYSTOCELE), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'198202' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_198202' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 198202
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 198202
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 198202
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 198212 (SPOTTING PER VAGINA IN PREGNANCY), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'198212' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_198212' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 198212
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 198212
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 198212
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 198363 (CANDIDIASIS OF VAGINA), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'198363' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_198363' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 198363
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 198363
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 198363
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 198471 (COMPLEX ENDOMETRIAL HYPERPLASIA), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'198471' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_198471' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 198471
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 198471
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 198471
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 198483 (STRICTURE OR ATRESIA OF THE VAGINA), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'198483' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_198483' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 198483
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 198483
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 198483
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 198803 (BENIGN PROSTATIC HYPERPLASIA), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'198803' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_198803' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 198803
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 198803
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 198803
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 198806 (ABSCESS OF PROSTATE), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'198806' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_198806' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 198806
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 198806
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 198806
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 199067 (FEMALE PELVIC INFLAMMATORY DISEASE), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'199067' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_199067' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 199067
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 199067
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 199067
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 199078 (VAGINAL WALL PROLAPSE), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'199078' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_199078' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 199078
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 199078
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 199078
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 199752 (SECONDARY MALIGNANT NEOPLASM OF OVARY), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'199752' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_199752' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 199752
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 199752
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 199752
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 199764 (BENIGN NEOPLASM OF OVARY), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'199764' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_199764' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 199764
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 199764
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 199764
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 199876 (PROLAPSE OF FEMALE GENITAL ORGANS), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'199876' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_199876' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 199876
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 199876
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 199876
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 199877 (MUCOUS POLYP OF CERVIX), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'199877' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_199877' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 199877
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 199877
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 199877
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 199878 (LIGHT AND INFREQUENT MENSTRUATION), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'199878' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_199878' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 199878
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 199878
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 199878
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 199881 (ENDOMETRIOSIS OF OVARY), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'199881' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_199881' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 199881
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 199881
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 199881
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 200051 (PRIMARY MALIGNANT NEOPLASM OF OVARY), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'200051' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_200051' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 200051
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 200051
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 200051
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 200052 (PRIMARY MALIGNANT NEOPLASM OF UTERINE ADNEXA), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'200052' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_200052' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 200052
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 200052
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 200052
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 200147 (ATROPHY OF PROSTATE), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'200147' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_200147' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 200147
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 200147
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 200147
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 200445 (CHRONIC PROSTATITIS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'200445' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_200445' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 200445
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 200445
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 200445
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 200452 (DISORDER OF FEMALE GENITAL ORGANS), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'200452' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_200452' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 200452
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 200452
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 200452
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 200461 (ENDOMETRIOSIS OF UTERUS), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'200461' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_200461' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 200461
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 200461
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 200461
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 200670 (BENIGN NEOPLASM OF MALE GENITAL ORGAN), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'200670' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_200670' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 200670
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 200670
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 200670
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 200675 (NEOPLASM OF UNCERTAIN BEHAVIOR OF OVARY), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'200675' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_200675' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 200675
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 200675
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 200675
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 200775 (ENDOMETRIAL HYPERPLASIA), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'200775' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_200775' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 200775
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 200775
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 200775
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 200779 (POLYP OF CORPUS UTERI), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'200779' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_200779' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 200779
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 200779
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 200779
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 200780 (DISORDER OF UTERUS), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'200780' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_200780' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 200780
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 200780
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 200780
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 200962 (PRIMARY MALIGNANT NEOPLASM OF PROSTATE), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'200962' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_200962' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 200962
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 200962
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 200962
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 200970 (CARCINOMA IN SITU OF PROSTATE), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'200970' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_200970' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 200970
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 200970
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 200970
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 201072 (BENIGN PROSTATIC HYPERTROPHY WITHOUT OUTFLOW OBSTRUCTION), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'201072' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_201072' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 201072
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 201072
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 201072
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 201078 (ATROPHIC VAGINITIS), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'201078' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_201078' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 201078
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 201078
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 201078
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 201211 (HERPETIC VULVOVAGINITIS), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'201211' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_201211' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 201211
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 201211
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 201211
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 201238 (PRIMARY MALIGNANT NEOPLASM OF FEMALE GENITAL ORGAN), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'201238' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_201238' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 201238
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 201238
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 201238
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 201244 (BENIGN NEOPLASM OF VAGINA), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'201244' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_201244' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 201244
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 201244
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 201244
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 201257 (DISORDER OF ENDOCRINE OVARY), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'201257' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_201257' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 201257
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 201257
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 201257
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 201346 (EDEMA OF PENIS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'201346' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_201346' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 201346
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 201346
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 201346
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 201355 (EROSION AND ECTROPION OF THE CERVIX), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'201355' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_201355' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 201355
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 201355
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 201355
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 201527 (NEOPLASM OF UNCERTAIN BEHAVIOR OF PROSTATE), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'201527' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_201527' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 201527
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 201527
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 201527
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 201617 (PROSTATIC CYST), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'201617' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_201617' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 201617
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 201617
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 201617
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 201625 (MALPOSITION OF UTERUS), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'201625' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_201625' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 201625
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 201625
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 201625
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 201801 (PRIMARY MALIGNANT NEOPLASM OF FALLOPIAN TUBE), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'201801' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_201801' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 201801
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 201801
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 201801
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 201817 (BENIGN NEOPLASM OF FEMALE GENITAL ORGAN), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'201817' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_201817' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 201817
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 201817
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 201817
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 201823 (BENIGN NEOPLASM OF PENIS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'201823' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_201823' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 201823
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 201823
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 201823
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 201907 (EDEMA OF MALE GENITAL ORGANS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'201907' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_201907' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 201907
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 201907
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 201907
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 201909 (FEMALE INFERTILITY), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'201909' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_201909' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 201909
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 201909
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 201909
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 201913 (TORSION OF THE OVARY, OVARIAN PEDICLE OR FALLOPIAN TUBE), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'201913' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_201913' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 201913
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 201913
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 201913
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 314409 (VASCULAR DISORDER OF PENIS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'314409' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_314409' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 314409
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 314409
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 314409
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 315586 (PRIAPISM), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'315586' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_315586' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 315586
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 315586
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 315586
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 433716 (PRIMARY MALIGNANT NEOPLASM OF TESTIS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'433716' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_433716' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 433716
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 433716
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 433716
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 434251 (INJURY OF MALE EXTERNAL GENITAL ORGANS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'434251' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_434251' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 434251
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 434251
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 434251
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 435315 (TORSION OF TESTIS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'435315' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_435315' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 435315
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 435315
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 435315
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 435648 (RETRACTILE TESTIS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'435648' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_435648' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 435648
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 435648
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 435648
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 436155 (REDUNDANT PREPUCE AND PHIMOSIS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'436155' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_436155' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 436155
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 436155
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 436155
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 436358 (PRIMARY MALIGNANT NEOPLASM OF EXOCERVIX), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'436358' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_436358' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 436358
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 436358
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 436358
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 436366 (BENIGN NEOPLASM OF TESTIS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'436366' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_436366' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 436366
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 436366
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 436366
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 436466 (BALANOPOSTHITIS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'436466' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_436466' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 436466
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 436466
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 436466
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 437501 (PRIMARY MALIGNANT NEOPLASM OF LABIA MAJORA), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'437501' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_437501' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 437501
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 437501
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 437501
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 437655 (UNDESCENDED TESTICLE), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'437655' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_437655' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 437655
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 437655
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 437655
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 438477 (ATROPHY OF TESTIS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'438477' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_438477' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 438477
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 438477
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 438477
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 439871 (HEMOSPERMIA), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'439871' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_439871' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 439871
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 439871
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 439871
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 440971 (NEOPLASM OF UNCERTAIN BEHAVIOR OF TESTIS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'440971' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_440971' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 440971
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 440971
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 440971
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 441068 (TORSION OF APPENDIX OF TESTIS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'441068' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_441068' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 441068
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 441068
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 441068
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 441077 (STENOSIS OF CERVIX), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'441077' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_441077' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 441077
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 441077
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 441077
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 441805 (PRIMARY MALIGNANT NEOPLASM OF ENDOCERVIX), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'441805' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_441805' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 441805
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 441805
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 441805
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 442781 (DISORDER OF UTERINE CERVIX), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'442781' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_442781' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 442781
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 442781
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 442781
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 443211 (BENIGN PROSTATIC HYPERTROPHY WITH OUTFLOW OBSTRUCTION), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'443211' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_443211' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 443211
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 443211
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 443211
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 443435 (PRIMARY UTERINE INERTIA), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'443435' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_443435' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 443435
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 443435
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 443435
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 443800 (AMENORRHEA), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'443800' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_443800' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 443800
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 443800
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 443800
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 444078 (INFLAMMATION OF CERVIX), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'444078' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_444078' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 444078
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 444078
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 444078
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 444106 (CANDIDIASIS OF VULVA), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'444106' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_444106' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 444106
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 444106
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 444106
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2003947 (CLOSED [PERCUTANEOUS] [NEEDLE] BIOPSY OF PROSTATE), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2003947' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2003947' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2003947
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2003947
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2003947
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2003966 (OTHER TRANSURETHRAL PROSTATECTOMY), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2003966' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2003966' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2003966
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2003966
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2003966
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2003983 (OTHER PROSTATECTOMY), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2003983' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2003983' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2003983
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2003983
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2003983
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2004031 (OTHER REPAIR OF SCROTUM AND TUNICA VAGINALIS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2004031' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2004031' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2004031
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2004031
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2004031
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2004063 (UNILATERAL ORCHIECTOMY), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2004063' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2004063' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2004063
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2004063
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2004063
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2004070 (OTHER REPAIR OF TESTIS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2004070' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2004070' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2004070
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2004070
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2004070
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2004090 (EXCISION OF VARICOCELE AND HYDROCELE OF SPERMATIC CORD), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2004090' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2004090' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2004090
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2004090
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2004090
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2004164 (LOCAL EXCISION OR DESTRUCTION OF LESION OF PENIS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2004164' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2004164' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2004164
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2004164
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2004164
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2004263 (OTHER REMOVAL OF BOTH OVARIES AND TUBES AT SAME OPERATIVE EPISODE), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2004263' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2004263' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2004263
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2004263
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2004263
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2004329 (OTHER BILATERAL DESTRUCTION OR OCCLUSION OF FALLOPIAN TUBES), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2004329' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2004329' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2004329
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2004329
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2004329
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2004342 (REMOVAL OF BOTH FALLOPIAN TUBES AT SAME OPERATIVE EPISODE), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2004342' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2004342' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2004342
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2004342
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2004342
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2004443 (CLOSED BIOPSY OF UTERUS), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2004443' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2004443' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2004443
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2004443
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2004443
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2004627 (VAGINAL SUSPENSION AND FIXATION), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2004627' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2004627' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2004627
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2004627
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2004627
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2109825 (TRANSURETHRAL ELECTROSURGICAL RESECTION OF PROSTATE, INCLUDING CONTROL OF POSTOPERATIVE BLEEDING, COMPLETE (VASECTOMY, MEATOTOMY, CYSTOURETHROSCOPY, URETHRAL CALIBRATION AND/OR DILATION, AND INTERNAL URETHROTOMY ARE INCLUDED)), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2109825' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2109825' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2109825
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2109825
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2109825
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2109833 (LASER VAPORIZATION OF PROSTATE, INCLUDING CONTROL OF POSTOPERATIVE BLEEDING, COMPLETE (VASECTOMY, MEATOTOMY, CYSTOURETHROSCOPY, URETHRAL CALIBRATION AND/OR DILATION, INTERNAL URETHROTOMY AND TRANSURETHRAL RESECTION OF PROSTATE ARE INCLUDED IF PERFORMED)), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2109833' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2109833' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2109833
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2109833
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2109833
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2109900 (DESTRUCTION OF LESION(S), PENIS (EG, CONDYLOMA, PAPILLOMA, MOLLUSCUM CONTAGIOSUM, HERPETIC VESICLE), SIMPLE; CHEMICAL), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2109900' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2109900' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2109900
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2109900
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2109900
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2109902 (DESTRUCTION OF LESION(S), PENIS (EG, CONDYLOMA, PAPILLOMA, MOLLUSCUM CONTAGIOSUM, HERPETIC VESICLE), SIMPLE; CRYOSURGERY), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2109902' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2109902' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2109902
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2109902
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2109902
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2109905 (DESTRUCTION OF LESION(S), PENIS (EG, CONDYLOMA, PAPILLOMA, MOLLUSCUM CONTAGIOSUM, HERPETIC VESICLE), EXTENSIVE (EG, LASER SURGERY, ELECTROSURGERY, CRYOSURGERY, CHEMOSURGERY)), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2109905' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2109905' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2109905
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2109905
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2109905
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2109906 (BIOPSY OF PENIS, (SEPARATE PROCEDURE)), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2109906' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2109906' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2109906
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2109906
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2109906
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2109916 (CIRCUMCISION, USING CLAMP OR OTHER DEVICE WITH REGIONAL DORSAL PENILE OR RING BLOCK), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2109916' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2109916' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2109916
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2109916
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2109916
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2109968 (FORESKIN MANIPULATION INCLUDING LYSIS OF PREPUTIAL ADHESIONS AND STRETCHING), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2109968' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2109968' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2109968
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2109968
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2109968
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2109973 (ORCHIECTOMY, SIMPLE (INCLUDING SUBCAPSULAR), WITH OR WITHOUT TESTICULAR PROSTHESIS, SCROTAL OR INGUINAL APPROACH), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2109973' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2109973' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2109973
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2109973
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2109973
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2109981 (ORCHIOPEXY, INGUINAL APPROACH, WITH OR WITHOUT HERNIA REPAIR), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2109981' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2109981' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2109981
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2109981
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2109981
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2110004 (DRAINAGE OF SCROTAL WALL ABSCESS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2110004' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2110004' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2110004
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2110004
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2110004
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2110011 (VASECTOMY, UNILATERAL OR BILATERAL (SEPARATE PROCEDURE), INCLUDING POSTOPERATIVE SEMEN EXAMINATION(S)), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2110011' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2110011' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2110011
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2110011
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2110011
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2110026 (BIOPSY, PROSTATE; NEEDLE OR PUNCH, SINGLE OR MULTIPLE, ANY APPROACH), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2110026' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2110026' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2110026
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2110026
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2110026
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2110039 (PROSTATECTOMY, RETROPUBIC RADICAL, WITH OR WITHOUT NERVE SPARING; WITH BILATERAL PELVIC LYMPHADENECTOMY, INCLUDING EXTERNAL ILIAC, HYPOGASTRIC, AND OBTURATOR NODES), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2110039' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2110039' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2110039
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2110039
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2110039
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2110044 (LAPAROSCOPY, SURGICAL PROSTATECTOMY, RETROPUBIC RADICAL, INCLUDING NERVE SPARING, INCLUDES ROBOTIC ASSISTANCE, WHEN PERFORMED), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2110044' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2110044' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2110044
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2110044
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2110044
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2110078 (COLPOSCOPY OF THE VULVA), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2110078' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2110078' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2110078
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2110078
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2110078
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2110116 (COLPOPEXY, VAGINAL; EXTRA-PERITONEAL APPROACH (SACROSPINOUS, ILIOCOCCYGEUS)), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2110116' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2110116' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2110116
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2110116
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2110116
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2110142 (LAPAROSCOPY, SURGICAL, COLPOPEXY (SUSPENSION OF VAGINAL APEX)), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2110142' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2110142' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2110142
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2110142
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2110142
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2110144 (COLPOSCOPY OF THE CERVIX INCLUDING UPPER/ADJACENT VAGINA, WITH BIOPSY(S) OF THE CERVIX AND ENDOCERVICAL CURETTAGE), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2110144' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2110144' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2110144
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2110144
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2110144
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2110169 (ENDOMETRIAL SAMPLING (BIOPSY) WITH OR WITHOUT ENDOCERVICAL SAMPLING (BIOPSY), WITHOUT CERVICAL DILATION, ANY METHOD (SEPARATE PROCEDURE)), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2110169' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2110169' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2110169
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2110169
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2110169
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2110175 (TOTAL ABDOMINAL HYSTERECTOMY (CORPUS AND CERVIX), WITH OR WITHOUT REMOVAL OF TUBE(S), WITH OR WITHOUT REMOVAL OF OVARY(S)), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2110175' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2110175' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2110175
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2110175
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2110175
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2110194 (INSERTION OF INTRAUTERINE DEVICE (IUD)), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2110194' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2110194' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2110194
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2110194
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2110194
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2110195 (REMOVAL OF INTRAUTERINE DEVICE (IUD)), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2110195' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2110195' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2110195
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2110195
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2110195
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2110203 (ENDOMETRIAL ABLATION, THERMAL, WITHOUT HYSTEROSCOPIC GUIDANCE), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2110203' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2110203' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2110203
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2110203
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2110203
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2110222 (HYSTEROSCOPY, SURGICAL; WITH SAMPLING (BIOPSY) OF ENDOMETRIUM AND/OR POLYPECTOMY, WITH OR WITHOUT D & C), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2110222' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2110222' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2110222
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2110222
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2110222
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2110227 (HYSTEROSCOPY, SURGICAL; WITH ENDOMETRIAL ABLATION (EG, ENDOMETRIAL RESECTION, ELECTROSURGICAL ABLATION, THERMOABLATION)), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2110227' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2110227' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2110227
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2110227
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2110227
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2110230 (LAPAROSCOPY, SURGICAL, WITH TOTAL HYSTERECTOMY, FOR UTERUS 250 G OR LESS; WITH REMOVAL OF TUBE(S) AND/OR OVARY(S)), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2110230' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2110230' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2110230
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2110230
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2110230
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2110307 (ROUTINE OBSTETRIC CARE INCLUDING ANTEPARTUM CARE, VAGINAL DELIVERY (WITH OR WITHOUT EPISIOTOMY, AND/OR FORCEPS) AND POSTPARTUM CARE), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2110307' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2110307' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2110307
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2110307
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2110307
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2110315 (ROUTINE OBSTETRIC CARE INCLUDING ANTEPARTUM CARE, CESAREAN DELIVERY, AND POSTPARTUM CARE), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2110315' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2110315' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2110315
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2110315
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2110315
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2110316 (CESAREAN DELIVERY ONLY), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2110316' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2110316' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2110316
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2110316
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2110316
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2110317 (CESAREAN DELIVERY ONLY, INCLUDING POSTPARTUM CARE), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2110317' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2110317' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2110317
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2110317
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2110317
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2110326 (TREATMENT OF MISSED ABORTION, COMPLETED SURGICALLY; FIRST TRIMESTER), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2110326' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2110326' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2110326
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2110326
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2110326
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2211747 (ULTRASOUND, PREGNANT UTERUS, REAL TIME WITH IMAGE DOCUMENTATION, FETAL AND MATERNAL EVALUATION, FIRST TRIMESTER (< 14 WEEKS 0 DAYS), TRANSABDOMINAL APPROACH; SINGLE OR FIRST GESTATION), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2211747' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2211747' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2211747
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2211747
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2211747
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2211749 (ULTRASOUND, PREGNANT UTERUS, REAL TIME WITH IMAGE DOCUMENTATION, FETAL AND MATERNAL EVALUATION, AFTER FIRST TRIMESTER (> OR = 14 WEEKS 0 DAYS), TRANSABDOMINAL APPROACH; SINGLE OR FIRST GESTATION), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2211749' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2211749' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2211749
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2211749
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2211749
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2211751 (ULTRASOUND, PREGNANT UTERUS, REAL TIME WITH IMAGE DOCUMENTATION, FETAL AND MATERNAL EVALUATION PLUS DETAILED FETAL ANATOMIC EXAMINATION, TRANSABDOMINAL APPROACH; SINGLE OR FIRST GESTATION), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2211751' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2211751' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2211751
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2211751
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2211751
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2211753 (ULTRASOUND, PREGNANT UTERUS, REAL TIME WITH IMAGE DOCUMENTATION, FIRST TRIMESTER FETAL NUCHAL TRANSLUCENCY MEASUREMENT, TRANSABDOMINAL OR TRANSVAGINAL APPROACH; SINGLE OR FIRST GESTATION), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2211753' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2211753' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2211753
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2211753
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2211753
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2211755 (ULTRASOUND, PREGNANT UTERUS, REAL TIME WITH IMAGE DOCUMENTATION, LIMITED (EG, FETAL HEART BEAT, PLACENTAL LOCATION, FETAL POSITION AND/OR QUALITATIVE AMNIOTIC FLUID VOLUME), 1 OR MORE FETUSES), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2211755' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2211755' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2211755
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2211755
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2211755
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2211756 (ULTRASOUND, PREGNANT UTERUS, REAL TIME WITH IMAGE DOCUMENTATION, FOLLOW-UP (EG, RE-EVALUATION OF FETAL SIZE BY MEASURING STANDARD GROWTH PARAMETERS AND AMNIOTIC FLUID VOLUME, RE-EVALUATION OF ORGAN SYSTEM(S) SUSPECTED OR CONFIRMED TO BE ABNORMAL ON A PREV), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2211756' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2211756' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2211756
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2211756
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2211756
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2211757 (ULTRASOUND, PREGNANT UTERUS, REAL TIME WITH IMAGE DOCUMENTATION, TRANSVAGINAL), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2211757' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2211757' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2211757
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2211757
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2211757
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2211765 (ULTRASOUND, TRANSVAGINAL), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2211765' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2211765' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2211765
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2211765
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2211765
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2211769 (ULTRASOUND, SCROTUM AND CONTENTS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2211769' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2211769' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2211769
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2211769
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2211769
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2617204 (CERVICAL OR VAGINAL CANCER SCREENING, PELVIC AND CLINICAL BREAST EXAMINATION), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2617204' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2617204' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2617204
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2617204
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2617204
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2721063 (ANNUAL GYNECOLOGICAL EXAMINATION, NEW PATIENT), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2721063' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2721063' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2721063
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2721063
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2721063
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2721064 (ANNUAL GYNECOLOGICAL EXAMINATION, ESTABLISHED PATIENT), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2721064' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2721064' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2721064
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2721064
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2721064
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2780478 (RESECTION OF PROSTATE, PERCUTANEOUS ENDOSCOPIC APPROACH), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2780478' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2780478' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2780478
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2780478
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2780478
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 2780523 (RESECTION OF PREPUCE, EXTERNAL APPROACH), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'2780523' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_2780523' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 2780523
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 2780523
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 2780523
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4005743 (FEMALE STERILITY), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4005743' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4005743' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4005743
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4005743
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4005743
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4005933 (HYPOSPADIAS, PENILE), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4005933' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4005933' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4005933
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4005933
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4005933
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4012343 (VAGINAL DISCHARGE SYMPTOM), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4012343' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4012343' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4012343
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4012343
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4012343
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4016155 (PROSTATISM), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4016155' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4016155' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4016155
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4016155
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4016155
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4021531 (TOTAL ABDOMINAL HYSTERECTOMY), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'4021531' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_4021531' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 4021531
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 4021531
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 4021531
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4032594 (INFLAMMATION OF SCROTUM), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4032594' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4032594' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4032594
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4032594
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4032594
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4032622 (LAPAROSCOPIC SUPRACERVICAL HYSTERECTOMY), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'4032622' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_4032622' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 4032622
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 4032622
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 4032622
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4038747 (OBSTETRIC EXAMINATION), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'4038747' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_4038747' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 4038747
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 4038747
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 4038747
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4048225 (NEOPLASM OF ENDOMETRIUM), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4048225' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4048225' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4048225
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4048225
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4048225
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4050091 (OPEN WOUND OF PENIS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4050091' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4050091' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4050091
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4050091
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4050091
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4051956 (VULVOVAGINAL DISEASE), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4051956' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4051956' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4051956
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4051956
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4051956
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4052532 (HYSTEROSCOPY), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'4052532' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_4052532' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 4052532
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 4052532
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 4052532
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4054550 (OPEN WOUND OF SCROTUM AND TESTES), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4054550' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4054550' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4054550
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4054550
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4054550
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4056903 (VAGINITIS ASSOCIATED WITH ANOTHER DISORDER), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4056903' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4056903' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4056903
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4056903
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4056903
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4058792 (DOUCHE OF VAGINA), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'4058792' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_4058792' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 4058792
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 4058792
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 4058792
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4060207 (VULVAL IRRITATION), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4060207' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4060207' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4060207
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4060207
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4060207
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4060556 (UTERINE SCAR FROM PREVIOUS SURGERY IN PREGNANCY, CHILDBIRTH AND THE PUERPERIUM), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4060556' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4060556' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4060556
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4060556
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4060556
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4060558 (UTERINE SCAR FROM PREVIOUS SURGERY IN PREGNANCY, CHILDBIRTH AND THE PUERPERIUM - DELIVERED), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4060558' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4060558' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4060558
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4060558
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4060558
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4060559 (UTERINE SCAR FROM PREVIOUS SURGERY IN PREGNANCY, CHILDBIRTH AND THE PUERPERIUM WITH ANTENATAL PROBLEM), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4060559' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4060559' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4060559
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4060559
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4060559
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4061050 (SUBACUTE AND CHRONIC VAGINITIS), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4061050' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4061050' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4061050
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4061050
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4061050
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4071874 (PAIN IN SCROTUM), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4071874' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4071874' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4071874
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4071874
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4071874
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4073700 (TRANSURETHRAL LASER PROSTATECTOMY), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'4073700' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_4073700' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 4073700
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 4073700
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 4073700
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4081648 (ACUTE VAGINITIS), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4081648' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4081648' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4081648
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4081648
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4081648
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4083772 (ECHOGRAPHY OF SCROTUM AND CONTENTS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'4083772' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_4083772' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 4083772
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 4083772
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 4083772
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4090039 (PENILE ARTERIAL INSUFFICIENCY), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4090039' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4090039' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4090039
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4090039
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4090039
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4092515 (MALIGNANT NEOPLASM, OVERLAPPING LESION OF CERVIX UTERI), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4092515' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4092515' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4092515
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4092515
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4092515
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4093346 (LARGE PROSTATE), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4093346' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4093346' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4093346
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4093346
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4093346
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4095940 (FINDING OF PATTERN OF MENSTRUAL CYCLE), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4095940' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4095940' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4095940
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4095940
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4095940
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4096783 (RADICAL PROSTATECTOMY), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'4096783' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_4096783' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 4096783
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 4096783
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 4096783
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4109081 (PAIN IN PENIS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4109081' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4109081' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4109081
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4109081
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4109081
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4127886 (HYSTERECTOMY), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'4127886' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_4127886' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 4127886
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 4127886
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 4127886
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4128329 (MENOPAUSE PRESENT), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4128329' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4128329' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4128329
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4128329
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4128329
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4129155 (VAGINAL BLEEDING), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4129155' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4129155' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4129155
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4129155
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4129155
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4138738 (VAGINAL HYSTERECTOMY), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'4138738' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_4138738' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 4138738
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 4138738
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 4138738
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4140828 (ACUTE VULVITIS), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4140828' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4140828' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4140828
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4140828
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4140828
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4141940 (ENDOMETRIAL ABLATION), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'4141940' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_4141940' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 4141940
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 4141940
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 4141940
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4143116 (AZOOSPERMIA), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4143116' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4143116' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4143116
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4143116
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4143116
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4146777 (RADICAL ABDOMINAL HYSTERECTOMY), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'4146777' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_4146777' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 4146777
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 4146777
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 4146777
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4147021 (CONTUSION, SCROTUM OR TESTIS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4147021' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4147021' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4147021
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4147021
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4147021
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4149084 (VAGINITIS), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4149084' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4149084' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4149084
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4149084
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4149084
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4150042 (VAGINAL ULCER), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4150042' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4150042' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4150042
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4150042
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4150042
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4150816 (BICORNUATE UTERUS), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4150816' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4150816' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4150816
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4150816
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4150816
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4155529 (MECHANICAL COMPLICATION OF INTRAUTERINE CONTRACEPTIVE DEVICE), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4155529' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4155529' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4155529
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4155529
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4155529
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4156113 (MALIGNANT NEOPLASM OF BODY OF UTERUS), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4156113' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4156113' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4156113
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4156113
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4156113
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4161944 (LOW CERVICAL CESAREAN SECTION), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'4161944' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_4161944' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 4161944
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 4161944
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 4161944
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4162860 (PRIMARY MALIGNANT NEOPLASM OF BODY OF UTERUS), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4162860' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4162860' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4162860
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4162860
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4162860
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4163261 (MALIGNANT TUMOR OF PROSTATE), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4163261' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4163261' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4163261
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4163261
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4163261
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4171394 (ABNORMAL MENSTRUAL CYCLE), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4171394' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4171394' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4171394
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4171394
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4171394
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4171915 (ORCHITIS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4171915' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4171915' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4171915
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4171915
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4171915
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4180978 (VULVOVAGINITIS), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4180978' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4180978' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4180978
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4180978
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4180978
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4181912 (CONE BIOPSY OF CERVIX), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'4181912' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_4181912' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 4181912
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 4181912
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 4181912
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4194652 (PRURITUS OF VULVA), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4194652' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4194652' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4194652
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4194652
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4194652
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4199600 (CANDIDAL BALANITIS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4199600' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4199600' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4199600
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4199600
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4199600
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4234536 (TRANSURETHRAL PROSTATECTOMY), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'4234536' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_4234536' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 4234536
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 4234536
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 4234536
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4235215 (SWELLING OF TESTICLE), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4235215' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4235215' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4235215
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4235215
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4235215
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4238715 (REMOVAL OF INTRAUTERINE DEVICE), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'4238715' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_4238715' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 4238715
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 4238715
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 4238715
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4243919 (INCISION OF OVARY), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'4243919' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_4243919' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 4243919
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 4243919
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 4243919
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4260520 (BALANITIS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4260520' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4260520' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4260520
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4260520
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4260520
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4270932 (PAIN IN TESTICLE), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4270932' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4270932' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4270932
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4270932
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4270932
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4275113 (INSERTION OF INTRAUTERINE CONTRACEPTIVE DEVICE), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'4275113' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_4275113' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 4275113
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 4275113
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 4275113
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4279913 (PRIMARY OVARIAN FAILURE), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4279913' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4279913' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4279913
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4279913
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4279913
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4281030 (SECONDARY MALIGNANT NEOPLASM OF RIGHT OVARY), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4281030' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4281030' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4281030
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4281030
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4281030
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4294393 (ULCER OF PENIS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4294393' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4294393' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4294393
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4294393
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4294393
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4294805 (LAPAROSCOPIC-ASSISTED VAGINAL HYSTERECTOMY), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'4294805' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_4294805' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 4294805
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 4294805
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 4294805
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4295261 (POSTMENOPAUSAL STATE), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4295261' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4295261' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4295261
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4295261
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4295261
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4303258 (BACTERIAL VAGINOSIS), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4303258' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4303258' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4303258
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4303258
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4303258
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4306780 (GYNECOLOGIC EXAMINATION), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'4306780' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_4306780' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 4306780
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 4306780
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 4306780
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4310552 (ORCHIDOPEXY), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'4310552' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_4310552' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 4310552
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 4310552
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 4310552
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4320332 (HYDROCELE OF TUNICA VAGINALIS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4320332' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4320332' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4320332
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4320332
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4320332
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4321575 (LYSIS OF PENILE ADHESIONS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'4321575' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_4321575' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 4321575
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 4321575
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 4321575
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4330583 (VASECTOMY), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'4330583' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_procedure_occurrence_procedure_concept_id_4330583' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 4330583
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.procedure_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.procedure_concept_id = 4330583
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
	where procedure_concept_id = 4330583
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 4339088 (TESTICULAR MASS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4339088' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_4339088' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4339088
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 4339088
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 4339088
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 40481080 (BENIGN LOCALIZED HYPERPLASIA OF PROSTATE), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'40481080' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_40481080' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 40481080
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 40481080
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 40481080
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 40482030 (DYSPLASIA OF PROSTATE), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'40482030' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_40482030' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 40482030
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 40482030
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 40482030
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 40482406 (LOW LYING PLACENTA), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'40482406' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_40482406' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 40482406
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 40482406
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 40482406
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 40483613 (INFLAMMATORY DISEASE OF FEMALE GENITAL STRUCTURE), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'40483613' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_40483613' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 40483613
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 40483613
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 40483613
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 40490888 (HERNIATION OF RECTUM INTO VAGINA), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'40490888' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_40490888' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 40490888
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 40490888
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 40490888
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 42709954 (PHIMOSIS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'42709954' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_42709954' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 42709954
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 42709954
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 42709954
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 45757415 (BENIGN ENDOMETRIAL HYPERPLASIA), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'45757415' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_45757415' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 45757415
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 45757415
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 45757415
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 45766654 (DISORDER OF SKIN OF PENIS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'45766654' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_45766654' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 45766654
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 45766654
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 45766654
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 45770892 (PRIMARY MALIGNANT NEOPLASM OF UTERUS), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'45770892' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_45770892' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 45770892
plausibleGender = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 45770892
		  	and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 45770892
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGender' as check_name
  ,'CONCEPT' as check_level
  ,'For a CONCEPT_ID 45772671 (NODULAR PROSTATE WITHOUT URINARY OBSTRUCTION), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'45772671' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegender_condition_occurrence_condition_concept_id_45772671' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER - number of records of a given concept which occur in person with implausible gender for that concept
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 45772671
plausibleGender = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
	denominator.num_rows as num_denominator_rows
from
(
	select 
		count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select cdmtable.* 
		from dataform.condition_occurrence cdmtable
			join dataform.person p
				on cdmtable.person_id = p.person_id
		where cdmtable.condition_concept_id = 45772671
		  	and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
	where condition_concept_id = 45772671
) denominator
) cte
)
 SELECT *
from cte_all
;

