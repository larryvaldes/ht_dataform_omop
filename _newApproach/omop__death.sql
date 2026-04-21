{{
  config(
    description='OMOP CDM v5.4 Death table — extracted from FHIR R4 Patient '
                'deceasedBoolean and deceasedDateTime fields.'
  )
}}

from {{ ref('int_omop__death') }}
|> select
    person_id,
    death_date,
    death_datetime,
    death_type_concept_id,
    cause_concept_id,
    cause_source_value,
    cause_source_concept_id
