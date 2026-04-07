/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleStartBeforeEnd' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the SOURCE_RELEASE_DATE field of the CDM_SOURCE that occurs after the date in the SOURCE_RELEASE_DATE.' as check_description
  ,'CDM_SOURCE' as cdm_table_name
  ,'SOURCE_RELEASE_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_start_before_end.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblestartbeforeend_cdm_source_source_release_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_START_BEFORE_END
Checks that all start dates are before their corresponding end dates (PLAUSIBLE_START_BEFORE_END == Yes).
SOURCE_RELEASE_DATE is the start date and SOURCE_RELEASE_DATE is the end date.
Parameters used in this template:
schema = dataform
cdmTableName = CDM_SOURCE
cdmFieldName = SOURCE_RELEASE_DATE
plausibleStartBeforeEndFieldName = SOURCE_RELEASE_DATE
**********/
select 
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
        where cdmtable.source_release_date is not null 
            and cdmtable.source_release_date is not null 
            and if(safe_cast(cdmtable.source_release_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.source_release_date  as string)),safe_cast(cdmtable.source_release_date  as date)) > if(safe_cast(cdmtable.source_release_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.source_release_date  as string)),safe_cast(cdmtable.source_release_date  as date))
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.cdm_source cdmtable
    where cdmtable.source_release_date is not null 
        and cdmtable.source_release_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleStartBeforeEnd' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the CONDITION_ERA_START_DATE field of the CONDITION_ERA that occurs after the date in the CONDITION_ERA_END_DATE.' as check_description
  ,'CONDITION_ERA' as cdm_table_name
  ,'CONDITION_ERA_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_start_before_end.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblestartbeforeend_condition_era_condition_era_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_START_BEFORE_END
Checks that all start dates are before their corresponding end dates (PLAUSIBLE_START_BEFORE_END == Yes).
CONDITION_ERA_START_DATE is the start date and CONDITION_ERA_END_DATE is the end date.
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_ERA
cdmFieldName = CONDITION_ERA_START_DATE
plausibleStartBeforeEndFieldName = CONDITION_ERA_END_DATE
**********/
select 
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
        where cdmtable.condition_era_start_date is not null 
            and cdmtable.condition_era_end_date is not null 
            and if(safe_cast(cdmtable.condition_era_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.condition_era_start_date  as string)),safe_cast(cdmtable.condition_era_start_date  as date)) > if(safe_cast(cdmtable.condition_era_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.condition_era_end_date  as string)),safe_cast(cdmtable.condition_era_end_date  as date))
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.condition_era cdmtable
    where cdmtable.condition_era_start_date is not null 
        and cdmtable.condition_era_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleStartBeforeEnd' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the CONDITION_START_DATE field of the CONDITION_OCCURRENCE that occurs after the date in the CONDITION_END_DATE.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_start_before_end.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblestartbeforeend_condition_occurrence_condition_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_START_BEFORE_END
Checks that all start dates are before their corresponding end dates (PLAUSIBLE_START_BEFORE_END == Yes).
CONDITION_START_DATE is the start date and CONDITION_END_DATE is the end date.
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_START_DATE
plausibleStartBeforeEndFieldName = CONDITION_END_DATE
**********/
select 
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
        where cdmtable.condition_start_date is not null 
            and cdmtable.condition_end_date is not null 
            and if(safe_cast(cdmtable.condition_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.condition_start_date  as string)),safe_cast(cdmtable.condition_start_date  as date)) > if(safe_cast(cdmtable.condition_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.condition_end_date  as string)),safe_cast(cdmtable.condition_end_date  as date))
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.condition_occurrence cdmtable
    where cdmtable.condition_start_date is not null 
        and cdmtable.condition_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleStartBeforeEnd' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the CONDITION_START_DATETIME field of the CONDITION_OCCURRENCE that occurs after the date in the CONDITION_END_DATETIME.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_START_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_start_before_end.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblestartbeforeend_condition_occurrence_condition_start_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_START_BEFORE_END
Checks that all start dates are before their corresponding end dates (PLAUSIBLE_START_BEFORE_END == Yes).
CONDITION_START_DATETIME is the start date and CONDITION_END_DATETIME is the end date.
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_START_DATETIME
plausibleStartBeforeEndFieldName = CONDITION_END_DATETIME
**********/
select 
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
        where cdmtable.condition_start_datetime is not null 
            and cdmtable.condition_end_datetime is not null 
            and if(safe_cast(cdmtable.condition_start_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.condition_start_datetime  as string)),safe_cast(cdmtable.condition_start_datetime  as date)) > if(safe_cast(cdmtable.condition_end_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.condition_end_datetime  as string)),safe_cast(cdmtable.condition_end_datetime  as date))
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.condition_occurrence cdmtable
    where cdmtable.condition_start_datetime is not null 
        and cdmtable.condition_end_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleStartBeforeEnd' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the DEVICE_EXPOSURE_START_DATE field of the DEVICE_EXPOSURE that occurs after the date in the DEVICE_EXPOSURE_END_DATE.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_EXPOSURE_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_start_before_end.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblestartbeforeend_device_exposure_device_exposure_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_START_BEFORE_END
Checks that all start dates are before their corresponding end dates (PLAUSIBLE_START_BEFORE_END == Yes).
DEVICE_EXPOSURE_START_DATE is the start date and DEVICE_EXPOSURE_END_DATE is the end date.
Parameters used in this template:
schema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = DEVICE_EXPOSURE_START_DATE
plausibleStartBeforeEndFieldName = DEVICE_EXPOSURE_END_DATE
**********/
select 
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
        where cdmtable.device_exposure_start_date is not null 
            and cdmtable.device_exposure_end_date is not null 
            and if(safe_cast(cdmtable.device_exposure_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.device_exposure_start_date  as string)),safe_cast(cdmtable.device_exposure_start_date  as date)) > if(safe_cast(cdmtable.device_exposure_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.device_exposure_end_date  as string)),safe_cast(cdmtable.device_exposure_end_date  as date))
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.device_exposure cdmtable
    where cdmtable.device_exposure_start_date is not null 
        and cdmtable.device_exposure_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleStartBeforeEnd' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the DEVICE_EXPOSURE_START_DATETIME field of the DEVICE_EXPOSURE that occurs after the date in the DEVICE_EXPOSURE_END_DATETIME.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_EXPOSURE_START_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_start_before_end.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblestartbeforeend_device_exposure_device_exposure_start_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_START_BEFORE_END
Checks that all start dates are before their corresponding end dates (PLAUSIBLE_START_BEFORE_END == Yes).
DEVICE_EXPOSURE_START_DATETIME is the start date and DEVICE_EXPOSURE_END_DATETIME is the end date.
Parameters used in this template:
schema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = DEVICE_EXPOSURE_START_DATETIME
plausibleStartBeforeEndFieldName = DEVICE_EXPOSURE_END_DATETIME
**********/
select 
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
        where cdmtable.device_exposure_start_datetime is not null 
            and cdmtable.device_exposure_end_datetime is not null 
            and if(safe_cast(cdmtable.device_exposure_start_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.device_exposure_start_datetime  as string)),safe_cast(cdmtable.device_exposure_start_datetime  as date)) > if(safe_cast(cdmtable.device_exposure_end_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.device_exposure_end_datetime  as string)),safe_cast(cdmtable.device_exposure_end_datetime  as date))
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.device_exposure cdmtable
    where cdmtable.device_exposure_start_datetime is not null 
        and cdmtable.device_exposure_end_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleStartBeforeEnd' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the DOSE_ERA_START_DATE field of the DOSE_ERA that occurs after the date in the DOSE_ERA_END_DATE.' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'DOSE_ERA_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_start_before_end.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblestartbeforeend_dose_era_dose_era_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_START_BEFORE_END
Checks that all start dates are before their corresponding end dates (PLAUSIBLE_START_BEFORE_END == Yes).
DOSE_ERA_START_DATE is the start date and DOSE_ERA_END_DATE is the end date.
Parameters used in this template:
schema = dataform
cdmTableName = DOSE_ERA
cdmFieldName = DOSE_ERA_START_DATE
plausibleStartBeforeEndFieldName = DOSE_ERA_END_DATE
**********/
select 
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
        where cdmtable.dose_era_start_date is not null 
            and cdmtable.dose_era_end_date is not null 
            and if(safe_cast(cdmtable.dose_era_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.dose_era_start_date  as string)),safe_cast(cdmtable.dose_era_start_date  as date)) > if(safe_cast(cdmtable.dose_era_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.dose_era_end_date  as string)),safe_cast(cdmtable.dose_era_end_date  as date))
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.dose_era cdmtable
    where cdmtable.dose_era_start_date is not null 
        and cdmtable.dose_era_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleStartBeforeEnd' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the DRUG_ERA_START_DATE field of the DRUG_ERA that occurs after the date in the DRUG_ERA_END_DATE.' as check_description
  ,'DRUG_ERA' as cdm_table_name
  ,'DRUG_ERA_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_start_before_end.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblestartbeforeend_drug_era_drug_era_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_START_BEFORE_END
Checks that all start dates are before their corresponding end dates (PLAUSIBLE_START_BEFORE_END == Yes).
DRUG_ERA_START_DATE is the start date and DRUG_ERA_END_DATE is the end date.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_ERA
cdmFieldName = DRUG_ERA_START_DATE
plausibleStartBeforeEndFieldName = DRUG_ERA_END_DATE
**********/
select 
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
        where cdmtable.drug_era_start_date is not null 
            and cdmtable.drug_era_end_date is not null 
            and if(safe_cast(cdmtable.drug_era_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.drug_era_start_date  as string)),safe_cast(cdmtable.drug_era_start_date  as date)) > if(safe_cast(cdmtable.drug_era_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.drug_era_end_date  as string)),safe_cast(cdmtable.drug_era_end_date  as date))
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.drug_era cdmtable
    where cdmtable.drug_era_start_date is not null 
        and cdmtable.drug_era_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleStartBeforeEnd' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the DRUG_EXPOSURE_START_DATE field of the DRUG_EXPOSURE that occurs after the date in the DRUG_EXPOSURE_END_DATE.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_EXPOSURE_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_start_before_end.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblestartbeforeend_drug_exposure_drug_exposure_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_START_BEFORE_END
Checks that all start dates are before their corresponding end dates (PLAUSIBLE_START_BEFORE_END == Yes).
DRUG_EXPOSURE_START_DATE is the start date and DRUG_EXPOSURE_END_DATE is the end date.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DRUG_EXPOSURE_START_DATE
plausibleStartBeforeEndFieldName = DRUG_EXPOSURE_END_DATE
**********/
select 
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
        where cdmtable.drug_exposure_start_date is not null 
            and cdmtable.drug_exposure_end_date is not null 
            and if(safe_cast(cdmtable.drug_exposure_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.drug_exposure_start_date  as string)),safe_cast(cdmtable.drug_exposure_start_date  as date)) > if(safe_cast(cdmtable.drug_exposure_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.drug_exposure_end_date  as string)),safe_cast(cdmtable.drug_exposure_end_date  as date))
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.drug_exposure cdmtable
    where cdmtable.drug_exposure_start_date is not null 
        and cdmtable.drug_exposure_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleStartBeforeEnd' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the DRUG_EXPOSURE_START_DATETIME field of the DRUG_EXPOSURE that occurs after the date in the DRUG_EXPOSURE_END_DATETIME.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_EXPOSURE_START_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_start_before_end.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblestartbeforeend_drug_exposure_drug_exposure_start_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_START_BEFORE_END
Checks that all start dates are before their corresponding end dates (PLAUSIBLE_START_BEFORE_END == Yes).
DRUG_EXPOSURE_START_DATETIME is the start date and DRUG_EXPOSURE_END_DATETIME is the end date.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DRUG_EXPOSURE_START_DATETIME
plausibleStartBeforeEndFieldName = DRUG_EXPOSURE_END_DATETIME
**********/
select 
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
        where cdmtable.drug_exposure_start_datetime is not null 
            and cdmtable.drug_exposure_end_datetime is not null 
            and if(safe_cast(cdmtable.drug_exposure_start_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.drug_exposure_start_datetime  as string)),safe_cast(cdmtable.drug_exposure_start_datetime  as date)) > if(safe_cast(cdmtable.drug_exposure_end_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.drug_exposure_end_datetime  as string)),safe_cast(cdmtable.drug_exposure_end_datetime  as date))
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.drug_exposure cdmtable
    where cdmtable.drug_exposure_start_datetime is not null 
        and cdmtable.drug_exposure_end_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleStartBeforeEnd' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the VALID_START_DATE field of the DRUG_STRENGTH that occurs after the date in the VALID_END_DATE.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'VALID_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_start_before_end.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblestartbeforeend_drug_strength_valid_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_START_BEFORE_END
Checks that all start dates are before their corresponding end dates (PLAUSIBLE_START_BEFORE_END == Yes).
VALID_START_DATE is the start date and VALID_END_DATE is the end date.
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_STRENGTH
cdmFieldName = VALID_START_DATE
plausibleStartBeforeEndFieldName = VALID_END_DATE
**********/
select 
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
            'DRUG_STRENGTH.VALID_START_DATE' as violating_field, 
            cdmtable.*
        from dataform.drug_strength cdmtable
        where cdmtable.valid_start_date is not null 
            and cdmtable.valid_end_date is not null 
            and if(safe_cast(cdmtable.valid_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.valid_start_date  as string)),safe_cast(cdmtable.valid_start_date  as date)) > if(safe_cast(cdmtable.valid_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.valid_end_date  as string)),safe_cast(cdmtable.valid_end_date  as date))
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.drug_strength cdmtable
    where cdmtable.valid_start_date is not null 
        and cdmtable.valid_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleStartBeforeEnd' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the EPISODE_START_DATE field of the EPISODE that occurs after the date in the EPISODE_END_DATE.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_start_before_end.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblestartbeforeend_episode_episode_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_START_BEFORE_END
Checks that all start dates are before their corresponding end dates (PLAUSIBLE_START_BEFORE_END == Yes).
EPISODE_START_DATE is the start date and EPISODE_END_DATE is the end date.
Parameters used in this template:
schema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_START_DATE
plausibleStartBeforeEndFieldName = EPISODE_END_DATE
**********/
select 
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
        where cdmtable.episode_start_date is not null 
            and cdmtable.episode_end_date is not null 
            and if(safe_cast(cdmtable.episode_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.episode_start_date  as string)),safe_cast(cdmtable.episode_start_date  as date)) > if(safe_cast(cdmtable.episode_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.episode_end_date  as string)),safe_cast(cdmtable.episode_end_date  as date))
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.episode cdmtable
    where cdmtable.episode_start_date is not null 
        and cdmtable.episode_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleStartBeforeEnd' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the EPISODE_START_DATETIME field of the EPISODE that occurs after the date in the EPISODE_END_DATETIME.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_START_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_start_before_end.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblestartbeforeend_episode_episode_start_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_START_BEFORE_END
Checks that all start dates are before their corresponding end dates (PLAUSIBLE_START_BEFORE_END == Yes).
EPISODE_START_DATETIME is the start date and EPISODE_END_DATETIME is the end date.
Parameters used in this template:
schema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_START_DATETIME
plausibleStartBeforeEndFieldName = EPISODE_END_DATETIME
**********/
select 
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
        where cdmtable.episode_start_datetime is not null 
            and cdmtable.episode_end_datetime is not null 
            and if(safe_cast(cdmtable.episode_start_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.episode_start_datetime  as string)),safe_cast(cdmtable.episode_start_datetime  as date)) > if(safe_cast(cdmtable.episode_end_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.episode_end_datetime  as string)),safe_cast(cdmtable.episode_end_datetime  as date))
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.episode cdmtable
    where cdmtable.episode_start_datetime is not null 
        and cdmtable.episode_end_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleStartBeforeEnd' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the OBSERVATION_PERIOD_START_DATE field of the OBSERVATION_PERIOD that occurs after the date in the OBSERVATION_PERIOD_END_DATE.' as check_description
  ,'OBSERVATION_PERIOD' as cdm_table_name
  ,'OBSERVATION_PERIOD_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_start_before_end.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblestartbeforeend_observation_period_observation_period_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_START_BEFORE_END
Checks that all start dates are before their corresponding end dates (PLAUSIBLE_START_BEFORE_END == Yes).
OBSERVATION_PERIOD_START_DATE is the start date and OBSERVATION_PERIOD_END_DATE is the end date.
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION_PERIOD
cdmFieldName = OBSERVATION_PERIOD_START_DATE
plausibleStartBeforeEndFieldName = OBSERVATION_PERIOD_END_DATE
**********/
select 
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
        where cdmtable.observation_period_start_date is not null 
            and cdmtable.observation_period_end_date is not null 
            and if(safe_cast(cdmtable.observation_period_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.observation_period_start_date  as string)),safe_cast(cdmtable.observation_period_start_date  as date)) > if(safe_cast(cdmtable.observation_period_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.observation_period_end_date  as string)),safe_cast(cdmtable.observation_period_end_date  as date))
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.observation_period cdmtable
    where cdmtable.observation_period_start_date is not null 
        and cdmtable.observation_period_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleStartBeforeEnd' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the PAYER_PLAN_PERIOD_START_DATE field of the PAYER_PLAN_PERIOD that occurs after the date in the PAYER_PLAN_PERIOD_END_DATE.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PAYER_PLAN_PERIOD_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_start_before_end.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblestartbeforeend_payer_plan_period_payer_plan_period_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_START_BEFORE_END
Checks that all start dates are before their corresponding end dates (PLAUSIBLE_START_BEFORE_END == Yes).
PAYER_PLAN_PERIOD_START_DATE is the start date and PAYER_PLAN_PERIOD_END_DATE is the end date.
Parameters used in this template:
schema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = PAYER_PLAN_PERIOD_START_DATE
plausibleStartBeforeEndFieldName = PAYER_PLAN_PERIOD_END_DATE
**********/
select 
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
        where cdmtable.payer_plan_period_start_date is not null 
            and cdmtable.payer_plan_period_end_date is not null 
            and if(safe_cast(cdmtable.payer_plan_period_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.payer_plan_period_start_date  as string)),safe_cast(cdmtable.payer_plan_period_start_date  as date)) > if(safe_cast(cdmtable.payer_plan_period_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.payer_plan_period_end_date  as string)),safe_cast(cdmtable.payer_plan_period_end_date  as date))
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.payer_plan_period cdmtable
    where cdmtable.payer_plan_period_start_date is not null 
        and cdmtable.payer_plan_period_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleStartBeforeEnd' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the PROCEDURE_DATE field of the PROCEDURE_OCCURRENCE that occurs after the date in the PROCEDURE_END_DATE.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_start_before_end.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblestartbeforeend_procedure_occurrence_procedure_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_START_BEFORE_END
Checks that all start dates are before their corresponding end dates (PLAUSIBLE_START_BEFORE_END == Yes).
PROCEDURE_DATE is the start date and PROCEDURE_END_DATE is the end date.
Parameters used in this template:
schema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_DATE
plausibleStartBeforeEndFieldName = PROCEDURE_END_DATE
**********/
select 
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
        where cdmtable.procedure_date is not null 
            and cdmtable.procedure_end_date is not null 
            and if(safe_cast(cdmtable.procedure_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.procedure_date  as string)),safe_cast(cdmtable.procedure_date  as date)) > if(safe_cast(cdmtable.procedure_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.procedure_end_date  as string)),safe_cast(cdmtable.procedure_end_date  as date))
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.procedure_occurrence cdmtable
    where cdmtable.procedure_date is not null 
        and cdmtable.procedure_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleStartBeforeEnd' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the PROCEDURE_DATETIME field of the PROCEDURE_OCCURRENCE that occurs after the date in the PROCEDURE_END_DATETIME.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_start_before_end.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblestartbeforeend_procedure_occurrence_procedure_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_START_BEFORE_END
Checks that all start dates are before their corresponding end dates (PLAUSIBLE_START_BEFORE_END == Yes).
PROCEDURE_DATETIME is the start date and PROCEDURE_END_DATETIME is the end date.
Parameters used in this template:
schema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_DATETIME
plausibleStartBeforeEndFieldName = PROCEDURE_END_DATETIME
**********/
select 
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
        where cdmtable.procedure_datetime is not null 
            and cdmtable.procedure_end_datetime is not null 
            and if(safe_cast(cdmtable.procedure_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.procedure_datetime  as string)),safe_cast(cdmtable.procedure_datetime  as date)) > if(safe_cast(cdmtable.procedure_end_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.procedure_end_datetime  as string)),safe_cast(cdmtable.procedure_end_datetime  as date))
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.procedure_occurrence cdmtable
    where cdmtable.procedure_datetime is not null 
        and cdmtable.procedure_end_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleStartBeforeEnd' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the VALID_START_DATE field of the SOURCE_TO_CONCEPT_MAP that occurs after the date in the VALID_END_DATE.' as check_description
  ,'SOURCE_TO_CONCEPT_MAP' as cdm_table_name
  ,'VALID_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_start_before_end.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblestartbeforeend_source_to_concept_map_valid_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_START_BEFORE_END
Checks that all start dates are before their corresponding end dates (PLAUSIBLE_START_BEFORE_END == Yes).
VALID_START_DATE is the start date and VALID_END_DATE is the end date.
Parameters used in this template:
schema = dataform
cdmTableName = SOURCE_TO_CONCEPT_MAP
cdmFieldName = VALID_START_DATE
plausibleStartBeforeEndFieldName = VALID_END_DATE
**********/
select 
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
            'SOURCE_TO_CONCEPT_MAP.VALID_START_DATE' as violating_field, 
            cdmtable.*
        from dataform.source_to_concept_map cdmtable
        where cdmtable.valid_start_date is not null 
            and cdmtable.valid_end_date is not null 
            and if(safe_cast(cdmtable.valid_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.valid_start_date  as string)),safe_cast(cdmtable.valid_start_date  as date)) > if(safe_cast(cdmtable.valid_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.valid_end_date  as string)),safe_cast(cdmtable.valid_end_date  as date))
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.source_to_concept_map cdmtable
    where cdmtable.valid_start_date is not null 
        and cdmtable.valid_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleStartBeforeEnd' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the VISIT_DETAIL_START_DATE field of the VISIT_DETAIL that occurs after the date in the VISIT_DETAIL_END_DATE.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_start_before_end.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblestartbeforeend_visit_detail_visit_detail_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_START_BEFORE_END
Checks that all start dates are before their corresponding end dates (PLAUSIBLE_START_BEFORE_END == Yes).
VISIT_DETAIL_START_DATE is the start date and VISIT_DETAIL_END_DATE is the end date.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_DETAIL_START_DATE
plausibleStartBeforeEndFieldName = VISIT_DETAIL_END_DATE
**********/
select 
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
        where cdmtable.visit_detail_start_date is not null 
            and cdmtable.visit_detail_end_date is not null 
            and if(safe_cast(cdmtable.visit_detail_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.visit_detail_start_date  as string)),safe_cast(cdmtable.visit_detail_start_date  as date)) > if(safe_cast(cdmtable.visit_detail_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.visit_detail_end_date  as string)),safe_cast(cdmtable.visit_detail_end_date  as date))
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.visit_detail cdmtable
    where cdmtable.visit_detail_start_date is not null 
        and cdmtable.visit_detail_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleStartBeforeEnd' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the VISIT_DETAIL_START_DATETIME field of the VISIT_DETAIL that occurs after the date in the VISIT_DETAIL_END_DATETIME.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_START_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_start_before_end.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblestartbeforeend_visit_detail_visit_detail_start_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_START_BEFORE_END
Checks that all start dates are before their corresponding end dates (PLAUSIBLE_START_BEFORE_END == Yes).
VISIT_DETAIL_START_DATETIME is the start date and VISIT_DETAIL_END_DATETIME is the end date.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_DETAIL_START_DATETIME
plausibleStartBeforeEndFieldName = VISIT_DETAIL_END_DATETIME
**********/
select 
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
        where cdmtable.visit_detail_start_datetime is not null 
            and cdmtable.visit_detail_end_datetime is not null 
            and if(safe_cast(cdmtable.visit_detail_start_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.visit_detail_start_datetime  as string)),safe_cast(cdmtable.visit_detail_start_datetime  as date)) > if(safe_cast(cdmtable.visit_detail_end_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.visit_detail_end_datetime  as string)),safe_cast(cdmtable.visit_detail_end_datetime  as date))
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.visit_detail cdmtable
    where cdmtable.visit_detail_start_datetime is not null 
        and cdmtable.visit_detail_end_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleStartBeforeEnd' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the VISIT_START_DATE field of the VISIT_OCCURRENCE that occurs after the date in the VISIT_END_DATE.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_start_before_end.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblestartbeforeend_visit_occurrence_visit_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_START_BEFORE_END
Checks that all start dates are before their corresponding end dates (PLAUSIBLE_START_BEFORE_END == Yes).
VISIT_START_DATE is the start date and VISIT_END_DATE is the end date.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = VISIT_START_DATE
plausibleStartBeforeEndFieldName = VISIT_END_DATE
**********/
select 
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
        where cdmtable.visit_start_date is not null 
            and cdmtable.visit_end_date is not null 
            and if(safe_cast(cdmtable.visit_start_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.visit_start_date  as string)),safe_cast(cdmtable.visit_start_date  as date)) > if(safe_cast(cdmtable.visit_end_date  as date) is null,parse_date('%Y%m%d', cast(cdmtable.visit_end_date  as string)),safe_cast(cdmtable.visit_end_date  as date))
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.visit_occurrence cdmtable
    where cdmtable.visit_start_date is not null 
        and cdmtable.visit_end_date is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleStartBeforeEnd' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a value in the VISIT_START_DATETIME field of the VISIT_OCCURRENCE that occurs after the date in the VISIT_END_DATETIME.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_START_DATETIME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_plausible_start_before_end.sql' as sql_file
  ,'Plausibility' as category
  ,'Temporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_plausiblestartbeforeend_visit_occurrence_visit_start_datetime' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 1 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 1 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,1 as threshold_value
  ,null as notes_value
from (
  /*********
PLAUSIBLE_START_BEFORE_END
Checks that all start dates are before their corresponding end dates (PLAUSIBLE_START_BEFORE_END == Yes).
VISIT_START_DATETIME is the start date and VISIT_END_DATETIME is the end date.
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = VISIT_START_DATETIME
plausibleStartBeforeEndFieldName = VISIT_END_DATETIME
**********/
select 
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
        where cdmtable.visit_start_datetime is not null 
            and cdmtable.visit_end_datetime is not null 
            and if(safe_cast(cdmtable.visit_start_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.visit_start_datetime  as string)),safe_cast(cdmtable.visit_start_datetime  as date)) > if(safe_cast(cdmtable.visit_end_datetime  as date) is null,parse_date('%Y%m%d', cast(cdmtable.visit_end_datetime  as string)),safe_cast(cdmtable.visit_end_datetime  as date))
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
(
    select 
        count(*) as num_rows
    from dataform.visit_occurrence cdmtable
    where cdmtable.visit_start_datetime is not null 
        and cdmtable.visit_end_datetime is not null
) denominator
) cte
)
 SELECT *
from cte_all
;

