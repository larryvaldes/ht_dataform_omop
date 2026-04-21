/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'measurePersonCompleteness' as check_name
  ,'TABLE' as check_level
  ,'The number and percent of persons in the CDM that do not have at least one record in the OBSERVATION_PERIOD table' as check_description
  ,'OBSERVATION_PERIOD' as cdm_table_name
  ,'NA' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'table_person_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'table_measurepersoncompleteness_observation_period' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
Table Level:  
MEASURE_PERSON_COMPLETENESS
Determine what #/% of persons have at least one record in the cdmTable
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION_PERIOD
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.person_id) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			cdmtable.* 
		from dataform.person cdmtable
			left join dataform.observation_period cdmtable2 
			    on cdmtable.person_id = cdmtable2.person_id
		where cdmtable2.person_id is null
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
  ,'measurePersonCompleteness' as check_name
  ,'TABLE' as check_level
  ,'The number and percent of persons in the CDM that do not have at least one record in the VISIT_OCCURRENCE table' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'NA' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'table_person_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'table_measurepersoncompleteness_visit_occurrence' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 95 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 95 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,95 as threshold_value
  ,null as notes_value
from (
  /*********
Table Level:  
MEASURE_PERSON_COMPLETENESS
Determine what #/% of persons have at least one record in the cdmTable
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_OCCURRENCE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.person_id) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			cdmtable.* 
		from dataform.person cdmtable
			left join dataform.visit_occurrence cdmtable2 
			    on cdmtable.person_id = cdmtable2.person_id
		where cdmtable2.person_id is null
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
  ,'measurePersonCompleteness' as check_name
  ,'TABLE' as check_level
  ,'The number and percent of persons in the CDM that do not have at least one record in the VISIT_DETAIL table' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'NA' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'table_person_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'table_measurepersoncompleteness_visit_detail' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
Table Level:  
MEASURE_PERSON_COMPLETENESS
Determine what #/% of persons have at least one record in the cdmTable
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.person_id) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			cdmtable.* 
		from dataform.person cdmtable
			left join dataform.visit_detail cdmtable2 
			    on cdmtable.person_id = cdmtable2.person_id
		where cdmtable2.person_id is null
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
  ,'measurePersonCompleteness' as check_name
  ,'TABLE' as check_level
  ,'The number and percent of persons in the CDM that do not have at least one record in the CONDITION_OCCURRENCE table' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'NA' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'table_person_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'table_measurepersoncompleteness_condition_occurrence' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 95 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 95 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,95 as threshold_value
  ,null as notes_value
from (
  /*********
Table Level:  
MEASURE_PERSON_COMPLETENESS
Determine what #/% of persons have at least one record in the cdmTable
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_OCCURRENCE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.person_id) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			cdmtable.* 
		from dataform.person cdmtable
			left join dataform.condition_occurrence cdmtable2 
			    on cdmtable.person_id = cdmtable2.person_id
		where cdmtable2.person_id is null
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
  ,'measurePersonCompleteness' as check_name
  ,'TABLE' as check_level
  ,'The number and percent of persons in the CDM that do not have at least one record in the DRUG_EXPOSURE table' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'NA' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'table_person_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'table_measurepersoncompleteness_drug_exposure' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 95 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 95 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,95 as threshold_value
  ,null as notes_value
from (
  /*********
Table Level:  
MEASURE_PERSON_COMPLETENESS
Determine what #/% of persons have at least one record in the cdmTable
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.person_id) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			cdmtable.* 
		from dataform.person cdmtable
			left join dataform.drug_exposure cdmtable2 
			    on cdmtable.person_id = cdmtable2.person_id
		where cdmtable2.person_id is null
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
  ,'measurePersonCompleteness' as check_name
  ,'TABLE' as check_level
  ,'The number and percent of persons in the CDM that do not have at least one record in the PROCEDURE_OCCURRENCE table' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'NA' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'table_person_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'table_measurepersoncompleteness_procedure_occurrence' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 95 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 95 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,95 as threshold_value
  ,null as notes_value
from (
  /*********
Table Level:  
MEASURE_PERSON_COMPLETENESS
Determine what #/% of persons have at least one record in the cdmTable
Parameters used in this template:
schema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.person_id) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			cdmtable.* 
		from dataform.person cdmtable
			left join dataform.procedure_occurrence cdmtable2 
			    on cdmtable.person_id = cdmtable2.person_id
		where cdmtable2.person_id is null
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
  ,'measurePersonCompleteness' as check_name
  ,'TABLE' as check_level
  ,'The number and percent of persons in the CDM that do not have at least one record in the DEVICE_EXPOSURE table' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'NA' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'table_person_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'table_measurepersoncompleteness_device_exposure' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
Table Level:  
MEASURE_PERSON_COMPLETENESS
Determine what #/% of persons have at least one record in the cdmTable
Parameters used in this template:
schema = dataform
cdmTableName = DEVICE_EXPOSURE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.person_id) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			cdmtable.* 
		from dataform.person cdmtable
			left join dataform.device_exposure cdmtable2 
			    on cdmtable.person_id = cdmtable2.person_id
		where cdmtable2.person_id is null
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
  ,'measurePersonCompleteness' as check_name
  ,'TABLE' as check_level
  ,'The number and percent of persons in the CDM that do not have at least one record in the MEASUREMENT table' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'NA' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'table_person_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'table_measurepersoncompleteness_measurement' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 95 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 95 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,95 as threshold_value
  ,null as notes_value
from (
  /*********
Table Level:  
MEASURE_PERSON_COMPLETENESS
Determine what #/% of persons have at least one record in the cdmTable
Parameters used in this template:
schema = dataform
cdmTableName = MEASUREMENT
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.person_id) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			cdmtable.* 
		from dataform.person cdmtable
			left join dataform.measurement cdmtable2 
			    on cdmtable.person_id = cdmtable2.person_id
		where cdmtable2.person_id is null
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
  ,'measurePersonCompleteness' as check_name
  ,'TABLE' as check_level
  ,'The number and percent of persons in the CDM that do not have at least one record in the OBSERVATION table' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'NA' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'table_person_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'table_measurepersoncompleteness_observation' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 95 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 95 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,95 as threshold_value
  ,null as notes_value
from (
  /*********
Table Level:  
MEASURE_PERSON_COMPLETENESS
Determine what #/% of persons have at least one record in the cdmTable
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.person_id) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			cdmtable.* 
		from dataform.person cdmtable
			left join dataform.observation cdmtable2 
			    on cdmtable.person_id = cdmtable2.person_id
		where cdmtable2.person_id is null
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
  ,'measurePersonCompleteness' as check_name
  ,'TABLE' as check_level
  ,'The number and percent of persons in the CDM that do not have at least one record in the DEATH table' as check_description
  ,'DEATH' as cdm_table_name
  ,'NA' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'table_person_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'table_measurepersoncompleteness_death' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
Table Level:  
MEASURE_PERSON_COMPLETENESS
Determine what #/% of persons have at least one record in the cdmTable
Parameters used in this template:
schema = dataform
cdmTableName = DEATH
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.person_id) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			cdmtable.* 
		from dataform.person cdmtable
			left join dataform.death cdmtable2 
			    on cdmtable.person_id = cdmtable2.person_id
		where cdmtable2.person_id is null
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
  ,'measurePersonCompleteness' as check_name
  ,'TABLE' as check_level
  ,'The number and percent of persons in the CDM that do not have at least one record in the NOTE table' as check_description
  ,'NOTE' as cdm_table_name
  ,'NA' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'table_person_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'table_measurepersoncompleteness_note' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
Table Level:  
MEASURE_PERSON_COMPLETENESS
Determine what #/% of persons have at least one record in the cdmTable
Parameters used in this template:
schema = dataform
cdmTableName = NOTE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.person_id) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			cdmtable.* 
		from dataform.person cdmtable
			left join dataform.note cdmtable2 
			    on cdmtable.person_id = cdmtable2.person_id
		where cdmtable2.person_id is null
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
  ,'measurePersonCompleteness' as check_name
  ,'TABLE' as check_level
  ,'The number and percent of persons in the CDM that do not have at least one record in the SPECIMEN table' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'NA' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'table_person_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'table_measurepersoncompleteness_specimen' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
Table Level:  
MEASURE_PERSON_COMPLETENESS
Determine what #/% of persons have at least one record in the cdmTable
Parameters used in this template:
schema = dataform
cdmTableName = SPECIMEN
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.person_id) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			cdmtable.* 
		from dataform.person cdmtable
			left join dataform.specimen cdmtable2 
			    on cdmtable.person_id = cdmtable2.person_id
		where cdmtable2.person_id is null
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
  ,'measurePersonCompleteness' as check_name
  ,'TABLE' as check_level
  ,'The number and percent of persons in the CDM that do not have at least one record in the PAYER_PLAN_PERIOD table' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'NA' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'table_person_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'table_measurepersoncompleteness_payer_plan_period' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
Table Level:  
MEASURE_PERSON_COMPLETENESS
Determine what #/% of persons have at least one record in the cdmTable
Parameters used in this template:
schema = dataform
cdmTableName = PAYER_PLAN_PERIOD
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.person_id) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			cdmtable.* 
		from dataform.person cdmtable
			left join dataform.payer_plan_period cdmtable2 
			    on cdmtable.person_id = cdmtable2.person_id
		where cdmtable2.person_id is null
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
  ,'measurePersonCompleteness' as check_name
  ,'TABLE' as check_level
  ,'The number and percent of persons in the CDM that do not have at least one record in the DRUG_ERA table' as check_description
  ,'DRUG_ERA' as cdm_table_name
  ,'NA' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'table_person_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'table_measurepersoncompleteness_drug_era' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 95 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 95 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,95 as threshold_value
  ,null as notes_value
from (
  /*********
Table Level:  
MEASURE_PERSON_COMPLETENESS
Determine what #/% of persons have at least one record in the cdmTable
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_ERA
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.person_id) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			cdmtable.* 
		from dataform.person cdmtable
			left join dataform.drug_era cdmtable2 
			    on cdmtable.person_id = cdmtable2.person_id
		where cdmtable2.person_id is null
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
  ,'measurePersonCompleteness' as check_name
  ,'TABLE' as check_level
  ,'The number and percent of persons in the CDM that do not have at least one record in the DOSE_ERA table' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'NA' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'table_person_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'table_measurepersoncompleteness_dose_era' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 100 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 100 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,100 as threshold_value
  ,null as notes_value
from (
  /*********
Table Level:  
MEASURE_PERSON_COMPLETENESS
Determine what #/% of persons have at least one record in the cdmTable
Parameters used in this template:
schema = dataform
cdmTableName = DOSE_ERA
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.person_id) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			cdmtable.* 
		from dataform.person cdmtable
			left join dataform.dose_era cdmtable2 
			    on cdmtable.person_id = cdmtable2.person_id
		where cdmtable2.person_id is null
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
  ,'measurePersonCompleteness' as check_name
  ,'TABLE' as check_level
  ,'The number and percent of persons in the CDM that do not have at least one record in the CONDITION_ERA table' as check_description
  ,'CONDITION_ERA' as cdm_table_name
  ,'NA' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'table_person_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'table_measurepersoncompleteness_condition_era' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 95 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 95 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,95 as threshold_value
  ,null as notes_value
from (
  /*********
Table Level:  
MEASURE_PERSON_COMPLETENESS
Determine what #/% of persons have at least one record in the cdmTable
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_ERA
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
    denominator.num_rows as num_denominator_rows
from
(
	select 
		count(violated_rows.person_id) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
			cdmtable.* 
		from dataform.person cdmtable
			left join dataform.condition_era cdmtable2 
			    on cdmtable.person_id = cdmtable2.person_id
		where cdmtable2.person_id is null
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

