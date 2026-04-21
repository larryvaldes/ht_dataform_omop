{{
  config(
    description='OMOP CDM v5.4 Condition Era — merges overlapping/adjacent condition '
                'occurrence records into continuous eras per person and standard concept. '
                'Uses the standard OHDSI algorithm with a 30-day persistence window.'
  )
}}

-- Only conditions with a valid standard concept (concept_id != 0)
-- For each person+concept, detect when a new era starts
-- A new era begins when the gap from the previous record's end exceeds 30 days
from {{ ref('omop__condition_occurrence') }}
|> where
    condition_concept_id != 0
    and condition_start_date is not null
|> select
    person_id, condition_concept_id, condition_start_date,
    -- If no end date, assume the condition lasts 1 day
    coalesce(condition_end_date, condition_start_date + 1) as condition_end_date
|> extend
    -- Running max of end_date to handle overlapping records
    max(condition_end_date) over (
        partition by person_id, condition_concept_id
        order by condition_start_date, condition_end_date
        rows between unbounded preceding and 1 preceding
    ) as max_end_so_far
|> extend
    case
        when condition_start_date <= max_end_so_far + 30
        then 0
        else 1
    end as new_era_flag
-- Assign an era group number using cumulative sum of new_era_flag
|> extend
    sum(new_era_flag) over (
        partition by person_id, condition_concept_id
        order by condition_start_date, condition_end_date
        rows between unbounded preceding and current row
    ) as era_group
|> aggregate
    min(condition_start_date) as condition_era_start_date,
    max(condition_end_date) as condition_era_end_date,
    count(*) as condition_occurrence_count
    group by person_id, condition_concept_id, era_group
|> select
    {{ surrogate_int_id(
        'concat(cast(person_id as string), cast(condition_concept_id as string), cast(era_group as string), cast(condition_era_start_date as string))'
    ) }} as condition_era_id,
    person_id,
    condition_concept_id,
    condition_era_start_date,
    condition_era_end_date,
    condition_occurrence_count
