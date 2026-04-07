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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CARE_SITE_ID of the CARE_SITE that is considered not nullable.' as check_description
  ,'CARE_SITE' as cdm_table_name
  ,'CARE_SITE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_care_site_care_site_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'CARE_SITE.CARE_SITE_ID' as violating_field, 
            cdmtable.* 
        from dataform.care_site cdmtable
        where cdmtable.care_site_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CDM_HOLDER of the CDM_SOURCE that is considered not nullable.' as check_description
  ,'CDM_SOURCE' as cdm_table_name
  ,'CDM_HOLDER' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_cdm_source_cdm_holder' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = CDM_SOURCE
cdmFieldName = CDM_HOLDER
**********/
select 
    num_violated_rows, 
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
            'CDM_SOURCE.CDM_HOLDER' as violating_field, 
            cdmtable.* 
        from dataform.cdm_source cdmtable
        where cdmtable.cdm_holder is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CDM_RELEASE_DATE of the CDM_SOURCE that is considered not nullable.' as check_description
  ,'CDM_SOURCE' as cdm_table_name
  ,'CDM_RELEASE_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_cdm_source_cdm_release_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = CDM_SOURCE
cdmFieldName = CDM_RELEASE_DATE
**********/
select 
    num_violated_rows, 
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
            'CDM_SOURCE.CDM_RELEASE_DATE' as violating_field, 
            cdmtable.* 
        from dataform.cdm_source cdmtable
        where cdmtable.cdm_release_date is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CDM_SOURCE_ABBREVIATION of the CDM_SOURCE that is considered not nullable.' as check_description
  ,'CDM_SOURCE' as cdm_table_name
  ,'CDM_SOURCE_ABBREVIATION' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_cdm_source_cdm_source_abbreviation' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = CDM_SOURCE
cdmFieldName = CDM_SOURCE_ABBREVIATION
**********/
select 
    num_violated_rows, 
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
            'CDM_SOURCE.CDM_SOURCE_ABBREVIATION' as violating_field, 
            cdmtable.* 
        from dataform.cdm_source cdmtable
        where cdmtable.cdm_source_abbreviation is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CDM_SOURCE_NAME of the CDM_SOURCE that is considered not nullable.' as check_description
  ,'CDM_SOURCE' as cdm_table_name
  ,'CDM_SOURCE_NAME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_cdm_source_cdm_source_name' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = CDM_SOURCE
cdmFieldName = CDM_SOURCE_NAME
**********/
select 
    num_violated_rows, 
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
            'CDM_SOURCE.CDM_SOURCE_NAME' as violating_field, 
            cdmtable.* 
        from dataform.cdm_source cdmtable
        where cdmtable.cdm_source_name is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CDM_VERSION_CONCEPT_ID of the CDM_SOURCE that is considered not nullable.' as check_description
  ,'CDM_SOURCE' as cdm_table_name
  ,'CDM_VERSION_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_cdm_source_cdm_version_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = CDM_SOURCE
cdmFieldName = CDM_VERSION_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'CDM_SOURCE.CDM_VERSION_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.cdm_source cdmtable
        where cdmtable.cdm_version_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the SOURCE_RELEASE_DATE of the CDM_SOURCE that is considered not nullable.' as check_description
  ,'CDM_SOURCE' as cdm_table_name
  ,'SOURCE_RELEASE_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_cdm_source_source_release_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = CDM_SOURCE
cdmFieldName = SOURCE_RELEASE_DATE
**********/
select 
    num_violated_rows, 
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
            'CDM_SOURCE.SOURCE_RELEASE_DATE' as violating_field, 
            cdmtable.* 
        from dataform.cdm_source cdmtable
        where cdmtable.source_release_date is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VOCABULARY_VERSION of the CDM_SOURCE that is considered not nullable.' as check_description
  ,'CDM_SOURCE' as cdm_table_name
  ,'VOCABULARY_VERSION' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_cdm_source_vocabulary_version' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = CDM_SOURCE
cdmFieldName = VOCABULARY_VERSION
**********/
select 
    num_violated_rows, 
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
            'CDM_SOURCE.VOCABULARY_VERSION' as violating_field, 
            cdmtable.* 
        from dataform.cdm_source cdmtable
        where cdmtable.vocabulary_version is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the COHORT_DEFINITION_ID of the COHORT that is considered not nullable.' as check_description
  ,'COHORT' as cdm_table_name
  ,'COHORT_DEFINITION_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_cohort_cohort_definition_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = COHORT
cdmFieldName = COHORT_DEFINITION_ID
**********/
select 
    num_violated_rows, 
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
            'COHORT.COHORT_DEFINITION_ID' as violating_field, 
            cdmtable.* 
        from dataform.cohort cdmtable
        where cdmtable.cohort_definition_id is null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select 
        count(*) as num_rows
    from dataform.cohort cdmtable
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the COHORT_END_DATE of the COHORT that is considered not nullable.' as check_description
  ,'COHORT' as cdm_table_name
  ,'COHORT_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_cohort_cohort_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = COHORT
cdmFieldName = COHORT_END_DATE
**********/
select 
    num_violated_rows, 
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
            'COHORT.COHORT_END_DATE' as violating_field, 
            cdmtable.* 
        from dataform.cohort cdmtable
        where cdmtable.cohort_end_date is null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select 
        count(*) as num_rows
    from dataform.cohort cdmtable
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the COHORT_START_DATE of the COHORT that is considered not nullable.' as check_description
  ,'COHORT' as cdm_table_name
  ,'COHORT_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_cohort_cohort_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = COHORT
cdmFieldName = COHORT_START_DATE
**********/
select 
    num_violated_rows, 
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
            'COHORT.COHORT_START_DATE' as violating_field, 
            cdmtable.* 
        from dataform.cohort cdmtable
        where cdmtable.cohort_start_date is null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select 
        count(*) as num_rows
    from dataform.cohort cdmtable
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the SUBJECT_ID of the COHORT that is considered not nullable.' as check_description
  ,'COHORT' as cdm_table_name
  ,'SUBJECT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_cohort_subject_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = COHORT
cdmFieldName = SUBJECT_ID
**********/
select 
    num_violated_rows, 
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
            'COHORT.SUBJECT_ID' as violating_field, 
            cdmtable.* 
        from dataform.cohort cdmtable
        where cdmtable.subject_id is null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select 
        count(*) as num_rows
    from dataform.cohort cdmtable
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the COHORT_DEFINITION_ID of the COHORT_DEFINITION that is considered not nullable.' as check_description
  ,'COHORT_DEFINITION' as cdm_table_name
  ,'COHORT_DEFINITION_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_cohort_definition_cohort_definition_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = COHORT_DEFINITION
cdmFieldName = COHORT_DEFINITION_ID
**********/
select 
    num_violated_rows, 
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
            'COHORT_DEFINITION.COHORT_DEFINITION_ID' as violating_field, 
            cdmtable.* 
        from dataform.cohort_definition cdmtable
        where cdmtable.cohort_definition_id is null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select 
        count(*) as num_rows
    from dataform.cohort_definition cdmtable
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the COHORT_DEFINITION_NAME of the COHORT_DEFINITION that is considered not nullable.' as check_description
  ,'COHORT_DEFINITION' as cdm_table_name
  ,'COHORT_DEFINITION_NAME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_cohort_definition_cohort_definition_name' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = COHORT_DEFINITION
cdmFieldName = COHORT_DEFINITION_NAME
**********/
select 
    num_violated_rows, 
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
            'COHORT_DEFINITION.COHORT_DEFINITION_NAME' as violating_field, 
            cdmtable.* 
        from dataform.cohort_definition cdmtable
        where cdmtable.cohort_definition_name is null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select 
        count(*) as num_rows
    from dataform.cohort_definition cdmtable
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DEFINITION_TYPE_CONCEPT_ID of the COHORT_DEFINITION that is considered not nullable.' as check_description
  ,'COHORT_DEFINITION' as cdm_table_name
  ,'DEFINITION_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_cohort_definition_definition_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = COHORT_DEFINITION
cdmFieldName = DEFINITION_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'COHORT_DEFINITION.DEFINITION_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.cohort_definition cdmtable
        where cdmtable.definition_type_concept_id is null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select 
        count(*) as num_rows
    from dataform.cohort_definition cdmtable
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the SUBJECT_CONCEPT_ID of the COHORT_DEFINITION that is considered not nullable.' as check_description
  ,'COHORT_DEFINITION' as cdm_table_name
  ,'SUBJECT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_cohort_definition_subject_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = COHORT_DEFINITION
cdmFieldName = SUBJECT_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'COHORT_DEFINITION.SUBJECT_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.cohort_definition cdmtable
        where cdmtable.subject_concept_id is null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select 
        count(*) as num_rows
    from dataform.cohort_definition cdmtable
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CONCEPT_ID of the CONCEPT_SYNONYM that is considered not nullable.' as check_description
  ,'CONCEPT_SYNONYM' as cdm_table_name
  ,'CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_concept_synonym_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = CONCEPT_SYNONYM
cdmFieldName = CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'CONCEPT_SYNONYM.CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.concept_synonym cdmtable
        where cdmtable.concept_id is null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select 
        count(*) as num_rows
    from dataform.concept_synonym cdmtable
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CONCEPT_SYNONYM_NAME of the CONCEPT_SYNONYM that is considered not nullable.' as check_description
  ,'CONCEPT_SYNONYM' as cdm_table_name
  ,'CONCEPT_SYNONYM_NAME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_concept_synonym_concept_synonym_name' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = CONCEPT_SYNONYM
cdmFieldName = CONCEPT_SYNONYM_NAME
**********/
select 
    num_violated_rows, 
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
            'CONCEPT_SYNONYM.CONCEPT_SYNONYM_NAME' as violating_field, 
            cdmtable.* 
        from dataform.concept_synonym cdmtable
        where cdmtable.concept_synonym_name is null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select 
        count(*) as num_rows
    from dataform.concept_synonym cdmtable
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the LANGUAGE_CONCEPT_ID of the CONCEPT_SYNONYM that is considered not nullable.' as check_description
  ,'CONCEPT_SYNONYM' as cdm_table_name
  ,'LANGUAGE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_concept_synonym_language_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = CONCEPT_SYNONYM
cdmFieldName = LANGUAGE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'CONCEPT_SYNONYM.LANGUAGE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.concept_synonym cdmtable
        where cdmtable.language_concept_id is null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select 
        count(*) as num_rows
    from dataform.concept_synonym cdmtable
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CONDITION_CONCEPT_ID of the CONDITION_ERA that is considered not nullable.' as check_description
  ,'CONDITION_ERA' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_condition_era_condition_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_ERA
cdmFieldName = CONDITION_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'CONDITION_ERA.CONDITION_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.condition_era cdmtable
        where cdmtable.condition_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CONDITION_ERA_END_DATE of the CONDITION_ERA that is considered not nullable.' as check_description
  ,'CONDITION_ERA' as cdm_table_name
  ,'CONDITION_ERA_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_condition_era_condition_era_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'CONDITION_ERA.CONDITION_ERA_END_DATE' as violating_field, 
            cdmtable.* 
        from dataform.condition_era cdmtable
        where cdmtable.condition_era_end_date is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CONDITION_ERA_ID of the CONDITION_ERA that is considered not nullable.' as check_description
  ,'CONDITION_ERA' as cdm_table_name
  ,'CONDITION_ERA_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_condition_era_condition_era_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'CONDITION_ERA.CONDITION_ERA_ID' as violating_field, 
            cdmtable.* 
        from dataform.condition_era cdmtable
        where cdmtable.condition_era_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CONDITION_ERA_START_DATE of the CONDITION_ERA that is considered not nullable.' as check_description
  ,'CONDITION_ERA' as cdm_table_name
  ,'CONDITION_ERA_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_condition_era_condition_era_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'CONDITION_ERA.CONDITION_ERA_START_DATE' as violating_field, 
            cdmtable.* 
        from dataform.condition_era cdmtable
        where cdmtable.condition_era_start_date is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERSON_ID of the CONDITION_ERA that is considered not nullable.' as check_description
  ,'CONDITION_ERA' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_condition_era_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_ERA
cdmFieldName = PERSON_ID
**********/
select 
    num_violated_rows, 
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
            'CONDITION_ERA.PERSON_ID' as violating_field, 
            cdmtable.* 
        from dataform.condition_era cdmtable
        where cdmtable.person_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CONDITION_CONCEPT_ID of the CONDITION_OCCURRENCE that is considered not nullable.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_condition_occurrence_condition_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'CONDITION_OCCURRENCE.CONDITION_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.condition_occurrence cdmtable
        where cdmtable.condition_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CONDITION_OCCURRENCE_ID of the CONDITION_OCCURRENCE that is considered not nullable.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_condition_occurrence_condition_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'CONDITION_OCCURRENCE.CONDITION_OCCURRENCE_ID' as violating_field, 
            cdmtable.* 
        from dataform.condition_occurrence cdmtable
        where cdmtable.condition_occurrence_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CONDITION_START_DATE of the CONDITION_OCCURRENCE that is considered not nullable.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_condition_occurrence_condition_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'CONDITION_OCCURRENCE.CONDITION_START_DATE' as violating_field, 
            cdmtable.* 
        from dataform.condition_occurrence cdmtable
        where cdmtable.condition_start_date is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the CONDITION_TYPE_CONCEPT_ID of the CONDITION_OCCURRENCE that is considered not nullable.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'CONDITION_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_condition_occurrence_condition_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = CONDITION_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'CONDITION_OCCURRENCE.CONDITION_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.condition_occurrence cdmtable
        where cdmtable.condition_type_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERSON_ID of the CONDITION_OCCURRENCE that is considered not nullable.' as check_description
  ,'CONDITION_OCCURRENCE' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_condition_occurrence_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = CONDITION_OCCURRENCE
cdmFieldName = PERSON_ID
**********/
select 
    num_violated_rows, 
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
            'CONDITION_OCCURRENCE.PERSON_ID' as violating_field, 
            cdmtable.* 
        from dataform.condition_occurrence cdmtable
        where cdmtable.person_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the COST_DOMAIN_ID of the COST that is considered not nullable.' as check_description
  ,'COST' as cdm_table_name
  ,'COST_DOMAIN_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_cost_cost_domain_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = COST
cdmFieldName = COST_DOMAIN_ID
**********/
select 
    num_violated_rows, 
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
            'COST.COST_DOMAIN_ID' as violating_field, 
            cdmtable.* 
        from dataform.cost cdmtable
        where cdmtable.cost_domain_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the COST_EVENT_ID of the COST that is considered not nullable.' as check_description
  ,'COST' as cdm_table_name
  ,'COST_EVENT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_cost_cost_event_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = COST
cdmFieldName = COST_EVENT_ID
**********/
select 
    num_violated_rows, 
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
            'COST.COST_EVENT_ID' as violating_field, 
            cdmtable.* 
        from dataform.cost cdmtable
        where cdmtable.cost_event_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the COST_ID of the COST that is considered not nullable.' as check_description
  ,'COST' as cdm_table_name
  ,'COST_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_cost_cost_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'COST.COST_ID' as violating_field, 
            cdmtable.* 
        from dataform.cost cdmtable
        where cdmtable.cost_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the COST_TYPE_CONCEPT_ID of the COST that is considered not nullable.' as check_description
  ,'COST' as cdm_table_name
  ,'COST_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_cost_cost_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = COST
cdmFieldName = COST_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'COST.COST_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.cost cdmtable
        where cdmtable.cost_type_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DEATH_DATE of the DEATH that is considered not nullable.' as check_description
  ,'DEATH' as cdm_table_name
  ,'DEATH_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_death_death_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = DEATH
cdmFieldName = DEATH_DATE
**********/
select 
    num_violated_rows, 
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
            'DEATH.DEATH_DATE' as violating_field, 
            cdmtable.* 
        from dataform.death cdmtable
        where cdmtable.death_date is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERSON_ID of the DEATH that is considered not nullable.' as check_description
  ,'DEATH' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_death_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = DEATH
cdmFieldName = PERSON_ID
**********/
select 
    num_violated_rows, 
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
            'DEATH.PERSON_ID' as violating_field, 
            cdmtable.* 
        from dataform.death cdmtable
        where cdmtable.person_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DEVICE_CONCEPT_ID of the DEVICE_EXPOSURE that is considered not nullable.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_device_exposure_device_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = DEVICE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'DEVICE_EXPOSURE.DEVICE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.device_exposure cdmtable
        where cdmtable.device_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DEVICE_EXPOSURE_ID of the DEVICE_EXPOSURE that is considered not nullable.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_EXPOSURE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_device_exposure_device_exposure_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'DEVICE_EXPOSURE.DEVICE_EXPOSURE_ID' as violating_field, 
            cdmtable.* 
        from dataform.device_exposure cdmtable
        where cdmtable.device_exposure_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DEVICE_EXPOSURE_START_DATE of the DEVICE_EXPOSURE that is considered not nullable.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_EXPOSURE_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_device_exposure_device_exposure_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'DEVICE_EXPOSURE.DEVICE_EXPOSURE_START_DATE' as violating_field, 
            cdmtable.* 
        from dataform.device_exposure cdmtable
        where cdmtable.device_exposure_start_date is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DEVICE_TYPE_CONCEPT_ID of the DEVICE_EXPOSURE that is considered not nullable.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'DEVICE_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_device_exposure_device_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = DEVICE_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'DEVICE_EXPOSURE.DEVICE_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.device_exposure cdmtable
        where cdmtable.device_type_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERSON_ID of the DEVICE_EXPOSURE that is considered not nullable.' as check_description
  ,'DEVICE_EXPOSURE' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_device_exposure_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = DEVICE_EXPOSURE
cdmFieldName = PERSON_ID
**********/
select 
    num_violated_rows, 
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
            'DEVICE_EXPOSURE.PERSON_ID' as violating_field, 
            cdmtable.* 
        from dataform.device_exposure cdmtable
        where cdmtable.person_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DOMAIN_CONCEPT_ID of the DOMAIN that is considered not nullable.' as check_description
  ,'DOMAIN' as cdm_table_name
  ,'DOMAIN_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_domain_domain_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = DOMAIN
cdmFieldName = DOMAIN_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'DOMAIN.DOMAIN_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.domain cdmtable
        where cdmtable.domain_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DOMAIN_ID of the DOMAIN that is considered not nullable.' as check_description
  ,'DOMAIN' as cdm_table_name
  ,'DOMAIN_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_domain_domain_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'DOMAIN.DOMAIN_ID' as violating_field, 
            cdmtable.* 
        from dataform.domain cdmtable
        where cdmtable.domain_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DOMAIN_NAME of the DOMAIN that is considered not nullable.' as check_description
  ,'DOMAIN' as cdm_table_name
  ,'DOMAIN_NAME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_domain_domain_name' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = DOMAIN
cdmFieldName = DOMAIN_NAME
**********/
select 
    num_violated_rows, 
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
            'DOMAIN.DOMAIN_NAME' as violating_field, 
            cdmtable.* 
        from dataform.domain cdmtable
        where cdmtable.domain_name is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DOSE_ERA_END_DATE of the DOSE_ERA that is considered not nullable.' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'DOSE_ERA_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_dose_era_dose_era_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'DOSE_ERA.DOSE_ERA_END_DATE' as violating_field, 
            cdmtable.* 
        from dataform.dose_era cdmtable
        where cdmtable.dose_era_end_date is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DOSE_ERA_ID of the DOSE_ERA that is considered not nullable.' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'DOSE_ERA_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_dose_era_dose_era_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'DOSE_ERA.DOSE_ERA_ID' as violating_field, 
            cdmtable.* 
        from dataform.dose_era cdmtable
        where cdmtable.dose_era_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DOSE_ERA_START_DATE of the DOSE_ERA that is considered not nullable.' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'DOSE_ERA_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_dose_era_dose_era_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'DOSE_ERA.DOSE_ERA_START_DATE' as violating_field, 
            cdmtable.* 
        from dataform.dose_era cdmtable
        where cdmtable.dose_era_start_date is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DOSE_VALUE of the DOSE_ERA that is considered not nullable.' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'DOSE_VALUE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_dose_era_dose_value' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = DOSE_ERA
cdmFieldName = DOSE_VALUE
**********/
select 
    num_violated_rows, 
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
            'DOSE_ERA.DOSE_VALUE' as violating_field, 
            cdmtable.* 
        from dataform.dose_era cdmtable
        where cdmtable.dose_value is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DRUG_CONCEPT_ID of the DOSE_ERA that is considered not nullable.' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'DRUG_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_dose_era_drug_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = DOSE_ERA
cdmFieldName = DRUG_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'DOSE_ERA.DRUG_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.dose_era cdmtable
        where cdmtable.drug_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERSON_ID of the DOSE_ERA that is considered not nullable.' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_dose_era_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = DOSE_ERA
cdmFieldName = PERSON_ID
**********/
select 
    num_violated_rows, 
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
            'DOSE_ERA.PERSON_ID' as violating_field, 
            cdmtable.* 
        from dataform.dose_era cdmtable
        where cdmtable.person_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the UNIT_CONCEPT_ID of the DOSE_ERA that is considered not nullable.' as check_description
  ,'DOSE_ERA' as cdm_table_name
  ,'UNIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_dose_era_unit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = DOSE_ERA
cdmFieldName = UNIT_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'DOSE_ERA.UNIT_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.dose_era cdmtable
        where cdmtable.unit_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DRUG_CONCEPT_ID of the DRUG_ERA that is considered not nullable.' as check_description
  ,'DRUG_ERA' as cdm_table_name
  ,'DRUG_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_drug_era_drug_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_ERA
cdmFieldName = DRUG_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'DRUG_ERA.DRUG_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.drug_era cdmtable
        where cdmtable.drug_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DRUG_ERA_END_DATE of the DRUG_ERA that is considered not nullable.' as check_description
  ,'DRUG_ERA' as cdm_table_name
  ,'DRUG_ERA_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_drug_era_drug_era_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'DRUG_ERA.DRUG_ERA_END_DATE' as violating_field, 
            cdmtable.* 
        from dataform.drug_era cdmtable
        where cdmtable.drug_era_end_date is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DRUG_ERA_ID of the DRUG_ERA that is considered not nullable.' as check_description
  ,'DRUG_ERA' as cdm_table_name
  ,'DRUG_ERA_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_drug_era_drug_era_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'DRUG_ERA.DRUG_ERA_ID' as violating_field, 
            cdmtable.* 
        from dataform.drug_era cdmtable
        where cdmtable.drug_era_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DRUG_ERA_START_DATE of the DRUG_ERA that is considered not nullable.' as check_description
  ,'DRUG_ERA' as cdm_table_name
  ,'DRUG_ERA_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_drug_era_drug_era_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'DRUG_ERA.DRUG_ERA_START_DATE' as violating_field, 
            cdmtable.* 
        from dataform.drug_era cdmtable
        where cdmtable.drug_era_start_date is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERSON_ID of the DRUG_ERA that is considered not nullable.' as check_description
  ,'DRUG_ERA' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_drug_era_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_ERA
cdmFieldName = PERSON_ID
**********/
select 
    num_violated_rows, 
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
            'DRUG_ERA.PERSON_ID' as violating_field, 
            cdmtable.* 
        from dataform.drug_era cdmtable
        where cdmtable.person_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DRUG_CONCEPT_ID of the DRUG_EXPOSURE that is considered not nullable.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_drug_exposure_drug_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DRUG_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'DRUG_EXPOSURE.DRUG_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.drug_exposure cdmtable
        where cdmtable.drug_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DRUG_EXPOSURE_END_DATE of the DRUG_EXPOSURE that is considered not nullable.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_EXPOSURE_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_drug_exposure_drug_exposure_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'DRUG_EXPOSURE.DRUG_EXPOSURE_END_DATE' as violating_field, 
            cdmtable.* 
        from dataform.drug_exposure cdmtable
        where cdmtable.drug_exposure_end_date is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DRUG_EXPOSURE_ID of the DRUG_EXPOSURE that is considered not nullable.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_EXPOSURE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_drug_exposure_drug_exposure_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'DRUG_EXPOSURE.DRUG_EXPOSURE_ID' as violating_field, 
            cdmtable.* 
        from dataform.drug_exposure cdmtable
        where cdmtable.drug_exposure_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DRUG_EXPOSURE_START_DATE of the DRUG_EXPOSURE that is considered not nullable.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_EXPOSURE_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_drug_exposure_drug_exposure_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'DRUG_EXPOSURE.DRUG_EXPOSURE_START_DATE' as violating_field, 
            cdmtable.* 
        from dataform.drug_exposure cdmtable
        where cdmtable.drug_exposure_start_date is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DRUG_TYPE_CONCEPT_ID of the DRUG_EXPOSURE that is considered not nullable.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'DRUG_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_drug_exposure_drug_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = DRUG_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'DRUG_EXPOSURE.DRUG_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.drug_exposure cdmtable
        where cdmtable.drug_type_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERSON_ID of the DRUG_EXPOSURE that is considered not nullable.' as check_description
  ,'DRUG_EXPOSURE' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_drug_exposure_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_EXPOSURE
cdmFieldName = PERSON_ID
**********/
select 
    num_violated_rows, 
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
            'DRUG_EXPOSURE.PERSON_ID' as violating_field, 
            cdmtable.* 
        from dataform.drug_exposure cdmtable
        where cdmtable.person_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DRUG_CONCEPT_ID of the DRUG_STRENGTH that is considered not nullable.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'DRUG_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_drug_strength_drug_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_STRENGTH
cdmFieldName = DRUG_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'DRUG_STRENGTH.DRUG_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.drug_strength cdmtable
        where cdmtable.drug_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the INGREDIENT_CONCEPT_ID of the DRUG_STRENGTH that is considered not nullable.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'INGREDIENT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_drug_strength_ingredient_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_STRENGTH
cdmFieldName = INGREDIENT_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'DRUG_STRENGTH.INGREDIENT_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.drug_strength cdmtable
        where cdmtable.ingredient_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VALID_END_DATE of the DRUG_STRENGTH that is considered not nullable.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'VALID_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_drug_strength_valid_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_STRENGTH
cdmFieldName = VALID_END_DATE
**********/
select 
    num_violated_rows, 
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
            'DRUG_STRENGTH.VALID_END_DATE' as violating_field, 
            cdmtable.* 
        from dataform.drug_strength cdmtable
        where cdmtable.valid_end_date is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VALID_START_DATE of the DRUG_STRENGTH that is considered not nullable.' as check_description
  ,'DRUG_STRENGTH' as cdm_table_name
  ,'VALID_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_drug_strength_valid_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = DRUG_STRENGTH
cdmFieldName = VALID_START_DATE
**********/
select 
    num_violated_rows, 
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
            'DRUG_STRENGTH.VALID_START_DATE' as violating_field, 
            cdmtable.* 
        from dataform.drug_strength cdmtable
        where cdmtable.valid_start_date is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the EPISODE_CONCEPT_ID of the EPISODE that is considered not nullable.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_episode_episode_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'EPISODE.EPISODE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.episode cdmtable
        where cdmtable.episode_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the EPISODE_ID of the EPISODE that is considered not nullable.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_episode_episode_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'EPISODE.EPISODE_ID' as violating_field, 
            cdmtable.* 
        from dataform.episode cdmtable
        where cdmtable.episode_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the EPISODE_OBJECT_CONCEPT_ID of the EPISODE that is considered not nullable.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_OBJECT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_episode_episode_object_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_OBJECT_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'EPISODE.EPISODE_OBJECT_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.episode cdmtable
        where cdmtable.episode_object_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the EPISODE_START_DATE of the EPISODE that is considered not nullable.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_episode_episode_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'EPISODE.EPISODE_START_DATE' as violating_field, 
            cdmtable.* 
        from dataform.episode cdmtable
        where cdmtable.episode_start_date is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the EPISODE_TYPE_CONCEPT_ID of the EPISODE that is considered not nullable.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'EPISODE_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_episode_episode_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = EPISODE
cdmFieldName = EPISODE_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'EPISODE.EPISODE_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.episode cdmtable
        where cdmtable.episode_type_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERSON_ID of the EPISODE that is considered not nullable.' as check_description
  ,'EPISODE' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_episode_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = EPISODE
cdmFieldName = PERSON_ID
**********/
select 
    num_violated_rows, 
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
            'EPISODE.PERSON_ID' as violating_field, 
            cdmtable.* 
        from dataform.episode cdmtable
        where cdmtable.person_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the EPISODE_EVENT_FIELD_CONCEPT_ID of the EPISODE_EVENT that is considered not nullable.' as check_description
  ,'EPISODE_EVENT' as cdm_table_name
  ,'EPISODE_EVENT_FIELD_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_episode_event_episode_event_field_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = EPISODE_EVENT
cdmFieldName = EPISODE_EVENT_FIELD_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'EPISODE_EVENT.EPISODE_EVENT_FIELD_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.episode_event cdmtable
        where cdmtable.episode_event_field_concept_id is null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select 
        count(*) as num_rows
    from dataform.episode_event cdmtable
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the EPISODE_ID of the EPISODE_EVENT that is considered not nullable.' as check_description
  ,'EPISODE_EVENT' as cdm_table_name
  ,'EPISODE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_episode_event_episode_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = EPISODE_EVENT
cdmFieldName = EPISODE_ID
**********/
select 
    num_violated_rows, 
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
            'EPISODE_EVENT.EPISODE_ID' as violating_field, 
            cdmtable.* 
        from dataform.episode_event cdmtable
        where cdmtable.episode_id is null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select 
        count(*) as num_rows
    from dataform.episode_event cdmtable
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the EVENT_ID of the EPISODE_EVENT that is considered not nullable.' as check_description
  ,'EPISODE_EVENT' as cdm_table_name
  ,'EVENT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_episode_event_event_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = EPISODE_EVENT
cdmFieldName = EVENT_ID
**********/
select 
    num_violated_rows, 
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
            'EPISODE_EVENT.EVENT_ID' as violating_field, 
            cdmtable.* 
        from dataform.episode_event cdmtable
        where cdmtable.event_id is null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select 
        count(*) as num_rows
    from dataform.episode_event cdmtable
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DOMAIN_CONCEPT_ID_1 of the FACT_RELATIONSHIP that is considered not nullable.' as check_description
  ,'FACT_RELATIONSHIP' as cdm_table_name
  ,'DOMAIN_CONCEPT_ID_1' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_fact_relationship_domain_concept_id_1' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = FACT_RELATIONSHIP
cdmFieldName = DOMAIN_CONCEPT_ID_1
**********/
select 
    num_violated_rows, 
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
            'FACT_RELATIONSHIP.DOMAIN_CONCEPT_ID_1' as violating_field, 
            cdmtable.* 
        from dataform.fact_relationship cdmtable
        where cdmtable.domain_concept_id_1 is null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select 
        count(*) as num_rows
    from dataform.fact_relationship cdmtable
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DOMAIN_CONCEPT_ID_2 of the FACT_RELATIONSHIP that is considered not nullable.' as check_description
  ,'FACT_RELATIONSHIP' as cdm_table_name
  ,'DOMAIN_CONCEPT_ID_2' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_fact_relationship_domain_concept_id_2' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = FACT_RELATIONSHIP
cdmFieldName = DOMAIN_CONCEPT_ID_2
**********/
select 
    num_violated_rows, 
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
            'FACT_RELATIONSHIP.DOMAIN_CONCEPT_ID_2' as violating_field, 
            cdmtable.* 
        from dataform.fact_relationship cdmtable
        where cdmtable.domain_concept_id_2 is null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select 
        count(*) as num_rows
    from dataform.fact_relationship cdmtable
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the FACT_ID_1 of the FACT_RELATIONSHIP that is considered not nullable.' as check_description
  ,'FACT_RELATIONSHIP' as cdm_table_name
  ,'FACT_ID_1' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_fact_relationship_fact_id_1' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = FACT_RELATIONSHIP
cdmFieldName = FACT_ID_1
**********/
select 
    num_violated_rows, 
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
            'FACT_RELATIONSHIP.FACT_ID_1' as violating_field, 
            cdmtable.* 
        from dataform.fact_relationship cdmtable
        where cdmtable.fact_id_1 is null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select 
        count(*) as num_rows
    from dataform.fact_relationship cdmtable
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the FACT_ID_2 of the FACT_RELATIONSHIP that is considered not nullable.' as check_description
  ,'FACT_RELATIONSHIP' as cdm_table_name
  ,'FACT_ID_2' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_fact_relationship_fact_id_2' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = FACT_RELATIONSHIP
cdmFieldName = FACT_ID_2
**********/
select 
    num_violated_rows, 
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
            'FACT_RELATIONSHIP.FACT_ID_2' as violating_field, 
            cdmtable.* 
        from dataform.fact_relationship cdmtable
        where cdmtable.fact_id_2 is null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select 
        count(*) as num_rows
    from dataform.fact_relationship cdmtable
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the RELATIONSHIP_CONCEPT_ID of the FACT_RELATIONSHIP that is considered not nullable.' as check_description
  ,'FACT_RELATIONSHIP' as cdm_table_name
  ,'RELATIONSHIP_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_fact_relationship_relationship_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = FACT_RELATIONSHIP
cdmFieldName = RELATIONSHIP_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'FACT_RELATIONSHIP.RELATIONSHIP_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.fact_relationship cdmtable
        where cdmtable.relationship_concept_id is null
        /*violatedRowsEnd*/
    ) violated_rows
) violated_row_count,
( 
    select 
        count(*) as num_rows
    from dataform.fact_relationship cdmtable
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the LOCATION_ID of the LOCATION that is considered not nullable.' as check_description
  ,'LOCATION' as cdm_table_name
  ,'LOCATION_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_location_location_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'LOCATION.LOCATION_ID' as violating_field, 
            cdmtable.* 
        from dataform.location cdmtable
        where cdmtable.location_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the MEASUREMENT_CONCEPT_ID of the MEASUREMENT that is considered not nullable.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_measurement_measurement_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'MEASUREMENT.MEASUREMENT_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.measurement cdmtable
        where cdmtable.measurement_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the MEASUREMENT_DATE of the MEASUREMENT that is considered not nullable.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_measurement_measurement_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'MEASUREMENT.MEASUREMENT_DATE' as violating_field, 
            cdmtable.* 
        from dataform.measurement cdmtable
        where cdmtable.measurement_date is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the MEASUREMENT_ID of the MEASUREMENT that is considered not nullable.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_measurement_measurement_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'MEASUREMENT.MEASUREMENT_ID' as violating_field, 
            cdmtable.* 
        from dataform.measurement cdmtable
        where cdmtable.measurement_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the MEASUREMENT_TYPE_CONCEPT_ID of the MEASUREMENT that is considered not nullable.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_measurement_measurement_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'MEASUREMENT.MEASUREMENT_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.measurement cdmtable
        where cdmtable.measurement_type_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERSON_ID of the MEASUREMENT that is considered not nullable.' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_measurement_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = PERSON_ID
**********/
select 
    num_violated_rows, 
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
            'MEASUREMENT.PERSON_ID' as violating_field, 
            cdmtable.* 
        from dataform.measurement cdmtable
        where cdmtable.person_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the METADATA_CONCEPT_ID of the METADATA that is considered not nullable.' as check_description
  ,'METADATA' as cdm_table_name
  ,'METADATA_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_metadata_metadata_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = METADATA
cdmFieldName = METADATA_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'METADATA.METADATA_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.metadata cdmtable
        where cdmtable.metadata_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the METADATA_ID of the METADATA that is considered not nullable.' as check_description
  ,'METADATA' as cdm_table_name
  ,'METADATA_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_metadata_metadata_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'METADATA.METADATA_ID' as violating_field, 
            cdmtable.* 
        from dataform.metadata cdmtable
        where cdmtable.metadata_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the METADATA_TYPE_CONCEPT_ID of the METADATA that is considered not nullable.' as check_description
  ,'METADATA' as cdm_table_name
  ,'METADATA_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_metadata_metadata_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = METADATA
cdmFieldName = METADATA_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'METADATA.METADATA_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.metadata cdmtable
        where cdmtable.metadata_type_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the NAME of the METADATA that is considered not nullable.' as check_description
  ,'METADATA' as cdm_table_name
  ,'NAME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_metadata_name' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = METADATA
cdmFieldName = NAME
**********/
select 
    num_violated_rows, 
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
            'METADATA.NAME' as violating_field, 
            cdmtable.* 
        from dataform.metadata cdmtable
        where cdmtable.name is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the ENCODING_CONCEPT_ID of the NOTE that is considered not nullable.' as check_description
  ,'NOTE' as cdm_table_name
  ,'ENCODING_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_note_encoding_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = NOTE
cdmFieldName = ENCODING_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'NOTE.ENCODING_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.note cdmtable
        where cdmtable.encoding_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the LANGUAGE_CONCEPT_ID of the NOTE that is considered not nullable.' as check_description
  ,'NOTE' as cdm_table_name
  ,'LANGUAGE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_note_language_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = NOTE
cdmFieldName = LANGUAGE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'NOTE.LANGUAGE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.note cdmtable
        where cdmtable.language_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the NOTE_CLASS_CONCEPT_ID of the NOTE that is considered not nullable.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_CLASS_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_note_note_class_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = NOTE
cdmFieldName = NOTE_CLASS_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'NOTE.NOTE_CLASS_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.note cdmtable
        where cdmtable.note_class_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the NOTE_DATE of the NOTE that is considered not nullable.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_note_note_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'NOTE.NOTE_DATE' as violating_field, 
            cdmtable.* 
        from dataform.note cdmtable
        where cdmtable.note_date is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the NOTE_ID of the NOTE that is considered not nullable.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_note_note_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'NOTE.NOTE_ID' as violating_field, 
            cdmtable.* 
        from dataform.note cdmtable
        where cdmtable.note_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the NOTE_TEXT of the NOTE that is considered not nullable.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_TEXT' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_note_note_text' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = NOTE
cdmFieldName = NOTE_TEXT
**********/
select 
    num_violated_rows, 
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
            'NOTE.NOTE_TEXT' as violating_field, 
            cdmtable.* 
        from dataform.note cdmtable
        where cdmtable.note_text is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the NOTE_TYPE_CONCEPT_ID of the NOTE that is considered not nullable.' as check_description
  ,'NOTE' as cdm_table_name
  ,'NOTE_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_note_note_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = NOTE
cdmFieldName = NOTE_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'NOTE.NOTE_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.note cdmtable
        where cdmtable.note_type_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERSON_ID of the NOTE that is considered not nullable.' as check_description
  ,'NOTE' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_note_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = NOTE
cdmFieldName = PERSON_ID
**********/
select 
    num_violated_rows, 
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
            'NOTE.PERSON_ID' as violating_field, 
            cdmtable.* 
        from dataform.note cdmtable
        where cdmtable.person_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the LEXICAL_VARIANT of the NOTE_NLP that is considered not nullable.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'LEXICAL_VARIANT' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_note_nlp_lexical_variant' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = NOTE_NLP
cdmFieldName = LEXICAL_VARIANT
**********/
select 
    num_violated_rows, 
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
            'NOTE_NLP.LEXICAL_VARIANT' as violating_field, 
            cdmtable.* 
        from dataform.note_nlp cdmtable
        where cdmtable.lexical_variant is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the NLP_DATE of the NOTE_NLP that is considered not nullable.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'NLP_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_note_nlp_nlp_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = NOTE_NLP
cdmFieldName = NLP_DATE
**********/
select 
    num_violated_rows, 
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
            'NOTE_NLP.NLP_DATE' as violating_field, 
            cdmtable.* 
        from dataform.note_nlp cdmtable
        where cdmtable.nlp_date is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the NOTE_ID of the NOTE_NLP that is considered not nullable.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'NOTE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_note_nlp_note_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = NOTE_NLP
cdmFieldName = NOTE_ID
**********/
select 
    num_violated_rows, 
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
            'NOTE_NLP.NOTE_ID' as violating_field, 
            cdmtable.* 
        from dataform.note_nlp cdmtable
        where cdmtable.note_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the NOTE_NLP_ID of the NOTE_NLP that is considered not nullable.' as check_description
  ,'NOTE_NLP' as cdm_table_name
  ,'NOTE_NLP_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_note_nlp_note_nlp_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'NOTE_NLP.NOTE_NLP_ID' as violating_field, 
            cdmtable.* 
        from dataform.note_nlp cdmtable
        where cdmtable.note_nlp_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the OBSERVATION_CONCEPT_ID of the OBSERVATION that is considered not nullable.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_observation_observation_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION
cdmFieldName = OBSERVATION_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'OBSERVATION.OBSERVATION_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.observation cdmtable
        where cdmtable.observation_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the OBSERVATION_DATE of the OBSERVATION that is considered not nullable.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_observation_observation_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'OBSERVATION.OBSERVATION_DATE' as violating_field, 
            cdmtable.* 
        from dataform.observation cdmtable
        where cdmtable.observation_date is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the OBSERVATION_ID of the OBSERVATION that is considered not nullable.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_observation_observation_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'OBSERVATION.OBSERVATION_ID' as violating_field, 
            cdmtable.* 
        from dataform.observation cdmtable
        where cdmtable.observation_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the OBSERVATION_TYPE_CONCEPT_ID of the OBSERVATION that is considered not nullable.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'OBSERVATION_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_observation_observation_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION
cdmFieldName = OBSERVATION_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'OBSERVATION.OBSERVATION_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.observation cdmtable
        where cdmtable.observation_type_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERSON_ID of the OBSERVATION that is considered not nullable.' as check_description
  ,'OBSERVATION' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_observation_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION
cdmFieldName = PERSON_ID
**********/
select 
    num_violated_rows, 
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
            'OBSERVATION.PERSON_ID' as violating_field, 
            cdmtable.* 
        from dataform.observation cdmtable
        where cdmtable.person_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the OBSERVATION_PERIOD_END_DATE of the OBSERVATION_PERIOD that is considered not nullable.' as check_description
  ,'OBSERVATION_PERIOD' as cdm_table_name
  ,'OBSERVATION_PERIOD_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_observation_period_observation_period_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'OBSERVATION_PERIOD.OBSERVATION_PERIOD_END_DATE' as violating_field, 
            cdmtable.* 
        from dataform.observation_period cdmtable
        where cdmtable.observation_period_end_date is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the OBSERVATION_PERIOD_ID of the OBSERVATION_PERIOD that is considered not nullable.' as check_description
  ,'OBSERVATION_PERIOD' as cdm_table_name
  ,'OBSERVATION_PERIOD_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_observation_period_observation_period_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'OBSERVATION_PERIOD.OBSERVATION_PERIOD_ID' as violating_field, 
            cdmtable.* 
        from dataform.observation_period cdmtable
        where cdmtable.observation_period_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the OBSERVATION_PERIOD_START_DATE of the OBSERVATION_PERIOD that is considered not nullable.' as check_description
  ,'OBSERVATION_PERIOD' as cdm_table_name
  ,'OBSERVATION_PERIOD_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_observation_period_observation_period_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'OBSERVATION_PERIOD.OBSERVATION_PERIOD_START_DATE' as violating_field, 
            cdmtable.* 
        from dataform.observation_period cdmtable
        where cdmtable.observation_period_start_date is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERIOD_TYPE_CONCEPT_ID of the OBSERVATION_PERIOD that is considered not nullable.' as check_description
  ,'OBSERVATION_PERIOD' as cdm_table_name
  ,'PERIOD_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_observation_period_period_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION_PERIOD
cdmFieldName = PERIOD_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'OBSERVATION_PERIOD.PERIOD_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.observation_period cdmtable
        where cdmtable.period_type_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERSON_ID of the OBSERVATION_PERIOD that is considered not nullable.' as check_description
  ,'OBSERVATION_PERIOD' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_observation_period_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = OBSERVATION_PERIOD
cdmFieldName = PERSON_ID
**********/
select 
    num_violated_rows, 
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
            'OBSERVATION_PERIOD.PERSON_ID' as violating_field, 
            cdmtable.* 
        from dataform.observation_period cdmtable
        where cdmtable.person_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PAYER_PLAN_PERIOD_END_DATE of the PAYER_PLAN_PERIOD that is considered not nullable.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PAYER_PLAN_PERIOD_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_payer_plan_period_payer_plan_period_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'PAYER_PLAN_PERIOD.PAYER_PLAN_PERIOD_END_DATE' as violating_field, 
            cdmtable.* 
        from dataform.payer_plan_period cdmtable
        where cdmtable.payer_plan_period_end_date is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PAYER_PLAN_PERIOD_ID of the PAYER_PLAN_PERIOD that is considered not nullable.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PAYER_PLAN_PERIOD_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_payer_plan_period_payer_plan_period_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'PAYER_PLAN_PERIOD.PAYER_PLAN_PERIOD_ID' as violating_field, 
            cdmtable.* 
        from dataform.payer_plan_period cdmtable
        where cdmtable.payer_plan_period_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PAYER_PLAN_PERIOD_START_DATE of the PAYER_PLAN_PERIOD that is considered not nullable.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PAYER_PLAN_PERIOD_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_payer_plan_period_payer_plan_period_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'PAYER_PLAN_PERIOD.PAYER_PLAN_PERIOD_START_DATE' as violating_field, 
            cdmtable.* 
        from dataform.payer_plan_period cdmtable
        where cdmtable.payer_plan_period_start_date is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERSON_ID of the PAYER_PLAN_PERIOD that is considered not nullable.' as check_description
  ,'PAYER_PLAN_PERIOD' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_payer_plan_period_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = PAYER_PLAN_PERIOD
cdmFieldName = PERSON_ID
**********/
select 
    num_violated_rows, 
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
            'PAYER_PLAN_PERIOD.PERSON_ID' as violating_field, 
            cdmtable.* 
        from dataform.payer_plan_period cdmtable
        where cdmtable.person_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the ETHNICITY_CONCEPT_ID of the PERSON that is considered not nullable.' as check_description
  ,'PERSON' as cdm_table_name
  ,'ETHNICITY_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_person_ethnicity_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = PERSON
cdmFieldName = ETHNICITY_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'PERSON.ETHNICITY_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.person cdmtable
        where cdmtable.ethnicity_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the GENDER_CONCEPT_ID of the PERSON that is considered not nullable.' as check_description
  ,'PERSON' as cdm_table_name
  ,'GENDER_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_person_gender_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = PERSON
cdmFieldName = GENDER_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'PERSON.GENDER_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.person cdmtable
        where cdmtable.gender_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERSON_ID of the PERSON that is considered not nullable.' as check_description
  ,'PERSON' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_person_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'PERSON.PERSON_ID' as violating_field, 
            cdmtable.* 
        from dataform.person cdmtable
        where cdmtable.person_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the RACE_CONCEPT_ID of the PERSON that is considered not nullable.' as check_description
  ,'PERSON' as cdm_table_name
  ,'RACE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_person_race_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = PERSON
cdmFieldName = RACE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'PERSON.RACE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.person cdmtable
        where cdmtable.race_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the YEAR_OF_BIRTH of the PERSON that is considered not nullable.' as check_description
  ,'PERSON' as cdm_table_name
  ,'YEAR_OF_BIRTH' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_person_year_of_birth' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = PERSON
cdmFieldName = YEAR_OF_BIRTH
**********/
select 
    num_violated_rows, 
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
            'PERSON.YEAR_OF_BIRTH' as violating_field, 
            cdmtable.* 
        from dataform.person cdmtable
        where cdmtable.year_of_birth is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERSON_ID of the PROCEDURE_OCCURRENCE that is considered not nullable.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_procedure_occurrence_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PERSON_ID
**********/
select 
    num_violated_rows, 
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
            'PROCEDURE_OCCURRENCE.PERSON_ID' as violating_field, 
            cdmtable.* 
        from dataform.procedure_occurrence cdmtable
        where cdmtable.person_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PROCEDURE_CONCEPT_ID of the PROCEDURE_OCCURRENCE that is considered not nullable.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_procedure_occurrence_procedure_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'PROCEDURE_OCCURRENCE.PROCEDURE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.procedure_occurrence cdmtable
        where cdmtable.procedure_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PROCEDURE_DATE of the PROCEDURE_OCCURRENCE that is considered not nullable.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_procedure_occurrence_procedure_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'PROCEDURE_OCCURRENCE.PROCEDURE_DATE' as violating_field, 
            cdmtable.* 
        from dataform.procedure_occurrence cdmtable
        where cdmtable.procedure_date is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PROCEDURE_OCCURRENCE_ID of the PROCEDURE_OCCURRENCE that is considered not nullable.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_procedure_occurrence_procedure_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'PROCEDURE_OCCURRENCE.PROCEDURE_OCCURRENCE_ID' as violating_field, 
            cdmtable.* 
        from dataform.procedure_occurrence cdmtable
        where cdmtable.procedure_occurrence_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PROCEDURE_TYPE_CONCEPT_ID of the PROCEDURE_OCCURRENCE that is considered not nullable.' as check_description
  ,'PROCEDURE_OCCURRENCE' as cdm_table_name
  ,'PROCEDURE_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_procedure_occurrence_procedure_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = PROCEDURE_OCCURRENCE
cdmFieldName = PROCEDURE_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'PROCEDURE_OCCURRENCE.PROCEDURE_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.procedure_occurrence cdmtable
        where cdmtable.procedure_type_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PROVIDER_ID of the PROVIDER that is considered not nullable.' as check_description
  ,'PROVIDER' as cdm_table_name
  ,'PROVIDER_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_provider_provider_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'PROVIDER.PROVIDER_ID' as violating_field, 
            cdmtable.* 
        from dataform.provider cdmtable
        where cdmtable.provider_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the DEFINES_ANCESTRY of the RELATIONSHIP that is considered not nullable.' as check_description
  ,'RELATIONSHIP' as cdm_table_name
  ,'DEFINES_ANCESTRY' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_relationship_defines_ancestry' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = RELATIONSHIP
cdmFieldName = DEFINES_ANCESTRY
**********/
select 
    num_violated_rows, 
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
            'RELATIONSHIP.DEFINES_ANCESTRY' as violating_field, 
            cdmtable.* 
        from dataform.relationship cdmtable
        where cdmtable.defines_ancestry is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the IS_HIERARCHICAL of the RELATIONSHIP that is considered not nullable.' as check_description
  ,'RELATIONSHIP' as cdm_table_name
  ,'IS_HIERARCHICAL' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_relationship_is_hierarchical' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = RELATIONSHIP
cdmFieldName = IS_HIERARCHICAL
**********/
select 
    num_violated_rows, 
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
            'RELATIONSHIP.IS_HIERARCHICAL' as violating_field, 
            cdmtable.* 
        from dataform.relationship cdmtable
        where cdmtable.is_hierarchical is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the RELATIONSHIP_CONCEPT_ID of the RELATIONSHIP that is considered not nullable.' as check_description
  ,'RELATIONSHIP' as cdm_table_name
  ,'RELATIONSHIP_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_relationship_relationship_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = RELATIONSHIP
cdmFieldName = RELATIONSHIP_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'RELATIONSHIP.RELATIONSHIP_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.relationship cdmtable
        where cdmtable.relationship_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the RELATIONSHIP_ID of the RELATIONSHIP that is considered not nullable.' as check_description
  ,'RELATIONSHIP' as cdm_table_name
  ,'RELATIONSHIP_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_relationship_relationship_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'RELATIONSHIP.RELATIONSHIP_ID' as violating_field, 
            cdmtable.* 
        from dataform.relationship cdmtable
        where cdmtable.relationship_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the RELATIONSHIP_NAME of the RELATIONSHIP that is considered not nullable.' as check_description
  ,'RELATIONSHIP' as cdm_table_name
  ,'RELATIONSHIP_NAME' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_relationship_relationship_name' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = RELATIONSHIP
cdmFieldName = RELATIONSHIP_NAME
**********/
select 
    num_violated_rows, 
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
            'RELATIONSHIP.RELATIONSHIP_NAME' as violating_field, 
            cdmtable.* 
        from dataform.relationship cdmtable
        where cdmtable.relationship_name is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the REVERSE_RELATIONSHIP_ID of the RELATIONSHIP that is considered not nullable.' as check_description
  ,'RELATIONSHIP' as cdm_table_name
  ,'REVERSE_RELATIONSHIP_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_relationship_reverse_relationship_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = RELATIONSHIP
cdmFieldName = REVERSE_RELATIONSHIP_ID
**********/
select 
    num_violated_rows, 
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
            'RELATIONSHIP.REVERSE_RELATIONSHIP_ID' as violating_field, 
            cdmtable.* 
        from dataform.relationship cdmtable
        where cdmtable.reverse_relationship_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the SOURCE_CODE of the SOURCE_TO_CONCEPT_MAP that is considered not nullable.' as check_description
  ,'SOURCE_TO_CONCEPT_MAP' as cdm_table_name
  ,'SOURCE_CODE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_source_to_concept_map_source_code' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = SOURCE_TO_CONCEPT_MAP
cdmFieldName = SOURCE_CODE
**********/
select 
    num_violated_rows, 
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
            'SOURCE_TO_CONCEPT_MAP.SOURCE_CODE' as violating_field, 
            cdmtable.* 
        from dataform.source_to_concept_map cdmtable
        where cdmtable.source_code is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the SOURCE_CONCEPT_ID of the SOURCE_TO_CONCEPT_MAP that is considered not nullable.' as check_description
  ,'SOURCE_TO_CONCEPT_MAP' as cdm_table_name
  ,'SOURCE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_source_to_concept_map_source_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = SOURCE_TO_CONCEPT_MAP
cdmFieldName = SOURCE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'SOURCE_TO_CONCEPT_MAP.SOURCE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.source_to_concept_map cdmtable
        where cdmtable.source_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the SOURCE_VOCABULARY_ID of the SOURCE_TO_CONCEPT_MAP that is considered not nullable.' as check_description
  ,'SOURCE_TO_CONCEPT_MAP' as cdm_table_name
  ,'SOURCE_VOCABULARY_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_source_to_concept_map_source_vocabulary_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = SOURCE_TO_CONCEPT_MAP
cdmFieldName = SOURCE_VOCABULARY_ID
**********/
select 
    num_violated_rows, 
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
            'SOURCE_TO_CONCEPT_MAP.SOURCE_VOCABULARY_ID' as violating_field, 
            cdmtable.* 
        from dataform.source_to_concept_map cdmtable
        where cdmtable.source_vocabulary_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the TARGET_CONCEPT_ID of the SOURCE_TO_CONCEPT_MAP that is considered not nullable.' as check_description
  ,'SOURCE_TO_CONCEPT_MAP' as cdm_table_name
  ,'TARGET_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_source_to_concept_map_target_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = SOURCE_TO_CONCEPT_MAP
cdmFieldName = TARGET_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'SOURCE_TO_CONCEPT_MAP.TARGET_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.source_to_concept_map cdmtable
        where cdmtable.target_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the TARGET_VOCABULARY_ID of the SOURCE_TO_CONCEPT_MAP that is considered not nullable.' as check_description
  ,'SOURCE_TO_CONCEPT_MAP' as cdm_table_name
  ,'TARGET_VOCABULARY_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_source_to_concept_map_target_vocabulary_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = SOURCE_TO_CONCEPT_MAP
cdmFieldName = TARGET_VOCABULARY_ID
**********/
select 
    num_violated_rows, 
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
            'SOURCE_TO_CONCEPT_MAP.TARGET_VOCABULARY_ID' as violating_field, 
            cdmtable.* 
        from dataform.source_to_concept_map cdmtable
        where cdmtable.target_vocabulary_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VALID_END_DATE of the SOURCE_TO_CONCEPT_MAP that is considered not nullable.' as check_description
  ,'SOURCE_TO_CONCEPT_MAP' as cdm_table_name
  ,'VALID_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_source_to_concept_map_valid_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = SOURCE_TO_CONCEPT_MAP
cdmFieldName = VALID_END_DATE
**********/
select 
    num_violated_rows, 
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
            'SOURCE_TO_CONCEPT_MAP.VALID_END_DATE' as violating_field, 
            cdmtable.* 
        from dataform.source_to_concept_map cdmtable
        where cdmtable.valid_end_date is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VALID_START_DATE of the SOURCE_TO_CONCEPT_MAP that is considered not nullable.' as check_description
  ,'SOURCE_TO_CONCEPT_MAP' as cdm_table_name
  ,'VALID_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_source_to_concept_map_valid_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = SOURCE_TO_CONCEPT_MAP
cdmFieldName = VALID_START_DATE
**********/
select 
    num_violated_rows, 
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
            'SOURCE_TO_CONCEPT_MAP.VALID_START_DATE' as violating_field, 
            cdmtable.* 
        from dataform.source_to_concept_map cdmtable
        where cdmtable.valid_start_date is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERSON_ID of the SPECIMEN that is considered not nullable.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_specimen_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = SPECIMEN
cdmFieldName = PERSON_ID
**********/
select 
    num_violated_rows, 
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
            'SPECIMEN.PERSON_ID' as violating_field, 
            cdmtable.* 
        from dataform.specimen cdmtable
        where cdmtable.person_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the SPECIMEN_CONCEPT_ID of the SPECIMEN that is considered not nullable.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'SPECIMEN_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_specimen_specimen_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = SPECIMEN
cdmFieldName = SPECIMEN_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'SPECIMEN.SPECIMEN_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.specimen cdmtable
        where cdmtable.specimen_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the SPECIMEN_DATE of the SPECIMEN that is considered not nullable.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'SPECIMEN_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_specimen_specimen_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'SPECIMEN.SPECIMEN_DATE' as violating_field, 
            cdmtable.* 
        from dataform.specimen cdmtable
        where cdmtable.specimen_date is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the SPECIMEN_ID of the SPECIMEN that is considered not nullable.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'SPECIMEN_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_specimen_specimen_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'SPECIMEN.SPECIMEN_ID' as violating_field, 
            cdmtable.* 
        from dataform.specimen cdmtable
        where cdmtable.specimen_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the SPECIMEN_TYPE_CONCEPT_ID of the SPECIMEN that is considered not nullable.' as check_description
  ,'SPECIMEN' as cdm_table_name
  ,'SPECIMEN_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_specimen_specimen_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = SPECIMEN
cdmFieldName = SPECIMEN_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'SPECIMEN.SPECIMEN_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.specimen cdmtable
        where cdmtable.specimen_type_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERSON_ID of the VISIT_DETAIL that is considered not nullable.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_visit_detail_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = PERSON_ID
**********/
select 
    num_violated_rows, 
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
            'VISIT_DETAIL.PERSON_ID' as violating_field, 
            cdmtable.* 
        from dataform.visit_detail cdmtable
        where cdmtable.person_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_DETAIL_CONCEPT_ID of the VISIT_DETAIL that is considered not nullable.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_visit_detail_visit_detail_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_DETAIL_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'VISIT_DETAIL.VISIT_DETAIL_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.visit_detail cdmtable
        where cdmtable.visit_detail_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_DETAIL_END_DATE of the VISIT_DETAIL that is considered not nullable.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_visit_detail_visit_detail_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'VISIT_DETAIL.VISIT_DETAIL_END_DATE' as violating_field, 
            cdmtable.* 
        from dataform.visit_detail cdmtable
        where cdmtable.visit_detail_end_date is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_DETAIL_ID of the VISIT_DETAIL that is considered not nullable.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_visit_detail_visit_detail_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'VISIT_DETAIL.VISIT_DETAIL_ID' as violating_field, 
            cdmtable.* 
        from dataform.visit_detail cdmtable
        where cdmtable.visit_detail_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_DETAIL_START_DATE of the VISIT_DETAIL that is considered not nullable.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_visit_detail_visit_detail_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'VISIT_DETAIL.VISIT_DETAIL_START_DATE' as violating_field, 
            cdmtable.* 
        from dataform.visit_detail cdmtable
        where cdmtable.visit_detail_start_date is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_DETAIL_TYPE_CONCEPT_ID of the VISIT_DETAIL that is considered not nullable.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_DETAIL_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_visit_detail_visit_detail_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_DETAIL_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'VISIT_DETAIL.VISIT_DETAIL_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.visit_detail cdmtable
        where cdmtable.visit_detail_type_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_OCCURRENCE_ID of the VISIT_DETAIL that is considered not nullable.' as check_description
  ,'VISIT_DETAIL' as cdm_table_name
  ,'VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_visit_detail_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_DETAIL
cdmFieldName = VISIT_OCCURRENCE_ID
**********/
select 
    num_violated_rows, 
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
            'VISIT_DETAIL.VISIT_OCCURRENCE_ID' as violating_field, 
            cdmtable.* 
        from dataform.visit_detail cdmtable
        where cdmtable.visit_occurrence_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the PERSON_ID of the VISIT_OCCURRENCE that is considered not nullable.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'PERSON_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_visit_occurrence_person_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = PERSON_ID
**********/
select 
    num_violated_rows, 
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
            'VISIT_OCCURRENCE.PERSON_ID' as violating_field, 
            cdmtable.* 
        from dataform.visit_occurrence cdmtable
        where cdmtable.person_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_CONCEPT_ID of the VISIT_OCCURRENCE that is considered not nullable.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_visit_occurrence_visit_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = VISIT_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'VISIT_OCCURRENCE.VISIT_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.visit_occurrence cdmtable
        where cdmtable.visit_concept_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_END_DATE of the VISIT_OCCURRENCE that is considered not nullable.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_END_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_visit_occurrence_visit_end_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'VISIT_OCCURRENCE.VISIT_END_DATE' as violating_field, 
            cdmtable.* 
        from dataform.visit_occurrence cdmtable
        where cdmtable.visit_end_date is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_OCCURRENCE_ID of the VISIT_OCCURRENCE that is considered not nullable.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_OCCURRENCE_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_visit_occurrence_visit_occurrence_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'VISIT_OCCURRENCE.VISIT_OCCURRENCE_ID' as violating_field, 
            cdmtable.* 
        from dataform.visit_occurrence cdmtable
        where cdmtable.visit_occurrence_id is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_START_DATE of the VISIT_OCCURRENCE that is considered not nullable.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_START_DATE' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_visit_occurrence_visit_start_date' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
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
from (
    select 
        count(violated_rows.violating_field) as num_violated_rows
    from (
        /*violatedRowsBegin*/
        select 
            'VISIT_OCCURRENCE.VISIT_START_DATE' as violating_field, 
            cdmtable.* 
        from dataform.visit_occurrence cdmtable
        where cdmtable.visit_start_date is null
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
  ,'isRequired' as check_name
  ,'FIELD' as check_level
  ,'The number and percent of records with a NULL value in the VISIT_TYPE_CONCEPT_ID of the VISIT_OCCURRENCE that is considered not nullable.' as check_description
  ,'VISIT_OCCURRENCE' as cdm_table_name
  ,'VISIT_TYPE_CONCEPT_ID' as cdm_field_name
  ,'NA' as concept_id
  ,'NA' as unit_concept_id
  ,'field_is_not_nullable.sql' as sql_file
  ,'Conformance' as category
  ,'Relational' as subcategory
  ,'Validation' as context
  ,'' as warning
  ,'' as error
  ,'field_isrequired_visit_occurrence_visit_type_concept_id' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 0 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 0 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,0 as threshold_value
  ,null as notes_value
from (
  /*********
FIELD_IS_REQUIRED
Check that values in fields where isRequired == TRUE are non-null
Parameters used in this template:
schema = dataform
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = VISIT_TYPE_CONCEPT_ID
**********/
select 
    num_violated_rows, 
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
            'VISIT_OCCURRENCE.VISIT_TYPE_CONCEPT_ID' as violating_field, 
            cdmtable.* 
        from dataform.visit_occurrence cdmtable
        where cdmtable.visit_type_concept_id is null
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

