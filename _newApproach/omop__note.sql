{{
  config(
    description='OMOP CDM v5.4 Note table — clinical notes and narrative text from FHIR DocumentReference resources.'
  )
}}

from {{ ref('int_omop__note_from_document_reference') }}
|> select
    note_id,
    person_id,
    note_date,
    note_datetime,
    note_type_concept_id,
    note_class_concept_id,
    note_title,
    note_text,
    encoding_concept_id,
    language_concept_id,
    provider_id,
    visit_occurrence_id,
    visit_detail_id,
    note_source_value,
    note_event_id,
    note_event_field_concept_id
