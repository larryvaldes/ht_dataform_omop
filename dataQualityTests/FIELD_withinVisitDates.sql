/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'withinVisitDates' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records not within one week on either side of the corresponding visit occurrence start and end date' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_within_visit_dates.sql' as sql_file
  ,'Plausibility' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_withinvisitdates_condition_occurrence_condition_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD LEVEL check:
WITHIN_VISIT_DATES - find events that occur one week before the corresponding visit_start_date or one week after the corresponding visit_end_date
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_START_DATE
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'CONDITION_OCCURRENCE.CONDITION_START_DATE' as violating_field, 
            cdmtable.*
        from dataform.condition_occurrence cdmtable
        join dataform.visit_occurrence vo
            on cdmtable.visit_occurrence_id = vo.visit_occurrence_id
        where cdmtable.condition_start_date < date_add(if(safe_cast(vo.visit_start_date  as date) is null,parse_date('%Y%m%d', cast(vo.visit_start_date  as string)),safe_cast(vo.visit_start_date  as date)), interval -7 day)
            or cdmtable.condition_start_date > date_add(if(safe_cast(vo.visit_end_date  as date) is null,parse_date('%Y%m%d', cast(vo.visit_end_date  as string)),safe_cast(vo.visit_end_date  as date)), interval 7 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.condition_occurrence cdmtable
    join dataform.visit_occurrence vo
        on cdmtable.visit_occurrence_id = vo.visit_occurrence_id
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'withinVisitDates' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records not within one week on either side of the corresponding visit occurrence start and end date' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_EXPOSURE_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_within_visit_dates.sql' as sql_file
  ,'Plausibility' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_withinvisitdates_device_exposure_device_exposure_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD LEVEL check:
WITHIN_VISIT_DATES - find events that occur one week before the corresponding visit_start_date or one week after the corresponding visit_end_date
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = DEVICE_EXPOSURE_START_DATE
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'DEVICE_EXPOSURE.DEVICE_EXPOSURE_START_DATE' as violating_field, 
            cdmtable.*
        from dataform.device_exposure cdmtable
        join dataform.visit_occurrence vo
            on cdmtable.visit_occurrence_id = vo.visit_occurrence_id
        where cdmtable.device_exposure_start_date < date_add(if(safe_cast(vo.visit_start_date  as date) is null,parse_date('%Y%m%d', cast(vo.visit_start_date  as string)),safe_cast(vo.visit_start_date  as date)), interval -7 day)
            or cdmtable.device_exposure_start_date > date_add(if(safe_cast(vo.visit_end_date  as date) is null,parse_date('%Y%m%d', cast(vo.visit_end_date  as string)),safe_cast(vo.visit_end_date  as date)), interval 7 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.device_exposure cdmtable
    join dataform.visit_occurrence vo
        on cdmtable.visit_occurrence_id = vo.visit_occurrence_id
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'withinVisitDates' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records not within one week on either side of the corresponding visit occurrence start and end date' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_EXPOSURE_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_within_visit_dates.sql' as sql_file
  ,'Plausibility' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_withinvisitdates_drug_exposure_drug_exposure_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD LEVEL check:
WITHIN_VISIT_DATES - find events that occur one week before the corresponding visit_start_date or one week after the corresponding visit_end_date
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DRUG_EXPOSURE_START_DATE
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'DRUG_EXPOSURE.DRUG_EXPOSURE_START_DATE' as violating_field, 
            cdmtable.*
        from dataform.drug_exposure cdmtable
        join dataform.visit_occurrence vo
            on cdmtable.visit_occurrence_id = vo.visit_occurrence_id
        where cdmtable.drug_exposure_start_date < date_add(if(safe_cast(vo.visit_start_date  as date) is null,parse_date('%Y%m%d', cast(vo.visit_start_date  as string)),safe_cast(vo.visit_start_date  as date)), interval -7 day)
            or cdmtable.drug_exposure_start_date > date_add(if(safe_cast(vo.visit_end_date  as date) is null,parse_date('%Y%m%d', cast(vo.visit_end_date  as string)),safe_cast(vo.visit_end_date  as date)), interval 7 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.drug_exposure cdmtable
    join dataform.visit_occurrence vo
        on cdmtable.visit_occurrence_id = vo.visit_occurrence_id
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'withinVisitDates' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records not within one week on either side of the corresponding visit occurrence start and end date' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_within_visit_dates.sql' as sql_file
  ,'Plausibility' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_withinvisitdates_measurement_measurement_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD LEVEL check:
WITHIN_VISIT_DATES - find events that occur one week before the corresponding visit_start_date or one week after the corresponding visit_end_date
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_DATE
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'MEASUREMENT.MEASUREMENT_DATE' as violating_field, 
            cdmtable.*
        from dataform.measurement cdmtable
        join dataform.visit_occurrence vo
            on cdmtable.visit_occurrence_id = vo.visit_occurrence_id
        where cdmtable.measurement_date < date_add(if(safe_cast(vo.visit_start_date  as date) is null,parse_date('%Y%m%d', cast(vo.visit_start_date  as string)),safe_cast(vo.visit_start_date  as date)), interval -7 day)
            or cdmtable.measurement_date > date_add(if(safe_cast(vo.visit_end_date  as date) is null,parse_date('%Y%m%d', cast(vo.visit_end_date  as string)),safe_cast(vo.visit_end_date  as date)), interval 7 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.measurement cdmtable
    join dataform.visit_occurrence vo
        on cdmtable.visit_occurrence_id = vo.visit_occurrence_id
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'withinVisitDates' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records not within one week on either side of the corresponding visit occurrence start and end date' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_within_visit_dates.sql' as sql_file
  ,'Plausibility' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_withinvisitdates_note_note_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD LEVEL check:
WITHIN_VISIT_DATES - find events that occur one week before the corresponding visit_start_date or one week after the corresponding visit_end_date
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = NOTE
cdmFieldName = NOTE_DATE
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'NOTE.NOTE_DATE' as violating_field, 
            cdmtable.*
        from dataform.note cdmtable
        join dataform.visit_occurrence vo
            on cdmtable.visit_occurrence_id = vo.visit_occurrence_id
        where cdmtable.note_date < date_add(if(safe_cast(vo.visit_start_date  as date) is null,parse_date('%Y%m%d', cast(vo.visit_start_date  as string)),safe_cast(vo.visit_start_date  as date)), interval -7 day)
            or cdmtable.note_date > date_add(if(safe_cast(vo.visit_end_date  as date) is null,parse_date('%Y%m%d', cast(vo.visit_end_date  as string)),safe_cast(vo.visit_end_date  as date)), interval 7 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.note cdmtable
    join dataform.visit_occurrence vo
        on cdmtable.visit_occurrence_id = vo.visit_occurrence_id
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'withinVisitDates' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records not within one week on either side of the corresponding visit occurrence start and end date' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_within_visit_dates.sql' as sql_file
  ,'Plausibility' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_withinvisitdates_observation_observation_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD LEVEL check:
WITHIN_VISIT_DATES - find events that occur one week before the corresponding visit_start_date or one week after the corresponding visit_end_date
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = OBSERVATION
cdmFieldName = OBSERVATION_DATE
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'OBSERVATION.OBSERVATION_DATE' as violating_field, 
            cdmtable.*
        from dataform.observation cdmtable
        join dataform.visit_occurrence vo
            on cdmtable.visit_occurrence_id = vo.visit_occurrence_id
        where cdmtable.observation_date < date_add(if(safe_cast(vo.visit_start_date  as date) is null,parse_date('%Y%m%d', cast(vo.visit_start_date  as string)),safe_cast(vo.visit_start_date  as date)), interval -7 day)
            or cdmtable.observation_date > date_add(if(safe_cast(vo.visit_end_date  as date) is null,parse_date('%Y%m%d', cast(vo.visit_end_date  as string)),safe_cast(vo.visit_end_date  as date)), interval 7 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.observation cdmtable
    join dataform.visit_occurrence vo
        on cdmtable.visit_occurrence_id = vo.visit_occurrence_id
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'withinVisitDates' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records not within one week on either side of the corresponding visit occurrence start and end date' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_within_visit_dates.sql' as sql_file
  ,'Plausibility' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_withinvisitdates_procedure_occurrence_procedure_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD LEVEL check:
WITHIN_VISIT_DATES - find events that occur one week before the corresponding visit_start_date or one week after the corresponding visit_end_date
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_DATE
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'PROCEDURE_OCCURRENCE.PROCEDURE_DATE' as violating_field, 
            cdmtable.*
        from dataform.procedure_occurrence cdmtable
        join dataform.visit_occurrence vo
            on cdmtable.visit_occurrence_id = vo.visit_occurrence_id
        where cdmtable.procedure_date < date_add(if(safe_cast(vo.visit_start_date  as date) is null,parse_date('%Y%m%d', cast(vo.visit_start_date  as string)),safe_cast(vo.visit_start_date  as date)), interval -7 day)
            or cdmtable.procedure_date > date_add(if(safe_cast(vo.visit_end_date  as date) is null,parse_date('%Y%m%d', cast(vo.visit_end_date  as string)),safe_cast(vo.visit_end_date  as date)), interval 7 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.procedure_occurrence cdmtable
    join dataform.visit_occurrence vo
        on cdmtable.visit_occurrence_id = vo.visit_occurrence_id
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'withinVisitDates' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records not within one week on either side of the corresponding visit occurrence start and end date' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_within_visit_dates.sql' as sql_file
  ,'Plausibility' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_withinvisitdates_visit_detail_visit_detail_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD LEVEL check:
WITHIN_VISIT_DATES - find events that occur one week before the corresponding visit_start_date or one week after the corresponding visit_end_date
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_DETAIL_END_DATE
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'VISIT_DETAIL.VISIT_DETAIL_END_DATE' as violating_field, 
            cdmtable.*
        from dataform.visit_detail cdmtable
        join dataform.visit_occurrence vo
            on cdmtable.visit_occurrence_id = vo.visit_occurrence_id
        where cdmtable.visit_detail_end_date < date_add(if(safe_cast(vo.visit_start_date  as date) is null,parse_date('%Y%m%d', cast(vo.visit_start_date  as string)),safe_cast(vo.visit_start_date  as date)), interval -7 day)
            or cdmtable.visit_detail_end_date > date_add(if(safe_cast(vo.visit_end_date  as date) is null,parse_date('%Y%m%d', cast(vo.visit_end_date  as string)),safe_cast(vo.visit_end_date  as date)), interval 7 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.visit_detail cdmtable
    join dataform.visit_occurrence vo
        on cdmtable.visit_occurrence_id = vo.visit_occurrence_id
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'withinVisitDates' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records not within one week on either side of the corresponding visit occurrence start and end date' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_within_visit_dates.sql' as sql_file
  ,'Plausibility' as category
  ,'NA' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_withinvisitdates_visit_detail_visit_detail_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD LEVEL check:
WITHIN_VISIT_DATES - find events that occur one week before the corresponding visit_start_date or one week after the corresponding visit_end_date
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_DETAIL_START_DATE
**********/
select num_violated_rows,
    case
        when denominator.num_rows = 0 then 0 
        else 1.0*num_violated_rows/denominator.num_rows
    end as pct_violated_rows,
    denominator.num_rows as num_denominator_rows
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'VISIT_DETAIL.VISIT_DETAIL_START_DATE' as violating_field, 
            cdmtable.*
        from dataform.visit_detail cdmtable
        join dataform.visit_occurrence vo
            on cdmtable.visit_occurrence_id = vo.visit_occurrence_id
        where cdmtable.visit_detail_start_date < date_add(if(safe_cast(vo.visit_start_date  as date) is null,parse_date('%Y%m%d', cast(vo.visit_start_date  as string)),safe_cast(vo.visit_start_date  as date)), interval -7 day)
            or cdmtable.visit_detail_start_date > date_add(if(safe_cast(vo.visit_end_date  as date) is null,parse_date('%Y%m%d', cast(vo.visit_end_date  as string)),safe_cast(vo.visit_end_date  as date)), interval 7 day)
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.visit_detail cdmtable
    join dataform.visit_occurrence vo
        on cdmtable.visit_occurrence_id = vo.visit_occurrence_id
) denominator
) cte
)
 SELECT *
from cte_all
;

