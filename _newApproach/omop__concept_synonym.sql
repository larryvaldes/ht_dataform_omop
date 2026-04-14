{{
  config(
    description='OMOP CDM v5.4 Concept Synonym table — alternative names for concepts across languages.'
  )
}}

from {{ ref('stg_raw_athena__concept_synonym') }}
|> select
    concept_id,
    concept_synonym_name,
    language_concept_id
