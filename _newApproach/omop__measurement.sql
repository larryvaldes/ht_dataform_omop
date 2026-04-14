{{
  config(
    materialized='table',
    description='OMOP CDM v5.4 Measurement table.'
  )
}}

-- provider_id null rate: ~85% (DATA-613, 2026-03-02)
--   67% — FHIR Observations arrive without performer[0].reference
--         (CERNER/FLATIRON/HEALTH_TREE: 100% missing; OPEN_EPIC: 62%; APPLE: 86%)
--   10% — performer references 97K practitioner IDs with no matching
--         Practitioner resource in Firestore (DATA-650, assigned to EHR connectors)
--    1% — from_condition path: conditions don't carry performer data (expected)

-- The main incremental arm stores practitioner_id (FHIR string) rather than provider_id
-- (int64 FK) to avoid accumulating stale FK references when practitioners are deleted from
-- Firestore. The fresh provider join happens here, at the final table rebuild, so provider_id
-- always reflects the current state of int_omop__provider.
with main_meas as (
    from {{ ref('int_omop__measurement') }}
    |> drop _loaded_at
    |> left join {{ ref('int_omop__provider') }} as prov
        on practitioner_id = prov.provider_source_value
    |> select
        measurement_id, person_id, measurement_concept_id,
        measurement_date, measurement_datetime, measurement_time,
        measurement_type_concept_id, operator_concept_id,
        value_as_number, value_as_concept_id, unit_concept_id,
        range_low, range_high, prov.provider_id,
        visit_occurrence_id, visit_detail_id,
        measurement_source_value, measurement_source_concept_id,
        unit_source_value, unit_source_concept_id, value_source_value,
        measurement_event_id, meas_event_field_concept_id
    -- Evict stale incremental rows where the source FHIR Observation has drifted
    -- to the observation pipeline (category changed after the row was written).
    -- int_omop__observation_mapped is a TABLE so it always reflects current routing.
    |> where measurement_id not in (
        select record_pk from {{ ref('int_omop__observation_mapped') }}
    )
)

(from main_meas)
|> union all by name (from {{ ref('int_omop__measurement_from_condition') }})
|> union all by name (from {{ ref('int_omop__measurement_from_procedure') }})
|> union all by name (from {{ ref('int_omop__measurement_from_observation') }})

|> where measurement_date > '1902-01-01'
    and measurement_date <= current_date()
|> select
    measurement_id,
    person_id,
    measurement_concept_id,
    measurement_date,
    measurement_datetime,
    measurement_time,
    measurement_type_concept_id,
    operator_concept_id,
    value_as_number,
    value_as_concept_id,
    unit_concept_id,
    range_low,
    range_high,
    provider_id,
    visit_occurrence_id,
    visit_detail_id,
    measurement_source_value,
    measurement_source_concept_id,
    unit_source_value,
    unit_source_concept_id,
    value_source_value,
    measurement_event_id,
    meas_event_field_concept_id
