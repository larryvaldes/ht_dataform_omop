{{
  config(
    description='OMOP CDM v5.4 Concept table — the central vocabulary table containing every clinical concept across all OHDSI vocabularies.'
  )
}}

from {{ ref('stg_raw_athena__concept') }}
|> select
    concept_id,
    concept_name,
    domain_id,
    vocabulary_id,
    concept_class_id,
    standard_concept,
    concept_code,
    valid_start_date,
    valid_end_date,
    invalid_reason
