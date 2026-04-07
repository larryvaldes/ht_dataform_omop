/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the CDM_RELEASE_DATE field of the CDM_SOURCE table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'CDM_SOURCE' as cdm_table_name
  ,'CDM_RELEASE_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_cdm_source_cdm_release_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = CDM_SOURCE
cdmFieldName = CDM_RELEASE_DATE
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.cdm_release_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.cdm_release_date  as string)),safe_cast(cdmtable.cdm_release_date  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.cdm_source cdmtable
  	where cdm_release_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the SOURCE_RELEASE_DATE field of the CDM_SOURCE table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'CDM_SOURCE' as cdm_table_name
  ,'SOURCE_RELEASE_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_cdm_source_source_release_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = CDM_SOURCE
cdmFieldName = SOURCE_RELEASE_DATE
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.source_release_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.source_release_date  as string)),safe_cast(cdmtable.source_release_date  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.cdm_source cdmtable
  	where source_release_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the COHORT_END_DATE field of the COHORT table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'COHORT' as cdm_table_name
  ,'COHORT_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_cohort_cohort_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = COHORT
cdmFieldName = COHORT_END_DATE
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.cohort_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.cohort_end_date  as string)),safe_cast(cdmtable.cohort_end_date  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.cohort cdmtable
  	where cohort_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the COHORT_START_DATE field of the COHORT table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'COHORT' as cdm_table_name
  ,'COHORT_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_cohort_cohort_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = COHORT
cdmFieldName = COHORT_START_DATE
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.cohort_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.cohort_start_date  as string)),safe_cast(cdmtable.cohort_start_date  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.cohort cdmtable
  	where cohort_start_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the CONDITION_ERA_END_DATE field of the CONDITION_ERA table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'CONDITION_ERA' as cdm_table_name
  ,'CONDITION_ERA_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_condition_era_condition_era_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_ERA
cdmFieldName = CONDITION_ERA_END_DATE
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.condition_era_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.condition_era_end_date  as string)),safe_cast(cdmtable.condition_era_end_date  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.condition_era cdmtable
  	where condition_era_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the CONDITION_ERA_START_DATE field of the CONDITION_ERA table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'CONDITION_ERA' as cdm_table_name
  ,'CONDITION_ERA_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_condition_era_condition_era_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_ERA
cdmFieldName = CONDITION_ERA_START_DATE
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.condition_era_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.condition_era_start_date  as string)),safe_cast(cdmtable.condition_era_start_date  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.condition_era cdmtable
  	where condition_era_start_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the CONDITION_END_DATE field of the CONDITION_OCCURRENCE table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_condition_occurrence_condition_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_END_DATE
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.condition_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.condition_end_date  as string)),safe_cast(cdmtable.condition_end_date  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
  	where condition_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the CONDITION_END_DATETIME field of the CONDITION_OCCURRENCE table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_END_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_condition_occurrence_condition_end_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_END_DATETIME
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.condition_end_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.condition_end_datetime  as string)),safe_cast(cdmtable.condition_end_datetime  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
  	where condition_end_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the CONDITION_START_DATE field of the CONDITION_OCCURRENCE table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_condition_occurrence_condition_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_START_DATE
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.condition_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.condition_start_date  as string)),safe_cast(cdmtable.condition_start_date  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
  	where condition_start_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the CONDITION_START_DATETIME field of the CONDITION_OCCURRENCE table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_START_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_condition_occurrence_condition_start_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_START_DATETIME
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.condition_start_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.condition_start_datetime  as string)),safe_cast(cdmtable.condition_start_datetime  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.condition_occurrence cdmtable
  	where condition_start_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the DEATH_DATE field of the DEATH table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'DEATH' as cdm_table_name
  ,'DEATH_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_death_death_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = DEATH
cdmFieldName = DEATH_DATE
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.death_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.death_date  as string)),safe_cast(cdmtable.death_date  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.death cdmtable
  	where death_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the DEATH_DATETIME field of the DEATH table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'DEATH' as cdm_table_name
  ,'DEATH_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_death_death_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = DEATH
cdmFieldName = DEATH_DATETIME
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.death_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.death_datetime  as string)),safe_cast(cdmtable.death_datetime  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.death cdmtable
  	where death_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the DEVICE_EXPOSURE_END_DATE field of the DEVICE_EXPOSURE table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_EXPOSURE_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_device_exposure_device_exposure_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = DEVICE_EXPOSURE_END_DATE
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.device_exposure_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.device_exposure_end_date  as string)),safe_cast(cdmtable.device_exposure_end_date  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.device_exposure cdmtable
  	where device_exposure_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the DEVICE_EXPOSURE_END_DATETIME field of the DEVICE_EXPOSURE table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_EXPOSURE_END_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_device_exposure_device_exposure_end_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = DEVICE_EXPOSURE_END_DATETIME
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.device_exposure_end_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.device_exposure_end_datetime  as string)),safe_cast(cdmtable.device_exposure_end_datetime  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.device_exposure cdmtable
  	where device_exposure_end_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the DEVICE_EXPOSURE_START_DATE field of the DEVICE_EXPOSURE table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_EXPOSURE_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_device_exposure_device_exposure_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = DEVICE_EXPOSURE_START_DATE
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.device_exposure_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.device_exposure_start_date  as string)),safe_cast(cdmtable.device_exposure_start_date  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.device_exposure cdmtable
  	where device_exposure_start_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the DEVICE_EXPOSURE_START_DATETIME field of the DEVICE_EXPOSURE table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_EXPOSURE_START_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_device_exposure_device_exposure_start_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = DEVICE_EXPOSURE_START_DATETIME
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.device_exposure_start_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.device_exposure_start_datetime  as string)),safe_cast(cdmtable.device_exposure_start_datetime  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.device_exposure cdmtable
  	where device_exposure_start_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the DOSE_ERA_END_DATE field of the DOSE_ERA table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'DOSE_ERA_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_dose_era_dose_era_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = DOSE_ERA
cdmFieldName = DOSE_ERA_END_DATE
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.dose_era_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.dose_era_end_date  as string)),safe_cast(cdmtable.dose_era_end_date  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.dose_era cdmtable
  	where dose_era_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the DOSE_ERA_START_DATE field of the DOSE_ERA table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'DOSE_ERA_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_dose_era_dose_era_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = DOSE_ERA
cdmFieldName = DOSE_ERA_START_DATE
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.dose_era_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.dose_era_start_date  as string)),safe_cast(cdmtable.dose_era_start_date  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.dose_era cdmtable
  	where dose_era_start_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the DRUG_ERA_END_DATE field of the DRUG_ERA table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'DRUG_ERA' as cdm_table_name
  ,'DRUG_ERA_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_drug_era_drug_era_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_ERA
cdmFieldName = DRUG_ERA_END_DATE
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.drug_era_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.drug_era_end_date  as string)),safe_cast(cdmtable.drug_era_end_date  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.drug_era cdmtable
  	where drug_era_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the DRUG_ERA_START_DATE field of the DRUG_ERA table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'DRUG_ERA' as cdm_table_name
  ,'DRUG_ERA_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_drug_era_drug_era_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_ERA
cdmFieldName = DRUG_ERA_START_DATE
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.drug_era_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.drug_era_start_date  as string)),safe_cast(cdmtable.drug_era_start_date  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.drug_era cdmtable
  	where drug_era_start_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the DAYS_SUPPLY field of the DRUG_EXPOSURE table greater than 365.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DAYS_SUPPLY' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_drug_exposure_days_supply' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DAYS_SUPPLY
plausibleValueHigh = 365
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where cdmtable.days_supply > 365
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.drug_exposure cdmtable
  	where days_supply is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the DRUG_EXPOSURE_END_DATE field of the DRUG_EXPOSURE table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_EXPOSURE_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_drug_exposure_drug_exposure_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DRUG_EXPOSURE_END_DATE
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.drug_exposure_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.drug_exposure_end_date  as string)),safe_cast(cdmtable.drug_exposure_end_date  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.drug_exposure cdmtable
  	where drug_exposure_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the DRUG_EXPOSURE_END_DATETIME field of the DRUG_EXPOSURE table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_EXPOSURE_END_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_drug_exposure_drug_exposure_end_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DRUG_EXPOSURE_END_DATETIME
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.drug_exposure_end_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.drug_exposure_end_datetime  as string)),safe_cast(cdmtable.drug_exposure_end_datetime  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.drug_exposure cdmtable
  	where drug_exposure_end_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the DRUG_EXPOSURE_START_DATE field of the DRUG_EXPOSURE table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_EXPOSURE_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_drug_exposure_drug_exposure_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DRUG_EXPOSURE_START_DATE
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.drug_exposure_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.drug_exposure_start_date  as string)),safe_cast(cdmtable.drug_exposure_start_date  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.drug_exposure cdmtable
  	where drug_exposure_start_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the DRUG_EXPOSURE_START_DATETIME field of the DRUG_EXPOSURE table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_EXPOSURE_START_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_drug_exposure_drug_exposure_start_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DRUG_EXPOSURE_START_DATETIME
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.drug_exposure_start_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.drug_exposure_start_datetime  as string)),safe_cast(cdmtable.drug_exposure_start_datetime  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.drug_exposure cdmtable
  	where drug_exposure_start_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the REFILLS field of the DRUG_EXPOSURE table greater than 24.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'REFILLS' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_drug_exposure_refills' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = REFILLS
plausibleValueHigh = 24
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where cdmtable.refills > 24
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.drug_exposure cdmtable
  	where refills is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the VERBATIM_END_DATE field of the DRUG_EXPOSURE table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'VERBATIM_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_drug_exposure_verbatim_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = VERBATIM_END_DATE
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.verbatim_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.verbatim_end_date  as string)),safe_cast(cdmtable.verbatim_end_date  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.drug_exposure cdmtable
  	where verbatim_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the EPISODE_END_DATE field of the EPISODE table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_episode_episode_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_END_DATE
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.episode_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.episode_end_date  as string)),safe_cast(cdmtable.episode_end_date  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.episode cdmtable
  	where episode_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the EPISODE_END_DATETIME field of the EPISODE table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_END_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_episode_episode_end_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_END_DATETIME
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.episode_end_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.episode_end_datetime  as string)),safe_cast(cdmtable.episode_end_datetime  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.episode cdmtable
  	where episode_end_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the EPISODE_START_DATE field of the EPISODE table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_episode_episode_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_START_DATE
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.episode_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.episode_start_date  as string)),safe_cast(cdmtable.episode_start_date  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.episode cdmtable
  	where episode_start_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the EPISODE_START_DATETIME field of the EPISODE table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_START_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_episode_episode_start_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_START_DATETIME
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.episode_start_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.episode_start_datetime  as string)),safe_cast(cdmtable.episode_start_datetime  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.episode cdmtable
  	where episode_start_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the MEASUREMENT_DATE field of the MEASUREMENT table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_measurement_measurement_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_DATE
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.measurement_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.measurement_date  as string)),safe_cast(cdmtable.measurement_date  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.measurement cdmtable
  	where measurement_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the MEASUREMENT_DATETIME field of the MEASUREMENT table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_measurement_measurement_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_DATETIME
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.measurement_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.measurement_datetime  as string)),safe_cast(cdmtable.measurement_datetime  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.measurement cdmtable
  	where measurement_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the NOTE_DATE field of the NOTE table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_note_note_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = NOTE
cdmFieldName = NOTE_DATE
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.note_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.note_date  as string)),safe_cast(cdmtable.note_date  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.note cdmtable
  	where note_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the NOTE_DATETIME field of the NOTE table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_note_note_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = NOTE
cdmFieldName = NOTE_DATETIME
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.note_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.note_datetime  as string)),safe_cast(cdmtable.note_datetime  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.note cdmtable
  	where note_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the NLP_DATETIME field of the NOTE_NLP table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'NLP_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_note_nlp_nlp_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = NOTE_NLP
cdmFieldName = NLP_DATETIME
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.nlp_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.nlp_datetime  as string)),safe_cast(cdmtable.nlp_datetime  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.note_nlp cdmtable
  	where nlp_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the OBSERVATION_DATE field of the OBSERVATION table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_observation_observation_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION
cdmFieldName = OBSERVATION_DATE
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.observation_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.observation_date  as string)),safe_cast(cdmtable.observation_date  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.observation cdmtable
  	where observation_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the OBSERVATION_DATETIME field of the OBSERVATION table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_observation_observation_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION
cdmFieldName = OBSERVATION_DATETIME
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.observation_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.observation_datetime  as string)),safe_cast(cdmtable.observation_datetime  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.observation cdmtable
  	where observation_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the OBSERVATION_PERIOD_END_DATE field of the OBSERVATION_PERIOD table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'OBSERVATION_PERIOD' as cdm_table_name
  ,'OBSERVATION_PERIOD_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_observation_period_observation_period_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION_PERIOD
cdmFieldName = OBSERVATION_PERIOD_END_DATE
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.observation_period_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.observation_period_end_date  as string)),safe_cast(cdmtable.observation_period_end_date  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.observation_period cdmtable
  	where observation_period_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the OBSERVATION_PERIOD_START_DATE field of the OBSERVATION_PERIOD table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'OBSERVATION_PERIOD' as cdm_table_name
  ,'OBSERVATION_PERIOD_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_observation_period_observation_period_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION_PERIOD
cdmFieldName = OBSERVATION_PERIOD_START_DATE
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.observation_period_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.observation_period_start_date  as string)),safe_cast(cdmtable.observation_period_start_date  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.observation_period cdmtable
  	where observation_period_start_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the PAYER_PLAN_PERIOD_END_DATE field of the PAYER_PLAN_PERIOD table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PAYER_PLAN_PERIOD_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_payer_plan_period_payer_plan_period_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = PAYER_PLAN_PERIOD_END_DATE
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.payer_plan_period_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.payer_plan_period_end_date  as string)),safe_cast(cdmtable.payer_plan_period_end_date  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.payer_plan_period cdmtable
  	where payer_plan_period_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the PAYER_PLAN_PERIOD_START_DATE field of the PAYER_PLAN_PERIOD table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PAYER_PLAN_PERIOD_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_payer_plan_period_payer_plan_period_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = PAYER_PLAN_PERIOD_START_DATE
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.payer_plan_period_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.payer_plan_period_start_date  as string)),safe_cast(cdmtable.payer_plan_period_start_date  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.payer_plan_period cdmtable
  	where payer_plan_period_start_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the BIRTH_DATETIME field of the PERSON table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'PERSON' as cdm_table_name
  ,'BIRTH_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_person_birth_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = PERSON
cdmFieldName = BIRTH_DATETIME
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.birth_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.birth_datetime  as string)),safe_cast(cdmtable.birth_datetime  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.person cdmtable
  	where birth_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the DAY_OF_BIRTH field of the PERSON table greater than 31.' as check_description
  ,'PERSON' as cdm_table_name
  ,'DAY_OF_BIRTH' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_person_day_of_birth' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = PERSON
cdmFieldName = DAY_OF_BIRTH
plausibleValueHigh = 31
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where cdmtable.day_of_birth > 31
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.person cdmtable
  	where day_of_birth is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the MONTH_OF_BIRTH field of the PERSON table greater than 12.' as check_description
  ,'PERSON' as cdm_table_name
  ,'MONTH_OF_BIRTH' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_person_month_of_birth' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = PERSON
cdmFieldName = MONTH_OF_BIRTH
plausibleValueHigh = 12
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where cdmtable.month_of_birth > 12
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.person cdmtable
  	where month_of_birth is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the YEAR_OF_BIRTH field of the PERSON table greater than YEAR(GETDATE())+1.' as check_description
  ,'PERSON' as cdm_table_name
  ,'YEAR_OF_BIRTH' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_person_year_of_birth' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = PERSON
cdmFieldName = YEAR_OF_BIRTH
plausibleValueHigh = YEAR(GETDATE())+1
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where cdmtable.year_of_birth > extract(year from current_date())+1
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.person cdmtable
  	where year_of_birth is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the PROCEDURE_DATE field of the PROCEDURE_OCCURRENCE table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_procedure_occurrence_procedure_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_DATE
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.procedure_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.procedure_date  as string)),safe_cast(cdmtable.procedure_date  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
  	where procedure_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the PROCEDURE_DATETIME field of the PROCEDURE_OCCURRENCE table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_procedure_occurrence_procedure_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_DATETIME
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.procedure_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.procedure_datetime  as string)),safe_cast(cdmtable.procedure_datetime  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
  	where procedure_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the PROCEDURE_END_DATE field of the PROCEDURE_OCCURRENCE table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_procedure_occurrence_procedure_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_END_DATE
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.procedure_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.procedure_end_date  as string)),safe_cast(cdmtable.procedure_end_date  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
  	where procedure_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the PROCEDURE_END_DATETIME field of the PROCEDURE_OCCURRENCE table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_END_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_procedure_occurrence_procedure_end_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_END_DATETIME
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.procedure_end_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.procedure_end_datetime  as string)),safe_cast(cdmtable.procedure_end_datetime  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.procedure_occurrence cdmtable
  	where procedure_end_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the SPECIMEN_DATE field of the SPECIMEN table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'SPECIMEN_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_specimen_specimen_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = SPECIMEN
cdmFieldName = SPECIMEN_DATE
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.specimen_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.specimen_date  as string)),safe_cast(cdmtable.specimen_date  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.specimen cdmtable
  	where specimen_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the SPECIMEN_DATETIME field of the SPECIMEN table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'SPECIMEN_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_specimen_specimen_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = SPECIMEN
cdmFieldName = SPECIMEN_DATETIME
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.specimen_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.specimen_datetime  as string)),safe_cast(cdmtable.specimen_datetime  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.specimen cdmtable
  	where specimen_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the VISIT_DETAIL_END_DATE field of the VISIT_DETAIL table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_visit_detail_visit_detail_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_DETAIL_END_DATE
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.visit_detail_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.visit_detail_end_date  as string)),safe_cast(cdmtable.visit_detail_end_date  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.visit_detail cdmtable
  	where visit_detail_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the VISIT_DETAIL_END_DATETIME field of the VISIT_DETAIL table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_END_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_visit_detail_visit_detail_end_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_DETAIL_END_DATETIME
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.visit_detail_end_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.visit_detail_end_datetime  as string)),safe_cast(cdmtable.visit_detail_end_datetime  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.visit_detail cdmtable
  	where visit_detail_end_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the VISIT_DETAIL_START_DATE field of the VISIT_DETAIL table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_visit_detail_visit_detail_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_DETAIL_START_DATE
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.visit_detail_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.visit_detail_start_date  as string)),safe_cast(cdmtable.visit_detail_start_date  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.visit_detail cdmtable
  	where visit_detail_start_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the VISIT_DETAIL_START_DATETIME field of the VISIT_DETAIL table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_START_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_visit_detail_visit_detail_start_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_DETAIL_START_DATETIME
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.visit_detail_start_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.visit_detail_start_datetime  as string)),safe_cast(cdmtable.visit_detail_start_datetime  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.visit_detail cdmtable
  	where visit_detail_start_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the VISIT_END_DATE field of the VISIT_OCCURRENCE table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_visit_occurrence_visit_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = VISIT_END_DATE
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.visit_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.visit_end_date  as string)),safe_cast(cdmtable.visit_end_date  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.visit_occurrence cdmtable
  	where visit_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the VISIT_END_DATETIME field of the VISIT_OCCURRENCE table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_END_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_visit_occurrence_visit_end_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = VISIT_END_DATETIME
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.visit_end_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.visit_end_datetime  as string)),safe_cast(cdmtable.visit_end_datetime  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.visit_occurrence cdmtable
  	where visit_end_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the VISIT_START_DATE field of the VISIT_OCCURRENCE table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_visit_occurrence_visit_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = VISIT_START_DATE
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.visit_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.visit_start_date  as string)),safe_cast(cdmtable.visit_start_date  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.visit_occurrence cdmtable
  	where visit_start_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleValueHigh' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the VISIT_START_DATETIME field of the VISIT_OCCURRENCE table greater than DATEADD(DD,1,GETDATE()).' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_START_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_value_high.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblevaluehigh_visit_occurrence_visit_start_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_VALUE_HIGH
get number of records and the proportion to total number of eligible records that exceed this threshold
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = VISIT_START_DATETIME
plausibleValueHigh = DATEADD(dd,1,GETDATE())
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
      	    where if(safe_cast(cdmtable.visit_start_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.visit_start_datetime  as string)),safe_cast(cdmtable.visit_start_datetime  as date)) > if(safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date) is null,parse_date('%Y%m%d', cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as string)),safe_cast(date_add(if(safe_cast(current_date()  as date) is null,parse_date('%Y%m%d', cast(current_date()  as string)),safe_cast(current_date()  as date)), interval 1 day)  as date))
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
(
	select 
		count(*) as num_rows
	from dataform.visit_occurrence cdmtable
  	where visit_start_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

