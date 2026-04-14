{{
  config(
    description='OMOP CDM v5.4 Drug Strength table — ingredient-level dosage information for drug concepts.'
  )
}}

from {{ ref('stg_raw_athena__drug_strength') }}
|> select
    drug_concept_id,
    ingredient_concept_id,
    amount_value,
    amount_unit_concept_id,
    numerator_value,
    numerator_unit_concept_id,
    denominator_value,
    denominator_unit_concept_id,
    box_size,
    valid_start_date,
    valid_end_date,
    invalid_reason
