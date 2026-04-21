/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the CONDITION_ERA_END_DATE field of the CONDITION_ERA table that occurs after death.' as check_description
  ,'CONDITION_ERA' as cdm_table_name
  ,'CONDITION_ERA_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_condition_era_condition_era_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.condition_era_end_date is not null 
            and if(safe_cast(cdmtable.condition_era_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.condition_era_end_date  as string)),safe_cast(cdmtable.condition_era_end_date  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.condition_era cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.condition_era_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the CONDITION_ERA_START_DATE field of the CONDITION_ERA table that occurs after death.' as check_description
  ,'CONDITION_ERA' as cdm_table_name
  ,'CONDITION_ERA_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_condition_era_condition_era_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.condition_era_start_date is not null 
            and if(safe_cast(cdmtable.condition_era_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.condition_era_start_date  as string)),safe_cast(cdmtable.condition_era_start_date  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.condition_era cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.condition_era_start_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the CONDITION_END_DATE field of the CONDITION_OCCURRENCE table that occurs after death.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_condition_occurrence_condition_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.condition_end_date is not null 
            and if(safe_cast(cdmtable.condition_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.condition_end_date  as string)),safe_cast(cdmtable.condition_end_date  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.condition_occurrence cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.condition_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the CONDITION_END_DATETIME field of the CONDITION_OCCURRENCE table that occurs after death.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_END_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_condition_occurrence_condition_end_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.condition_end_datetime is not null 
            and if(safe_cast(cdmtable.condition_end_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.condition_end_datetime  as string)),safe_cast(cdmtable.condition_end_datetime  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.condition_occurrence cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.condition_end_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the CONDITION_START_DATE field of the CONDITION_OCCURRENCE table that occurs after death.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_condition_occurrence_condition_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.condition_start_date is not null 
            and if(safe_cast(cdmtable.condition_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.condition_start_date  as string)),safe_cast(cdmtable.condition_start_date  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.condition_occurrence cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.condition_start_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the CONDITION_START_DATETIME field of the CONDITION_OCCURRENCE table that occurs after death.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_START_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_condition_occurrence_condition_start_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.condition_start_datetime is not null 
            and if(safe_cast(cdmtable.condition_start_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.condition_start_datetime  as string)),safe_cast(cdmtable.condition_start_datetime  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.condition_occurrence cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.condition_start_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the DEVICE_EXPOSURE_END_DATE field of the DEVICE_EXPOSURE table that occurs after death.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_EXPOSURE_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_device_exposure_device_exposure_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.device_exposure_end_date is not null 
            and if(safe_cast(cdmtable.device_exposure_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.device_exposure_end_date  as string)),safe_cast(cdmtable.device_exposure_end_date  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.device_exposure cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.device_exposure_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the DEVICE_EXPOSURE_END_DATETIME field of the DEVICE_EXPOSURE table that occurs after death.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_EXPOSURE_END_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_device_exposure_device_exposure_end_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.device_exposure_end_datetime is not null 
            and if(safe_cast(cdmtable.device_exposure_end_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.device_exposure_end_datetime  as string)),safe_cast(cdmtable.device_exposure_end_datetime  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.device_exposure cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.device_exposure_end_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the DEVICE_EXPOSURE_START_DATE field of the DEVICE_EXPOSURE table that occurs after death.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_EXPOSURE_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_device_exposure_device_exposure_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.device_exposure_start_date is not null 
            and if(safe_cast(cdmtable.device_exposure_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.device_exposure_start_date  as string)),safe_cast(cdmtable.device_exposure_start_date  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.device_exposure cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.device_exposure_start_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the DEVICE_EXPOSURE_START_DATETIME field of the DEVICE_EXPOSURE table that occurs after death.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_EXPOSURE_START_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_device_exposure_device_exposure_start_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.device_exposure_start_datetime is not null 
            and if(safe_cast(cdmtable.device_exposure_start_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.device_exposure_start_datetime  as string)),safe_cast(cdmtable.device_exposure_start_datetime  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.device_exposure cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.device_exposure_start_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the DOSE_ERA_END_DATE field of the DOSE_ERA table that occurs after death.' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'DOSE_ERA_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_dose_era_dose_era_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.dose_era_end_date is not null 
            and if(safe_cast(cdmtable.dose_era_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.dose_era_end_date  as string)),safe_cast(cdmtable.dose_era_end_date  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.dose_era cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.dose_era_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the DOSE_ERA_START_DATE field of the DOSE_ERA table that occurs after death.' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'DOSE_ERA_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_dose_era_dose_era_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.dose_era_start_date is not null 
            and if(safe_cast(cdmtable.dose_era_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.dose_era_start_date  as string)),safe_cast(cdmtable.dose_era_start_date  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.dose_era cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.dose_era_start_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the DRUG_ERA_END_DATE field of the DRUG_ERA table that occurs after death.' as check_description
  ,'DRUG_ERA' as cdm_table_name
  ,'DRUG_ERA_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_drug_era_drug_era_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.drug_era_end_date is not null 
            and if(safe_cast(cdmtable.drug_era_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.drug_era_end_date  as string)),safe_cast(cdmtable.drug_era_end_date  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.drug_era cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.drug_era_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the DRUG_ERA_START_DATE field of the DRUG_ERA table that occurs after death.' as check_description
  ,'DRUG_ERA' as cdm_table_name
  ,'DRUG_ERA_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_drug_era_drug_era_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.drug_era_start_date is not null 
            and if(safe_cast(cdmtable.drug_era_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.drug_era_start_date  as string)),safe_cast(cdmtable.drug_era_start_date  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.drug_era cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.drug_era_start_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the DRUG_EXPOSURE_END_DATE field of the DRUG_EXPOSURE table that occurs after death.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_EXPOSURE_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_drug_exposure_drug_exposure_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.drug_exposure_end_date is not null 
            and if(safe_cast(cdmtable.drug_exposure_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.drug_exposure_end_date  as string)),safe_cast(cdmtable.drug_exposure_end_date  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.drug_exposure cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.drug_exposure_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the DRUG_EXPOSURE_END_DATETIME field of the DRUG_EXPOSURE table that occurs after death.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_EXPOSURE_END_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_drug_exposure_drug_exposure_end_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.drug_exposure_end_datetime is not null 
            and if(safe_cast(cdmtable.drug_exposure_end_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.drug_exposure_end_datetime  as string)),safe_cast(cdmtable.drug_exposure_end_datetime  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.drug_exposure cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.drug_exposure_end_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the DRUG_EXPOSURE_START_DATE field of the DRUG_EXPOSURE table that occurs after death.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_EXPOSURE_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_drug_exposure_drug_exposure_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.drug_exposure_start_date is not null 
            and if(safe_cast(cdmtable.drug_exposure_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.drug_exposure_start_date  as string)),safe_cast(cdmtable.drug_exposure_start_date  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.drug_exposure cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.drug_exposure_start_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the DRUG_EXPOSURE_START_DATETIME field of the DRUG_EXPOSURE table that occurs after death.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_EXPOSURE_START_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_drug_exposure_drug_exposure_start_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.drug_exposure_start_datetime is not null 
            and if(safe_cast(cdmtable.drug_exposure_start_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.drug_exposure_start_datetime  as string)),safe_cast(cdmtable.drug_exposure_start_datetime  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.drug_exposure cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.drug_exposure_start_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the VERBATIM_END_DATE field of the DRUG_EXPOSURE table that occurs after death.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'VERBATIM_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_drug_exposure_verbatim_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.verbatim_end_date is not null 
            and if(safe_cast(cdmtable.verbatim_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.verbatim_end_date  as string)),safe_cast(cdmtable.verbatim_end_date  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.drug_exposure cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.verbatim_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the EPISODE_END_DATE field of the EPISODE table that occurs after death.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_episode_episode_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.episode_end_date is not null 
            and if(safe_cast(cdmtable.episode_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.episode_end_date  as string)),safe_cast(cdmtable.episode_end_date  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.episode cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.episode_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the EPISODE_END_DATETIME field of the EPISODE table that occurs after death.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_END_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_episode_episode_end_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.episode_end_datetime is not null 
            and if(safe_cast(cdmtable.episode_end_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.episode_end_datetime  as string)),safe_cast(cdmtable.episode_end_datetime  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.episode cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.episode_end_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the EPISODE_START_DATE field of the EPISODE table that occurs after death.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_episode_episode_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.episode_start_date is not null 
            and if(safe_cast(cdmtable.episode_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.episode_start_date  as string)),safe_cast(cdmtable.episode_start_date  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.episode cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.episode_start_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the EPISODE_START_DATETIME field of the EPISODE table that occurs after death.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_START_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_episode_episode_start_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.episode_start_datetime is not null 
            and if(safe_cast(cdmtable.episode_start_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.episode_start_datetime  as string)),safe_cast(cdmtable.episode_start_datetime  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.episode cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.episode_start_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the MEASUREMENT_DATE field of the MEASUREMENT table that occurs after death.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_measurement_measurement_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.measurement_date is not null 
            and if(safe_cast(cdmtable.measurement_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.measurement_date  as string)),safe_cast(cdmtable.measurement_date  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.measurement cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.measurement_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the MEASUREMENT_DATETIME field of the MEASUREMENT table that occurs after death.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_measurement_measurement_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.measurement_datetime is not null 
            and if(safe_cast(cdmtable.measurement_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.measurement_datetime  as string)),safe_cast(cdmtable.measurement_datetime  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.measurement cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.measurement_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the NOTE_DATE field of the NOTE table that occurs after death.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_note_note_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.note_date is not null 
            and if(safe_cast(cdmtable.note_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.note_date  as string)),safe_cast(cdmtable.note_date  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.note cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.note_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the NOTE_DATETIME field of the NOTE table that occurs after death.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_note_note_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.note_datetime is not null 
            and if(safe_cast(cdmtable.note_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.note_datetime  as string)),safe_cast(cdmtable.note_datetime  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.note cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.note_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the OBSERVATION_DATE field of the OBSERVATION table that occurs after death.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_observation_observation_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.observation_date is not null 
            and if(safe_cast(cdmtable.observation_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.observation_date  as string)),safe_cast(cdmtable.observation_date  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.observation cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.observation_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the OBSERVATION_DATETIME field of the OBSERVATION table that occurs after death.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_observation_observation_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.observation_datetime is not null 
            and if(safe_cast(cdmtable.observation_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.observation_datetime  as string)),safe_cast(cdmtable.observation_datetime  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.observation cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.observation_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the OBSERVATION_PERIOD_END_DATE field of the OBSERVATION_PERIOD table that occurs after death.' as check_description
  ,'OBSERVATION_PERIOD' as cdm_table_name
  ,'OBSERVATION_PERIOD_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_observation_period_observation_period_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.observation_period_end_date is not null 
            and if(safe_cast(cdmtable.observation_period_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.observation_period_end_date  as string)),safe_cast(cdmtable.observation_period_end_date  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.observation_period cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.observation_period_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the OBSERVATION_PERIOD_START_DATE field of the OBSERVATION_PERIOD table that occurs after death.' as check_description
  ,'OBSERVATION_PERIOD' as cdm_table_name
  ,'OBSERVATION_PERIOD_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_observation_period_observation_period_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.observation_period_start_date is not null 
            and if(safe_cast(cdmtable.observation_period_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.observation_period_start_date  as string)),safe_cast(cdmtable.observation_period_start_date  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.observation_period cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.observation_period_start_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the PAYER_PLAN_PERIOD_END_DATE field of the PAYER_PLAN_PERIOD table that occurs after death.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PAYER_PLAN_PERIOD_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_payer_plan_period_payer_plan_period_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.payer_plan_period_end_date is not null 
            and if(safe_cast(cdmtable.payer_plan_period_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.payer_plan_period_end_date  as string)),safe_cast(cdmtable.payer_plan_period_end_date  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.payer_plan_period cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.payer_plan_period_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the PAYER_PLAN_PERIOD_START_DATE field of the PAYER_PLAN_PERIOD table that occurs after death.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PAYER_PLAN_PERIOD_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_payer_plan_period_payer_plan_period_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.payer_plan_period_start_date is not null 
            and if(safe_cast(cdmtable.payer_plan_period_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.payer_plan_period_start_date  as string)),safe_cast(cdmtable.payer_plan_period_start_date  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.payer_plan_period cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.payer_plan_period_start_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the PROCEDURE_DATE field of the PROCEDURE_OCCURRENCE table that occurs after death.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_procedure_occurrence_procedure_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.procedure_date is not null 
            and if(safe_cast(cdmtable.procedure_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.procedure_date  as string)),safe_cast(cdmtable.procedure_date  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.procedure_occurrence cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.procedure_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the PROCEDURE_DATETIME field of the PROCEDURE_OCCURRENCE table that occurs after death.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_procedure_occurrence_procedure_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.procedure_datetime is not null 
            and if(safe_cast(cdmtable.procedure_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.procedure_datetime  as string)),safe_cast(cdmtable.procedure_datetime  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.procedure_occurrence cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.procedure_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the PROCEDURE_END_DATE field of the PROCEDURE_OCCURRENCE table that occurs after death.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_procedure_occurrence_procedure_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.procedure_end_date is not null 
            and if(safe_cast(cdmtable.procedure_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.procedure_end_date  as string)),safe_cast(cdmtable.procedure_end_date  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.procedure_occurrence cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.procedure_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the PROCEDURE_END_DATETIME field of the PROCEDURE_OCCURRENCE table that occurs after death.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_END_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_procedure_occurrence_procedure_end_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.procedure_end_datetime is not null 
            and if(safe_cast(cdmtable.procedure_end_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.procedure_end_datetime  as string)),safe_cast(cdmtable.procedure_end_datetime  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.procedure_occurrence cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.procedure_end_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the SPECIMEN_DATE field of the SPECIMEN table that occurs after death.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'SPECIMEN_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_specimen_specimen_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.specimen_date is not null 
            and if(safe_cast(cdmtable.specimen_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.specimen_date  as string)),safe_cast(cdmtable.specimen_date  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.specimen cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.specimen_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the SPECIMEN_DATETIME field of the SPECIMEN table that occurs after death.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'SPECIMEN_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_specimen_specimen_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.specimen_datetime is not null 
            and if(safe_cast(cdmtable.specimen_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.specimen_datetime  as string)),safe_cast(cdmtable.specimen_datetime  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.specimen cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.specimen_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the VISIT_DETAIL_END_DATE field of the VISIT_DETAIL table that occurs after death.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_visit_detail_visit_detail_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.visit_detail_end_date is not null 
            and if(safe_cast(cdmtable.visit_detail_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.visit_detail_end_date  as string)),safe_cast(cdmtable.visit_detail_end_date  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.visit_detail cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.visit_detail_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the VISIT_DETAIL_END_DATETIME field of the VISIT_DETAIL table that occurs after death.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_END_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_visit_detail_visit_detail_end_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.visit_detail_end_datetime is not null 
            and if(safe_cast(cdmtable.visit_detail_end_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.visit_detail_end_datetime  as string)),safe_cast(cdmtable.visit_detail_end_datetime  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.visit_detail cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.visit_detail_end_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the VISIT_DETAIL_START_DATE field of the VISIT_DETAIL table that occurs after death.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_visit_detail_visit_detail_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.visit_detail_start_date is not null 
            and if(safe_cast(cdmtable.visit_detail_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.visit_detail_start_date  as string)),safe_cast(cdmtable.visit_detail_start_date  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.visit_detail cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.visit_detail_start_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the VISIT_DETAIL_START_DATETIME field of the VISIT_DETAIL table that occurs after death.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_START_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_visit_detail_visit_detail_start_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.visit_detail_start_datetime is not null 
            and if(safe_cast(cdmtable.visit_detail_start_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.visit_detail_start_datetime  as string)),safe_cast(cdmtable.visit_detail_start_datetime  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.visit_detail cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.visit_detail_start_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the VISIT_END_DATE field of the VISIT_OCCURRENCE table that occurs after death.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_visit_occurrence_visit_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.visit_end_date is not null 
            and if(safe_cast(cdmtable.visit_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.visit_end_date  as string)),safe_cast(cdmtable.visit_end_date  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.visit_occurrence cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.visit_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the VISIT_END_DATETIME field of the VISIT_OCCURRENCE table that occurs after death.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_END_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_visit_occurrence_visit_end_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.visit_end_datetime is not null 
            and if(safe_cast(cdmtable.visit_end_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.visit_end_datetime  as string)),safe_cast(cdmtable.visit_end_datetime  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.visit_occurrence cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.visit_end_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the VISIT_START_DATE field of the VISIT_OCCURRENCE table that occurs after death.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_visit_occurrence_visit_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.visit_start_date is not null 
            and if(safe_cast(cdmtable.visit_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.visit_start_date  as string)),safe_cast(cdmtable.visit_start_date  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.visit_occurrence cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.visit_start_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleBeforeDeath' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a date value in the VISIT_START_DATETIME field of the VISIT_OCCURRENCE table that occurs after death.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_START_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_before_death.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblebeforedeath_visit_occurrence_visit_start_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_BEFORE_DEATH
Checks for events that occur more than 60 days after death (PLAUSIBLE_BEFORE_DEATH == Yes).
Denominator is number of events with a non-null date, of persons who died.
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
        join dataform.death de 
            on cdmtable.person_id = de.person_id
        where cdmtable.visit_start_datetime is not null 
            and if(safe_cast(cdmtable.visit_start_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.visit_start_datetime  as string)),safe_cast(cdmtable.visit_start_datetime  as date)) > date_add(if(safe_cast(de.death_date  as date) is null,parse_date('%Y%m%d', cast(de.death_date  as string)),safe_cast(de.death_date  as date)), interval 60 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.visit_occurrence cdmtable
    join dataform.death
        on death.person_id = cdmtable.person_id
    where cdmtable.visit_start_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

