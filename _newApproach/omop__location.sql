{{
  config(
    description='OMOP CDM v5.4 Location table — distinct physical addresses from patient records.'
  )
}}

from {{ ref('int_location__patient_address_condense_legacy') }}
|> extend row_number() over (
    partition by location_id
    order by
        -- prefer the most complete address when multiple patients share a location_id
        (case when address_line_1 is not null then 0 else 1 end)
        + (case when city is not null then 0 else 1 end)
        + (case when state is not null then 0 else 1 end)
        + (case when zip is not null then 0 else 1 end)
        + (case when county is not null then 0 else 1 end),
        location_source_value desc
) as _rn
|> where _rn = 1
|> drop _rn
|> as dl
|> left join {{ ref('stg_raw_athena__concept') }} as snomed_country
    on dl.country = snomed_country.concept_name
    and snomed_country.domain_id = 'Geography'
    and snomed_country.vocabulary_id = 'SNOMED'
    and snomed_country.concept_class_id = 'Location'
|> left join {{ ref('int_omop__standard_concept_map') }} as cm
    on snomed_country.concept_id = cm.source_concept_id
    and cm.standard_domain_id = 'Geography'
|> extend
    coalesce(cm.standard_concept_id, 0) as country_concept_id
|> select
    dl.location_id, dl.address_line_1 as address_1, dl.address_line_2 as address_2,
    dl.city, dl.state, dl.zip, dl.county, dl.country,
    dl.latitude, dl.longitude, dl.location_source_value,
    country_concept_id, dl.country_source_value
