{{
  config(
    description='OMOP CDM v5.4 Drug Era — continuous periods of drug exposure at the '
                'ingredient level, collapsed using the standard OHDSI 30-day persistence window.'
  )
}}

with

-- Pre-build a deduplicated drug-to-ingredient mapping.
-- concept_ancestor returns the full transitive closure, so we filter to
-- only RxNorm Ingredient ancestors and pick one per descendant (shortest path).
ingredient_map as (
    from {{ ref('stg_raw_athena__concept_ancestor') }}
    |> as ca
    |> inner join {{ ref('stg_raw_athena__concept') }} as ancestor
        on ca.ancestor_concept_id = ancestor.concept_id
        and ancestor.vocabulary_id = 'RxNorm'
        and ancestor.concept_class_id = 'Ingredient'
        and ancestor.invalid_reason is null
    |> extend row_number() over (
        partition by ca.descendant_concept_id
        order by ca.min_levels_of_separation asc, ancestor.concept_id asc
    ) as _rn
    |> where _rn = 1
    |> select
        ca.descendant_concept_id as drug_concept_id,
        ancestor.concept_id as ingredient_concept_id
)

-- Detect gaps > 30 days between consecutive exposures per person + ingredient.
-- Use running MAX(end_date) instead of LAG to correctly handle overlapping exposures.
-- Roll up each drug exposure to its RxNorm Ingredient ancestor.
-- Exposures with no ingredient ancestor (e.g. CVX vaccines) are excluded
-- per OHDSI convention: drug_era only contains Ingredient-level concepts.
from {{ ref('omop__drug_exposure') }}
|> as de
|> inner join ingredient_map as im
    on de.drug_concept_id = im.drug_concept_id
|> where
    de.drug_concept_id != 0
    and de.drug_exposure_start_date is not null
|> select
    de.person_id, im.ingredient_concept_id, de.drug_exposure_start_date,
    coalesce(de.drug_exposure_end_date, de.drug_exposure_start_date) as drug_exposure_end_date
|> extend
    max(drug_exposure_end_date) over (
        partition by person_id, ingredient_concept_id
        order by drug_exposure_start_date, drug_exposure_end_date
        rows between unbounded preceding and 1 preceding
    ) as max_prev_end_date
-- Assign era group numbers via cumulative sum of "new era" flags
|> extend
    sum(
        case
            when max_prev_end_date is null then 1
            when date_diff(drug_exposure_start_date, max_prev_end_date, day) > 30 then 1
            else 0
        end
    ) over (
        partition by person_id, ingredient_concept_id
        order by drug_exposure_start_date, drug_exposure_end_date
        rows unbounded preceding
    ) as era_group
-- Aggregate into eras
|> aggregate
    min(drug_exposure_start_date) as drug_era_start_date,
    max(drug_exposure_end_date) as drug_era_end_date,
    count(*) as drug_exposure_count,
    greatest(
        0,
        date_diff(max(drug_exposure_end_date), min(drug_exposure_start_date), day)
            - sum(date_diff(drug_exposure_end_date, drug_exposure_start_date, day))
    ) as gap_days
    group by person_id, ingredient_concept_id, era_group
|> rename ingredient_concept_id as drug_concept_id
|> extend
    {{ surrogate_int_id(
        'cast(person_id as string) || cast(drug_concept_id as string) || cast(drug_era_start_date as string)'
    ) }} as drug_era_id
|> select
    drug_era_id, person_id, drug_concept_id,
    drug_era_start_date, drug_era_end_date, drug_exposure_count, gap_days
