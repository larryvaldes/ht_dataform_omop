{{
  config(
    description='OMOP CDM v5.4 source_to_concept_map — maps non-standard source codes '
                'to OMOP standard concepts. Currently contains HL7 demographic mappings '
                '(race, ethnicity, gender) from map__hl7_omop. Expand by adding new '
                'mapping tables as union-all members.'
  )
}}

from {{ ref('map__hl7_omop') }}
|> select
    source_code,
    source_concept_id,
    source_vocabulary_id,
    source_code_description,
    target_concept_id,
    target_vocabulary_id,
    valid_start_date,
    valid_end_date,
    invalid_reason
