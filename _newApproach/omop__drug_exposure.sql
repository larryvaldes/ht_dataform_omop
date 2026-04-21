{{
  config(
    materialized='table',
    description='OMOP CDM v5.4 Drug Exposure table. Combines MedicationRequest and Immunization sources.'
  )
}}

(from {{ ref('int_omop__drug_exposure') }})
|> union all by name (from {{ ref('int_omop__drug_exposure_from_procedure') }})
|> union all by name (from {{ ref('int_omop__drug_exposure_from_immunization') }})

|> where drug_exposure_start_date > '1902-01-01'
    and drug_exposure_start_date <= current_date()
|> select
    drug_exposure_id,
    person_id,
    drug_concept_id,
    drug_exposure_start_date,
    drug_exposure_start_datetime,
    drug_exposure_end_date,
    drug_exposure_end_datetime,
    verbatim_end_date,
    drug_type_concept_id,
    stop_reason,
    refills,
    quantity,
    days_supply,
    sig,
    route_concept_id,
    lot_number,
    provider_id,
    visit_occurrence_id,
    visit_detail_id,
    drug_source_value,
    drug_source_concept_id,
    route_source_value,
    dose_unit_source_value
