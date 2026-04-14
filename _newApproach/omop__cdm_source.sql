{{
  config(
    description='OMOP CDM v5.4 CDM Source — provenance metadata required by OHDSI '
                'Achilles, Data Quality Dashboard, and Atlas.'
  )
}}

from (select 1 as _placeholder)
|> extend
    'HealthTree' as cdm_source_name,
    'HT' as cdm_source_abbreviation,
    'HealthTree Foundation' as cdm_holder,
    'Patient-contributed EHR data from Epic, Cerner, and VA health systems via FHIR R4' as source_description,
    'https://storage.googleapis.com/healthtree-dbt-docs/index.html' as cdm_etl_reference,
    'https://build.fhir.org/ig/HL7/fhir-omop-ig/' as source_documentation_reference,
    current_date() as source_release_date,
    current_date() as cdm_release_date,
    'v5.4' as cdm_version,
    756265 as cdm_version_concept_id,
    (
        select vocabulary_version
        from {{ ref('stg_raw_athena__vocabulary') }}
        where vocabulary_id = 'None'
        order by vocabulary_version
        limit 1
    ) as vocabulary_version
|> select
    cdm_source_name, cdm_source_abbreviation, cdm_holder,
    source_description, cdm_etl_reference, source_documentation_reference,
    source_release_date, cdm_release_date, cdm_version, cdm_version_concept_id,
    vocabulary_version
