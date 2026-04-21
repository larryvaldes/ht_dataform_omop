{{
  config(
    description='OMOP CDM v5.4 Procedure Occurrence table.'
  )
}}

(from {{ ref('int_omop__procedure_occurrence') }})
|> union all by name (from {{ ref('int_omop__procedure_from_condition') }})

|> where procedure_date > '1902-01-01'
    and procedure_date <= current_date()
|> select
    procedure_occurrence_id,
    person_id,
    procedure_concept_id,
    procedure_date,
    procedure_datetime,
    procedure_end_date,
    procedure_end_datetime,
    procedure_type_concept_id,
    modifier_concept_id,
    quantity,
    provider_id,
    visit_occurrence_id,
    visit_detail_id,
    procedure_source_value,
    procedure_source_concept_id,
    modifier_source_value
