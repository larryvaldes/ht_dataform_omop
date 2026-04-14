{{
  config(
    description='OMOP CDM v5.4 Concept Class table — sub-classifications within vocabularies.'
  )
}}

from {{ ref('stg_raw_athena__concept_class') }}
|> select
    concept_class_id,
    concept_class_name,
    concept_class_concept_id
