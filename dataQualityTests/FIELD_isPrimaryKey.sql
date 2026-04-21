/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isPrimaryKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a duplicate value in the CARE_SITE_ID field of the CARE_SITE.' as check_description
  ,'CARE_SITE' as cdm_table_name
  ,'CARE_SITE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_primary_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isprimarykey_care_site_care_site_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_PRIMARY_KEY
Primary Key - verify that values in fields where isPrimaryKey == Yes are unique
Parameters used in this template:
schema = dataform
cdmTableName = CARE_SITE
cdmFieldName = CARE_SITE_ID
**********/
select 
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
            'CARE_SITE.CARE_SITE_ID' as violating_field, 
            cdmtable.* 
        from dataform.care_site cdmtable
        where cdmtable.care_site_id in ( 
                  select care_site_id 
                  from dataform.care_site
                  group by  1   having count(*) > 1 
           )
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select 
        count(*) as num_rows
    from dataform.care_site cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isPrimaryKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a duplicate value in the CONDITION_ERA_ID field of the CONDITION_ERA.' as check_description
  ,'CONDITION_ERA' as cdm_table_name
  ,'CONDITION_ERA_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_primary_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isprimarykey_condition_era_condition_era_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_PRIMARY_KEY
Primary Key - verify that values in fields where isPrimaryKey == Yes are unique
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_ERA
cdmFieldName = CONDITION_ERA_ID
**********/
select 
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
            'CONDITION_ERA.CONDITION_ERA_ID' as violating_field, 
            cdmtable.* 
        from dataform.condition_era cdmtable
        where cdmtable.condition_era_id in ( 
                  select condition_era_id 
                  from dataform.condition_era
                  group by  1   having count(*) > 1 
           )
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
  ,'isPrimaryKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a duplicate value in the CONDITION_OCCURRENCE_ID field of the CONDITION_OCCURRENCE.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_primary_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isprimarykey_condition_occurrence_condition_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_PRIMARY_KEY
Primary Key - verify that values in fields where isPrimaryKey == Yes are unique
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_OCCURRENCE_ID
**********/
select 
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
            'CONDITION_OCCURRENCE.CONDITION_OCCURRENCE_ID' as violating_field, 
            cdmtable.* 
        from dataform.condition_occurrence cdmtable
        where cdmtable.condition_occurrence_id in ( 
                  select condition_occurrence_id 
                  from dataform.condition_occurrence
                  group by  1   having count(*) > 1 
           )
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
  ,'isPrimaryKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a duplicate value in the COST_ID field of the COST.' as check_description
  ,'COST' as cdm_table_name
  ,'COST_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_primary_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isprimarykey_cost_cost_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_PRIMARY_KEY
Primary Key - verify that values in fields where isPrimaryKey == Yes are unique
Parameters used in this template:
schema = dataform
cdmTableName = COST
cdmFieldName = COST_ID
**********/
select 
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
            'COST.COST_ID' as violating_field, 
            cdmtable.* 
        from dataform.cost cdmtable
        where cdmtable.cost_id in ( 
                  select cost_id 
                  from dataform.cost
                  group by  1   having count(*) > 1 
           )
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select 
        count(*) as num_rows
    from dataform.cost cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isPrimaryKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a duplicate value in the DEVICE_EXPOSURE_ID field of the DEVICE_EXPOSURE.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_EXPOSURE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_primary_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isprimarykey_device_exposure_device_exposure_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_PRIMARY_KEY
Primary Key - verify that values in fields where isPrimaryKey == Yes are unique
Parameters used in this template:
schema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = DEVICE_EXPOSURE_ID
**********/
select 
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
            'DEVICE_EXPOSURE.DEVICE_EXPOSURE_ID' as violating_field, 
            cdmtable.* 
        from dataform.device_exposure cdmtable
        where cdmtable.device_exposure_id in ( 
                  select device_exposure_id 
                  from dataform.device_exposure
                  group by  1   having count(*) > 1 
           )
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
  ,'isPrimaryKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a duplicate value in the DOMAIN_ID field of the DOMAIN.' as check_description
  ,'DOMAIN' as cdm_table_name
  ,'DOMAIN_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_primary_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isprimarykey_domain_domain_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_PRIMARY_KEY
Primary Key - verify that values in fields where isPrimaryKey == Yes are unique
Parameters used in this template:
schema = dataform
cdmTableName = DOMAIN
cdmFieldName = DOMAIN_ID
**********/
select 
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
            'DOMAIN.DOMAIN_ID' as violating_field, 
            cdmtable.* 
        from dataform.domain cdmtable
        where cdmtable.domain_id in ( 
                  select domain_id 
                  from dataform.domain
                  group by  1   having count(*) > 1 
           )
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select 
        count(*) as num_rows
    from dataform.domain cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isPrimaryKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a duplicate value in the DOSE_ERA_ID field of the DOSE_ERA.' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'DOSE_ERA_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_primary_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isprimarykey_dose_era_dose_era_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_PRIMARY_KEY
Primary Key - verify that values in fields where isPrimaryKey == Yes are unique
Parameters used in this template:
schema = dataform
cdmTableName = DOSE_ERA
cdmFieldName = DOSE_ERA_ID
**********/
select 
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
            'DOSE_ERA.DOSE_ERA_ID' as violating_field, 
            cdmtable.* 
        from dataform.dose_era cdmtable
        where cdmtable.dose_era_id in ( 
                  select dose_era_id 
                  from dataform.dose_era
                  group by  1   having count(*) > 1 
           )
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
  ,'isPrimaryKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a duplicate value in the DRUG_ERA_ID field of the DRUG_ERA.' as check_description
  ,'DRUG_ERA' as cdm_table_name
  ,'DRUG_ERA_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_primary_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isprimarykey_drug_era_drug_era_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_PRIMARY_KEY
Primary Key - verify that values in fields where isPrimaryKey == Yes are unique
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_ERA
cdmFieldName = DRUG_ERA_ID
**********/
select 
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
            'DRUG_ERA.DRUG_ERA_ID' as violating_field, 
            cdmtable.* 
        from dataform.drug_era cdmtable
        where cdmtable.drug_era_id in ( 
                  select drug_era_id 
                  from dataform.drug_era
                  group by  1   having count(*) > 1 
           )
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
  ,'isPrimaryKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a duplicate value in the DRUG_EXPOSURE_ID field of the DRUG_EXPOSURE.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_EXPOSURE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_primary_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isprimarykey_drug_exposure_drug_exposure_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_PRIMARY_KEY
Primary Key - verify that values in fields where isPrimaryKey == Yes are unique
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DRUG_EXPOSURE_ID
**********/
select 
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
            'DRUG_EXPOSURE.DRUG_EXPOSURE_ID' as violating_field, 
            cdmtable.* 
        from dataform.drug_exposure cdmtable
        where cdmtable.drug_exposure_id in ( 
                  select drug_exposure_id 
                  from dataform.drug_exposure
                  group by  1   having count(*) > 1 
           )
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
  ,'isPrimaryKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a duplicate value in the EPISODE_ID field of the EPISODE.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_primary_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isprimarykey_episode_episode_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_PRIMARY_KEY
Primary Key - verify that values in fields where isPrimaryKey == Yes are unique
Parameters used in this template:
schema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_ID
**********/
select 
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
            'EPISODE.EPISODE_ID' as violating_field, 
            cdmtable.* 
        from dataform.episode cdmtable
        where cdmtable.episode_id in ( 
                  select episode_id 
                  from dataform.episode
                  group by  1   having count(*) > 1 
           )
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
  ,'isPrimaryKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a duplicate value in the LOCATION_ID field of the LOCATION.' as check_description
  ,'LOCATION' as cdm_table_name
  ,'LOCATION_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_primary_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isprimarykey_location_location_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_PRIMARY_KEY
Primary Key - verify that values in fields where isPrimaryKey == Yes are unique
Parameters used in this template:
schema = dataform
cdmTableName = LOCATION
cdmFieldName = LOCATION_ID
**********/
select 
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
            'LOCATION.LOCATION_ID' as violating_field, 
            cdmtable.* 
        from dataform.location cdmtable
        where cdmtable.location_id in ( 
                  select location_id 
                  from dataform.location
                  group by  1   having count(*) > 1 
           )
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select 
        count(*) as num_rows
    from dataform.location cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isPrimaryKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a duplicate value in the MEASUREMENT_ID field of the MEASUREMENT.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_primary_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isprimarykey_measurement_measurement_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_PRIMARY_KEY
Primary Key - verify that values in fields where isPrimaryKey == Yes are unique
Parameters used in this template:
schema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_ID
**********/
select 
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
            'MEASUREMENT.MEASUREMENT_ID' as violating_field, 
            cdmtable.* 
        from dataform.measurement cdmtable
        where cdmtable.measurement_id in ( 
                  select measurement_id 
                  from dataform.measurement
                  group by  1   having count(*) > 1 
           )
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
  ,'isPrimaryKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a duplicate value in the METADATA_ID field of the METADATA.' as check_description
  ,'METADATA' as cdm_table_name
  ,'METADATA_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_primary_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isprimarykey_metadata_metadata_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_PRIMARY_KEY
Primary Key - verify that values in fields where isPrimaryKey == Yes are unique
Parameters used in this template:
schema = dataform
cdmTableName = METADATA
cdmFieldName = METADATA_ID
**********/
select 
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
            'METADATA.METADATA_ID' as violating_field, 
            cdmtable.* 
        from dataform.metadata cdmtable
        where cdmtable.metadata_id in ( 
                  select metadata_id 
                  from dataform.metadata
                  group by  1   having count(*) > 1 
           )
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select 
        count(*) as num_rows
    from dataform.metadata cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isPrimaryKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a duplicate value in the NOTE_ID field of the NOTE.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_primary_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isprimarykey_note_note_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_PRIMARY_KEY
Primary Key - verify that values in fields where isPrimaryKey == Yes are unique
Parameters used in this template:
schema = dataform
cdmTableName = NOTE
cdmFieldName = NOTE_ID
**********/
select 
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
            'NOTE.NOTE_ID' as violating_field, 
            cdmtable.* 
        from dataform.note cdmtable
        where cdmtable.note_id in ( 
                  select note_id 
                  from dataform.note
                  group by  1   having count(*) > 1 
           )
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
  ,'isPrimaryKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a duplicate value in the NOTE_NLP_ID field of the NOTE_NLP.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'NOTE_NLP_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_primary_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isprimarykey_note_nlp_note_nlp_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_PRIMARY_KEY
Primary Key - verify that values in fields where isPrimaryKey == Yes are unique
Parameters used in this template:
schema = dataform
cdmTableName = NOTE_NLP
cdmFieldName = NOTE_NLP_ID
**********/
select 
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
            'NOTE_NLP.NOTE_NLP_ID' as violating_field, 
            cdmtable.* 
        from dataform.note_nlp cdmtable
        where cdmtable.note_nlp_id in ( 
                  select note_nlp_id 
                  from dataform.note_nlp
                  group by  1   having count(*) > 1 
           )
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select 
        count(*) as num_rows
    from dataform.note_nlp cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isPrimaryKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a duplicate value in the OBSERVATION_ID field of the OBSERVATION.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_primary_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isprimarykey_observation_observation_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_PRIMARY_KEY
Primary Key - verify that values in fields where isPrimaryKey == Yes are unique
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION
cdmFieldName = OBSERVATION_ID
**********/
select 
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
            'OBSERVATION.OBSERVATION_ID' as violating_field, 
            cdmtable.* 
        from dataform.observation cdmtable
        where cdmtable.observation_id in ( 
                  select observation_id 
                  from dataform.observation
                  group by  1   having count(*) > 1 
           )
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
  ,'isPrimaryKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a duplicate value in the OBSERVATION_PERIOD_ID field of the OBSERVATION_PERIOD.' as check_description
  ,'OBSERVATION_PERIOD' as cdm_table_name
  ,'OBSERVATION_PERIOD_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_primary_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isprimarykey_observation_period_observation_period_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_PRIMARY_KEY
Primary Key - verify that values in fields where isPrimaryKey == Yes are unique
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION_PERIOD
cdmFieldName = OBSERVATION_PERIOD_ID
**********/
select 
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
            'OBSERVATION_PERIOD.OBSERVATION_PERIOD_ID' as violating_field, 
            cdmtable.* 
        from dataform.observation_period cdmtable
        where cdmtable.observation_period_id in ( 
                  select observation_period_id 
                  from dataform.observation_period
                  group by  1   having count(*) > 1 
           )
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
  ,'isPrimaryKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a duplicate value in the PAYER_PLAN_PERIOD_ID field of the PAYER_PLAN_PERIOD.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PAYER_PLAN_PERIOD_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_primary_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isprimarykey_payer_plan_period_payer_plan_period_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_PRIMARY_KEY
Primary Key - verify that values in fields where isPrimaryKey == Yes are unique
Parameters used in this template:
schema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = PAYER_PLAN_PERIOD_ID
**********/
select 
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
            'PAYER_PLAN_PERIOD.PAYER_PLAN_PERIOD_ID' as violating_field, 
            cdmtable.* 
        from dataform.payer_plan_period cdmtable
        where cdmtable.payer_plan_period_id in ( 
                  select payer_plan_period_id 
                  from dataform.payer_plan_period
                  group by  1   having count(*) > 1 
           )
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
  ,'isPrimaryKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a duplicate value in the PERSON_ID field of the PERSON.' as check_description
  ,'PERSON' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_primary_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isprimarykey_person_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_PRIMARY_KEY
Primary Key - verify that values in fields where isPrimaryKey == Yes are unique
Parameters used in this template:
schema = dataform
cdmTableName = PERSON
cdmFieldName = PERSON_ID
**********/
select 
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
            'PERSON.PERSON_ID' as violating_field, 
            cdmtable.* 
        from dataform.person cdmtable
        where cdmtable.person_id in ( 
                  select person_id 
                  from dataform.person
                  group by  1   having count(*) > 1 
           )
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
  ,'isPrimaryKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a duplicate value in the PROCEDURE_OCCURRENCE_ID field of the PROCEDURE_OCCURRENCE.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_primary_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isprimarykey_procedure_occurrence_procedure_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_PRIMARY_KEY
Primary Key - verify that values in fields where isPrimaryKey == Yes are unique
Parameters used in this template:
schema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_OCCURRENCE_ID
**********/
select 
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
            'PROCEDURE_OCCURRENCE.PROCEDURE_OCCURRENCE_ID' as violating_field, 
            cdmtable.* 
        from dataform.procedure_occurrence cdmtable
        where cdmtable.procedure_occurrence_id in ( 
                  select procedure_occurrence_id 
                  from dataform.procedure_occurrence
                  group by  1   having count(*) > 1 
           )
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
  ,'isPrimaryKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a duplicate value in the PROVIDER_ID field of the PROVIDER.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_primary_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isprimarykey_provider_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_PRIMARY_KEY
Primary Key - verify that values in fields where isPrimaryKey == Yes are unique
Parameters used in this template:
schema = dataform
cdmTableName = PROVIDER
cdmFieldName = PROVIDER_ID
**********/
select 
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
            'PROVIDER.PROVIDER_ID' as violating_field, 
            cdmtable.* 
        from dataform.provider cdmtable
        where cdmtable.provider_id in ( 
                  select provider_id 
                  from dataform.provider
                  group by  1   having count(*) > 1 
           )
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select 
        count(*) as num_rows
    from dataform.provider cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isPrimaryKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a duplicate value in the RELATIONSHIP_ID field of the RELATIONSHIP.' as check_description
  ,'RELATIONSHIP' as cdm_table_name
  ,'RELATIONSHIP_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_primary_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isprimarykey_relationship_relationship_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_PRIMARY_KEY
Primary Key - verify that values in fields where isPrimaryKey == Yes are unique
Parameters used in this template:
schema = dataform
cdmTableName = RELATIONSHIP
cdmFieldName = RELATIONSHIP_ID
**********/
select 
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
            'RELATIONSHIP.RELATIONSHIP_ID' as violating_field, 
            cdmtable.* 
        from dataform.relationship cdmtable
        where cdmtable.relationship_id in ( 
                  select relationship_id 
                  from dataform.relationship
                  group by  1   having count(*) > 1 
           )
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select 
        count(*) as num_rows
    from dataform.relationship cdmtable
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'isPrimaryKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a duplicate value in the SPECIMEN_ID field of the SPECIMEN.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'SPECIMEN_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_primary_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isprimarykey_specimen_specimen_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_PRIMARY_KEY
Primary Key - verify that values in fields where isPrimaryKey == Yes are unique
Parameters used in this template:
schema = dataform
cdmTableName = SPECIMEN
cdmFieldName = SPECIMEN_ID
**********/
select 
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
            'SPECIMEN.SPECIMEN_ID' as violating_field, 
            cdmtable.* 
        from dataform.specimen cdmtable
        where cdmtable.specimen_id in ( 
                  select specimen_id 
                  from dataform.specimen
                  group by  1   having count(*) > 1 
           )
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
  ,'isPrimaryKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a duplicate value in the VISIT_DETAIL_ID field of the VISIT_DETAIL.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_primary_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isprimarykey_visit_detail_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_PRIMARY_KEY
Primary Key - verify that values in fields where isPrimaryKey == Yes are unique
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_DETAIL_ID
**********/
select 
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
            'VISIT_DETAIL.VISIT_DETAIL_ID' as violating_field, 
            cdmtable.* 
        from dataform.visit_detail cdmtable
        where cdmtable.visit_detail_id in ( 
                  select visit_detail_id 
                  from dataform.visit_detail
                  group by  1   having count(*) > 1 
           )
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
  ,'isPrimaryKey' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records that have a duplicate value in the VISIT_OCCURRENCE_ID field of the VISIT_OCCURRENCE.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_primary_key.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'field_isprimarykey_visit_occurrence_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_PRIMARY_KEY
Primary Key - verify that values in fields where isPrimaryKey == Yes are unique
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = VISIT_OCCURRENCE_ID
**********/
select 
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
            'VISIT_OCCURRENCE.VISIT_OCCURRENCE_ID' as violating_field, 
            cdmtable.* 
        from dataform.visit_occurrence cdmtable
        where cdmtable.visit_occurrence_id in ( 
                  select visit_occurrence_id 
                  from dataform.visit_occurrence
                  group by  1   having count(*) > 1 
           )
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

