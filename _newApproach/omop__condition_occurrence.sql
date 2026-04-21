{{
  config(
    description='OMOP CDM v5.4 Condition Occurrence table.'
  )
}}

(from {{ ref('int_omop__condition_occurrence') }})
|> union all by name (from {{ ref('int_omop__condition_occurrence_from_allergy_intolerance') }})

|> where condition_start_date > '1902-01-01'
    and condition_start_date <= current_date()
|> select
    condition_occurrence_id,
    person_id,
    condition_concept_id,
    condition_start_date,
    condition_start_datetime,
    condition_end_date,
    condition_end_datetime,
    condition_type_concept_id,
    condition_status_concept_id,
    stop_reason,
    provider_id,
    visit_occurrence_id,
    visit_detail_id,
    condition_source_value,
    condition_source_concept_id,
    condition_status_source_value
