/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGenderUseDescendants' as check_name
  ,'CONCEPT' as check_level
  ,'For descendants of CONCEPT_ID 4090861, 4025213 (MALE GENITALIA FINDING, MALE REPRODUCTIVE FINDING), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4090861, 4025213' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender_use_descendants.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegenderusedescendants_condition_occurrence_condition_concept_id_4090861,4025213' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 2 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 2 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,2 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER_USE_DESCENDANTS - number of records of descendants of a given concept which occur in person with implausible gender for that concept set
Parameters used in this template:
cdmDatabaseSchema = dataform
vocabDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4090861, 4025213
plausibleGenderUseDescendants = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
			join dataform.concept_ancestor ca
				on ca.descendant_concept_id = cdmtable.condition_concept_id
		where ca.ancestor_concept_id in (4090861, 4025213)
		and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
		join dataform.concept_ancestor ca
			on ca.descendant_concept_id = cdmtable.condition_concept_id
	where ca.ancestor_concept_id in (4090861, 4025213)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGenderUseDescendants' as check_name
  ,'CONCEPT' as check_level
  ,'For descendants of CONCEPT_ID 4095793 , 443343, 4024004 , 4172857, 444094 , 197810, 4158481 (FEMALE GENITALIA FINDING, DISORDER OF INTRAUTERINE CONTRACEPTIVE DEVICE, MENOPAUSE FINDING, DISORDER OF FEMALE GENITAL SYSTEM, MALIGNANT NEOPLASM OF UTERINE ADNEXA, FINDING RELATED TO PREGNANCY, FEMALE REPRODUCTIVE FINDING), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'4095793 , 443343, 4024004 , 4172857, 444094 , 197810, 4158481' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender_use_descendants.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegenderusedescendants_condition_occurrence_condition_concept_id_4095793,443343,4024004,4172857,444094,197810,4158481' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 2 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 2 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,2 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER_USE_DESCENDANTS - number of records of descendants of a given concept which occur in person with implausible gender for that concept set
Parameters used in this template:
cdmDatabaseSchema = dataform
vocabDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
conceptId = 4095793 , 443343, 4024004 , 4172857, 444094 , 197810, 4158481
plausibleGenderUseDescendants = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
			join dataform.concept_ancestor ca
				on ca.descendant_concept_id = cdmtable.condition_concept_id
		where ca.ancestor_concept_id in (4095793 , 443343, 4024004 , 4172857, 444094 , 197810, 4158481)
		and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
		join dataform.concept_ancestor ca
			on ca.descendant_concept_id = cdmtable.condition_concept_id
	where ca.ancestor_concept_id in (4095793 , 443343, 4024004 , 4172857, 444094 , 197810, 4158481)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGenderUseDescendants' as check_name
  ,'CONCEPT' as check_level
  ,'For descendants of CONCEPT_ID 4041261 (PROCEDURE ON FEMALE GENITAL SYSTEM), the number and percent of records associated with patients with an implausible gender (correct gender = FEMALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'4041261' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender_use_descendants.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegenderusedescendants_procedure_occurrence_procedure_concept_id_4041261' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 2 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 2 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,2 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER_USE_DESCENDANTS - number of records of descendants of a given concept which occur in person with implausible gender for that concept set
Parameters used in this template:
cdmDatabaseSchema = dataform
vocabDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 4041261
plausibleGenderUseDescendants = Female
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
			join dataform.concept_ancestor ca
				on ca.descendant_concept_id = cdmtable.procedure_concept_id
		where ca.ancestor_concept_id in (4041261)
		and p.gender_concept_id <> 8532 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
		join dataform.concept_ancestor ca
			on ca.descendant_concept_id = cdmtable.procedure_concept_id
	where ca.ancestor_concept_id in (4041261)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleGenderUseDescendants' as check_name
  ,'CONCEPT' as check_level
  ,'For descendants of CONCEPT_ID 4250917, 4077750, 4043199, 4040577 (OPERATION ON PROSTATE, OPERATION ON SCROTUM, PROCEDURE ON PENIS, PROCEDURE ON TESTIS), the number and percent of records associated with patients with an implausible gender (correct gender = MALE).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'4250917, 4077750, 4043199, 4040577' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_gender_use_descendants.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausiblegenderusedescendants_procedure_occurrence_procedure_concept_id_4250917,4077750,4043199,4040577' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 2 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 2 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,2 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_GENDER_USE_DESCENDANTS - number of records of descendants of a given concept which occur in person with implausible gender for that concept set
Parameters used in this template:
cdmDatabaseSchema = dataform
vocabDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
conceptId = 4250917, 4077750, 4043199, 4040577
plausibleGenderUseDescendants = Male
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
			join dataform.concept_ancestor ca
				on ca.descendant_concept_id = cdmtable.procedure_concept_id
		where ca.ancestor_concept_id in (4250917, 4077750, 4043199, 4040577)
		and p.gender_concept_id <> 8507 
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
		join dataform.concept_ancestor ca
			on ca.descendant_concept_id = cdmtable.procedure_concept_id
	where ca.ancestor_concept_id in (4250917, 4077750, 4043199, 4040577)
) denominator
) cte
)
 SELECT *
from cte_all
;

