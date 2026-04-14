{{
  config(
    materialized='table',
    description='OMOP CDM v5.4 Observation table.'
  )
}}

-- The main incremental arm stores practitioner_id (FHIR string) rather than provider_id
-- (int64 FK) to avoid accumulating stale FK references when practitioners are deleted from
-- Firestore. The fresh provider join happens here, at the final table rebuild.
with main_obs as (
    from {{ ref('int_omop__observation') }}
    |> drop _loaded_at
    -- Evict stale incremental rows where the source FHIR Observation has since drifted
    -- to the measurement pipeline (e.g. null-category resource gains a LOINC coding).
    -- int_omop__measurement_coded is a TABLE rebuilt every run, so this always reflects
    -- current routing. Mirrors the symmetric eviction in omop__measurement.
    |> where observation_id not in (
        select record_pk from {{ ref('int_omop__measurement_coded') }}
    )
    |> left join {{ ref('int_omop__provider') }} as prov
        on practitioner_id = prov.provider_source_value
    |> select
        observation_id, person_id, observation_concept_id,
        observation_date, observation_datetime, observation_type_concept_id,
        value_as_number, value_as_string, value_as_concept_id,
        qualifier_concept_id, unit_concept_id, prov.provider_id,
        visit_occurrence_id, visit_detail_id,
        observation_source_value, observation_source_concept_id,
        unit_source_value, qualifier_source_value, value_source_value,
        observation_event_id, obs_event_field_concept_id
)

(from main_obs)
|> union all by name (from {{ ref('int_omop__observation_from_condition') }})
|> union all by name (from {{ ref('int_omop__observation_from_procedure') }})
|> union all by name (from {{ ref('int_omop__observation_from_allergy_intolerance') }})
|> union all by name (from {{ ref('int_omop__observation_from_person') }})
|> union all by name (from {{ ref('int_omop__observation_from_measurement') }})

|> where observation_date <= current_date()
    and observation_date > '1902-01-01'
|> select
    observation_id,
    person_id,
    observation_concept_id,
    observation_date,
    observation_datetime,
    observation_type_concept_id,
    value_as_number,
    value_as_string,
    value_as_concept_id,
    qualifier_concept_id,
    unit_concept_id,
    provider_id,
    visit_occurrence_id,
    visit_detail_id,
    observation_source_value,
    observation_source_concept_id,
    unit_source_value,
    qualifier_source_value,
    value_source_value,
    observation_event_id,
    obs_event_field_concept_id
