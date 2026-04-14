{{
  config(
    description='OMOP CDM v5.4 Cohort Definition — myeloma diagnosis cohorts (MM, SMM, MGUS).'
  )
}}

from (
    select
        {{ surrogate_int_id("'MM'") }} as cohort_definition_id,
        'Multiple Myeloma' as cohort_definition_name,
        'Patients with at least one condition occurrence mapped to a Multiple Myeloma SNOMED concept (excludes SMM and MGUS).' as cohort_definition_description,
        0 as definition_type_concept_id,
        cast(null as string) as cohort_definition_syntax,
        0 as subject_concept_id,
        date('2026-03-02') as cohort_initiation_date
)
|>
union all
(
    select
        {{ surrogate_int_id("'MGUS'") }} as cohort_definition_id,
        'Monoclonal Gammopathy of Undetermined Significance' as cohort_definition_name,
        'Patients with at least one condition occurrence mapped to an MGUS SNOMED concept.' as cohort_definition_description,
        0 as definition_type_concept_id,
        cast(null as string) as cohort_definition_syntax,
        0 as subject_concept_id,
        date('2026-03-02') as cohort_initiation_date
)
|>
union all
(
    select
        {{ surrogate_int_id("'SMM'") }} as cohort_definition_id,
        'Smoldering Multiple Myeloma' as cohort_definition_name,
        'Patients with at least one condition occurrence mapped to a Smoldering Multiple Myeloma SNOMED concept.' as cohort_definition_description,
        0 as definition_type_concept_id,
        cast(null as string) as cohort_definition_syntax,
        0 as subject_concept_id,
        date('2026-03-02') as cohort_initiation_date
)
