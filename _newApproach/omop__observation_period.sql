{{
  config(
    materialized='table',
    description='OMOP CDM v5.4 Observation Period — derived from the earliest and latest '
                'clinical event dates per person across all OMOP clinical tables.'
  )
}}

with

-- Collect all event dates (start AND end) from every clinical table.
-- Including end dates prevents 61% of observation periods from being cut short.
all_event_dates as (
    -- Condition
    (from {{ ref('int_omop__condition_occurrence') }} |> where condition_start_date is not null |> select person_id, condition_start_date as event_date)
    |> union all (from {{ ref('int_omop__condition_occurrence') }} |> where condition_end_date is not null |> select person_id, condition_end_date as event_date)
    |> union all (from {{ ref('int_omop__condition_occurrence_from_allergy_intolerance') }} |> where condition_start_date is not null |> select person_id, condition_start_date as event_date)
    |> union all (from {{ ref('int_omop__condition_occurrence_from_allergy_intolerance') }} |> where condition_end_date is not null |> select person_id, condition_end_date as event_date)
    -- Drug exposure (primary + secondary sources)
    |> union all (from {{ ref('int_omop__drug_exposure') }} |> where drug_exposure_start_date is not null |> select person_id, drug_exposure_start_date as event_date)
    |> union all (from {{ ref('int_omop__drug_exposure') }} |> where drug_exposure_end_date is not null |> select person_id, drug_exposure_end_date as event_date)
    |> union all (from {{ ref('int_omop__drug_exposure_from_immunization') }} |> where drug_exposure_start_date is not null |> select person_id, drug_exposure_start_date as event_date)
    |> union all (from {{ ref('int_omop__drug_exposure_from_immunization') }} |> where drug_exposure_end_date is not null |> select person_id, drug_exposure_end_date as event_date)
    |> union all (from {{ ref('int_omop__drug_exposure_from_procedure') }} |> where drug_exposure_start_date is not null |> select person_id, drug_exposure_start_date as event_date)
    -- Measurement (primary + secondary sources)
    |> union all (from {{ ref('int_omop__measurement') }} |> where measurement_date is not null |> select person_id, measurement_date as event_date)
    |> union all (from {{ ref('int_omop__measurement_from_condition') }} |> where measurement_date is not null |> select person_id, measurement_date as event_date)
    |> union all (from {{ ref('int_omop__measurement_from_procedure') }} |> where measurement_date is not null |> select person_id, measurement_date as event_date)
    |> union all (from {{ ref('int_omop__measurement_from_observation') }} |> where measurement_date is not null |> select person_id, measurement_date as event_date)
    -- Observation (primary + secondary sources)
    |> union all (from {{ ref('int_omop__observation') }} |> where observation_date is not null |> select person_id, observation_date as event_date)
    |> union all (from {{ ref('int_omop__observation_from_condition') }} |> where observation_date is not null |> select person_id, observation_date as event_date)
    |> union all (from {{ ref('int_omop__observation_from_procedure') }} |> where observation_date is not null |> select person_id, observation_date as event_date)
    |> union all (from {{ ref('int_omop__observation_from_allergy_intolerance') }} |> where observation_date is not null |> select person_id, observation_date as event_date)
    -- Note: int_omop__observation_from_person is excluded — it already depends on
    -- omop__observation_period (circular). Those 3 demographics-only persons are
    -- acceptable edge cases with no clinical data.
    |> union all (from {{ ref('int_omop__observation_from_measurement') }} |> where observation_date is not null |> select person_id, observation_date as event_date)
    -- Note
    |> union all (from {{ ref('int_omop__note_from_document_reference') }} |> where note_date is not null |> select person_id, note_date as event_date)
    -- Procedure (primary + secondary sources)
    |> union all (from {{ ref('int_omop__procedure_occurrence') }} |> where procedure_date is not null |> select person_id, procedure_date as event_date)
    |> union all (from {{ ref('int_omop__procedure_from_condition') }} |> where procedure_date is not null |> select person_id, procedure_date as event_date)
    -- Visit
    |> union all (from {{ ref('int_omop__visit_occurrence') }} |> where visit_start_date is not null |> select person_id, visit_start_date as event_date)
    |> union all (from {{ ref('int_omop__visit_occurrence') }} |> where visit_end_date is not null |> select person_id, visit_end_date as event_date)
)

-- Join to person to exclude event dates before the patient's birth year.
-- EHR sentinel dates (1900-01-01, 1901-01-01) are the primary culprit:
-- 76 of 83 Achilles-114 violations come from visits with these placeholder dates.
from all_event_dates
|> as e
|> inner join (from {{ ref('int_omop__person') }} |> select person_id, year_of_birth) as p
    on e.person_id = p.person_id
|> where
    -- Filter out clearly bogus dates
    e.event_date >= '1900-01-01'
    and e.event_date <= current_date()
    -- Exclude events before the person's birth year (Achilles 114)
    and extract(year from e.event_date) >= p.year_of_birth
|> aggregate
    min(e.event_date) as observation_period_start_date,
    max(e.event_date) as observation_period_end_date
    group by e.person_id
|> select
    {{ surrogate_int_id('cast(person_id as string)') }} as observation_period_id,
    person_id,
    observation_period_start_date,
    observation_period_end_date,
    32882 as period_type_concept_id  -- Standard algorithm from EHR (Type Concept)
