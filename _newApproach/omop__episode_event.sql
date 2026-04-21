{{
  config(
    description='OMOP CDM v5.4 Episode Event — links Treatment Regimen episodes to '
                'drug exposures, procedures, and condition occurrences that fall within '
                'the episode date range. Open-ended episodes are capped at '
                'episode_start_date + 365 days to prevent over-matching.'
  )
}}

with

-- Only Treatment Regimen episodes (32531) generate event links.
-- Pre-compute the effective end date: use actual end date when present,
-- otherwise cap at 365 days after start to avoid matching all future events.
regimen_episodes as (
    from {{ ref('int_omop__episode') }}
    |> where episode_concept_id = 32531
    |> select
        episode_id,
        person_id,
        episode_start_date,
        episode_end_date,
        coalesce(
            episode_end_date,
            date_add(episode_start_date, interval 365 day)
        ) as effective_end_date
),

-- Drug exposure events overlapping with treatment regimen dates.
-- Uses true interval overlap: drug period [start, end] intersects episode period.
-- For drugs without an end date, checks that drug start falls within the episode window.
drug_events as (
    from regimen_episodes
    |> as e
    |> inner join {{ ref('omop__drug_exposure') }} as de
        on e.person_id = de.person_id
        and e.effective_end_date >= de.drug_exposure_start_date
        and coalesce(de.drug_exposure_end_date, de.drug_exposure_start_date)
            >= e.episode_start_date
    |> select distinct
        e.episode_id,
        de.drug_exposure_id as event_id,
        1147094 as episode_event_field_concept_id  -- drug_exposure.drug_exposure_id
),

-- Procedure events within treatment regimen dates.
-- For open-ended episodes, uses 365-day cap from episode start.
procedure_events as (
    from regimen_episodes
    |> as e
    |> inner join {{ ref('omop__procedure_occurrence') }} as po
        on e.person_id = po.person_id
        and po.procedure_date
            between e.episode_start_date
            and e.effective_end_date
    |> select distinct
        e.episode_id,
        po.procedure_occurrence_id as event_id,
        1147082 as episode_event_field_concept_id  -- procedure_occurrence.procedure_occurrence_id
),

-- Condition occurrence events within treatment regimen dates.
-- For open-ended episodes, uses 365-day cap from episode start.
condition_events as (
    from regimen_episodes
    |> as e
    |> inner join {{ ref('omop__condition_occurrence') }} as co
        on e.person_id = co.person_id
        and co.condition_start_date
            between e.episode_start_date
            and e.effective_end_date
    |> select distinct
        e.episode_id,
        co.condition_occurrence_id as event_id,
        1147127 as episode_event_field_concept_id  -- condition_occurrence.condition_occurrence_id
)

(from drug_events)
|> union all by name (from procedure_events)
|> union all by name (from condition_events)
