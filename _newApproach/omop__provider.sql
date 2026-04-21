{{
  config(
    description='OMOP CDM v5.4 Provider table. Maps FHIR R4 Practitioner and '
                'PractitionerRole resources into one row per distinct provider with '
                'NPI, gender, specialty (NUCC), and care site when available.'
  )
}}

from {{ ref('int_omop__provider') }}
|> select
    provider_id,
    provider_name,
    npi,
    dea,
    specialty_concept_id,
    care_site_id,
    year_of_birth,
    gender_concept_id,
    provider_source_value,
    specialty_source_value,
    specialty_source_concept_id,
    gender_source_value,
    gender_source_concept_id
