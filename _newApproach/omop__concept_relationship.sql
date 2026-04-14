{{
  config(
    description='OMOP CDM v5.4 Concept Relationship table — directed relationships between concepts, including "Maps to" for standard concept mapping.'
  )
}}

from {{ ref('stg_raw_athena__concept_relationship') }}
|> select
    concept_id_1,
    concept_id_2,
    relationship_id,
    valid_start_date,
    valid_end_date,
    invalid_reason
