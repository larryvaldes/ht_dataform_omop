/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'measureConditionEraCompleteness' as check_name
  ,'TABLE' as check_level
  ,'The number and Percent of persons that does not have condition_era built successfully  for all persons in condition_occurrence' as check_description
  ,'CONDITION_ERA' as cdm_table_name
  ,'NA' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'table_condition_era_completeness.sql' as sql_file
  ,'Completeness' as category
  ,'NA' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'table_measureconditioneracompleteness_condition_era' as checkid
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
MEASURE_CONDITION_ERA_COMPLETENESS
Determine what #/% of persons have condition_era built successfully 
for persons in condition_occurrence table
Parameters used in this template:
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
		select distinct 
		    co.person_id
		from dataform.condition_occurrence co
		left join dataform.condition_era cdmtable 
		    on co.person_id = cdmtable.person_id
  	    where cdmtable.person_id is null
  	    and co.condition_concept_id != 0
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(distinct person_id) as num_rows
	from dataform.condition_occurrence co
    where co.condition_concept_id != 0
) denominator
) cte
)
 SELECT *
from cte_all
;

