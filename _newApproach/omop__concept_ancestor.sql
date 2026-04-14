{{
  config(
    description='OMOP CDM v5.4 Concept Ancestor table — pre-computed transitive closure of hierarchical relationships between standard concepts.'
  )
}}

from {{ ref('stg_raw_athena__concept_ancestor') }}
|> select
    ancestor_concept_id,
    descendant_concept_id,
    min_levels_of_separation,
    max_levels_of_separation
