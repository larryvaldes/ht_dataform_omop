{{
  config(
    description='OMOP CDM v5.4 Metadata — ETL configuration parameters and provenance.'
  )
}}

from (select 1 as _placeholder)
|> extend
    0 as metadata_id,
    0 as metadata_concept_id,
    0 as metadata_type_concept_id,
    'CDM Version' as name,
    'OMOP CDM v5.4' as value_as_string,
    756265 as value_as_concept_id,
    cast(null as float64) as value_as_number,
    current_date() as metadata_date,
    current_timestamp() as metadata_datetime
|> select
    metadata_id, metadata_concept_id, metadata_type_concept_id,
    name, value_as_string, value_as_concept_id, value_as_number,
    metadata_date, metadata_datetime
