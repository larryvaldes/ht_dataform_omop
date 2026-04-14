{{
  config(
    description='OMOP CDM v5.4 Cohort — assigns patients to diagnosis-based cohorts '
                '(MM, SMM, MGUS) using the myeloma SNOMED classification seed.'
  )
}}

with

-- Map seed SNOMED codes to OMOP concept_ids (MM, SMM, MGUS only)
myeloma_concepts as (
    from {{ ref('seed__myeloma_snomed_classification') }}
    |> as msc
    |> inner join {{ ref('stg_raw_athena__concept') }} as c
        on cast(msc.snomed_code as string) = c.concept_code
        and c.vocabulary_id = 'SNOMED'
        and c.invalid_reason is null
    |> where msc.myeloma_category in ('MM', 'SMM', 'MGUS')
    |> select
        msc.myeloma_category,
        c.concept_id as condition_concept_id
)

-- Find all condition occurrences matching myeloma concepts,
-- then one row per person per cohort with earliest diagnosis as start date
from {{ ref('omop__condition_occurrence') }}
|> as co
|> inner join myeloma_concepts as mc
    on co.condition_concept_id = mc.condition_concept_id
|> where co.condition_concept_id != 0
|> aggregate
    min(condition_start_date) as cohort_start_date
    group by myeloma_category, person_id
|> as cm
|> left join {{ ref('omop__observation_period') }} as op
    on cm.person_id = op.person_id
|> left join {{ ref('omop__death') }} as d
    on cm.person_id = d.person_id
|> extend
    {{ surrogate_int_id('cm.myeloma_category') }} as cohort_definition_id,
    coalesce(
        d.death_date,
        op.observation_period_end_date,
        current_date()
    ) as cohort_end_date
|> select
    cohort_definition_id,
    cm.person_id as subject_id,
    cm.cohort_start_date,
    cohort_end_date
