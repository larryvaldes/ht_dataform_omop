{{
  config(
    description='OMOP CDM v5.4 Care Site table — healthcare facilities derived from EHR organization data.'
  )
}}

from {{ ref('int_facility__organization') }}
|> extend
    -- CMS Place of Service: hospital-based orgs → 8756 (Outpatient Hospital),
    -- independent practices → 8716 (Independent Clinic)
    case organization_category
        when 'Community Oncology' then 8716  -- Independent Clinic
        when 'Sandbox' then 0
        else 8756                            -- Outpatient Hospital
    end as place_of_service_concept_id,
    cast(null as int64) as location_id
|> select
    care_site_id,
    organization_name as care_site_name,
    place_of_service_concept_id,
    location_id,
    organization_id as care_site_source_value,
    organization_category as place_of_service_source_value
