/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3006315 (BASOPHILS [#/VOLUME] IN BLOOD) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8784,8848,8961,9444)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3006315' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3006315' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3006315
plausibleUnitConceptIds = 8784,8848,8961,9444
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3006315
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8784,8848,8961,9444' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8784,8848,8961,9444, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3006315
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3004410 (HEMOGLOBIN A1C/HEMOGLOBIN.TOTAL IN BLOOD) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8554,8737,9225,9579)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3004410' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3004410' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3004410
plausibleUnitConceptIds = 8554,8737,9225,9579
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3004410
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8554,8737,9225,9579' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8554,8737,9225,9579, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3004410
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 40487382 (TOTAL LYMPHOCYTE COUNT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8784,8848,8961,9444)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'40487382' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_40487382' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 40487382
plausibleUnitConceptIds = 8784,8848,8961,9444
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 40487382
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8784,8848,8961,9444' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8784,8848,8961,9444, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 40487382
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3013721 (ASPARTATE AMINOTRANSFERASE [ENZYMATIC ACTIVITY/VOLUME] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8645,8923)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3013721' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3013721' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3013721
plausibleUnitConceptIds = 8645,8923
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3013721
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8645,8923' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8645,8923, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3013721
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3019198 (LYMPHOCYTES [#/VOLUME] IN BLOOD) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8784,8848,8961,9444)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3019198' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3019198' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3019198
plausibleUnitConceptIds = 8784,8848,8961,9444
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3019198
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8784,8848,8961,9444' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8784,8848,8961,9444, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3019198
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3034426 (PROTHROMBIN TIME (PT)) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8555)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3034426' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3034426' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3034426
plausibleUnitConceptIds = 8555
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3034426
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8555' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8555, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3034426
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3043688 (HEMOGLOBIN [MASS/VOLUME] IN BODY FLUID) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8713)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3043688' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3043688' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3043688
plausibleUnitConceptIds = 8713
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3043688
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8713' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8713, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3043688
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3046485 (UREA NITROGEN/CREATININE [MASS RATIO] IN BLOOD) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8523,8554,8596,-1)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3046485' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3046485' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3046485
plausibleUnitConceptIds = 8523,8554,8596,-1
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3046485
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8523,8554,8596,-1' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8523,8554,8596,-1, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3046485
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 4216098 (EOSINOPHIL COUNT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8784,8848,8961,9444)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'4216098' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_4216098' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 4216098
plausibleUnitConceptIds = 8784,8848,8961,9444
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 4216098
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8784,8848,8961,9444' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8784,8848,8961,9444, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 4216098
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 4245152 (POTASSIUM MEASUREMENT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8736,8753,9557)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'4245152' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_4245152' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 4245152
plausibleUnitConceptIds = 8736,8753,9557
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 4245152
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8736,8753,9557' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8736,8753,9557, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 4245152
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 43055141 (PAIN SEVERITY - 0-10 VERBAL NUMERIC RATING [SCORE] - REPORTED) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (-1)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'43055141' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_43055141' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 43055141
plausibleUnitConceptIds = -1
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 43055141
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('-1' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (-1, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 43055141
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3006923 (ALANINE AMINOTRANSFERASE [ENZYMATIC ACTIVITY/VOLUME] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8645,8923)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3006923' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3006923' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3006923
plausibleUnitConceptIds = 8645,8923
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3006923
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8645,8923' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8645,8923, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3006923
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3021044 (IRON BINDING CAPACITY [MASS/VOLUME] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8837)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3021044' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3021044' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3021044
plausibleUnitConceptIds = 8837
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3021044
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8837' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8837, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3021044
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3024171 (RESPIRATORY RATE) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8483,8541)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3024171' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3024171' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3024171
plausibleUnitConceptIds = 8483,8541
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3024171
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8483,8541' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8483,8541, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3024171
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3027114 (CHOLESTEROL [MASS/VOLUME] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8840)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3027114' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3027114' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3027114
plausibleUnitConceptIds = 8840
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3027114
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8840' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8840, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3027114
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 40762499 (OXYGEN SATURATION IN ARTERIAL BLOOD BY PULSE OXIMETRY) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8554,-1)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'40762499' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_40762499' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 40762499
plausibleUnitConceptIds = 8554,-1
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 40762499
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8554,-1' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8554,-1, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 40762499
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3000963 (HEMOGLOBIN [MASS/VOLUME] IN BLOOD) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8636,8713)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3000963' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3000963' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3000963
plausibleUnitConceptIds = 8636,8713
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3000963
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8636,8713' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8636,8713, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3000963
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3001604 (MONOCYTES [#/VOLUME] IN BLOOD) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8848,8961,9444)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3001604' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3001604' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3001604
plausibleUnitConceptIds = 8848,8961,9444
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3001604
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8848,8961,9444' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8848,8961,9444, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3001604
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3019069 (MONOCYTES/100 LEUKOCYTES IN BLOOD) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8554)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3019069' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3019069' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3019069
plausibleUnitConceptIds = 8554
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3019069
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8554' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8554, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3019069
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3022509 (HYALINE CASTS [#/AREA] IN URINE SEDIMENT BY MICROSCOPY LOW POWER FIELD) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8765)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3022509' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3022509' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3022509
plausibleUnitConceptIds = 8765
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3022509
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8765' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8765, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3022509
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3028288 (CHOLESTEROL IN LDL [MASS/VOLUME] IN SERUM OR PLASMA BY CALCULATION) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8840,9028)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3028288' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3028288' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3028288
plausibleUnitConceptIds = 8840,9028
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3028288
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8840,9028' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8840,9028, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3028288
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 4148615 (NEUTROPHIL COUNT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8784,8848,8961,8848,9444)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'4148615' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_4148615' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 4148615
plausibleUnitConceptIds = 8784,8848,8961,8848,9444
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 4148615
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8784,8848,8961,8848,9444' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8784,8848,8961,8848,9444, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 4148615
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 44806420 (ESTIMATION OF GLOMERULAR FILTRATION RATE) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (720870,8795)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'44806420' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_44806420' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 44806420
plausibleUnitConceptIds = 720870,8795
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 44806420
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('720870,8795' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (720870,8795, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 44806420
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3028437 (CHOLESTEROL IN LDL [MASS/VOLUME] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8840,9028)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3028437' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3028437' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3028437
plausibleUnitConceptIds = 8840,9028
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3028437
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8840,9028' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8840,9028, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3028437
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3016991 (THYROXINE (T4) [MASS/VOLUME] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8837)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3016991' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3016991' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3016991
plausibleUnitConceptIds = 8837
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3016991
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8837' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8837, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3016991
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3026925 (TRIIODOTHYRONINE (T3) FREE [MASS/VOLUME] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8820,8845)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3026925' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3026925' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3026925
plausibleUnitConceptIds = 8820,8845
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3026925
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8820,8845' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8820,8845, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3026925
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3028615 (EOSINOPHILS [#/VOLUME] IN BLOOD BY AUTOMATED COUNT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8784,8816,8848,8961,9436,9444,8647)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3028615' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3028615' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3028615
plausibleUnitConceptIds = 8784,8816,8848,8961,9436,9444,8647
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3028615
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8784,8816,8848,8961,9436,9444,8647' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8784,8816,8848,8961,9436,9444,8647, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3028615
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3051205 (CRYSTALS [#/AREA] IN URINE SEDIMENT BY MICROSCOPY HIGH POWER FIELD) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8786)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3051205' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3051205' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3051205
plausibleUnitConceptIds = 8786
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3051205
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8786' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8786, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3051205
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 4098046 (PULSE OXIMETRY) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8554)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'4098046' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_4098046' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 4098046
plausibleUnitConceptIds = 8554
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 4098046
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8554' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8554, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 4098046
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3005131 (GLUCOSE MEAN VALUE [MASS/VOLUME] IN BLOOD ESTIMATED FROM GLYCATED HEMOGLOBIN) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8840,9028)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3005131' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3005131' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3005131
plausibleUnitConceptIds = 8840,9028
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3005131
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8840,9028' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8840,9028, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3005131
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3011163 (CHOLESTEROL.TOTAL/CHOLESTEROL IN HDL [MASS RATIO] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8523,8529,8554,8596,8606,-1)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3011163' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3011163' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3011163
plausibleUnitConceptIds = 8523,8529,8554,8596,8606,-1
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3011163
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8523,8529,8554,8596,8606,-1' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8523,8529,8554,8596,8606,-1, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3011163
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3044491 (CHOLESTEROL NON HDL [MASS/VOLUME] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8576,8840,9028)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3044491' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3044491' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3044491
plausibleUnitConceptIds = 8576,8840,9028
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3044491
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8576,8840,9028' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8576,8840,9028, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3044491
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 4017361 (BLOOD UREA NITROGEN MEASUREMENT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8753,8840)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'4017361' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_4017361' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 4017361
plausibleUnitConceptIds = 8753,8840
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 4017361
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8753,8840' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8753,8840, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 4017361
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3006504 (EOSINOPHILS/100 LEUKOCYTES IN BLOOD) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8554)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3006504' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3006504' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3006504
plausibleUnitConceptIds = 8554
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3006504
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8554' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8554, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3006504
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3000483 (GLUCOSE [MASS/VOLUME] IN BLOOD) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8840)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3000483' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3000483' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3000483
plausibleUnitConceptIds = 8840
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3000483
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8840' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8840, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3000483
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3033543 (SPECIFIC GRAVITY OF URINE) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8523,-1)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3033543' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3033543' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3033543
plausibleUnitConceptIds = 8523,-1
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3033543
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8523,-1' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8523,-1, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3033543
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3045716 (ANION GAP IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8753,9557)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3045716' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3045716' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3045716
plausibleUnitConceptIds = 8753,9557
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3045716
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8753,9557' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8753,9557, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3045716
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 4101713 (HIGH DENSITY LIPOPROTEIN CHOLESTEROL MEASUREMENT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8636,8736,8753,8840)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'4101713' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_4101713' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 4101713
plausibleUnitConceptIds = 8636,8736,8753,8840
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 4101713
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8636,8736,8753,8840' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8636,8736,8753,8840, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 4101713
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 4103762 (ANION GAP MEASUREMENT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8753,9557)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'4103762' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_4103762' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 4103762
plausibleUnitConceptIds = 8753,9557
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 4103762
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8753,9557' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8753,9557, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 4103762
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3001008 (EPITHELIAL CELLS.SQUAMOUS [#/AREA] IN URINE SEDIMENT BY MICROSCOPY HIGH POWER FIELD) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8765,8786,8889)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3001008' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3001008' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3001008
plausibleUnitConceptIds = 8765,8786,8889
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3001008
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8765,8786,8889' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8765,8786,8889, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3001008
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3009744 (MCHC [MASS/VOLUME] BY AUTOMATED COUNT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8564,8636,8713)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3009744' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3009744' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3009744
plausibleUnitConceptIds = 8564,8636,8713
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3009744
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8564,8636,8713' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8564,8636,8713, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3009744
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3013115 (EOSINOPHILS [#/VOLUME] IN BLOOD) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8848,8961,9444)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3013115' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3013115' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3013115
plausibleUnitConceptIds = 8848,8961,9444
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3013115
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8848,8961,9444' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8848,8961,9444, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3013115
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3019550 (SODIUM [MOLES/VOLUME] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8753,9557)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3019550' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3019550' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3019550
plausibleUnitConceptIds = 8753,9557
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3019550
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8753,9557' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8753,9557, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3019550
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3020416 (ERYTHROCYTES [#/VOLUME] IN BLOOD BY AUTOMATED COUNT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (44777575,8734,8815)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3020416' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3020416' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3020416
plausibleUnitConceptIds = 44777575,8734,8815
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3020416
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('44777575,8734,8815' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (44777575,8734,8815, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3020416
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3035583 (LEUKOCYTES [#/AREA] IN URINE SEDIMENT BY MICROSCOPY HIGH POWER FIELD) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8786,8889)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3035583' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3035583' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3035583
plausibleUnitConceptIds = 8786,8889
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3035583
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8786,8889' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8786,8889, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3035583
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3035995 (ALKALINE PHOSPHATASE [ENZYMATIC ACTIVITY/VOLUME] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8645,8923)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3035995' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3035995' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3035995
plausibleUnitConceptIds = 8645,8923
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3035995
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8645,8923' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8645,8923, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3035995
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3038553 (BODY MASS INDEX (BMI) [RATIO]) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (9531)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3038553' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3038553' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3038553
plausibleUnitConceptIds = 9531
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3038553
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('9531' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (9531, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3038553
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 35610320 (DIASTOLIC ARTERIAL PRESSURE) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8876)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'35610320' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_35610320' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 35610320
plausibleUnitConceptIds = 8876
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 35610320
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8876' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8876, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 35610320
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3001490 (NUCLEATED ERYTHROCYTES [#/VOLUME] IN BLOOD) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8784,8848,8961,9444)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3001490' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3001490' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3001490
plausibleUnitConceptIds = 8784,8848,8961,9444
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3001490
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8784,8848,8961,9444' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8784,8848,8961,9444, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3001490
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 4195214 (CHOLESTEROL/HDL RATIO MEASUREMENT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8523,8554,8596,-1)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'4195214' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_4195214' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 4195214
plausibleUnitConceptIds = 8523,8554,8596,-1
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 4195214
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8523,8554,8596,-1' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8523,8554,8596,-1, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 4195214
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 36306178 (GLOMERULAR FILTRATION RATE/1.73 SQ M.PREDICTED AMONG BLACKS [VOLUME RATE/AREA] IN SERUM, PLASMA OR BLOOD BY CREATININE-BASED FORMULA (CKD-EPI)) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (720870,8795)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'36306178' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_36306178' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 36306178
plausibleUnitConceptIds = 720870,8795
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 36306178
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('720870,8795' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (720870,8795, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 36306178
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 37393850 (MCHC - MEAN CORPUSCULAR HAEMOGLOBIN CONCENTRATION) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8636,8713,8554,8753)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'37393850' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_37393850' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 37393850
plausibleUnitConceptIds = 8636,8713,8554,8753
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 37393850
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8636,8713,8554,8753' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8636,8713,8554,8753, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 37393850
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3004501 (GLUCOSE [MASS/VOLUME] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8840,8753)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3004501' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3004501' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3004501
plausibleUnitConceptIds = 8840,8753
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3004501
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8840,8753' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8840,8753, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3004501
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3008598 (THYROXINE (T4) FREE [MASS/VOLUME] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8817,8845,8725)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3008598' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3008598' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3008598
plausibleUnitConceptIds = 8817,8845,8725
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3008598
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8817,8845,8725' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8817,8845,8725, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3008598
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3018010 (NEUTROPHILS/100 LEUKOCYTES IN BLOOD) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8554,-1)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3018010' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3018010' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3018010
plausibleUnitConceptIds = 8554,-1
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3018010
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8554,-1' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8554,-1, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3018010
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3022192 (TRIGLYCERIDE [MASS/VOLUME] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8840,8753)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3022192' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3022192' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3022192
plausibleUnitConceptIds = 8840,8753
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3022192
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8840,8753' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8840,8753, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3022192
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 4151768 (PACK YEARS) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (9448,-1)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'4151768' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_4151768' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 4151768
plausibleUnitConceptIds = 9448,-1
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 4151768
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('9448,-1' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (9448,-1, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 4151768
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 4197602 (SERUM TSH MEASUREMENT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8719,9040,9093,44777578,8750,8923,44777583)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'4197602' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_4197602' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 4197602
plausibleUnitConceptIds = 8719,9040,9093,44777578,8750,8923,44777583
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 4197602
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8719,9040,9093,44777578,8750,8923,44777583' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8719,9040,9093,44777578,8750,8923,44777583, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 4197602
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 46236952 (GLOMERULAR FILTRATION RATE/1.73 SQ M.PREDICTED [VOLUME RATE/AREA] IN SERUM, PLASMA OR BLOOD BY CREATININE-BASED FORMULA (MDRD)) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (720870,8795)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'46236952' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_46236952' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 46236952
plausibleUnitConceptIds = 720870,8795
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 46236952
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('720870,8795' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (720870,8795, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 46236952
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3006906 (CALCIUM [MASS/VOLUME] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8840)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3006906' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3006906' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3006906
plausibleUnitConceptIds = 8840
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3006906
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8840' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8840, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3006906
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3007070 (CHOLESTEROL IN HDL [MASS/VOLUME] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8840)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3007070' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3007070' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3007070
plausibleUnitConceptIds = 8840
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3007070
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8840' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8840, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3007070
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3020460 (C REACTIVE PROTEIN [MASS/VOLUME] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8751,8840)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3020460' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3020460' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3020460
plausibleUnitConceptIds = 8751,8840
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3020460
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8751,8840' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8751,8840, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3020460
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3023314 (HEMATOCRIT [VOLUME FRACTION] OF BLOOD BY AUTOMATED COUNT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (44777604,8554)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3023314' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3023314' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3023314
plausibleUnitConceptIds = 44777604,8554
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3023314
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('44777604,8554' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (44777604,8554, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3023314
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3035941 (MCH [ENTITIC MASS]) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8564,9655)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3035941' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3035941' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3035941
plausibleUnitConceptIds = 8564,9655
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3035941
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8564,9655' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8564,9655, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3035941
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3037072 (UROBILINOGEN [MASS/VOLUME] IN URINE BY TEST STRIP) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8840)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3037072' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3037072' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3037072
plausibleUnitConceptIds = 8840
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3037072
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8840' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8840, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3037072
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 4151358 (HEMATOCRIT DETERMINATION) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (44777604,8554,8523)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'4151358' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_4151358' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 4151358
plausibleUnitConceptIds = 44777604,8554,8523
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 4151358
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('44777604,8554,8523' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (44777604,8554,8523, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 4151358
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 4194332 (MONOCYTE COUNT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8784,8848,8961,9444)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'4194332' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_4194332' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 4194332
plausibleUnitConceptIds = 8784,8848,8961,9444
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 4194332
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8784,8848,8961,9444' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8784,8848,8961,9444, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 4194332
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3001123 (PLATELET MEAN VOLUME [ENTITIC VOLUME] IN BLOOD) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8583)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3001123' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3001123' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3001123
plausibleUnitConceptIds = 8583
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3001123
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8583' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8583, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3001123
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3012888 (DIASTOLIC BLOOD PRESSURE) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8876)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3012888' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3012888' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3012888
plausibleUnitConceptIds = 8876
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3012888
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8876' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8876, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3012888
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3013707 (ERYTHROCYTE SEDIMENTATION RATE BY WESTERGREN METHOD) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8752)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3013707' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3013707' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3013707
plausibleUnitConceptIds = 8752
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3013707
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8752' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8752, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3013707
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3037511 (LYMPHOCYTES/100 LEUKOCYTES IN BLOOD BY AUTOMATED COUNT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8554)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3037511' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3037511' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3037511
plausibleUnitConceptIds = 8554
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3037511
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8554' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8554, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3037511
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3040168 (IMMATURE GRANULOCYTES [#/VOLUME] IN BLOOD) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8848,8961,9444)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3040168' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3040168' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3040168
plausibleUnitConceptIds = 8848,8961,9444
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3040168
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8848,8961,9444' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8848,8961,9444, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3040168
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 4097430 (SODIUM MEASUREMENT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8753,9557)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'4097430' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_4097430' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 4097430
plausibleUnitConceptIds = 8753,9557
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 4097430
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8753,9557' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8753,9557, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 4097430
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3005424 (BODY SURFACE AREA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8617)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3005424' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3005424' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3005424
plausibleUnitConceptIds = 8617
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3005424
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8617' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8617, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3005424
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3013603 (PROSTATE SPECIFIC AG [MASS/VOLUME] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8748,8842)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3013603' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3013603' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3013603
plausibleUnitConceptIds = 8748,8842
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3013603
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8748,8842' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8748,8842, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3013603
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3020509 (ALBUMIN/GLOBULIN [MASS RATIO] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8523,8554,8596,-1)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3020509' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3020509' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3020509
plausibleUnitConceptIds = 8523,8554,8596,-1
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3020509
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8523,8554,8596,-1' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8523,8554,8596,-1, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3020509
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3036277 (BODY HEIGHT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8582,9327,9330,9546)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3036277' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3036277' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3036277
plausibleUnitConceptIds = 8582,9327,9330,9546
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3036277
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8582,9327,9330,9546' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8582,9327,9330,9546, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3036277
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 4301868 (PULSE RATE) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8483,8541,8581)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'4301868' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_4301868' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 4301868
plausibleUnitConceptIds = 8483,8541,8581
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 4301868
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8483,8541,8581' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8483,8541,8581, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 4301868
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 40762636 (BODY MASS INDEX (BMI) [PERCENTILE]) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8554)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'40762636' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_40762636' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 40762636
plausibleUnitConceptIds = 8554
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 40762636
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8554' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8554, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 40762636
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 40765040 (25-HYDROXYVITAMIN D3+25-HYDROXYVITAMIN D2 [MASS/VOLUME] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8842,8845)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'40765040' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_40765040' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 40765040
plausibleUnitConceptIds = 8842,8845
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 40765040
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8842,8845' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8842,8845, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 40765040
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3024386 (PLATELET MEAN VOLUME [ENTITIC VOLUME] IN BLOOD BY REES-ECKER) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8583)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3024386' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3024386' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3024386
plausibleUnitConceptIds = 8583
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3024386
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8583' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8583, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3024386
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3009201 (THYROTROPIN [UNITS/VOLUME] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (44777578,8719,9040,9093,8860)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3009201' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3009201' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3009201
plausibleUnitConceptIds = 44777578,8719,9040,9093,8860
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3009201
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('44777578,8719,9040,9093,8860' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (44777578,8719,9040,9093,8860, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3009201
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3024731 (MCV [ENTITIC VOLUME]) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8583)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3024731' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3024731' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3024731
plausibleUnitConceptIds = 8583
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3024731
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8583' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8583, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3024731
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3050479 (IMMATURE GRANULOCYTES/100 LEUKOCYTES IN BLOOD) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8554,-1)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3050479' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3050479' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3050479
plausibleUnitConceptIds = 8554,-1
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3050479
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8554,-1' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8554,-1, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3050479
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 4012479 (LOW DENSITY LIPOPROTEIN CHOLESTEROL MEASUREMENT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8636,8753,8840)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'4012479' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_4012479' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 4012479
plausibleUnitConceptIds = 8636,8753,8840
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 4012479
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8636,8753,8840' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8636,8753,8840, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 4012479
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 4152194 (SYSTOLIC BLOOD PRESSURE) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8876)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'4152194' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_4152194' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 4152194
plausibleUnitConceptIds = 8876
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 4152194
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8876' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8876, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 4152194
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 37393840 (HAEMATOCRIT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (44777604,8523,8554,-1)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'37393840' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_37393840' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 37393840
plausibleUnitConceptIds = 44777604,8523,8554,-1
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 37393840
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('44777604,8523,8554,-1' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (44777604,8523,8554,-1, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 37393840
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3000593 (COBALAMIN (VITAMIN B12) [MASS/VOLUME] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8845,8725)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3000593' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3000593' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3000593
plausibleUnitConceptIds = 8845,8725
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3000593
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8845,8725' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8845,8725, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3000593
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3002888 (ERYTHROCYTE DISTRIBUTION WIDTH [ENTITIC VOLUME]) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8583)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3002888' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3002888' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3002888
plausibleUnitConceptIds = 8583
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3002888
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8583' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8583, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3002888
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3010910 (ERYTHROCYTES [#/VOLUME] IN BODY FLUID) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8647,8785,8815,8931)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3010910' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3010910' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3010910
plausibleUnitConceptIds = 8647,8785,8815,8931
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3010910
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8647,8785,8815,8931' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8647,8785,8815,8931, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3010910
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3013290 (CARBON DIOXIDE [PARTIAL PRESSURE] IN BLOOD) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8876)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3013290' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3013290' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3013290
plausibleUnitConceptIds = 8876
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3013290
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8876' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8876, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3013290
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3027970 (GLOBULIN [MASS/VOLUME] IN SERUM BY CALCULATION) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8636,8713,8950)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3027970' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3027970' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3027970
plausibleUnitConceptIds = 8636,8713,8950
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3027970
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8636,8713,8950' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8636,8713,8950, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3027970
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 4239408 (HEART RATE) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8483,8541,8581)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'4239408' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_4239408' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 4239408
plausibleUnitConceptIds = 8483,8541,8581
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 4239408
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8483,8541,8581' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8483,8541,8581, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 4239408
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3010813 (LEUKOCYTES [#/VOLUME] IN BLOOD) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (44777588,8848,8961,9444,8647)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3010813' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3010813' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3010813
plausibleUnitConceptIds = 44777588,8848,8961,9444,8647
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3010813
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('44777588,8848,8961,9444,8647' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (44777588,8848,8961,9444,8647, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3010813
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3023103 (POTASSIUM [MOLES/VOLUME] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8753,9557)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3023103' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3023103' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3023103
plausibleUnitConceptIds = 8753,9557
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3023103
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8753,9557' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8753,9557, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3023103
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 4030871 (RED BLOOD CELL COUNT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8734,8815,8931,9444,9445)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'4030871' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_4030871' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 4030871
plausibleUnitConceptIds = 8734,8815,8931,9444,9445
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 4030871
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8734,8815,8931,9444,9445' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8734,8815,8931,9444,9445, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 4030871
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 4154790 (DIASTOLIC BLOOD PRESSURE) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8876)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'4154790' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_4154790' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 4154790
plausibleUnitConceptIds = 8876
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 4154790
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8876' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8876, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 4154790
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 4217013 (SYSTOLIC ARTERIAL PRESSURE) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8876)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'4217013' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_4217013' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 4217013
plausibleUnitConceptIds = 8876
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 4217013
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8876' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8876, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 4217013
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3001318 (CHOLESTEROL.TOTAL/CHOLESTEROL IN HDL [PERCENTILE]) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8554,8596,-1)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3001318' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3001318' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3001318
plausibleUnitConceptIds = 8554,8596,-1
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3001318
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8554,8596,-1' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8554,8596,-1, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3001318
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3004249 (SYSTOLIC BLOOD PRESSURE) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8876)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3004249' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3004249' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3004249
plausibleUnitConceptIds = 8876
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3004249
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8876' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8876, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3004249
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3009596 (CHOLESTEROL IN VLDL [MASS/VOLUME] IN SERUM OR PLASMA BY CALCULATION) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8576,8840)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3009596' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3009596' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3009596
plausibleUnitConceptIds = 8576,8840
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3009596
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8576,8840' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8576,8840, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3009596
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3025315 (BODY WEIGHT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8739,9346,9373,9529)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3025315' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3025315' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3025315
plausibleUnitConceptIds = 8739,9346,9373,9529
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3025315
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8739,9346,9373,9529' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8739,9346,9373,9529, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3025315
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3053283 (GLOMERULAR FILTRATION RATE/1.73 SQ M.PREDICTED AMONG BLACKS [VOLUME RATE/AREA] IN SERUM, PLASMA OR BLOOD BY CREATININE-BASED FORMULA (MDRD)) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (720870,8795)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3053283' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3053283' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3053283
plausibleUnitConceptIds = 720870,8795
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3053283
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('720870,8795' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (720870,8795, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3053283
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 4008265 (TOTAL CHOLESTEROL MEASUREMENT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8736,8753,8840)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'4008265' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_4008265' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 4008265
plausibleUnitConceptIds = 8736,8753,8840
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 4008265
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8736,8753,8840' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8736,8753,8840, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 4008265
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 36303797 (GLOMERULAR FILTRATION RATE/1.73 SQ M.PREDICTED AMONG NON-BLACKS [VOLUME RATE/AREA] IN SERUM, PLASMA OR BLOOD BY CREATININE-BASED FORMULA (CKD-EPI)) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (720870,8795)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'36303797' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_36303797' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 36303797
plausibleUnitConceptIds = 720870,8795
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 36303797
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('720870,8795' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (720870,8795, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 36303797
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 37398460 (SERUM ALKALINE PHOSPHATASE LEVEL) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (32995,8645,8923)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'37398460' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_37398460' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 37398460
plausibleUnitConceptIds = 32995,8645,8923
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 37398460
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('32995,8645,8923' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (32995,8645,8923, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 37398460
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3013682 (UREA NITROGEN [MASS/VOLUME] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8840)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3013682' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3013682' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3013682
plausibleUnitConceptIds = 8840
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3013682
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8840' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8840, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3013682
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3026361 (ERYTHROCYTES [#/VOLUME] IN BLOOD) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (32706,8785,8815,8931)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3026361' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3026361' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3026361
plausibleUnitConceptIds = 32706,8785,8815,8931
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3026361
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('32706,8785,8815,8931' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (32706,8785,8815,8931, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3026361
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3027018 (HEART RATE) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8483,8541,-1)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3027018' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3027018' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3027018
plausibleUnitConceptIds = 8483,8541,-1
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3027018
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8483,8541,-1' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8483,8541,-1, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3027018
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 4013965 (OXYGEN SATURATION MEASUREMENT, ARTERIAL) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8554)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'4013965' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_4013965' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 4013965
plausibleUnitConceptIds = 8554
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 4013965
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8554' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8554, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 4013965
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3013429 (BASOPHILS [#/VOLUME] IN BLOOD BY AUTOMATED COUNT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8784,8816,8848,8961,9436,9444)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3013429' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3013429' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3013429
plausibleUnitConceptIds = 8784,8816,8848,8961,9436,9444
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3013429
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8784,8816,8848,8961,9436,9444' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8784,8816,8848,8961,9436,9444, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3013429
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3023599 (MCV [ENTITIC VOLUME] BY AUTOMATED COUNT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8583)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3023599' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3023599' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3023599
plausibleUnitConceptIds = 8583
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3023599
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8583' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8583, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3023599
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3036588 (NEUTROPHIL CYTOPLASMIC AB.PERINUCLEAR [PRESENCE] IN SERUM) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8525,-1)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3036588' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3036588' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3036588
plausibleUnitConceptIds = 8525,-1
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3036588
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8525,-1' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8525,-1, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3036588
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 4298431 (WHITE BLOOD CELL COUNT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8848,8961,9444)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'4298431' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_4298431' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 4298431
plausibleUnitConceptIds = 8848,8961,9444
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 4298431
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8848,8961,9444' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8848,8961,9444, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 4298431
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3017732 (NEUTROPHILS [#/VOLUME] IN BLOOD) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8848,8961,9444)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3017732' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3017732' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3017732
plausibleUnitConceptIds = 8848,8961,9444
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3017732
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8848,8961,9444' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8848,8961,9444, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3017732
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3024561 (ALBUMIN [MASS/VOLUME] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8636,8713)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3024561' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3024561' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3024561
plausibleUnitConceptIds = 8636,8713
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3024561
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8636,8713' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8636,8713, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3024561
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3034639 (HEMOGLOBIN A1C [MASS/VOLUME] IN BLOOD) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8713,8840,9579,8923)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3034639' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3034639' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3034639
plausibleUnitConceptIds = 8713,8840,9579,8923
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3034639
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8713,8840,9579,8923' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8713,8840,9579,8923, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3034639
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3013650 (NEUTROPHILS [#/VOLUME] IN BLOOD BY AUTOMATED COUNT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8784,8848,8961,9444,8647)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3013650' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3013650' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3013650
plausibleUnitConceptIds = 8784,8848,8961,9444,8647
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3013650
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8784,8848,8961,9444,8647' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8784,8848,8961,9444,8647, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3013650
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3021886 (GLOBULIN [MASS/VOLUME] IN SERUM) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8636,8713,8950)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3021886' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3021886' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3021886
plausibleUnitConceptIds = 8636,8713,8950
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3021886
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8636,8713,8950' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8636,8713,8950, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3021886
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 4254663 (LYMPHOCYTE COUNT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8848,9444,8961)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'4254663' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_4254663' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 4254663
plausibleUnitConceptIds = 8848,9444,8961
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 4254663
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8848,9444,8961' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8848,9444,8961, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 4254663
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3001420 (MAGNESIUM [MASS/VOLUME] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8840)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3001420' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3001420' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3001420
plausibleUnitConceptIds = 8840
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3001420
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8840' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8840, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3001420
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3007461 (PLATELETS [#/VOLUME] IN BLOOD) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8848,8961,9444,32706)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3007461' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3007461' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3007461
plausibleUnitConceptIds = 8848,8961,9444,32706
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3007461
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8848,8961,9444,32706' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8848,8961,9444,32706, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3007461
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3012030 (MCH [ENTITIC MASS] BY AUTOMATED COUNT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8564)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3012030' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3012030' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3012030
plausibleUnitConceptIds = 8564
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3012030
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8564' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8564, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3012030
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 40764999 (GLOMERULAR FILTRATION RATE/1.73 SQ M.PREDICTED [VOLUME RATE/AREA] IN SERUM, PLASMA OR BLOOD BY CREATININE-BASED FORMULA (CKD-EPI)) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (720870,8795)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'40764999' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_40764999' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 40764999
plausibleUnitConceptIds = 720870,8795
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 40764999
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('720870,8795' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (720870,8795, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 40764999
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3008893 (TESTOSTERONE [MASS/VOLUME] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8817,8842)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3008893' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3008893' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3008893
plausibleUnitConceptIds = 8817,8842
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3008893
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8817,8842' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8817,8842, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3008893
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3016723 (CREATININE [MASS/VOLUME] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8840,8749)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3016723' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3016723' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3016723
plausibleUnitConceptIds = 8840,8749
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3016723
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8840,8749' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8840,8749, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3016723
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3026910 (GAMMA GLUTAMYL TRANSFERASE [ENZYMATIC ACTIVITY/VOLUME] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8645,8923)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3026910' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3026910' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3026910
plausibleUnitConceptIds = 8645,8923
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3026910
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8645,8923' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8645,8923, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3026910
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3033575 (MONOCYTES [#/VOLUME] IN BLOOD BY AUTOMATED COUNT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8784,8816,8848,8961,9436,9444)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3033575' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3033575' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3033575
plausibleUnitConceptIds = 8784,8816,8848,8961,9436,9444
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3033575
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8784,8816,8848,8961,9436,9444' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8784,8816,8848,8961,9436,9444, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3033575
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3041084 (IMMATURE GRANULOCYTES [#/VOLUME] IN BLOOD BY AUTOMATED COUNT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8848,8961,9444)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3041084' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3041084' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3041084
plausibleUnitConceptIds = 8848,8961,9444
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3041084
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8848,8961,9444' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8848,8961,9444, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3041084
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 4184637 (HEMOGLOBIN A1C MEASUREMENT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8554,8632,8737,9579)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'4184637' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_4184637' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 4184637
plausibleUnitConceptIds = 8554,8632,8737,9579
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 4184637
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8554,8632,8737,9579' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8554,8632,8737,9579, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 4184637
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 4313591 (RESPIRATORY RATE) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8483,8541)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'4313591' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_4313591' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 4313591
plausibleUnitConceptIds = 8483,8541
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 4313591
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8483,8541' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8483,8541, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 4313591
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 37393851 (MCV - MEAN CORPUSCULAR VOLUME) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8583)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'37393851' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_37393851' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 37393851
plausibleUnitConceptIds = 8583
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 37393851
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8583' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8583, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 37393851
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 1619025 (GLOMERULAR FILTRATION RATE/1.73 SQ M.PREDICTED [VOLUME RATE/AREA] IN SERUM, PLASMA OR BLOOD BY CREATININE-BASED FORMULA (CKD-EPI 2021)) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (720870,8795)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'1619025' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_1619025' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 1619025
plausibleUnitConceptIds = 720870,8795
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 1619025
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('720870,8795' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (720870,8795, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 1619025
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3013869 (BASOPHILS/100 LEUKOCYTES IN BLOOD BY AUTOMATED COUNT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8554)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3013869' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3013869' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3013869
plausibleUnitConceptIds = 8554
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3013869
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8554' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8554, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3013869
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3035472 (ALBUMIN/PROTEIN.TOTAL IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8554,-1)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3035472' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3035472' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3035472
plausibleUnitConceptIds = 8554,-1
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3035472
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8554,-1' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8554,-1, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3035472
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3039000 (ANION GAP IN BLOOD) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8753,9557)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3039000' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3039000' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3039000
plausibleUnitConceptIds = 8753,9557
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3039000
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8753,9557' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8753,9557, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3039000
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3000905 (LEUKOCYTES [#/VOLUME] IN BLOOD BY AUTOMATED COUNT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8816,8848,8961,9436,9444)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3000905' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3000905' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3000905
plausibleUnitConceptIds = 8816,8848,8961,9436,9444
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3000905
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8816,8848,8961,9436,9444' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8816,8848,8961,9436,9444, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3000905
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3015632 (CARBON DIOXIDE, TOTAL [MOLES/VOLUME] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8753,9557)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3015632' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3015632' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3015632
plausibleUnitConceptIds = 8753,9557
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3015632
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8753,9557' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8753,9557, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3015632
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3032710 (CALCIUM.IONIZED/CALCIUM.TOTAL CORRECTED FOR ALBUMIN IN BLOOD) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8554,-1)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3032710' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3032710' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3032710
plausibleUnitConceptIds = 8554,-1
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3032710
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8554,-1' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8554,-1, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3032710
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 4197971 (HBA1C MEASUREMENT (DCCT ALIGNED)) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8554,8632,8737)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'4197971' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_4197971' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 4197971
plausibleUnitConceptIds = 8554,8632,8737
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 4197971
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8554,8632,8737' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8554,8632,8737, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 4197971
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 42869452 (IMMATURE GRANULOCYTES/100 LEUKOCYTES IN BLOOD BY AUTOMATED COUNT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8554,-1)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'42869452' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_42869452' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 42869452
plausibleUnitConceptIds = 8554,-1
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 42869452
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8554,-1' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8554,-1, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 42869452
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3002109 (CHOLESTEROL IN LDL/CHOLESTEROL IN HDL [MASS RATIO] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8523,8596,8606,-1)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3002109' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3002109' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3002109
plausibleUnitConceptIds = 8523,8596,8606,-1
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3002109
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8523,8596,8606,-1' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8523,8596,8606,-1, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3002109
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3004327 (LYMPHOCYTES [#/VOLUME] IN BLOOD BY AUTOMATED COUNT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8784,8816,8848,8961,9436,9444)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3004327' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3004327' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3004327
plausibleUnitConceptIds = 8784,8816,8848,8961,9436,9444
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3004327
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8784,8816,8848,8961,9436,9444' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8784,8816,8848,8961,9436,9444, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3004327
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3006322 (ORAL TEMPERATURE) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (586323)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3006322' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3006322' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3006322
plausibleUnitConceptIds = 586323
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3006322
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('586323' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (586323, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3006322
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3008342 (NEUTROPHILS/100 LEUKOCYTES IN BLOOD BY AUTOMATED COUNT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8554)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3008342' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3008342' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3008342
plausibleUnitConceptIds = 8554
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3008342
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8554' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8554, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3008342
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3020630 (PROTEIN [MASS/VOLUME] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8636,8713)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3020630' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3020630' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3020630
plausibleUnitConceptIds = 8636,8713
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3020630
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8636,8713' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8636,8713, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3020630
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3001122 (FERRITIN [MASS/VOLUME] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8748,8842)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3001122' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3001122' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3001122
plausibleUnitConceptIds = 8748,8842
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3001122
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8748,8842' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8748,8842, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3001122
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3009542 (HEMATOCRIT [VOLUME FRACTION] OF BLOOD) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8554)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3009542' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3009542' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3009542
plausibleUnitConceptIds = 8554
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3009542
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8554' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8554, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3009542
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3010189 (EPITHELIAL CELLS [#/AREA] IN URINE SEDIMENT BY MICROSCOPY HIGH POWER FIELD) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8765,8786)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3010189' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3010189' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3010189
plausibleUnitConceptIds = 8765,8786
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3010189
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8765,8786' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8765,8786, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3010189
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3010457 (EOSINOPHILS/100 LEUKOCYTES IN BLOOD BY AUTOMATED COUNT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8554)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3010457' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3010457' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3010457
plausibleUnitConceptIds = 8554
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3010457
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8554' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8554, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3010457
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 4192368 (PLATELET MEAN VOLUME DETERMINATION) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8583)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'4192368' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_4192368' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 4192368
plausibleUnitConceptIds = 8583
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 4192368
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8583' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8583, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 4192368
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3014576 (CHLORIDE [MOLES/VOLUME] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8753,9557)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3014576' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3014576' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3014576
plausibleUnitConceptIds = 8753,9557
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3014576
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8753,9557' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8753,9557, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3014576
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3024128 (BILIRUBIN.TOTAL [MASS/VOLUME] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8840,8749)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3024128' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3024128' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3024128
plausibleUnitConceptIds = 8840,8749
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3024128
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8840,8749' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8840,8749, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3024128
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3018311 (UREA NITROGEN/CREATININE [MASS RATIO] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8523,8554,8596,-1)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3018311' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3018311' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3018311
plausibleUnitConceptIds = 8523,8554,8596,-1
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3018311
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8523,8554,8596,-1' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8523,8554,8596,-1, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3018311
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3020891 (BODY TEMPERATURE) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (586323,9289)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3020891' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3020891' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3020891
plausibleUnitConceptIds = 586323,9289
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3020891
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('586323,9289' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (586323,9289, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3020891
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3037556 (URATE [MASS/VOLUME] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8840,8923)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3037556' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3037556' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3037556
plausibleUnitConceptIds = 8840,8923
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3037556
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8840,8923' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8840,8923, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3037556
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 37399332 (SERUM TSH (THYROID STIMULATING HORMONE) LEVEL) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (44777578,9040)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'37399332' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_37399332' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 37399332
plausibleUnitConceptIds = 44777578,9040
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 37399332
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('44777578,9040' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (44777578,9040, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 37399332
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3011904 (PHOSPHATE [MASS/VOLUME] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8840)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3011904' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3011904' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3011904
plausibleUnitConceptIds = 8840
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3011904
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8840' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8840, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3011904
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3019897 (ERYTHROCYTE DISTRIBUTION WIDTH [RATIO] BY AUTOMATED COUNT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8554,-1)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3019897' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3019897' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3019897
plausibleUnitConceptIds = 8554,-1
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3019897
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8554,-1' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8554,-1, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3019897
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3025255 (BACTERIA [#/AREA] IN URINE SEDIMENT BY MICROSCOPY HIGH POWER FIELD) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8786)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3025255' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3025255' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3025255
plausibleUnitConceptIds = 8786
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3025255
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8786' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8786, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3025255
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 4076704 (HIGH DENSITY LIPOPROTEIN MEASUREMENT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8753,8840)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'4076704' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_4076704' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 4076704
plausibleUnitConceptIds = 8753,8840
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 4076704
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8753,8840' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8753,8840, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 4076704
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 4172647 (BASOPHIL COUNT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8848,8961,9444)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'4172647' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_4172647' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 4172647
plausibleUnitConceptIds = 8848,8961,9444
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 4172647
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8848,8961,9444' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8848,8961,9444, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 4172647
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 37393531 (SERUM ALANINE AMINOTRANSFERASE LEVEL) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (32995,8645,8923)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'37393531' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_37393531' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 37393531
plausibleUnitConceptIds = 32995,8645,8923
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 37393531
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('32995,8645,8923' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (32995,8645,8923, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 37393531
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 40771529 (IMMATURE GRANULOCYTES/100 LEUKOCYTES IN BODY FLUID) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8554,-1)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'40771529' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_40771529' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 40771529
plausibleUnitConceptIds = 8554,-1
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 40771529
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8554,-1' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8554,-1, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 40771529
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3000034 (MICROALBUMIN [MASS/VOLUME] IN URINE) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8576,8723,8751,8840,8859,8636)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3000034' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3000034' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3000034
plausibleUnitConceptIds = 8576,8723,8751,8840,8859,8636
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3000034
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8576,8723,8751,8840,8859,8636' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8576,8723,8751,8840,8859,8636, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3000034
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3035124 (ERYTHROCYTES [#/AREA] IN URINE SEDIMENT BY MICROSCOPY HIGH POWER FIELD) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8786,8889)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3035124' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3035124' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3035124
plausibleUnitConceptIds = 8786,8889
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3035124
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8786,8889' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8786,8889, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3035124
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3002030 (LYMPHOCYTES/100 LEUKOCYTES IN BLOOD) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8554,8848)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3002030' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3002030' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3002030
plausibleUnitConceptIds = 8554,8848
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3002030
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8554,8848' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8554,8848, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3002030
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3019170 (THYROTROPIN [UNITS/VOLUME] IN SERUM OR PLASMA BY DETECTION LIMIT <= 0.005 MIU/L) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (44777578,8719,8860,9040,9093,9550)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3019170' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3019170' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3019170
plausibleUnitConceptIds = 44777578,8719,8860,9040,9093,9550
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3019170
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('44777578,8719,8860,9040,9093,9550' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (44777578,8719,8860,9040,9093,9550, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3019170
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3020149 (25-HYDROXYVITAMIN D3 [MASS/VOLUME] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8842)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3020149' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3020149' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3020149
plausibleUnitConceptIds = 8842
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3020149
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8842' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8842, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3020149
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3022174 (LEUKOCYTES [#/VOLUME] IN BODY FLUID) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8647,8784,8785,8848,8961)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3022174' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3022174' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3022174
plausibleUnitConceptIds = 8647,8784,8785,8848,8961
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3022174
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8647,8784,8785,8848,8961' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8647,8784,8785,8848,8961, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3022174
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3024929 (PLATELETS [#/VOLUME] IN BLOOD BY AUTOMATED COUNT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8816,8848,8961,9436,9444)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3024929' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3024929' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3024929
plausibleUnitConceptIds = 8816,8848,8961,9436,9444
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3024929
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8816,8848,8961,9436,9444' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8816,8848,8961,9436,9444, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3024929
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3049187 (GLOMERULAR FILTRATION RATE/1.73 SQ M.PREDICTED AMONG NON-BLACKS [VOLUME RATE/AREA] IN SERUM, PLASMA OR BLOOD BY CREATININE-BASED FORMULA (MDRD)) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (720870,8795)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3049187' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3049187' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3049187
plausibleUnitConceptIds = 720870,8795
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3049187
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('720870,8795' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (720870,8795, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3049187
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 37398676 (BASOPHIL COUNT) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8848)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'37398676' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_37398676' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 37398676
plausibleUnitConceptIds = 8848
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 37398676
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8848' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8848, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 37398676
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 4112223 (BUN/CREATININE RATIO) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8523,8596,-1)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'4112223' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_4112223' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 4112223
plausibleUnitConceptIds = 8523,8596,-1
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 4112223
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8523,8596,-1' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8523,8596,-1, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 4112223
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3017250 (CREATININE [MASS/VOLUME] IN URINE) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8840,8636)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3017250' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3017250' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3017250
plausibleUnitConceptIds = 8840,8636
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3017250
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8840,8636' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8840,8636, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3017250
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 4191837 (CALCULATED LDL CHOLESTEROL LEVEL) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8840,8753)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'4191837' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_4191837' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 4191837
plausibleUnitConceptIds = 8840,8753
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 4191837
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8840,8753' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8840,8753, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 4191837
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3022096 (BASOPHILS/100 LEUKOCYTES IN BLOOD) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8554)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3022096' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3022096' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3022096
plausibleUnitConceptIds = 8554
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3022096
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8554' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8554, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3022096
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3034485 (ALBUMIN/CREATININE [MASS RATIO] IN URINE) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8523,8723,8838,9017,9072)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3034485' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3034485' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3034485
plausibleUnitConceptIds = 8523,8723,8838,9017,9072
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3034485
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8523,8723,8838,9017,9072' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8523,8723,8838,9017,9072, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3034485
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 44790183 (GLOMERULAR FILTRATION RATE TESTING) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (720870,8795)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'44790183' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_44790183' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 44790183
plausibleUnitConceptIds = 720870,8795
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 44790183
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('720870,8795' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (720870,8795, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 44790183
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3002400 (IRON [MASS/VOLUME] IN SERUM OR PLASMA) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8749,8837)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3002400' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3002400' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3002400
plausibleUnitConceptIds = 8749,8837
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3002400
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8749,8837' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8749,8837, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3002400
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

/*********
SQL to insert individual DQD results directly into output table, rather than waiting until collecting all results.
Note that this  does not include information about SQL errors or performance
**********/
INSERT INTO dataform.dqdashboard_results
 WITH cte_all as (
  /*********
SQL to create query for insertion into results table. These may be unioned together prior to insert.
Note that this does not include information about SQL errors or performance.
**********/
select 
  cte.num_violated_rows
  ,cte.pct_violated_rows
  ,cte.num_denominator_rows
  ,'' as execution_time
  ,'' as query_text
  ,'plausibleUnitConceptIds' as check_name
  ,'CONCEPT' as check_level
  ,'The number and percent of records for a given CONCEPT_ID 3003338 (MCHC [MASS/VOLUME]) with implausible units (i.e., UNIT_CONCEPT_ID NOT IN  (8713,8753)).' as check_description
  ,'MEASUREMENT' as cdm_table_name
  ,'MEASUREMENT_CONCEPT_ID' as cdm_field_name
  ,'3003338' as concept_id
  ,'NA' as unit_concept_id
  ,'concept_plausible_unit_concept_ids.sql' as sql_file
  ,'Plausibility' as category
  ,'Atemporal' as subcategory
  ,'Verification' as context
  ,'' as warning
  ,'' as error
  ,'concept_plausibleunitconceptids_measurement_measurement_concept_id_3003338' as checkid
  ,0 as is_error
  ,0 as not_applicable
  ,case when (cte.pct_violated_rows * 100) > 5 then 1 else 0 end as failed
  ,case when (cte.pct_violated_rows * 100) <= 5 then 1 else 0 end as passed
  ,null as not_applicable_reason
  ,5 as threshold_value
  ,null as notes_value
from (
  /*********
CONCEPT LEVEL check:
PLAUSIBLE_UNIT_CONCEPT_IDS - find any MEASUREMENT records that are associated with an incorrect UNIT_CONCEPT_ID
Parameters used in this template:
cdmDatabaseSchema = dataform
cdmTableName = MEASUREMENT
cdmFieldName = MEASUREMENT_CONCEPT_ID
conceptId = 3003338
plausibleUnitConceptIds = 8713,8753
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
	  count(*) as num_violated_rows
	from
	(
		/*violatedRowsBegin*/
		select 
		  m.* 
		from dataform.measurement m
		where m.measurement_concept_id = 3003338
			and m.unit_concept_id is not null
			/* '-1' stands for the cases when the only plausible unit_concept_id is no unit 0 prevents flagging rows with a unit_concept_id of 0, which are checked in standardConceptRecordCompleteness */
		  	and (
				('8713,8753' = '-1' and m.unit_concept_id != 0) 
    			or m.unit_concept_id not in (8713,8753, 0)
			)
		/*violatedRowsEnd*/
	) violated_rows
) violated_row_count,
( 
	select 
	  count(*) as num_rows
	from dataform.measurement m
	where m.measurement_concept_id = 3003338
	and (unit_concept_id != 0 or unit_concept_id is null)
) denominator
) cte
)
 SELECT *
from cte_all
;

