{{
  config(
    description='OMOP CDM v5.4 Episode table. Maps HealthTree AI Lines of Therapy '
                'into Treatment Regimen, Cancer Drug Treatment, and Cancer Surgery episodes.'
  )
}}

from {{ ref('int_omop__episode') }}
|> select
    episode_id,
    person_id,
    episode_concept_id,
    episode_start_date,
    episode_start_datetime,
    episode_end_date,
    episode_end_datetime,
    episode_object_concept_id,
    episode_type_concept_id,
    episode_source_value,
    episode_source_concept_id,
    episode_parent_id,
    episode_number
