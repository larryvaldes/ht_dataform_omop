{{
  config(
    description='OMOP CDM v5.4 Vocabulary table — metadata about each loaded vocabulary (SNOMED, RxNorm, LOINC, etc.).'
  )
}}

from {{ ref('stg_raw_athena__vocabulary') }}
|> select
    vocabulary_id,
    vocabulary_name,
    vocabulary_reference,
    vocabulary_version,
    vocabulary_concept_id
