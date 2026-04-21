/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'measureObservationPeriodOverlap' as check_name
  ,'TABLE' as check_level
  ,'The number and percent of persons that have overlapping or back-to-back observation periods.' as check_description
  ,'OBSERVATION_PERIOD' as cdm_table_name
  ,'NA' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'table_observation_period_overlap.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'table_measureobservationperiodoverlap_observation_period' as checkid
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
MEASURE_OBSERVATION_PERIOD_OVERLAP
Determine what #/% of persons have overlapping or back-to-back observation periods
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
		select distinct
			cdmtable.person_id 
		from dataform.observation_period cdmtable
		join dataform.observation_period cdmtable2 
		    on cdmtable.person_id = cdmtable2.person_id
		    and cdmtable.observation_period_id != cdmtable2.observation_period_id
		where (cdmtable.observation_period_start_date <= cdmtable2.observation_period_end_date 
		    and cdmtable.observation_period_end_date >= cdmtable2.observation_period_start_date)
		    or (date_add(if(safe_cast(cdmtable.observation_period_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.observation_period_end_date  as string)),safe_cast(cdmtable.observation_period_end_date  as date)), interval 1 day) = cdmtable2.observation_period_start_date)
		    or (date_add(if(safe_cast(cdmtable2.observation_period_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable2.observation_period_end_date  as string)),safe_cast(cdmtable2.observation_period_end_date  as date)), interval 1 day) = cdmtable.observation_period_start_date)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
		count(distinct cdmtable.person_id) as num_rows
	from dataform.observation_period cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

