/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the CDM_RELEASE_DATE field of the CDM_SOURCE that occurs prior to the date in the SOURCE_RELEASE_DATE field of the CDM_SOURCE table.' as check_description
  ,'CDM_SOURCE' as cdm_table_name
  ,'CDM_RELEASE_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_cdm_source_cdm_release_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = CDM_SOURCE
cdmFieldName = CDM_RELEASE_DATE
plausibleTemporalAfterTableName = CDM_SOURCE
plausibleTemporalAfterFieldName = SOURCE_RELEASE_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
    where 
			if(safe_cast(cdmtable.source_release_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.source_release_date  as string)),safe_cast(cdmtable.source_release_date  as date))
		 > if(safe_cast(cdmtable.cdm_release_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.cdm_release_date  as string)),safe_cast(cdmtable.cdm_release_date  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the CONDITION_ERA_END_DATE field of the CONDITION_ERA that occurs prior to the date in the CONDITION_ERA_START_DATE field of the CONDITION_ERA table.' as check_description
  ,'CONDITION_ERA' as cdm_table_name
  ,'CONDITION_ERA_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_condition_era_condition_era_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_ERA
cdmFieldName = CONDITION_ERA_END_DATE
plausibleTemporalAfterTableName = CONDITION_ERA
plausibleTemporalAfterFieldName = CONDITION_ERA_START_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
    where 
			if(safe_cast(cdmtable.condition_era_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.condition_era_start_date  as string)),safe_cast(cdmtable.condition_era_start_date  as date))
		 > if(safe_cast(cdmtable.condition_era_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.condition_era_end_date  as string)),safe_cast(cdmtable.condition_era_end_date  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the CONDITION_ERA_START_DATE field of the CONDITION_ERA that occurs prior to the date in the BIRTH_DATETIME field of the PERSON table.' as check_description
  ,'CONDITION_ERA' as cdm_table_name
  ,'CONDITION_ERA_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_condition_era_condition_era_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_ERA
cdmFieldName = CONDITION_ERA_START_DATE
plausibleTemporalAfterTableName = PERSON
plausibleTemporalAfterFieldName = BIRTH_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
				join dataform.person plausibletable 
                    on cdmtable.person_id = plausibletable.person_id
    where 
			coalesce(
				if(safe_cast(plausibletable.birth_datetime  as date) is null,parse_date('%Y%m%d', cast(plausibletable.birth_datetime  as string)),safe_cast(plausibletable.birth_datetime  as date)),
				parse_date('%Y%m%d', concat(plausibletable.year_of_birth,'0601'))
			) 
		 > if(safe_cast(cdmtable.condition_era_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.condition_era_start_date  as string)),safe_cast(cdmtable.condition_era_start_date  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the CONDITION_END_DATE field of the CONDITION_OCCURRENCE that occurs prior to the date in the CONDITION_START_DATE field of the CONDITION_OCCURRENCE table.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_condition_occurrence_condition_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_END_DATE
plausibleTemporalAfterTableName = CONDITION_OCCURRENCE
plausibleTemporalAfterFieldName = CONDITION_START_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
    where 
			if(safe_cast(cdmtable.condition_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.condition_start_date  as string)),safe_cast(cdmtable.condition_start_date  as date))
		 > if(safe_cast(cdmtable.condition_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.condition_end_date  as string)),safe_cast(cdmtable.condition_end_date  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the CONDITION_END_DATETIME field of the CONDITION_OCCURRENCE that occurs prior to the date in the CONDITION_START_DATETIME field of the CONDITION_OCCURRENCE table.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_END_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_condition_occurrence_condition_end_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_END_DATETIME
plausibleTemporalAfterTableName = CONDITION_OCCURRENCE
plausibleTemporalAfterFieldName = CONDITION_START_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
    where 
			if(safe_cast(cdmtable.condition_start_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.condition_start_datetime  as string)),safe_cast(cdmtable.condition_start_datetime  as date))
		 > if(safe_cast(cdmtable.condition_end_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.condition_end_datetime  as string)),safe_cast(cdmtable.condition_end_datetime  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the CONDITION_START_DATE field of the CONDITION_OCCURRENCE that occurs prior to the date in the BIRTH_DATETIME field of the PERSON table.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_condition_occurrence_condition_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_START_DATE
plausibleTemporalAfterTableName = PERSON
plausibleTemporalAfterFieldName = BIRTH_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
				join dataform.person plausibletable 
                    on cdmtable.person_id = plausibletable.person_id
    where 
			coalesce(
				if(safe_cast(plausibletable.birth_datetime  as date) is null,parse_date('%Y%m%d', cast(plausibletable.birth_datetime  as string)),safe_cast(plausibletable.birth_datetime  as date)),
				parse_date('%Y%m%d', concat(plausibletable.year_of_birth,'0601'))
			) 
		 > if(safe_cast(cdmtable.condition_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.condition_start_date  as string)),safe_cast(cdmtable.condition_start_date  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the CONDITION_START_DATETIME field of the CONDITION_OCCURRENCE that occurs prior to the date in the BIRTH_DATETIME field of the PERSON table.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_START_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_condition_occurrence_condition_start_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_START_DATETIME
plausibleTemporalAfterTableName = PERSON
plausibleTemporalAfterFieldName = BIRTH_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
				join dataform.person plausibletable 
                    on cdmtable.person_id = plausibletable.person_id
    where 
			coalesce(
				if(safe_cast(plausibletable.birth_datetime  as date) is null,parse_date('%Y%m%d', cast(plausibletable.birth_datetime  as string)),safe_cast(plausibletable.birth_datetime  as date)),
				parse_date('%Y%m%d', concat(plausibletable.year_of_birth,'0601'))
			) 
		 > if(safe_cast(cdmtable.condition_start_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.condition_start_datetime  as string)),safe_cast(cdmtable.condition_start_datetime  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the DEATH_DATE field of the DEATH that occurs prior to the date in the BIRTH_DATETIME field of the PERSON table.' as check_description
  ,'DEATH' as cdm_table_name
  ,'DEATH_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_death_death_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = DEATH
cdmFieldName = DEATH_DATE
plausibleTemporalAfterTableName = PERSON
plausibleTemporalAfterFieldName = BIRTH_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
				join dataform.person plausibletable 
                    on cdmtable.person_id = plausibletable.person_id
    where 
			coalesce(
				if(safe_cast(plausibletable.birth_datetime  as date) is null,parse_date('%Y%m%d', cast(plausibletable.birth_datetime  as string)),safe_cast(plausibletable.birth_datetime  as date)),
				parse_date('%Y%m%d', concat(plausibletable.year_of_birth,'0601'))
			) 
		 > if(safe_cast(cdmtable.death_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.death_date  as string)),safe_cast(cdmtable.death_date  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the DEATH_DATETIME field of the DEATH that occurs prior to the date in the BIRTH_DATETIME field of the PERSON table.' as check_description
  ,'DEATH' as cdm_table_name
  ,'DEATH_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_death_death_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = DEATH
cdmFieldName = DEATH_DATETIME
plausibleTemporalAfterTableName = PERSON
plausibleTemporalAfterFieldName = BIRTH_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
				join dataform.person plausibletable 
                    on cdmtable.person_id = plausibletable.person_id
    where 
			coalesce(
				if(safe_cast(plausibletable.birth_datetime  as date) is null,parse_date('%Y%m%d', cast(plausibletable.birth_datetime  as string)),safe_cast(plausibletable.birth_datetime  as date)),
				parse_date('%Y%m%d', concat(plausibletable.year_of_birth,'0601'))
			) 
		 > if(safe_cast(cdmtable.death_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.death_datetime  as string)),safe_cast(cdmtable.death_datetime  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the DEVICE_EXPOSURE_END_DATE field of the DEVICE_EXPOSURE that occurs prior to the date in the DEVICE_EXPOSURE_START_DATE field of the DEVICE_EXPOSURE table.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_EXPOSURE_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_device_exposure_device_exposure_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = DEVICE_EXPOSURE_END_DATE
plausibleTemporalAfterTableName = DEVICE_EXPOSURE
plausibleTemporalAfterFieldName = DEVICE_EXPOSURE_START_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
    where 
			if(safe_cast(cdmtable.device_exposure_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.device_exposure_start_date  as string)),safe_cast(cdmtable.device_exposure_start_date  as date))
		 > if(safe_cast(cdmtable.device_exposure_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.device_exposure_end_date  as string)),safe_cast(cdmtable.device_exposure_end_date  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the DEVICE_EXPOSURE_END_DATETIME field of the DEVICE_EXPOSURE that occurs prior to the date in the DEVICE_EXPOSURE_START_DATETIME field of the DEVICE_EXPOSURE table.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_EXPOSURE_END_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_device_exposure_device_exposure_end_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = DEVICE_EXPOSURE_END_DATETIME
plausibleTemporalAfterTableName = DEVICE_EXPOSURE
plausibleTemporalAfterFieldName = DEVICE_EXPOSURE_START_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
    where 
			if(safe_cast(cdmtable.device_exposure_start_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.device_exposure_start_datetime  as string)),safe_cast(cdmtable.device_exposure_start_datetime  as date))
		 > if(safe_cast(cdmtable.device_exposure_end_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.device_exposure_end_datetime  as string)),safe_cast(cdmtable.device_exposure_end_datetime  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the DEVICE_EXPOSURE_START_DATE field of the DEVICE_EXPOSURE that occurs prior to the date in the BIRTH_DATETIME field of the PERSON table.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_EXPOSURE_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_device_exposure_device_exposure_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = DEVICE_EXPOSURE_START_DATE
plausibleTemporalAfterTableName = PERSON
plausibleTemporalAfterFieldName = BIRTH_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
				join dataform.person plausibletable 
                    on cdmtable.person_id = plausibletable.person_id
    where 
			coalesce(
				if(safe_cast(plausibletable.birth_datetime  as date) is null,parse_date('%Y%m%d', cast(plausibletable.birth_datetime  as string)),safe_cast(plausibletable.birth_datetime  as date)),
				parse_date('%Y%m%d', concat(plausibletable.year_of_birth,'0601'))
			) 
		 > if(safe_cast(cdmtable.device_exposure_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.device_exposure_start_date  as string)),safe_cast(cdmtable.device_exposure_start_date  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the DEVICE_EXPOSURE_START_DATETIME field of the DEVICE_EXPOSURE that occurs prior to the date in the BIRTH_DATETIME field of the PERSON table.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_EXPOSURE_START_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_device_exposure_device_exposure_start_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = DEVICE_EXPOSURE_START_DATETIME
plausibleTemporalAfterTableName = PERSON
plausibleTemporalAfterFieldName = BIRTH_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
				join dataform.person plausibletable 
                    on cdmtable.person_id = plausibletable.person_id
    where 
			coalesce(
				if(safe_cast(plausibletable.birth_datetime  as date) is null,parse_date('%Y%m%d', cast(plausibletable.birth_datetime  as string)),safe_cast(plausibletable.birth_datetime  as date)),
				parse_date('%Y%m%d', concat(plausibletable.year_of_birth,'0601'))
			) 
		 > if(safe_cast(cdmtable.device_exposure_start_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.device_exposure_start_datetime  as string)),safe_cast(cdmtable.device_exposure_start_datetime  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the DOSE_ERA_END_DATE field of the DOSE_ERA that occurs prior to the date in the BIRTH_DATETIME field of the PERSON table.' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'DOSE_ERA_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_dose_era_dose_era_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = DOSE_ERA
cdmFieldName = DOSE_ERA_END_DATE
plausibleTemporalAfterTableName = PERSON
plausibleTemporalAfterFieldName = BIRTH_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
				join dataform.person plausibletable 
                    on cdmtable.person_id = plausibletable.person_id
    where 
			coalesce(
				if(safe_cast(plausibletable.birth_datetime  as date) is null,parse_date('%Y%m%d', cast(plausibletable.birth_datetime  as string)),safe_cast(plausibletable.birth_datetime  as date)),
				parse_date('%Y%m%d', concat(plausibletable.year_of_birth,'0601'))
			) 
		 > if(safe_cast(cdmtable.dose_era_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.dose_era_end_date  as string)),safe_cast(cdmtable.dose_era_end_date  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the DOSE_ERA_START_DATE field of the DOSE_ERA that occurs prior to the date in the BIRTH_DATETIME field of the PERSON table.' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'DOSE_ERA_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_dose_era_dose_era_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = DOSE_ERA
cdmFieldName = DOSE_ERA_START_DATE
plausibleTemporalAfterTableName = PERSON
plausibleTemporalAfterFieldName = BIRTH_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
				join dataform.person plausibletable 
                    on cdmtable.person_id = plausibletable.person_id
    where 
			coalesce(
				if(safe_cast(plausibletable.birth_datetime  as date) is null,parse_date('%Y%m%d', cast(plausibletable.birth_datetime  as string)),safe_cast(plausibletable.birth_datetime  as date)),
				parse_date('%Y%m%d', concat(plausibletable.year_of_birth,'0601'))
			) 
		 > if(safe_cast(cdmtable.dose_era_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.dose_era_start_date  as string)),safe_cast(cdmtable.dose_era_start_date  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the DRUG_ERA_END_DATE field of the DRUG_ERA that occurs prior to the date in the DRUG_ERA_START_DATE field of the DRUG_ERA table.' as check_description
  ,'DRUG_ERA' as cdm_table_name
  ,'DRUG_ERA_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_drug_era_drug_era_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_ERA
cdmFieldName = DRUG_ERA_END_DATE
plausibleTemporalAfterTableName = DRUG_ERA
plausibleTemporalAfterFieldName = DRUG_ERA_START_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
    where 
			if(safe_cast(cdmtable.drug_era_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.drug_era_start_date  as string)),safe_cast(cdmtable.drug_era_start_date  as date))
		 > if(safe_cast(cdmtable.drug_era_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.drug_era_end_date  as string)),safe_cast(cdmtable.drug_era_end_date  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the DRUG_ERA_START_DATE field of the DRUG_ERA that occurs prior to the date in the BIRTH_DATETIME field of the PERSON table.' as check_description
  ,'DRUG_ERA' as cdm_table_name
  ,'DRUG_ERA_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_drug_era_drug_era_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_ERA
cdmFieldName = DRUG_ERA_START_DATE
plausibleTemporalAfterTableName = PERSON
plausibleTemporalAfterFieldName = BIRTH_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
				join dataform.person plausibletable 
                    on cdmtable.person_id = plausibletable.person_id
    where 
			coalesce(
				if(safe_cast(plausibletable.birth_datetime  as date) is null,parse_date('%Y%m%d', cast(plausibletable.birth_datetime  as string)),safe_cast(plausibletable.birth_datetime  as date)),
				parse_date('%Y%m%d', concat(plausibletable.year_of_birth,'0601'))
			) 
		 > if(safe_cast(cdmtable.drug_era_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.drug_era_start_date  as string)),safe_cast(cdmtable.drug_era_start_date  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the DRUG_EXPOSURE_END_DATE field of the DRUG_EXPOSURE that occurs prior to the date in the DRUG_EXPOSURE_START_DATE field of the DRUG_EXPOSURE table.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_EXPOSURE_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_drug_exposure_drug_exposure_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DRUG_EXPOSURE_END_DATE
plausibleTemporalAfterTableName = DRUG_EXPOSURE
plausibleTemporalAfterFieldName = DRUG_EXPOSURE_START_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
    where 
			if(safe_cast(cdmtable.drug_exposure_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.drug_exposure_start_date  as string)),safe_cast(cdmtable.drug_exposure_start_date  as date))
		 > if(safe_cast(cdmtable.drug_exposure_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.drug_exposure_end_date  as string)),safe_cast(cdmtable.drug_exposure_end_date  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the DRUG_EXPOSURE_END_DATETIME field of the DRUG_EXPOSURE that occurs prior to the date in the DRUG_EXPOSURE_START_DATETIME field of the DRUG_EXPOSURE table.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_EXPOSURE_END_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_drug_exposure_drug_exposure_end_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DRUG_EXPOSURE_END_DATETIME
plausibleTemporalAfterTableName = DRUG_EXPOSURE
plausibleTemporalAfterFieldName = DRUG_EXPOSURE_START_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
    where 
			if(safe_cast(cdmtable.drug_exposure_start_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.drug_exposure_start_datetime  as string)),safe_cast(cdmtable.drug_exposure_start_datetime  as date))
		 > if(safe_cast(cdmtable.drug_exposure_end_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.drug_exposure_end_datetime  as string)),safe_cast(cdmtable.drug_exposure_end_datetime  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the DRUG_EXPOSURE_START_DATE field of the DRUG_EXPOSURE that occurs prior to the date in the BIRTH_DATETIME field of the PERSON table.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_EXPOSURE_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_drug_exposure_drug_exposure_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DRUG_EXPOSURE_START_DATE
plausibleTemporalAfterTableName = PERSON
plausibleTemporalAfterFieldName = BIRTH_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
				join dataform.person plausibletable 
                    on cdmtable.person_id = plausibletable.person_id
    where 
			coalesce(
				if(safe_cast(plausibletable.birth_datetime  as date) is null,parse_date('%Y%m%d', cast(plausibletable.birth_datetime  as string)),safe_cast(plausibletable.birth_datetime  as date)),
				parse_date('%Y%m%d', concat(plausibletable.year_of_birth,'0601'))
			) 
		 > if(safe_cast(cdmtable.drug_exposure_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.drug_exposure_start_date  as string)),safe_cast(cdmtable.drug_exposure_start_date  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the DRUG_EXPOSURE_START_DATETIME field of the DRUG_EXPOSURE that occurs prior to the date in the BIRTH_DATETIME field of the PERSON table.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_EXPOSURE_START_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_drug_exposure_drug_exposure_start_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DRUG_EXPOSURE_START_DATETIME
plausibleTemporalAfterTableName = PERSON
plausibleTemporalAfterFieldName = BIRTH_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
				join dataform.person plausibletable 
                    on cdmtable.person_id = plausibletable.person_id
    where 
			coalesce(
				if(safe_cast(plausibletable.birth_datetime  as date) is null,parse_date('%Y%m%d', cast(plausibletable.birth_datetime  as string)),safe_cast(plausibletable.birth_datetime  as date)),
				parse_date('%Y%m%d', concat(plausibletable.year_of_birth,'0601'))
			) 
		 > if(safe_cast(cdmtable.drug_exposure_start_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.drug_exposure_start_datetime  as string)),safe_cast(cdmtable.drug_exposure_start_datetime  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the VERBATIM_END_DATE field of the DRUG_EXPOSURE that occurs prior to the date in the DRUG_EXPOSURE_START_DATE field of the DRUG_EXPOSURE table.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'VERBATIM_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_drug_exposure_verbatim_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = VERBATIM_END_DATE
plausibleTemporalAfterTableName = DRUG_EXPOSURE
plausibleTemporalAfterFieldName = DRUG_EXPOSURE_START_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
    where 
			if(safe_cast(cdmtable.drug_exposure_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.drug_exposure_start_date  as string)),safe_cast(cdmtable.drug_exposure_start_date  as date))
		 > if(safe_cast(cdmtable.verbatim_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.verbatim_end_date  as string)),safe_cast(cdmtable.verbatim_end_date  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the VALID_END_DATE field of the DRUG_STRENGTH that occurs prior to the date in the VALID_START_DATE field of the DRUG_STRENGTH table.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'VALID_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_drug_strength_valid_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_STRENGTH
cdmFieldName = VALID_END_DATE
plausibleTemporalAfterTableName = DRUG_STRENGTH
plausibleTemporalAfterFieldName = VALID_START_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
    where 
			if(safe_cast(cdmtable.valid_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.valid_start_date  as string)),safe_cast(cdmtable.valid_start_date  as date))
		 > if(safe_cast(cdmtable.valid_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.valid_end_date  as string)),safe_cast(cdmtable.valid_end_date  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the EPISODE_END_DATE field of the EPISODE that occurs prior to the date in the EPISODE_START_DATE field of the EPISODE table.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_episode_episode_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_END_DATE
plausibleTemporalAfterTableName = EPISODE
plausibleTemporalAfterFieldName = EPISODE_START_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
    where 
			if(safe_cast(cdmtable.episode_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.episode_start_date  as string)),safe_cast(cdmtable.episode_start_date  as date))
		 > if(safe_cast(cdmtable.episode_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.episode_end_date  as string)),safe_cast(cdmtable.episode_end_date  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the EPISODE_END_DATETIME field of the EPISODE that occurs prior to the date in the EPISODE_START_DATETIME field of the EPISODE table.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_END_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_episode_episode_end_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_END_DATETIME
plausibleTemporalAfterTableName = EPISODE
plausibleTemporalAfterFieldName = EPISODE_START_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
    where 
			if(safe_cast(cdmtable.episode_start_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.episode_start_datetime  as string)),safe_cast(cdmtable.episode_start_datetime  as date))
		 > if(safe_cast(cdmtable.episode_end_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.episode_end_datetime  as string)),safe_cast(cdmtable.episode_end_datetime  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the EPISODE_START_DATE field of the EPISODE that occurs prior to the date in the BIRTH_DATETIME field of the PERSON table.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_episode_episode_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_START_DATE
plausibleTemporalAfterTableName = PERSON
plausibleTemporalAfterFieldName = BIRTH_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
				join dataform.person plausibletable 
                    on cdmtable.person_id = plausibletable.person_id
    where 
			coalesce(
				if(safe_cast(plausibletable.birth_datetime  as date) is null,parse_date('%Y%m%d', cast(plausibletable.birth_datetime  as string)),safe_cast(plausibletable.birth_datetime  as date)),
				parse_date('%Y%m%d', concat(plausibletable.year_of_birth,'0601'))
			) 
		 > if(safe_cast(cdmtable.episode_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.episode_start_date  as string)),safe_cast(cdmtable.episode_start_date  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the EPISODE_START_DATETIME field of the EPISODE that occurs prior to the date in the BIRTH_DATETIME field of the PERSON table.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_START_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_episode_episode_start_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_START_DATETIME
plausibleTemporalAfterTableName = PERSON
plausibleTemporalAfterFieldName = BIRTH_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
				join dataform.person plausibletable 
                    on cdmtable.person_id = plausibletable.person_id
    where 
			coalesce(
				if(safe_cast(plausibletable.birth_datetime  as date) is null,parse_date('%Y%m%d', cast(plausibletable.birth_datetime  as string)),safe_cast(plausibletable.birth_datetime  as date)),
				parse_date('%Y%m%d', concat(plausibletable.year_of_birth,'0601'))
			) 
		 > if(safe_cast(cdmtable.episode_start_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.episode_start_datetime  as string)),safe_cast(cdmtable.episode_start_datetime  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the MEASUREMENT_DATE field of the MEASUREMENT that occurs prior to the date in the BIRTH_DATETIME field of the PERSON table.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_measurement_measurement_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_DATE
plausibleTemporalAfterTableName = PERSON
plausibleTemporalAfterFieldName = BIRTH_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
				join dataform.person plausibletable 
                    on cdmtable.person_id = plausibletable.person_id
    where 
			coalesce(
				if(safe_cast(plausibletable.birth_datetime  as date) is null,parse_date('%Y%m%d', cast(plausibletable.birth_datetime  as string)),safe_cast(plausibletable.birth_datetime  as date)),
				parse_date('%Y%m%d', concat(plausibletable.year_of_birth,'0601'))
			) 
		 > if(safe_cast(cdmtable.measurement_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.measurement_date  as string)),safe_cast(cdmtable.measurement_date  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the NOTE_DATE field of the NOTE that occurs prior to the date in the BIRTH_DATETIME field of the PERSON table.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_note_note_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = NOTE
cdmFieldName = NOTE_DATE
plausibleTemporalAfterTableName = PERSON
plausibleTemporalAfterFieldName = BIRTH_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
				join dataform.person plausibletable 
                    on cdmtable.person_id = plausibletable.person_id
    where 
			coalesce(
				if(safe_cast(plausibletable.birth_datetime  as date) is null,parse_date('%Y%m%d', cast(plausibletable.birth_datetime  as string)),safe_cast(plausibletable.birth_datetime  as date)),
				parse_date('%Y%m%d', concat(plausibletable.year_of_birth,'0601'))
			) 
		 > if(safe_cast(cdmtable.note_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.note_date  as string)),safe_cast(cdmtable.note_date  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the NOTE_DATETIME field of the NOTE that occurs prior to the date in the BIRTH_DATETIME field of the PERSON table.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_note_note_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = NOTE
cdmFieldName = NOTE_DATETIME
plausibleTemporalAfterTableName = PERSON
plausibleTemporalAfterFieldName = BIRTH_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
				join dataform.person plausibletable 
                    on cdmtable.person_id = plausibletable.person_id
    where 
			coalesce(
				if(safe_cast(plausibletable.birth_datetime  as date) is null,parse_date('%Y%m%d', cast(plausibletable.birth_datetime  as string)),safe_cast(plausibletable.birth_datetime  as date)),
				parse_date('%Y%m%d', concat(plausibletable.year_of_birth,'0601'))
			) 
		 > if(safe_cast(cdmtable.note_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.note_datetime  as string)),safe_cast(cdmtable.note_datetime  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the OBSERVATION_DATE field of the OBSERVATION that occurs prior to the date in the BIRTH_DATETIME field of the PERSON table.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_observation_observation_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION
cdmFieldName = OBSERVATION_DATE
plausibleTemporalAfterTableName = PERSON
plausibleTemporalAfterFieldName = BIRTH_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
				join dataform.person plausibletable 
                    on cdmtable.person_id = plausibletable.person_id
    where 
			coalesce(
				if(safe_cast(plausibletable.birth_datetime  as date) is null,parse_date('%Y%m%d', cast(plausibletable.birth_datetime  as string)),safe_cast(plausibletable.birth_datetime  as date)),
				parse_date('%Y%m%d', concat(plausibletable.year_of_birth,'0601'))
			) 
		 > if(safe_cast(cdmtable.observation_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.observation_date  as string)),safe_cast(cdmtable.observation_date  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the OBSERVATION_DATETIME field of the OBSERVATION that occurs prior to the date in the BIRTH_DATETIME field of the PERSON table.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_observation_observation_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION
cdmFieldName = OBSERVATION_DATETIME
plausibleTemporalAfterTableName = PERSON
plausibleTemporalAfterFieldName = BIRTH_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
				join dataform.person plausibletable 
                    on cdmtable.person_id = plausibletable.person_id
    where 
			coalesce(
				if(safe_cast(plausibletable.birth_datetime  as date) is null,parse_date('%Y%m%d', cast(plausibletable.birth_datetime  as string)),safe_cast(plausibletable.birth_datetime  as date)),
				parse_date('%Y%m%d', concat(plausibletable.year_of_birth,'0601'))
			) 
		 > if(safe_cast(cdmtable.observation_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.observation_datetime  as string)),safe_cast(cdmtable.observation_datetime  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the OBSERVATION_PERIOD_END_DATE field of the OBSERVATION_PERIOD that occurs prior to the date in the OBSERVATION_PERIOD_START_DATE field of the OBSERVATION_PERIOD table.' as check_description
  ,'OBSERVATION_PERIOD' as cdm_table_name
  ,'OBSERVATION_PERIOD_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_observation_period_observation_period_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION_PERIOD
cdmFieldName = OBSERVATION_PERIOD_END_DATE
plausibleTemporalAfterTableName = OBSERVATION_PERIOD
plausibleTemporalAfterFieldName = OBSERVATION_PERIOD_START_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
    where 
			if(safe_cast(cdmtable.observation_period_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.observation_period_start_date  as string)),safe_cast(cdmtable.observation_period_start_date  as date))
		 > if(safe_cast(cdmtable.observation_period_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.observation_period_end_date  as string)),safe_cast(cdmtable.observation_period_end_date  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the OBSERVATION_PERIOD_START_DATE field of the OBSERVATION_PERIOD that occurs prior to the date in the BIRTH_DATETIME field of the PERSON table.' as check_description
  ,'OBSERVATION_PERIOD' as cdm_table_name
  ,'OBSERVATION_PERIOD_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_observation_period_observation_period_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION_PERIOD
cdmFieldName = OBSERVATION_PERIOD_START_DATE
plausibleTemporalAfterTableName = PERSON
plausibleTemporalAfterFieldName = BIRTH_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
				join dataform.person plausibletable 
                    on cdmtable.person_id = plausibletable.person_id
    where 
			coalesce(
				if(safe_cast(plausibletable.birth_datetime  as date) is null,parse_date('%Y%m%d', cast(plausibletable.birth_datetime  as string)),safe_cast(plausibletable.birth_datetime  as date)),
				parse_date('%Y%m%d', concat(plausibletable.year_of_birth,'0601'))
			) 
		 > if(safe_cast(cdmtable.observation_period_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.observation_period_start_date  as string)),safe_cast(cdmtable.observation_period_start_date  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the PAYER_PLAN_PERIOD_END_DATE field of the PAYER_PLAN_PERIOD that occurs prior to the date in the PAYER_PLAN_PERIOD_START_DATE field of the PAYER_PLAN_PERIOD table.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PAYER_PLAN_PERIOD_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_payer_plan_period_payer_plan_period_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = PAYER_PLAN_PERIOD_END_DATE
plausibleTemporalAfterTableName = PAYER_PLAN_PERIOD
plausibleTemporalAfterFieldName = PAYER_PLAN_PERIOD_START_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
    where 
			if(safe_cast(cdmtable.payer_plan_period_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.payer_plan_period_start_date  as string)),safe_cast(cdmtable.payer_plan_period_start_date  as date))
		 > if(safe_cast(cdmtable.payer_plan_period_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.payer_plan_period_end_date  as string)),safe_cast(cdmtable.payer_plan_period_end_date  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the PAYER_PLAN_PERIOD_START_DATE field of the PAYER_PLAN_PERIOD that occurs prior to the date in the BIRTH_DATETIME field of the PERSON table.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PAYER_PLAN_PERIOD_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_payer_plan_period_payer_plan_period_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = PAYER_PLAN_PERIOD_START_DATE
plausibleTemporalAfterTableName = PERSON
plausibleTemporalAfterFieldName = BIRTH_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
				join dataform.person plausibletable 
                    on cdmtable.person_id = plausibletable.person_id
    where 
			coalesce(
				if(safe_cast(plausibletable.birth_datetime  as date) is null,parse_date('%Y%m%d', cast(plausibletable.birth_datetime  as string)),safe_cast(plausibletable.birth_datetime  as date)),
				parse_date('%Y%m%d', concat(plausibletable.year_of_birth,'0601'))
			) 
		 > if(safe_cast(cdmtable.payer_plan_period_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.payer_plan_period_start_date  as string)),safe_cast(cdmtable.payer_plan_period_start_date  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the PROCEDURE_DATE field of the PROCEDURE_OCCURRENCE that occurs prior to the date in the BIRTH_DATETIME field of the PERSON table.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_procedure_occurrence_procedure_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_DATE
plausibleTemporalAfterTableName = PERSON
plausibleTemporalAfterFieldName = BIRTH_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
				join dataform.person plausibletable 
                    on cdmtable.person_id = plausibletable.person_id
    where 
			coalesce(
				if(safe_cast(plausibletable.birth_datetime  as date) is null,parse_date('%Y%m%d', cast(plausibletable.birth_datetime  as string)),safe_cast(plausibletable.birth_datetime  as date)),
				parse_date('%Y%m%d', concat(plausibletable.year_of_birth,'0601'))
			) 
		 > if(safe_cast(cdmtable.procedure_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.procedure_date  as string)),safe_cast(cdmtable.procedure_date  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the PROCEDURE_DATETIME field of the PROCEDURE_OCCURRENCE that occurs prior to the date in the BIRTH_DATETIME field of the PERSON table.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_procedure_occurrence_procedure_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_DATETIME
plausibleTemporalAfterTableName = PERSON
plausibleTemporalAfterFieldName = BIRTH_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
				join dataform.person plausibletable 
                    on cdmtable.person_id = plausibletable.person_id
    where 
			coalesce(
				if(safe_cast(plausibletable.birth_datetime  as date) is null,parse_date('%Y%m%d', cast(plausibletable.birth_datetime  as string)),safe_cast(plausibletable.birth_datetime  as date)),
				parse_date('%Y%m%d', concat(plausibletable.year_of_birth,'0601'))
			) 
		 > if(safe_cast(cdmtable.procedure_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.procedure_datetime  as string)),safe_cast(cdmtable.procedure_datetime  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the PROCEDURE_END_DATE field of the PROCEDURE_OCCURRENCE that occurs prior to the date in the PROCEDURE_DATE field of the PROCEDURE_OCCURRENCE table.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_procedure_occurrence_procedure_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_END_DATE
plausibleTemporalAfterTableName = PROCEDURE_OCCURRENCE
plausibleTemporalAfterFieldName = PROCEDURE_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
    where 
			if(safe_cast(cdmtable.procedure_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.procedure_date  as string)),safe_cast(cdmtable.procedure_date  as date))
		 > if(safe_cast(cdmtable.procedure_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.procedure_end_date  as string)),safe_cast(cdmtable.procedure_end_date  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the PROCEDURE_END_DATETIME field of the PROCEDURE_OCCURRENCE that occurs prior to the date in the PROCEDURE_DATETIME field of the PROCEDURE_OCCURRENCE table.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_END_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_procedure_occurrence_procedure_end_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_END_DATETIME
plausibleTemporalAfterTableName = PROCEDURE_OCCURRENCE
plausibleTemporalAfterFieldName = PROCEDURE_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
    where 
			if(safe_cast(cdmtable.procedure_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.procedure_datetime  as string)),safe_cast(cdmtable.procedure_datetime  as date))
		 > if(safe_cast(cdmtable.procedure_end_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.procedure_end_datetime  as string)),safe_cast(cdmtable.procedure_end_datetime  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the VALID_END_DATE field of the SOURCE_TO_CONCEPT_MAP that occurs prior to the date in the VALID_START_DATE field of the SOURCE_TO_CONCEPT_MAP table.' as check_description
  ,'SOURCE_TO_CONCEPT_MAP' as cdm_table_name
  ,'VALID_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_source_to_concept_map_valid_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = SOURCE_TO_CONCEPT_MAP
cdmFieldName = VALID_END_DATE
plausibleTemporalAfterTableName = SOURCE_TO_CONCEPT_MAP
plausibleTemporalAfterFieldName = VALID_START_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
    where 
			if(safe_cast(cdmtable.valid_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.valid_start_date  as string)),safe_cast(cdmtable.valid_start_date  as date))
		 > if(safe_cast(cdmtable.valid_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.valid_end_date  as string)),safe_cast(cdmtable.valid_end_date  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the SPECIMEN_DATE field of the SPECIMEN that occurs prior to the date in the BIRTH_DATETIME field of the PERSON table.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'SPECIMEN_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_specimen_specimen_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = SPECIMEN
cdmFieldName = SPECIMEN_DATE
plausibleTemporalAfterTableName = PERSON
plausibleTemporalAfterFieldName = BIRTH_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
				join dataform.person plausibletable 
                    on cdmtable.person_id = plausibletable.person_id
    where 
			coalesce(
				if(safe_cast(plausibletable.birth_datetime  as date) is null,parse_date('%Y%m%d', cast(plausibletable.birth_datetime  as string)),safe_cast(plausibletable.birth_datetime  as date)),
				parse_date('%Y%m%d', concat(plausibletable.year_of_birth,'0601'))
			) 
		 > if(safe_cast(cdmtable.specimen_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.specimen_date  as string)),safe_cast(cdmtable.specimen_date  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the SPECIMEN_DATETIME field of the SPECIMEN that occurs prior to the date in the BIRTH_DATETIME field of the PERSON table.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'SPECIMEN_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_specimen_specimen_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = SPECIMEN
cdmFieldName = SPECIMEN_DATETIME
plausibleTemporalAfterTableName = PERSON
plausibleTemporalAfterFieldName = BIRTH_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
				join dataform.person plausibletable 
                    on cdmtable.person_id = plausibletable.person_id
    where 
			coalesce(
				if(safe_cast(plausibletable.birth_datetime  as date) is null,parse_date('%Y%m%d', cast(plausibletable.birth_datetime  as string)),safe_cast(plausibletable.birth_datetime  as date)),
				parse_date('%Y%m%d', concat(plausibletable.year_of_birth,'0601'))
			) 
		 > if(safe_cast(cdmtable.specimen_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.specimen_datetime  as string)),safe_cast(cdmtable.specimen_datetime  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the VISIT_DETAIL_END_DATE field of the VISIT_DETAIL that occurs prior to the date in the VISIT_DETAIL_START_DATE field of the VISIT_DETAIL table.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_visit_detail_visit_detail_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_DETAIL_END_DATE
plausibleTemporalAfterTableName = VISIT_DETAIL
plausibleTemporalAfterFieldName = VISIT_DETAIL_START_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
    where 
			if(safe_cast(cdmtable.visit_detail_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.visit_detail_start_date  as string)),safe_cast(cdmtable.visit_detail_start_date  as date))
		 > if(safe_cast(cdmtable.visit_detail_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.visit_detail_end_date  as string)),safe_cast(cdmtable.visit_detail_end_date  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the VISIT_DETAIL_END_DATETIME field of the VISIT_DETAIL that occurs prior to the date in the VISIT_DETAIL_START_DATETIME field of the VISIT_DETAIL table.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_END_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_visit_detail_visit_detail_end_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_DETAIL_END_DATETIME
plausibleTemporalAfterTableName = VISIT_DETAIL
plausibleTemporalAfterFieldName = VISIT_DETAIL_START_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
    where 
			if(safe_cast(cdmtable.visit_detail_start_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.visit_detail_start_datetime  as string)),safe_cast(cdmtable.visit_detail_start_datetime  as date))
		 > if(safe_cast(cdmtable.visit_detail_end_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.visit_detail_end_datetime  as string)),safe_cast(cdmtable.visit_detail_end_datetime  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the VISIT_DETAIL_START_DATE field of the VISIT_DETAIL that occurs prior to the date in the BIRTH_DATETIME field of the PERSON table.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_visit_detail_visit_detail_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_DETAIL_START_DATE
plausibleTemporalAfterTableName = PERSON
plausibleTemporalAfterFieldName = BIRTH_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
				join dataform.person plausibletable 
                    on cdmtable.person_id = plausibletable.person_id
    where 
			coalesce(
				if(safe_cast(plausibletable.birth_datetime  as date) is null,parse_date('%Y%m%d', cast(plausibletable.birth_datetime  as string)),safe_cast(plausibletable.birth_datetime  as date)),
				parse_date('%Y%m%d', concat(plausibletable.year_of_birth,'0601'))
			) 
		 > if(safe_cast(cdmtable.visit_detail_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.visit_detail_start_date  as string)),safe_cast(cdmtable.visit_detail_start_date  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the VISIT_DETAIL_START_DATETIME field of the VISIT_DETAIL that occurs prior to the date in the BIRTH_DATETIME field of the PERSON table.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_START_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_visit_detail_visit_detail_start_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_DETAIL_START_DATETIME
plausibleTemporalAfterTableName = PERSON
plausibleTemporalAfterFieldName = BIRTH_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
				join dataform.person plausibletable 
                    on cdmtable.person_id = plausibletable.person_id
    where 
			coalesce(
				if(safe_cast(plausibletable.birth_datetime  as date) is null,parse_date('%Y%m%d', cast(plausibletable.birth_datetime  as string)),safe_cast(plausibletable.birth_datetime  as date)),
				parse_date('%Y%m%d', concat(plausibletable.year_of_birth,'0601'))
			) 
		 > if(safe_cast(cdmtable.visit_detail_start_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.visit_detail_start_datetime  as string)),safe_cast(cdmtable.visit_detail_start_datetime  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the VISIT_END_DATE field of the VISIT_OCCURRENCE that occurs prior to the date in the VISIT_START_DATE field of the VISIT_OCCURRENCE table.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_visit_occurrence_visit_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = VISIT_END_DATE
plausibleTemporalAfterTableName = VISIT_OCCURRENCE
plausibleTemporalAfterFieldName = VISIT_START_DATE
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
    where 
			if(safe_cast(cdmtable.visit_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.visit_start_date  as string)),safe_cast(cdmtable.visit_start_date  as date))
		 > if(safe_cast(cdmtable.visit_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.visit_end_date  as string)),safe_cast(cdmtable.visit_end_date  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the VISIT_END_DATETIME field of the VISIT_OCCURRENCE that occurs prior to the date in the VISIT_START_DATETIME field of the VISIT_OCCURRENCE table.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_END_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_visit_occurrence_visit_end_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = VISIT_END_DATETIME
plausibleTemporalAfterTableName = VISIT_OCCURRENCE
plausibleTemporalAfterFieldName = VISIT_START_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
    where 
			if(safe_cast(cdmtable.visit_start_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.visit_start_datetime  as string)),safe_cast(cdmtable.visit_start_datetime  as date))
		 > if(safe_cast(cdmtable.visit_end_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.visit_end_datetime  as string)),safe_cast(cdmtable.visit_end_datetime  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the VISIT_START_DATE field of the VISIT_OCCURRENCE that occurs prior to the date in the BIRTH_DATETIME field of the PERSON table.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_visit_occurrence_visit_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = VISIT_START_DATE
plausibleTemporalAfterTableName = PERSON
plausibleTemporalAfterFieldName = BIRTH_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
				join dataform.person plausibletable 
                    on cdmtable.person_id = plausibletable.person_id
    where 
			coalesce(
				if(safe_cast(plausibletable.birth_datetime  as date) is null,parse_date('%Y%m%d', cast(plausibletable.birth_datetime  as string)),safe_cast(plausibletable.birth_datetime  as date)),
				parse_date('%Y%m%d', concat(plausibletable.year_of_birth,'0601'))
			) 
		 > if(safe_cast(cdmtable.visit_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.visit_start_date  as string)),safe_cast(cdmtable.visit_start_date  as date))
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
  ,'plausibleTemporalAfter' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the VISIT_START_DATETIME field of the VISIT_OCCURRENCE that occurs prior to the date in the BIRTH_DATETIME field of the PERSON table.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_START_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_temporal_after.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausibletemporalafter_visit_occurrence_visit_start_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = VISIT_START_DATETIME
plausibleTemporalAfterTableName = PERSON
plausibleTemporalAfterFieldName = BIRTH_DATETIME
**********/
select 
	num_violated_rows, 
	case 
		when denominator.num_rows = 0 then 0 
		else 1.0*num_violated_rows/denominator.num_rows 
	end as pct_violated_rows, 
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
				join dataform.person plausibletable 
                    on cdmtable.person_id = plausibletable.person_id
    where 
			coalesce(
				if(safe_cast(plausibletable.birth_datetime  as date) is null,parse_date('%Y%m%d', cast(plausibletable.birth_datetime  as string)),safe_cast(plausibletable.birth_datetime  as date)),
				parse_date('%Y%m%d', concat(plausibletable.year_of_birth,'0601'))
			) 
		 > if(safe_cast(cdmtable.visit_start_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.visit_start_datetime  as string)),safe_cast(cdmtable.visit_start_datetime  as date))
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

