{{
  config(
    description='OMOP CDM v5.4 Relationship table — metadata about relationship types used in concept_relationship.'
  )
}}

from {{ ref('stg_raw_athena__relationship') }}
|> select
    relationship_id,
    relationship_name,
    is_hierarchical,
    defines_ancestry,
    reverse_relationship_id,
    relationship_concept_id
