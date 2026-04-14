{{
  config(
    description='OMOP CDM v5.4 Domain table — lists all clinical domains that determine which OMOP table a concept populates.'
  )
}}

from {{ ref('stg_raw_athena__domain') }}
|> select
    domain_id,
    domain_name,
    domain_concept_id
