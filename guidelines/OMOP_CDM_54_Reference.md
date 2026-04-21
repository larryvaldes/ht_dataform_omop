# OMOP CDM v5.4 — Reference Guide

**Source:** https://ohdsi.github.io/CommonDataModel/cdm54.html
**DDL Source:** https://github.com/OHDSI/CommonDataModel/blob/main/inst/ddl/5.4/postgresql/OMOPCDM_postgresql_5.4_ddl.sql
**Version:** OMOP Common Data Model 5.4

---

## Part 1: General Conventions

### Platform Independence
The OMOP CDM is platform-independent. Data types are defined generically using ANSI SQL data types (VARCHAR, INTEGER, FLOAT, DATE, DATETIME, CLOB). The PostgreSQL DDL uses `TIMESTAMP` for datetime, `NUMERIC` for float, and `TEXT` for large text fields.

### Naming Conventions

| Suffix Pattern | Purpose |
|---|---|
| `*_SOURCE_VALUE` | Verbatim value from source data. Preserved for ETL audit; not for analytics. |
| `*_ID` | Unique integer identifier; serves as primary key or foreign key. |
| `*_CONCEPT_ID` | Standard vocabulary concept integer. Used for analytics. Must be a Standard Concept (standard_concept = 'S'). |
| `*_SOURCE_CONCEPT_ID` | Non-standard (source) vocabulary concept for the source code, when it exists in the vocabulary. |
| `*_TYPE_CONCEPT_ID` | Provenance/origin of the data (e.g., EHR record, insurance claim, registry). |

### NULL vs. 0 Rules
- Required concept_id fields that cannot be mapped: use **0** (not NULL) to indicate "no matching concept."
- Exceptions where NULL is acceptable: `VALUE_AS_CONCEPT_ID`, `UNIT_CONCEPT_ID`, `OPERATOR_CONCEPT_ID`, `MODIFIER_CONCEPT_ID` in MEASUREMENT and OBSERVATION.
- All tables must be instantiated in a CDM instance, but non-required tables do not need to be populated.
- All fields (even non-required) must exist in the table structure; they simply do not need to be populated.

### Datetime Rules
- If time is unknown, default to `00:00:00` (midnight).
- No clinical event record can fall outside a valid `OBSERVATION_PERIOD` time span.
- Unknown start dates: `1-Jan-1970`. Unknown end dates: `31-Dec-2099`.

### Three-Level Source Mapping Pattern
1. **Source Value** (`*_SOURCE_VALUE`): Verbatim source code or text — stored as-is.
2. **Source Concept ID** (`*_SOURCE_CONCEPT_ID`): The concept in the OMOP vocabulary that represents the source code. Set to 0 if the source code is not in the vocabulary.
3. **Standard Concept ID** (`*_CONCEPT_ID`): The Standard Concept mapped from the source concept. This is **mandatory**; set to 0 if unmappable.

### Concept Standards
- **Standard Concepts** (`standard_concept = 'S'`): Used in all `*_concept_id` fields for analytics.
- **Classification Concepts** (`standard_concept = 'C'`): Used in vocabulary hierarchies only; never in CDM data fields.
- **Non-standard Concepts**: Only in `*_source_concept_id` fields.
- Reserved concept_id ranges: 0–2,000,000,000 for standard vocabularies; >2,000,000,000 available for local custom concepts.
- Concept 0: Represents non-existing, unmappable, or unknown concepts.

### Domain Rules
- Clinical data must be placed in the table matching the concept's domain.
- A single source code can map to multiple standard concepts in different domains, generating multiple records across multiple clinical tables.

### Historical / Family History
- Family history and personal past diagnoses ("history of") go into the **OBSERVATION** table, not CONDITION_OCCURRENCE.
- Rule-out diagnoses ("question of," "rule out") also go into OBSERVATION if captured.

---

## Part 2: CDM Schemas

| Schema | Contents |
|---|---|
| `CDM` | All clinical and administrative tables |
| `VOCAB` | All standardized vocabulary reference tables |
| `RESULTS` | Cohort and cohort definition tables (writable by tools like ATLAS) |

---

## Part 3: Clinical Data Tables

---

### 1. PERSON

**Schema:** CDM | **Table Required:** Yes | **Population Required:** Yes (all persons must have a record)

**Purpose:** Central identity management for all Persons in the database. Contains records that uniquely identify each person or patient, and some demographic information. All records are independent Persons. Persons with no Events should still have a record.

**ETL Convention:** All Persons in a database need one record in this table. If more than one data source contributes Events, Persons must be reconciled across sources to create one single record per Person. `BIRTH_DATETIME` content must be equivalent to `BIRTH_DAY`, `BIRTH_MONTH`, and `BIRTH_YEAR`.

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| person_id | integer | NOT NULL | Unique row identifier and primary key. |
| gender_concept_id | integer | NOT NULL | Biological sex at birth. Standard concept from Gender domain. Use 0 if unknown. |
| year_of_birth | integer | NOT NULL | Year of birth. Used for age calculation. |
| month_of_birth | integer | NULL | Month of birth if available in source data. |
| day_of_birth | integer | NULL | Day of birth if available in source data. |
| birth_datetime | TIMESTAMP | NULL | Full date and time of birth. Must be consistent with year/month/day fields. |
| race_concept_id | integer | NOT NULL | Race/ethnic background. Standard concept from Race domain. Use 0 if unknown. |
| ethnicity_concept_id | integer | NOT NULL | OMB ethnicity (Hispanic or Latino / Not Hispanic or Latino). Standard concept from Ethnicity domain. Use 0 if unknown. |
| location_id | integer | NULL | FK to LOCATION. Represents the Person's primary address. |
| provider_id | integer | NULL | FK to PROVIDER. Primary care provider associated with the person. |
| care_site_id | integer | NULL | FK to CARE_SITE. Primary care site associated with the person. |
| person_source_value | varchar(50) | NULL | Original person identifier from source data. Used for ETL linking. |
| gender_source_value | varchar(50) | NULL | Verbatim biological sex value from source. |
| gender_source_concept_id | integer | NULL | Concept representing the source gender code, if it exists in the vocabulary. |
| race_source_value | varchar(50) | NULL | Verbatim race value from source. |
| race_source_concept_id | integer | NULL | Concept representing the source race code, if it exists in the vocabulary. |
| ethnicity_source_value | varchar(50) | NULL | Verbatim ethnicity value from source. |
| ethnicity_source_concept_id | integer | NULL | Concept representing the source ethnicity code, if it exists in the vocabulary. |

**Primary Key:** `person_id`
**Foreign Keys:** `location_id` → LOCATION, `provider_id` → PROVIDER, `care_site_id` → CARE_SITE
**Vocabulary Domains:** Gender, Race, Ethnicity
**THEMIS Reference:** https://ohdsi.github.io/Themis/person.html

---

### 2. OBSERVATION_PERIOD

**Schema:** CDM | **Table Required:** Yes | **Population Required:** Yes (at least one per person)

**Purpose:** Defines spans of time during which two conditions are expected to hold: (i) clinical events that happened to the person are recorded in the event tables, and (ii) absence of records indicates such events did not occur during this span. Incidence/prevalence rates should only be calculated during active observation period records.

**ETL Convention:** Each Person needs at least one OBSERVATION_PERIOD record representing time intervals with a high capture rate of clinical events. Overlapping or adjacent periods must be merged into one. In insurance claims, enrollment periods map directly. In EHR data, time spans must be inferred. A single clinical event can yield a one-day observation period.

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| observation_period_id | integer | NOT NULL | Unique row identifier and primary key. |
| person_id | integer | NOT NULL | FK to PERSON. |
| observation_period_start_date | date | NOT NULL | Start date of the observation period. High capture rate begins. |
| observation_period_end_date | date | NOT NULL | End date of the observation period. High capture rate ends. |
| period_type_concept_id | integer | NOT NULL | Provenance of the observation period (e.g., insurance enrollment, EHR active period). From Type Concept domain. |

**Primary Key:** `observation_period_id`
**Foreign Keys:** `person_id` → PERSON
**Rules:** Periods for the same person cannot overlap or be back-to-back.

---

### 3. VISIT_OCCURRENCE

**Schema:** CDM | **Table Required:** No | **Population Required:** Where applicable

**Purpose:** Records events where Persons engage with the healthcare system for a duration of time (encounters). Visits are defined by circumstances: whether the patient comes to a facility or vice versa, what kind of staff is involved, and whether the visit is transient or prolonged.

**Visit Concept Hierarchy (Standard concepts):**
- Inpatient Visit (9201): Hospital stay >1 day with physicians available around the clock
- Emergency Room Visit (9203): Dedicated ER, within one day
- Emergency Room and Inpatient Visit (262): ER followed by inpatient admission
- Non-hospital institution Visit (42898160): Long-term care facility, no physician
- Outpatient Visit (9202): Ambulatory, within one day, no bed
- Home Visit (581476): Provider visits patient at home
- Telehealth Visit (5083): Remote/communication-based encounter
- Pharmacy Visit (581458): Drug dispensing at pharmacy
- Laboratory Visit (32036): Dedicated lab facility visit
- Ambulance Visit (581478): Transportation service visit
- Case Management Visit (38004193): Administrative interaction, no Care Site

**ETL Convention:** Visit duration = `VISIT_END_DATE` minus `VISIT_START_DATE`. Multi-day visits must not overlap (except start/end days). Outpatient visits within an inpatient stay period may be rolled into one visit_occurrence_id. Providers associated via `PROVIDER_ID` or indirectly via PROCEDURE_OCCURRENCE.

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| visit_occurrence_id | integer | NOT NULL | Unique row identifier and primary key. |
| person_id | integer | NOT NULL | FK to PERSON. |
| visit_concept_id | integer | NOT NULL | Standard concept defining the visit type. From Visit domain. |
| visit_start_date | date | NOT NULL | Admission or encounter start date. |
| visit_start_datetime | TIMESTAMP | NULL | Start datetime. Default to midnight if time unknown. |
| visit_end_date | date | NOT NULL | Discharge or encounter end date. For same-day visits, equals start date. |
| visit_end_datetime | TIMESTAMP | NULL | End datetime. Default to midnight if time unknown. |
| visit_type_concept_id | integer | NOT NULL | Provenance of the visit record (EHR, billing claim, etc.). From Type Concept domain. |
| provider_id | integer | NULL | FK to PROVIDER associated with the visit. |
| care_site_id | integer | NULL | FK to CARE_SITE where the visit occurred. |
| visit_source_value | varchar(50) | NULL | Verbatim visit type from source (e.g., place of service code). |
| visit_source_concept_id | integer | NULL | Source vocabulary concept for the visit type. |
| admitted_from_concept_id | integer | NULL | Standard concept for where the patient was admitted from. |
| admitted_from_source_value | varchar(50) | NULL | Verbatim admission origin from source. |
| discharged_to_concept_id | integer | NULL | Standard concept for discharge destination. |
| discharged_to_source_value | varchar(50) | NULL | Verbatim discharge destination from source. |
| preceding_visit_occurrence_id | integer | NULL | FK to prior VISIT_OCCURRENCE for the same person. |

**Primary Key:** `visit_occurrence_id`
**Foreign Keys:** `person_id` → PERSON, `provider_id` → PROVIDER, `care_site_id` → CARE_SITE, `preceding_visit_occurrence_id` → VISIT_OCCURRENCE
**Note (v5.4 change):** `admitting_source_concept_id` renamed to `admitted_from_concept_id`; `discharge_to_concept_id` renamed to `discharged_to_concept_id`.

---

### 4. VISIT_DETAIL

**Schema:** CDM | **Table Required:** No | **Population Required:** Optional

**Purpose:** Optional table representing details of each record in the parent VISIT_OCCURRENCE table. Used for unit transfers during inpatient stays, or claim lines in insurance data. Structurally similar to VISIT_OCCURRENCE. Has a 1:n relationship with VISIT_OCCURRENCE (n may be 0).

**ETL Convention:** Use VISIT_DETAIL when the logic to create VISIT_OCCURRENCE records requires rolling up multiple smaller sub-records. In EHR data, hospital encounters with multiple provider interactions should be strung together into one VISIT_OCCURRENCE with the individual interactions as VISIT_DETAILs. The `VISIT_DETAIL_CONCEPT_ID` should be a descendant of the parent `VISIT_CONCEPT_ID`.

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| visit_detail_id | integer | NOT NULL | Unique row identifier and primary key. |
| person_id | integer | NOT NULL | FK to PERSON. |
| visit_detail_concept_id | integer | NOT NULL | Standard concept defining the visit detail type. Must be descendant of parent visit concept. |
| visit_detail_start_date | date | NOT NULL | Start date of the visit detail encounter. |
| visit_detail_start_datetime | TIMESTAMP | NULL | Start datetime. Default to midnight if time unknown. |
| visit_detail_end_date | date | NOT NULL | End date of the visit detail encounter. |
| visit_detail_end_datetime | TIMESTAMP | NULL | End datetime. Default to midnight if time unknown. |
| visit_detail_type_concept_id | integer | NOT NULL | Provenance of the visit detail record. From Type Concept domain. |
| provider_id | integer | NULL | FK to PROVIDER for this detail record. |
| care_site_id | integer | NULL | FK to CARE_SITE. |
| visit_detail_source_value | varchar(50) | NULL | Verbatim visit detail type from source. |
| visit_detail_source_concept_id | integer | NULL | Source vocabulary concept. |
| admitted_from_concept_id | integer | NULL | Standard concept for admission origin. |
| admitted_from_source_value | varchar(50) | NULL | Verbatim admission origin from source. |
| discharged_to_source_value | varchar(50) | NULL | Verbatim discharge destination from source. |
| discharged_to_concept_id | integer | NULL | Standard concept for discharge destination. |
| preceding_visit_detail_id | integer | NULL | FK to prior VISIT_DETAIL for the same person within the same visit. |
| parent_visit_detail_id | integer | NULL | FK to parent VISIT_DETAIL for nested detail records. |
| visit_occurrence_id | integer | NOT NULL | FK to parent VISIT_OCCURRENCE. |

**Primary Key:** `visit_detail_id`
**Foreign Keys:** `person_id` → PERSON, `visit_occurrence_id` → VISIT_OCCURRENCE, `provider_id` → PROVIDER, `care_site_id` → CARE_SITE, `preceding_visit_detail_id` → VISIT_DETAIL, `parent_visit_detail_id` → VISIT_DETAIL
**Note (v5.4 change):** `visit_detail_parent_id` renamed to `parent_visit_detail_id`.

---

### 5. CONDITION_OCCURRENCE

**Schema:** CDM | **Table Required:** No | **Population Required:** Where applicable

**Purpose:** Records of events suggesting the presence of a disease or medical condition, stated as a diagnosis, sign, or symptom — observed by a provider or reported by the patient.

**ETL Convention:** Record all conditions as they exist in source data. Rule-out diagnoses and family/past history do NOT go here (use OBSERVATION). Conditions span time intervals but are typically recorded as single snapshot records without end dates. Source codes mapped to the Condition domain must be recorded here.

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| condition_occurrence_id | integer | NOT NULL | Unique row identifier and primary key. |
| person_id | integer | NOT NULL | FK to PERSON. |
| condition_concept_id | integer | NOT NULL | Standard concept for the condition. From Condition domain. Use 0 if unmappable. |
| condition_start_date | date | NOT NULL | Date when condition was first recorded or started. |
| condition_start_datetime | TIMESTAMP | NULL | Start datetime. Default to midnight if time unknown. |
| condition_end_date | date | NULL | Date when condition was resolved or ended. Frequently not recorded. |
| condition_end_datetime | TIMESTAMP | NULL | End datetime. |
| condition_type_concept_id | integer | NOT NULL | Provenance (EHR diagnosis, insurance claim, registry, etc.). From Type Concept domain. |
| condition_status_concept_id | integer | NULL | Clinical status of the condition (admitting diagnosis, primary diagnosis, secondary, etc.). |
| stop_reason | varchar(20) | NULL | Reason the condition is no longer recorded (e.g., "Resolved"). |
| provider_id | integer | NULL | FK to PROVIDER who diagnosed the condition. |
| visit_occurrence_id | integer | NULL | FK to associated VISIT_OCCURRENCE. |
| visit_detail_id | integer | NULL | FK to associated VISIT_DETAIL. |
| condition_source_value | varchar(50) | NULL | Source code (e.g., ICD-10-CM code). |
| condition_source_concept_id | integer | NULL | Concept in vocabulary representing the source code. |
| condition_status_source_value | varchar(50) | NULL | Verbatim condition status from source. |

**Primary Key:** `condition_occurrence_id`
**Foreign Keys:** `person_id` → PERSON, `visit_occurrence_id` → VISIT_OCCURRENCE, `visit_detail_id` → VISIT_DETAIL, `provider_id` → PROVIDER
**Vocabulary Domains:** Condition, Type Concept
**Common Source Vocabularies:** ICD-10-CM, ICD-9-CM, SNOMED, Read codes

---

### 6. DRUG_EXPOSURE

**Schema:** CDM | **Table Required:** No | **Population Required:** Where applicable

**Purpose:** Records of exposure to a drug ingested or otherwise introduced into the body. Drugs include prescription/OTC medicines, vaccines, and large-molecule biologics. Radiological devices applied locally do not qualify. Records represent prescriptions written, prescriptions dispensed, and drugs administered.

**ETL Convention:** Provide as much dose/quantity information as possible. Do not de-duplicate records for the same drug on the same day unless clearly a true duplicate. Handle refills according to THEMIS conventions.

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| drug_exposure_id | integer | NOT NULL | Unique row identifier and primary key. |
| person_id | integer | NOT NULL | FK to PERSON. |
| drug_concept_id | integer | NOT NULL | Standard drug concept. From Drug domain (ingredient level preferred). Use 0 if unmappable. |
| drug_exposure_start_date | date | NOT NULL | Date prescription was written, filled, or administration began. |
| drug_exposure_start_datetime | TIMESTAMP | NULL | Start datetime. Default to midnight if unknown. |
| drug_exposure_end_date | date | NOT NULL | Date drug use ended or prescription expired. |
| drug_exposure_end_datetime | TIMESTAMP | NULL | End datetime. |
| verbatim_end_date | date | NULL | End date exactly as appears in source data, before any ETL derivation. |
| drug_type_concept_id | integer | NOT NULL | Provenance (prescription written, dispensed, administered, etc.). From Type Concept domain. |
| stop_reason | varchar(20) | NULL | Reason drug was stopped (e.g., "Adverse event," "Completed"). |
| refills | integer | NULL | Number of refills authorized at the time the prescription was written. |
| quantity | NUMERIC | NULL | Amount dispensed or administered. |
| days_supply | integer | NULL | Number of days the supply should last. |
| sig | TEXT | NULL | Verbatim dosing instructions (Signatura) from the prescription. |
| route_concept_id | integer | NULL | Standard concept for route of administration. From Route domain. |
| lot_number | varchar(50) | NULL | Manufacturer lot/batch number (useful for vaccines). |
| provider_id | integer | NULL | FK to PROVIDER who prescribed or administered the drug. |
| visit_occurrence_id | integer | NULL | FK to associated VISIT_OCCURRENCE. |
| visit_detail_id | integer | NULL | FK to associated VISIT_DETAIL. |
| drug_source_value | varchar(50) | NULL | Source code for the drug (e.g., NDC, Gemscript code). |
| drug_source_concept_id | integer | NULL | Concept representing the source drug code. |
| route_source_value | varchar(50) | NULL | Verbatim route of administration from source. |
| dose_unit_source_value | varchar(50) | NULL | Verbatim dose unit from source (deprecated in v5.4; use DRUG_STRENGTH). |

**Primary Key:** `drug_exposure_id`
**Foreign Keys:** `person_id` → PERSON, `visit_occurrence_id` → VISIT_OCCURRENCE, `visit_detail_id` → VISIT_DETAIL, `provider_id` → PROVIDER
**Vocabulary Domains:** Drug (RxNorm/RxNorm Extension preferred), Route, Type Concept
**THEMIS Reference:** https://ohdsi.github.io/Themis/drug_exposure.html

---

### 7. PROCEDURE_OCCURRENCE

**Schema:** CDM | **Table Required:** No | **Population Required:** Where applicable

**Purpose:** Records of activities or processes ordered by, or carried out by, a healthcare provider with diagnostic or therapeutic purpose. Lab tests are NOT procedures (they go in MEASUREMENT). Phlebotomy is a procedure but rarely captured separately.

**ETL Convention:** When dealing with duplicate records, determine whether to sum into one record or keep separate based on: same procedure, same datetime, same visit, same provider, same modifier. Source codes mapped to Procedure domain go here.

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| procedure_occurrence_id | integer | NOT NULL | Unique row identifier and primary key. |
| person_id | integer | NOT NULL | FK to PERSON. |
| procedure_concept_id | integer | NOT NULL | Standard procedure concept. From Procedure domain. Use 0 if unmappable. |
| procedure_date | date | NOT NULL | Date the procedure was performed. |
| procedure_datetime | TIMESTAMP | NULL | Procedure start datetime. |
| procedure_end_date | date | NULL | Date the procedure ended. (NEW in v5.4.) |
| procedure_end_datetime | TIMESTAMP | NULL | Procedure end datetime. (NEW in v5.4.) |
| procedure_type_concept_id | integer | NOT NULL | Provenance (EHR order, billing claim, etc.). From Type Concept domain. |
| modifier_concept_id | integer | NULL | Standard concept for procedure modifier (e.g., CPT4 modifier). |
| quantity | integer | NULL | Number of times the procedure was performed. Defaults to 1 if the record exists. |
| provider_id | integer | NULL | FK to PROVIDER who performed the procedure. |
| visit_occurrence_id | integer | NULL | FK to associated VISIT_OCCURRENCE. |
| visit_detail_id | integer | NULL | FK to associated VISIT_DETAIL. |
| procedure_source_value | varchar(50) | NULL | Source code (e.g., CPT4, OPCS-4, ICD-10-PCS). |
| procedure_source_concept_id | integer | NULL | Concept representing the source procedure code. |
| modifier_source_value | varchar(50) | NULL | Verbatim modifier from source. |

**Primary Key:** `procedure_occurrence_id`
**Foreign Keys:** `person_id` → PERSON, `visit_occurrence_id` → VISIT_OCCURRENCE, `visit_detail_id` → VISIT_DETAIL, `provider_id` → PROVIDER
**Vocabulary Domains:** Procedure (SNOMED, CPT4, HCPCS, ICD-10-PCS), Type Concept

---

### 8. DEVICE_EXPOSURE

**Schema:** CDM | **Table Required:** No | **Population Required:** Where applicable

**Purpose:** Records of exposure to foreign physical objects or instruments used for diagnostic/therapeutic purposes through a mechanism beyond chemical action. Includes implantable objects (pacemakers, stents, artificial joints), medical equipment/supplies (bandages, syringes), surgical instruments (sutures), and clinical materials.

**ETL Convention:** Distinction between devices and procedures: devices are physical objects; procedures are actions. Source codes mapped to Device domain go here.

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| device_exposure_id | integer | NOT NULL | Unique row identifier and primary key. |
| person_id | integer | NOT NULL | FK to PERSON. |
| device_concept_id | integer | NOT NULL | Standard device concept. From Device domain. Use 0 if unmappable. |
| device_exposure_start_date | date | NOT NULL | Date device was applied, implanted, or used. |
| device_exposure_start_datetime | TIMESTAMP | NULL | Start datetime. Default to midnight if unknown. |
| device_exposure_end_date | date | NULL | Date device use ended or was removed. |
| device_exposure_end_datetime | TIMESTAMP | NULL | End datetime. |
| device_type_concept_id | integer | NOT NULL | Provenance (EHR, claims, registry). From Type Concept domain. |
| unique_device_id | varchar(255) | NULL | FDA Unique Device Identifier (UDI-DI portion). (Changed to varchar(255) in v5.4.) |
| production_id | varchar(255) | NULL | Production Identifier (UDI-PI) portion of the UDI. (NEW in v5.4.) |
| quantity | integer | NULL | Number of devices. Default to 1 if record exists. |
| provider_id | integer | NULL | FK to PROVIDER who prescribed or implanted the device. |
| visit_occurrence_id | integer | NULL | FK to associated VISIT_OCCURRENCE. |
| visit_detail_id | integer | NULL | FK to associated VISIT_DETAIL. |
| device_source_value | varchar(50) | NULL | Source code for the device (NDC, HCPCS). |
| device_source_concept_id | integer | NULL | Concept representing the source device code. |
| unit_concept_id | integer | NULL | Standard unit concept (e.g., mL for blood transfusions). (NEW in v5.4.) |
| unit_source_value | varchar(50) | NULL | Verbatim unit from source. (NEW in v5.4.) |
| unit_source_concept_id | integer | NULL | Concept for source unit code. (NEW in v5.4.) |

**Primary Key:** `device_exposure_id`
**Foreign Keys:** `person_id` → PERSON, `visit_occurrence_id` → VISIT_OCCURRENCE, `visit_detail_id` → VISIT_DETAIL, `provider_id` → PROVIDER
**Vocabulary Domains:** Device, Type Concept

---

### 9. MEASUREMENT

**Schema:** CDM | **Table Required:** No | **Population Required:** Where applicable

**Purpose:** Records of structured values (numerical or categorical) obtained through systematic examination or testing. Includes laboratory tests, vital signs, quantitative pathology findings. Stored as attribute-value pairs. Differs from OBSERVATION in that a standardized test or activity is required to generate the result.

**ETL Convention:** Only records where source value maps to the Measurement domain go here. Even if result is unknown, the fact that a measurement was taken is valuable. For concepts that include result (e.g., "Abnormal enzyme level"), the CONCEPT_RELATIONSHIP table contains both a "Maps to" and a "Maps to value" relationship.

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| measurement_id | integer | NOT NULL | Unique row identifier and primary key. |
| person_id | integer | NOT NULL | FK to PERSON. |
| measurement_concept_id | integer | NOT NULL | Standard measurement concept. From Measurement domain (LOINC preferred). Use 0 if unmappable. |
| measurement_date | date | NOT NULL | Date closest to sample draw or measurement. |
| measurement_datetime | TIMESTAMP | NULL | Measurement datetime. Default to midnight if unknown. |
| measurement_time | varchar(10) | NULL | Time of measurement (deprecated; use measurement_datetime). |
| measurement_type_concept_id | integer | NOT NULL | Provenance (EHR lab order, billing claim, etc.). From Type Concept domain. |
| operator_concept_id | integer | NULL | Comparison operator concept (<, >, =, >=, <=) for result interpretation. |
| value_as_number | NUMERIC | NULL | Numerical measurement result. |
| value_as_concept_id | integer | NULL | Categorical result mapped to a standard concept. |
| unit_concept_id | integer | NULL | Standard unit concept for the measurement (from Unit domain). |
| range_low | NUMERIC | NULL | Lower bound of the normal reference range. |
| range_high | NUMERIC | NULL | Upper bound of the normal reference range. |
| provider_id | integer | NULL | FK to PROVIDER who ordered or recorded the measurement. |
| visit_occurrence_id | integer | NULL | FK to associated VISIT_OCCURRENCE. |
| visit_detail_id | integer | NULL | FK to associated VISIT_DETAIL. |
| measurement_source_value | varchar(50) | NULL | Source code for the measurement (LOINC, local lab code). |
| measurement_source_concept_id | integer | NULL | Concept representing the source measurement code. |
| unit_source_value | varchar(50) | NULL | Verbatim unit from source. |
| unit_source_concept_id | integer | NULL | Concept for source unit code. (NEW in v5.4.) |
| value_source_value | varchar(50) | NULL | Verbatim result value from source. |
| measurement_event_id | integer | NULL | PK of a linked record in another table (e.g., SPECIMEN). (NEW in v5.4.) |
| meas_event_field_concept_id | integer | NULL | Concept identifying which table the measurement_event_id refers to. (NEW in v5.4.) |

**Primary Key:** `measurement_id`
**Foreign Keys:** `person_id` → PERSON, `visit_occurrence_id` → VISIT_OCCURRENCE, `visit_detail_id` → VISIT_DETAIL, `provider_id` → PROVIDER
**Vocabulary Domains:** Measurement (LOINC preferred), Unit, Type Concept, Meas Value (for value_as_concept_id)

---

### 10. OBSERVATION

**Schema:** CDM | **Table Required:** No | **Population Required:** Where applicable

**Purpose:** Clinical facts about a Person obtained in context of examination, questioning, or procedure. Any data that cannot be represented by other domains (social facts, lifestyle, medical history, family history, healthcare patterns). Observations do NOT require a standardized test to generate — they differ from Measurements in this key way.

**ETL Convention:** Records whose source values map to any domain besides Condition, Procedure, Drug, Specimen, Measurement, or Device go in Observation. The observation date/datetime is when the observation was obtained (not when it occurred). Positive assertion observations should have `value_as_concept_id` = 4188539 ("Yes").

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| observation_id | integer | NOT NULL | Unique row identifier and primary key. |
| person_id | integer | NOT NULL | FK to PERSON. |
| observation_concept_id | integer | NOT NULL | Standard observation concept. Must not belong to Condition, Procedure, Drug, Device, Specimen, or Measurement domain. Use 0 if unmappable. |
| observation_date | date | NOT NULL | Date observation was obtained or documented. |
| observation_datetime | TIMESTAMP | NULL | Datetime of observation. Default to midnight if unknown. |
| observation_type_concept_id | integer | NOT NULL | Provenance (medical history, patient report, EHR note, etc.). From Type Concept domain. |
| value_as_number | NUMERIC | NULL | Numerical value if the observation has one. |
| value_as_string | varchar(60) | NULL | Text/string value if applicable. |
| value_as_concept_id | integer | NULL | Categorical value concept if the observation has a coded result. |
| qualifier_concept_id | integer | NULL | Additional specification or qualifier of the observation. |
| unit_concept_id | integer | NULL | Standard unit if the observation has a unit. |
| provider_id | integer | NULL | FK to PROVIDER who recorded the observation. |
| visit_occurrence_id | integer | NULL | FK to associated VISIT_OCCURRENCE. |
| visit_detail_id | integer | NULL | FK to associated VISIT_DETAIL. |
| observation_source_value | varchar(50) | NULL | Source code or text. |
| observation_source_concept_id | integer | NULL | Concept representing the source code. |
| unit_source_value | varchar(50) | NULL | Verbatim unit from source. |
| qualifier_source_value | varchar(50) | NULL | Verbatim qualifier from source. |
| value_source_value | varchar(50) | NULL | Verbatim value from source. (NEW in v5.4.) |
| observation_event_id | integer | NULL | PK of a linked record in another table. (NEW in v5.4.) |
| obs_event_field_concept_id | integer | NULL | Concept identifying which table the observation_event_id refers to. (NEW in v5.4.) |

**Primary Key:** `observation_id`
**Foreign Keys:** `person_id` → PERSON, `visit_occurrence_id` → VISIT_OCCURRENCE, `visit_detail_id` → VISIT_DETAIL, `provider_id` → PROVIDER

---

### 11. DEATH

**Schema:** CDM | **Table Required:** No | **Population Required:** Where evidence exists

**Purpose:** Clinical event for how and when a Person dies. A person can have up to one death record. Evidence sources include: condition in administrative claim, health plan enrollment status, or explicit EHR record.

**ETL Convention:** If a person has multiple death records on different days, apply THEMIS guidance for reconciliation. When only year or year/month is known for death date, apply THEMIS conventions for date derivation.

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| person_id | integer | NOT NULL | FK to PERSON. Also serves as the unique identifier (one record per person). |
| death_date | date | NOT NULL | Date of death. Best estimate when exact date is unknown. |
| death_datetime | TIMESTAMP | NULL | Datetime of death. |
| death_type_concept_id | integer | NULL | Provenance of the death record (EHR, claims, etc.). From Type Concept domain. |
| cause_concept_id | integer | NULL | Standard concept for cause of death. From Condition domain. |
| cause_source_value | varchar(50) | NULL | Source code for cause of death (ICD-10 code). |
| cause_source_concept_id | integer | NULL | Concept representing the source cause of death code. |

**Primary Key:** `person_id` (one record per person maximum)
**Foreign Keys:** `person_id` → PERSON
**THEMIS Reference:** https://ohdsi.github.io/Themis/death.html

---

### 12. NOTE

**Schema:** CDM | **Table Required:** No | **Population Required:** Where applicable

**Purpose:** Captures unstructured information recorded by a provider about a patient in free text notes on a given date. Text is stored in ASCII or preferably UTF-8. Notes are annotated using HL7/LOINC CDO (Clinical Document Ontology) with up to 5 dimensions.

**HL7/LOINC CDO Annotation Dimensions:**
1. **Kind of Document**: General structure (e.g., Anesthesia Consent) — REQUIRED
2. **Type of Service**: Kind of service/activity (e.g., Discharge Teaching) — at least one required
3. **Setting**: CMS-based setting (e.g., Inpatient, Outpatient)
4. **Subject Matter Domain (SMD)**: Note subject matter (e.g., Anesthesiology)
5. **Role**: Author's training level (e.g., Physician)

Each combination of dimensions maps to a unique LOINC code. These dimensions are stored in the OMOP Vocabulary under the domain 'Meas Value.'

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| note_id | integer | NOT NULL | Unique row identifier and primary key. |
| person_id | integer | NOT NULL | FK to PERSON. |
| note_date | date | NOT NULL | Date the note was recorded. |
| note_datetime | TIMESTAMP | NULL | Datetime the note was recorded. |
| note_type_concept_id | integer | NOT NULL | Provenance/type of note (EHR, scanned, dictated). From Type Concept domain. |
| note_class_concept_id | integer | NOT NULL | Standard concept classifying the note (LOINC CDO concept). |
| note_title | varchar(250) | NULL | Title of the clinical note. |
| note_text | TEXT | NOT NULL | Full text content of the note (large text field). |
| encoding_concept_id | integer | NOT NULL | Standard concept for character encoding of the note text (e.g., UTF-8). |
| language_concept_id | integer | NOT NULL | Standard concept for language of the note (e.g., English). |
| provider_id | integer | NULL | FK to PROVIDER who authored the note. |
| visit_occurrence_id | integer | NULL | FK to associated VISIT_OCCURRENCE. |
| visit_detail_id | integer | NULL | FK to associated VISIT_DETAIL. |
| note_source_value | varchar(50) | NULL | Source identifier for the note. |
| note_event_id | integer | NULL | PK of a linked record in another table. (NEW in v5.4.) |
| note_event_field_concept_id | integer | NULL | Concept identifying which table the note_event_id refers to. (NEW in v5.4.) |

**Primary Key:** `note_id`
**Foreign Keys:** `person_id` → PERSON, `visit_occurrence_id` → VISIT_OCCURRENCE, `visit_detail_id` → VISIT_DETAIL, `provider_id` → PROVIDER

---

### 13. NOTE_NLP

**Schema:** CDM | **Table Required:** No | **Population Required:** Where NLP has been applied

**Purpose:** Encodes all output of NLP (Natural Language Processing) applied to clinical notes. Each row represents a single extracted term from a note. Linked to the NOTE table.

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| note_nlp_id | integer | NOT NULL | Unique row identifier and primary key. |
| note_id | integer | NOT NULL | FK to NOTE. |
| section_concept_id | integer | NULL | Standard concept for the section of the note where the term was found. |
| snippet | varchar(250) | NULL | Brief context surrounding the extracted term (surrounding text). |
| offset | varchar(50) | NULL | Character position of the extracted term within the note text. |
| lexical_variant | varchar(250) | NOT NULL | The exact text extracted from the note. |
| note_nlp_concept_id | integer | NULL | Standard concept the extracted term maps to. |
| note_nlp_source_concept_id | integer | NULL | Source concept the extracted term maps to. |
| nlp_system | varchar(250) | NULL | Name and version of the NLP system used. |
| nlp_date | date | NOT NULL | Date NLP was run. |
| nlp_datetime | TIMESTAMP | NULL | Datetime NLP was run. |
| term_exists | varchar(1) | NULL | Flag indicating whether the term exists ('Y'), is negated ('N'), or uncertain. |
| term_temporal | varchar(50) | NULL | Temporal context of the term (current, historical, hypothetical). |
| term_modifiers | varchar(2000) | NULL | Any additional modifiers or attributes extracted for the term. |

**Primary Key:** `note_nlp_id`
**Foreign Keys:** `note_id` → NOTE

---

### 14. SPECIMEN

**Schema:** CDM | **Table Required:** No | **Population Required:** Where applicable

**Purpose:** Records identifying biological samples taken from a person. Anatomic site coded at most specific granularity possible.

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| specimen_id | integer | NOT NULL | Unique row identifier and primary key. |
| person_id | integer | NOT NULL | FK to PERSON. |
| specimen_concept_id | integer | NOT NULL | Standard concept for the type of specimen (from Specimen domain). |
| specimen_type_concept_id | integer | NOT NULL | Provenance of the specimen record. From Type Concept domain. |
| specimen_date | date | NOT NULL | Date specimen was collected. |
| specimen_datetime | TIMESTAMP | NULL | Datetime specimen was collected. |
| quantity | NUMERIC | NULL | Amount of specimen collected (numeric value). |
| unit_concept_id | integer | NULL | Standard unit concept for the specimen quantity. |
| anatomic_site_concept_id | integer | NULL | Standard concept for the anatomic site from which specimen was taken (most specific level). |
| disease_status_concept_id | integer | NULL | Standard concept for disease status at time of specimen collection. |
| specimen_source_id | varchar(50) | NULL | Source system identifier for the specimen. |
| specimen_source_value | varchar(50) | NULL | Source code or description for the specimen type. |
| unit_source_value | varchar(50) | NULL | Verbatim unit from source. |
| anatomic_site_source_value | varchar(50) | NULL | Verbatim anatomic site from source. |
| disease_status_source_value | varchar(50) | NULL | Verbatim disease status from source. |

**Primary Key:** `specimen_id`
**Foreign Keys:** `person_id` → PERSON

---

### 15. FACT_RELATIONSHIP

**Schema:** CDM | **Table Required:** No | **Population Required:** Where applicable

**Purpose:** Records relationships between facts stored as records in ANY table of the CDM. Relationships can be within the same domain or across different domains. Examples: person relationships (parent-child), care site organizational hierarchy, drug-condition indication relationships, device usage during procedures, measurements derived from specimens.

**Key Convention:** ALL relationships are directional, and each relationship is represented TWICE (symmetrically). Example: if person 1 is mother of person 2:
- Record 1: domain=Person, fact_id=1, domain=Person, fact_id=2, relationship="parent of"
- Record 2: domain=Person, fact_id=2, domain=Person, fact_id=1, relationship="child of"

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| domain_concept_id_1 | integer | NOT NULL | Concept for the domain of the first fact (e.g., Person, Drug Exposure). |
| fact_id_1 | integer | NOT NULL | PK value of the first fact record in its domain table. |
| domain_concept_id_2 | integer | NOT NULL | Concept for the domain of the second fact. |
| fact_id_2 | integer | NOT NULL | PK value of the second fact record in its domain table. |
| relationship_concept_id | integer | NOT NULL | Standard concept defining the relationship between the two facts. From Relationship domain. |

**Primary Key:** Composite of all 5 columns

---

## Part 4: Health System Tables

---

### 16. LOCATION

**Schema:** CDM | **Table Required:** No | **Population Required:** Where applicable

**Purpose:** Generic capture of physical location or address information for Persons and Care Sites. Each unique address appears only once. Does not contain names (names come from CARE_SITE or PERSON records).

**Note:** Currently US-centric. International adaptations: STATE → province/district, ZIP → postal code, COUNTY → region.

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| location_id | integer | NOT NULL | Unique row identifier and primary key. |
| address_1 | varchar(50) | NULL | Street address line 1. |
| address_2 | varchar(50) | NULL | Street address line 2 (apartment, suite, etc.). |
| city | varchar(50) | NULL | City name. |
| state | varchar(2) | NULL | 2-letter US state abbreviation (or province/district). |
| zip | varchar(9) | NULL | ZIP code or postal code. |
| county | varchar(20) | NULL | County or region name. |
| location_source_value | varchar(50) | NULL | Source identifier for the location. |
| country_concept_id | integer | NULL | Standard concept for the country. (NEW in v5.4.) |
| country_source_value | varchar(80) | NULL | Verbatim country name from source. (NEW in v5.4.) |
| latitude | NUMERIC | NULL | Geographic latitude. (NEW in v5.4.) |
| longitude | NUMERIC | NULL | Geographic longitude. (NEW in v5.4.) |

**Primary Key:** `location_id`

---

### 17. CARE_SITE

**Schema:** CDM | **Table Required:** No | **Population Required:** Where applicable

**Purpose:** List of uniquely identified institutional units where healthcare delivery is practiced (offices, wards, hospitals, clinics). Care site is a unique combination of location and nature of the site. Does not capture individual provider (human) information — that goes in PROVIDER.

**ETL Convention:** If source data only provides limited info like Place of Service, create generic "pooled" Care Site records. Hierarchical relationships (ward → clinic → hospital → system → HMO) are defined in FACT_RELATIONSHIP.

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| care_site_id | integer | NOT NULL | Unique row identifier and primary key. |
| care_site_name | varchar(255) | NULL | Name of the care site. |
| place_of_service_concept_id | integer | NULL | Standard concept for the place of service type. |
| location_id | integer | NULL | FK to LOCATION for the care site's physical address. |
| care_site_source_value | varchar(50) | NULL | Source identifier for the care site. |
| place_of_service_source_value | varchar(50) | NULL | Verbatim place of service from source. |

**Primary Key:** `care_site_id`
**Foreign Keys:** `location_id` → LOCATION
**THEMIS Reference:** https://ohdsi.github.io/Themis/care_site.html

---

### 18. PROVIDER

**Schema:** CDM | **Table Required:** No | **Population Required:** Where applicable

**Purpose:** List of uniquely identified healthcare providers. These are INDIVIDUALS providing hands-on care (physicians, nurses, midwives, physical therapists, etc.). No duplication allowed. If source data only provides specialty, create generic "pooled" Provider records.

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| provider_id | integer | NOT NULL | Unique row identifier and primary key. |
| provider_name | varchar(255) | NULL | Name of the provider. |
| npi | varchar(20) | NULL | National Provider Identifier (US). |
| dea | varchar(20) | NULL | DEA (Drug Enforcement Agency) number for controlled substance prescribing. |
| specialty_concept_id | integer | NULL | Standard concept for provider specialty. |
| care_site_id | integer | NULL | FK to CARE_SITE where provider primarily practices. |
| year_of_birth | integer | NULL | Provider's year of birth. |
| gender_concept_id | integer | NULL | Standard concept for provider's gender. |
| provider_source_value | varchar(50) | NULL | Source identifier for the provider. |
| specialty_source_value | varchar(50) | NULL | Verbatim specialty from source. |
| specialty_source_concept_id | integer | NULL | Concept representing the source specialty code. |
| gender_source_value | varchar(50) | NULL | Verbatim gender from source. |
| gender_source_concept_id | integer | NULL | Concept representing source gender code. |

**Primary Key:** `provider_id`
**Foreign Keys:** `care_site_id` → CARE_SITE

---

## Part 5: Payer / Financial Tables

---

### 19. PAYER_PLAN_PERIOD

**Schema:** CDM | **Table Required:** No | **Population Required:** Where applicable

**Purpose:** Captures time periods during which a Person is continuously enrolled under a specific health plan benefit structure from a given payer. A Person can have multiple overlapping periods (e.g., separate medical and drug coverage).

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| payer_plan_period_id | integer | NOT NULL | Unique row identifier and primary key. |
| person_id | integer | NOT NULL | FK to PERSON. |
| payer_plan_period_start_date | date | NOT NULL | Start date of enrollment in the payer plan. |
| payer_plan_period_end_date | date | NOT NULL | End date of enrollment in the payer plan. |
| payer_concept_id | integer | NULL | Standard concept for the payer organization. |
| payer_source_value | varchar(50) | NULL | Verbatim payer name or identifier from source. |
| payer_source_concept_id | integer | NULL | Concept representing source payer code. |
| plan_concept_id | integer | NULL | Standard concept for the health benefit plan. |
| plan_source_value | varchar(50) | NULL | Verbatim plan name from source. |
| plan_source_concept_id | integer | NULL | Concept representing source plan code. |
| sponsor_concept_id | integer | NULL | Standard concept for the sponsor (employer, government agency). |
| sponsor_source_value | varchar(50) | NULL | Verbatim sponsor name from source. |
| sponsor_source_concept_id | integer | NULL | Concept representing source sponsor code. |
| family_source_value | varchar(50) | NULL | Source identifier for the family enrollment unit. |
| stop_reason_concept_id | integer | NULL | Standard concept for why enrollment ended. |
| stop_reason_source_value | varchar(50) | NULL | Verbatim stop reason from source. |
| stop_reason_source_concept_id | integer | NULL | Concept representing source stop reason code. |

**Primary Key:** `payer_plan_period_id`
**Foreign Keys:** `person_id` → PERSON

---

### 20. COST

**Schema:** CDM | **Table Required:** No | **Population Required:** Where applicable

**Purpose:** Records the cost of any medical event recorded in clinical event tables (DRUG_EXPOSURE, PROCEDURE_OCCURRENCE, VISIT_OCCURRENCE, VISIT_DETAIL, DEVICE_EXPOSURE, OBSERVATION, MEASUREMENT). Each record accounts for money transacted for one clinical event. Can represent receivables (charges) and payments (paid). One cost record is generated per payer response; multiple records possible per event if multiple payers are involved.

**ETL Convention:** Summary costs may be derived from hospital charges × average cost-to-charge ratio. Drug costs include ingredient cost + dispensing fee. Payer reimbursement identified by `PAYER_PLAN_ID`.

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| cost_id | integer | NOT NULL | Unique row identifier and primary key. |
| cost_event_id | integer | NOT NULL | PK of the clinical event this cost record is associated with. |
| cost_domain_id | varchar(20) | NOT NULL | Domain of the linked clinical event (e.g., "Drug", "Procedure", "Visit"). |
| cost_type_concept_id | integer | NOT NULL | Provenance/type of cost record. From Type Concept domain. |
| currency_concept_id | integer | NULL | Standard concept for currency (e.g., US Dollar). |
| total_charge | NUMERIC | NULL | Total amount charged by the provider to the payer. |
| total_cost | NUMERIC | NULL | Total cost to the provider (ingredient cost for drugs). |
| total_paid | NUMERIC | NULL | Total amount actually paid (all sources combined). |
| paid_by_payer | NUMERIC | NULL | Amount paid by the payer/insurer. |
| paid_by_patient | NUMERIC | NULL | Total amount paid by the patient (all out-of-pocket). |
| paid_patient_copay | NUMERIC | NULL | Patient copay portion. |
| paid_patient_coinsurance | NUMERIC | NULL | Patient coinsurance portion. |
| paid_patient_deductible | NUMERIC | NULL | Patient deductible portion. |
| paid_by_primary | NUMERIC | NULL | Amount paid by the primary insurer. |
| paid_ingredient_cost | NUMERIC | NULL | Drug ingredient cost portion paid. |
| paid_dispensing_fee | NUMERIC | NULL | Pharmacy dispensing fee portion paid. |
| payer_plan_period_id | integer | NULL | FK to PAYER_PLAN_PERIOD for adjudication context. |
| amount_allowed | NUMERIC | NULL | Maximum amount allowed by the payer's fee schedule. |
| revenue_code_concept_id | integer | NULL | Standard concept for the revenue code (hospital billing). |
| revenue_code_source_value | varchar(50) | NULL | Verbatim revenue code from source. |
| drg_concept_id | integer | NULL | Standard concept for DRG (Diagnosis Related Group). |
| drg_source_value | varchar(3) | NULL | Source DRG code (up to 3 characters). |

**Primary Key:** `cost_id`
**Foreign Keys:** `payer_plan_period_id` → PAYER_PLAN_PERIOD

---

## Part 6: Derived / Standardized Tables

---

### 21. DRUG_ERA

**Schema:** CDM | **Table Required:** No | **Population Required:** Yes (derived)

**Purpose:** A Drug Era is a span of time when the Person is assumed to be exposed to a particular active ingredient. Drug Eras combine successive Drug Exposure records into continuous periods. Every DRUG_EXPOSURE record should be part of a Drug Era. Operates at ingredient level, not product level.

**ETL Convention:** Generated from DRUG_EXPOSURE records using a standardized algorithm (SQL script: https://ohdsi.github.io/CommonDataModel/sqlScripts.html#drug_eras). Uses a **30-day persistence window** — gap tolerance of 30 days between exposures of the same ingredient.

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| drug_era_id | integer | NOT NULL | Unique row identifier and primary key. |
| person_id | integer | NOT NULL | FK to PERSON. |
| drug_concept_id | integer | NOT NULL | Standard concept for the drug ingredient (not product). |
| drug_era_start_date | date | NOT NULL | Start date of the first Drug Exposure in the era. |
| drug_era_end_date | date | NOT NULL | End date of the last Drug Exposure in the era. |
| drug_exposure_count | integer | NULL | Number of individual Drug Exposure records that make up this era. |
| gap_days | integer | NULL | Number of days not covered by Drug Exposure within the era (gap days). |

**Primary Key:** `drug_era_id`
**Foreign Keys:** `person_id` → PERSON

---

### 22. DOSE_ERA

**Schema:** CDM | **Table Required:** No | **Population Required:** Yes (derived)

**Purpose:** A Dose Era is a span of time when the Person is exposed to a constant dose of a specific active ingredient. Derived from DRUG_EXPOSURE and DRUG_STRENGTH tables. Dose form information is ignored — changes in formulation or manufacturer with the same dose still span one Dose Era.

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| dose_era_id | integer | NOT NULL | Unique row identifier and primary key. |
| person_id | integer | NOT NULL | FK to PERSON. |
| drug_concept_id | integer | NOT NULL | Standard concept for the drug ingredient. |
| unit_concept_id | integer | NOT NULL | Standard unit concept for the dose value. |
| dose_value | NUMERIC | NOT NULL | The constant dose value during the era. |
| dose_era_start_date | date | NOT NULL | Start date of the dose era. |
| dose_era_end_date | date | NOT NULL | End date of the dose era. |

**Primary Key:** `dose_era_id`
**Foreign Keys:** `person_id` → PERSON

---

### 23. CONDITION_ERA

**Schema:** CDM | **Table Required:** No | **Population Required:** Yes (derived)

**Purpose:** A Condition Era is a span of time when the Person is assumed to have a given condition. Derived from CONDITION_OCCURRENCE records. Serves two purposes: (1) aggregates chronic conditions that require frequent ongoing care, (2) aggregates multiple close-in-time visits for the same condition to avoid double-counting.

**ETL Convention:** Built with a **30-day Persistence Window**: if no occurrence of the same `condition_concept_id` occurs within 30 days of any occurrence, that occurrence marks the `condition_era_end_date`. Each CONDITION_OCCURRENCE should be part of a Condition Era. Condition Eras are NOT aggregated across hierarchical levels (unlike Drug Eras). SQL script: https://ohdsi.github.io/CommonDataModel/sqlScripts.html#condition_eras

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| condition_era_id | integer | NOT NULL | Unique row identifier and primary key. |
| person_id | integer | NOT NULL | FK to PERSON. |
| condition_concept_id | integer | NOT NULL | Standard concept for the condition (same as in CONDITION_OCCURRENCE). |
| condition_era_start_date | date | NOT NULL | Start date of the first Condition Occurrence in the era. |
| condition_era_end_date | date | NOT NULL | End date of the last Condition Occurrence in the era. |
| condition_occurrence_count | integer | NULL | Number of CONDITION_OCCURRENCE records that make up this era. |

**Primary Key:** `condition_era_id`
**Foreign Keys:** `person_id` → PERSON

---

### 24. EPISODE

**Schema:** CDM | **Table Required:** No | **Population Required:** Where applicable (currently cancer use cases)

**Purpose:** Aggregates lower-level clinical events into higher-level abstractions representing clinically and analytically relevant disease phases, outcomes, and treatments. Primary use case: oncology (disease episodes, treatment episodes). Connected to underlying events via EPISODE_EVENT.

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| episode_id | integer | NOT NULL | Unique row identifier and primary key. |
| person_id | integer | NOT NULL | FK to PERSON. |
| episode_concept_id | integer | NOT NULL | Standard concept defining the episode type. From Episode domain. |
| episode_start_date | date | NOT NULL | Start date of the episode. |
| episode_start_datetime | TIMESTAMP | NULL | Start datetime of the episode. |
| episode_end_date | date | NULL | End date of the episode. |
| episode_end_datetime | TIMESTAMP | NULL | End datetime of the episode. |
| episode_parent_id | integer | NULL | FK to parent EPISODE for hierarchical episode nesting. |
| episode_number | integer | NULL | Sequence number for the episode within a series (e.g., cycle 1, cycle 2). |
| episode_object_concept_id | integer | NOT NULL | Concept identifying the clinical object of the episode (e.g., the cancer being treated). |
| episode_type_concept_id | integer | NOT NULL | Provenance of the episode record. From Type Concept domain. |
| episode_source_value | varchar(50) | NULL | Verbatim source identifier for the episode. |
| episode_source_concept_id | integer | NULL | Concept representing the source episode code. |

**Primary Key:** `episode_id`
**Foreign Keys:** `person_id` → PERSON, `episode_parent_id` → EPISODE

---

### 25. EPISODE_EVENT

**Schema:** CDM | **Table Required:** No | **Population Required:** Where applicable

**Purpose:** Connects qualifying clinical events (CONDITION_OCCURRENCE, DRUG_EXPOSURE, PROCEDURE_OCCURRENCE, MEASUREMENT, VISIT_OCCURRENCE, DEVICE_EXPOSURE) to the appropriate EPISODE entry. Used INSTEAD of FACT_RELATIONSHIP for linking low-level events to abstracted Episodes.

**Note:** Some episodes may not have links to any underlying events; for such episodes EPISODE_EVENT is not populated.

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| episode_id | integer | NOT NULL | FK to EPISODE. |
| event_id | integer | NOT NULL | PK of the linked clinical event record in its domain table. |
| episode_event_field_concept_id | integer | NOT NULL | Concept identifying which table the event_id refers to (e.g., concept for "condition_occurrence_id"). |

**Primary Key:** Composite of `episode_id`, `event_id`, `episode_event_field_concept_id`
**Foreign Keys:** `episode_id` → EPISODE

---

## Part 7: Metadata Tables

---

### 26. METADATA

**Schema:** CDM | **Table Required:** No | **Population Required:** Where applicable

**Purpose:** Contains metadata information about a dataset that has been transformed to the OMOP CDM. Stored as flexible name-value pairs with optional typed value fields.

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| metadata_id | integer | NOT NULL | Unique row identifier and primary key. (NEW in v5.4.) |
| metadata_concept_id | integer | NOT NULL | Standard concept describing the type of metadata. |
| metadata_type_concept_id | integer | NOT NULL | Provenance of the metadata. From Type Concept domain. |
| name | varchar(250) | NOT NULL | Name/label of the metadata item. |
| value_as_string | varchar(250) | NULL | String value of the metadata. |
| value_as_concept_id | integer | NULL | Concept value of the metadata if applicable. |
| value_as_number | NUMERIC | NULL | Numeric value of the metadata. (NEW in v5.4.) |
| metadata_date | date | NULL | Date associated with the metadata. |
| metadata_datetime | TIMESTAMP | NULL | Datetime associated with the metadata. |

**Primary Key:** `metadata_id`

---

### 27. CDM_SOURCE

**Schema:** CDM | **Table Required:** No | **Population Required:** Highly recommended

**Purpose:** Contains detail about the source database and the ETL process used to transform data into OMOP CDM. Single record describing the CDM instance.

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| cdm_source_name | varchar(255) | NOT NULL | Full name of the CDM instance/source database. |
| cdm_source_abbreviation | varchar(25) | NOT NULL | Short abbreviation of the source name. |
| cdm_holder | varchar(255) | NOT NULL | Name of the organization holding/maintaining this CDM. |
| source_description | TEXT | NULL | Detailed description of the source data. |
| source_documentation_reference | varchar(255) | NULL | URL or reference to source data documentation. |
| cdm_etl_reference | varchar(255) | NULL | URL or reference to the ETL documentation/code. |
| source_release_date | date | NOT NULL | Date of the source data release used for this CDM. |
| cdm_release_date | date | NOT NULL | Date this CDM instance was created/released. |
| cdm_version | varchar(10) | NULL | CDM version string (e.g., "5.4"). |
| cdm_version_concept_id | integer | NOT NULL | Standard concept representing the CDM version. (NEW in v5.4.) |
| vocabulary_version | varchar(20) | NOT NULL | Version of the OMOP Vocabulary used (from VOCABULARY table). |

**Primary Key:** No formal PK (single-row table)
**Note (v5.4):** `cdm_source_name`, `cdm_source_abbreviation`, `cdm_holder`, `source_release_date`, `cdm_release_date` are now mandatory (NOT NULL).

---

## Part 8: Vocabulary Tables (VOCAB Schema)

### CONCEPT

**Purpose:** Central vocabulary table. Every fundamental unit of meaning has a unique `concept_id`. Standard Concepts (`standard_concept = 'S'`) are used in CDM data fields.

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| concept_id | integer | NOT NULL | Unique concept identifier (PK). |
| concept_name | varchar(255) | NOT NULL | Full name/description of the concept. |
| domain_id | varchar(20) | NOT NULL | FK to DOMAIN. The domain this concept belongs to. |
| vocabulary_id | varchar(20) | NOT NULL | FK to VOCABULARY. Source vocabulary. |
| concept_class_id | varchar(20) | NOT NULL | FK to CONCEPT_CLASS. Semantic class within vocabulary. |
| standard_concept | varchar(1) | NULL | 'S' = Standard, 'C' = Classification, NULL = Non-standard. |
| concept_code | varchar(50) | NOT NULL | The code as it appears in the source vocabulary (e.g., ICD-10 code). |
| valid_start_date | date | NOT NULL | Date this concept became valid. |
| valid_end_date | date | NOT NULL | Date this concept expired (31-Dec-2099 if still valid). |
| invalid_reason | varchar(1) | NULL | Reason concept is invalid: 'D' = Deleted, 'U' = Updated. |

---

### VOCABULARY

**Purpose:** Reference list of all source vocabularies included in the OMOP standardized vocabularies.

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| vocabulary_id | varchar(20) | NOT NULL | Unique vocabulary identifier (PK). |
| vocabulary_name | varchar(255) | NOT NULL | Full name of the vocabulary. |
| vocabulary_reference | varchar(255) | NULL | Reference/URL for the vocabulary (optional in v5.4). |
| vocabulary_version | varchar(255) | NULL | Version of the vocabulary (optional in v5.4). |
| vocabulary_concept_id | integer | NOT NULL | Concept representing this vocabulary in the CONCEPT table. |

---

### DOMAIN

**Purpose:** Defines the clinical domains to which concepts can belong. Determines which CDM table a concept should be used in.

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| domain_id | varchar(20) | NOT NULL | Unique domain identifier (PK). |
| domain_name | varchar(255) | NOT NULL | Full name of the domain. |
| domain_concept_id | integer | NOT NULL | Concept representing this domain in the CONCEPT table. |

---

### CONCEPT_CLASS

**Purpose:** Semantic categories within each vocabulary (horizontal or vertical classifications).

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| concept_class_id | varchar(20) | NOT NULL | Unique concept class identifier (PK). |
| concept_class_name | varchar(255) | NOT NULL | Full name of the concept class. |
| concept_class_concept_id | integer | NOT NULL | Concept representing this class in the CONCEPT table. |

---

### CONCEPT_RELATIONSHIP

**Purpose:** Defines relationships between any two concepts. Key relationships: "Maps to" (source → standard) and "Maps to value" (source → value_as_concept_id target).

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| concept_id_1 | integer | NOT NULL | FK to CONCEPT (source/first concept). |
| concept_id_2 | integer | NOT NULL | FK to CONCEPT (target/second concept). |
| relationship_id | varchar(20) | NOT NULL | FK to RELATIONSHIP. Type of relationship. |
| valid_start_date | date | NOT NULL | Start of relationship validity. |
| valid_end_date | date | NOT NULL | End of relationship validity. |
| invalid_reason | varchar(1) | NULL | Reason relationship is invalid. |

---

### RELATIONSHIP

**Purpose:** Reference list of all relationship types, their reverse relationships, and hierarchical characteristics.

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| relationship_id | varchar(20) | NOT NULL | Unique relationship identifier (PK). |
| relationship_name | varchar(255) | NOT NULL | Full name of the relationship. |
| is_hierarchical | varchar(1) | NOT NULL | '1' if relationship is hierarchical (used for CONCEPT_ANCESTOR). |
| defines_ancestry | varchar(1) | NOT NULL | '1' if relationship defines ancestry. |
| reverse_relationship_id | varchar(20) | NOT NULL | The reverse/inverse of this relationship. |
| relationship_concept_id | integer | NOT NULL | Concept representing this relationship. |

---

### CONCEPT_SYNONYM

**Purpose:** Alternative terms, synonyms, and translations for concepts.

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| concept_id | integer | NOT NULL | FK to CONCEPT. |
| concept_synonym_name | varchar(1000) | NOT NULL | Synonym or alternate name. |
| language_concept_id | integer | NOT NULL | Concept for the language of the synonym. |

---

### CONCEPT_ANCESTOR

**Purpose:** Complete hierarchical relationships between Standard and Classification concepts, including all levels of ancestry (parent, grandparent, etc.). Derived from CONCEPT, CONCEPT_RELATIONSHIP, and RELATIONSHIP tables. Enables rolling up to ancestor concepts for cohort definitions.

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| ancestor_concept_id | integer | NOT NULL | FK to CONCEPT (the ancestor). |
| descendant_concept_id | integer | NOT NULL | FK to CONCEPT (the descendant). |
| min_levels_of_separation | integer | NOT NULL | Minimum path length from ancestor to descendant. |
| max_levels_of_separation | integer | NOT NULL | Maximum path length from ancestor to descendant. |

---

### SOURCE_TO_CONCEPT_MAP

**Purpose:** For ETL use — maps local source codes not in the standard vocabulary to standard target concepts. Tools: Usagi and Perseus.

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| source_code | varchar(50) | NOT NULL | The local source code. |
| source_concept_id | integer | NOT NULL | Concept representing the source code (0 if not in vocabulary). |
| source_vocabulary_id | varchar(20) | NOT NULL | The vocabulary the source code belongs to. |
| source_code_description | varchar(255) | NULL | Description of the source code. |
| target_concept_id | integer | NOT NULL | Standard concept the source code maps to. |
| target_vocabulary_id | varchar(20) | NOT NULL | Vocabulary of the target concept. |
| valid_start_date | date | NOT NULL | Start of mapping validity. |
| valid_end_date | date | NOT NULL | End of mapping validity. |
| invalid_reason | varchar(1) | NULL | Reason mapping is invalid. |

---

### DRUG_STRENGTH

**Purpose:** Structured content about amount or concentration of specific ingredients within drug products. Used to derive DOSE_ERA.

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| drug_concept_id | integer | NOT NULL | FK to CONCEPT (the drug product). |
| ingredient_concept_id | integer | NOT NULL | FK to CONCEPT (the active ingredient). |
| amount_value | NUMERIC | NULL | Amount (for solid dose forms, e.g., tablets). |
| amount_unit_concept_id | integer | NULL | Unit for amount_value. |
| numerator_value | NUMERIC | NULL | Numerator for concentration (for liquids and percentages). |
| numerator_unit_concept_id | integer | NULL | Unit for numerator_value. |
| denominator_value | NUMERIC | NULL | Denominator for concentration (total solution amount for quantified drugs). |
| denominator_unit_concept_id | integer | NULL | Unit for denominator_value. |
| box_size | integer | NULL | Number of units per box/package. |
| valid_start_date | date | NOT NULL | Start of strength record validity. |
| valid_end_date | date | NOT NULL | End of strength record validity. |
| invalid_reason | varchar(1) | NULL | Reason record is invalid. |

**Drug Strength Conventions:**
- **Solid dose forms** (tablets, capsules): `amount_value` + `amount_unit_concept_id`
- **Liquid/concentration dose forms**: `numerator_value` + `numerator_unit_concept_id` + `denominator_unit_concept_id`
- **Quantified drugs** (total product amount known): `denominator_value` contains total amount
- **Percentages**: Stored in `numerator_value`; denominator fields NULL unless quantified
- Multiple active ingredients yield multiple DRUG_STRENGTH records per drug product

---

## Part 9: Results Tables (RESULTS Schema)

### COHORT

**Purpose:** Stores cohort membership records. A subject can have multiple non-overlapping records per cohort_definition_id. Cohorts include patients with diagnoses, drug exposures, or specific procedures. Writable by ATLAS and other OHDSI tools.

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| cohort_definition_id | integer | NOT NULL | FK to COHORT_DEFINITION. |
| subject_id | integer | NOT NULL | PK of the subject (usually person_id). |
| cohort_start_date | date | NOT NULL | Start date of cohort membership. |
| cohort_end_date | date | NOT NULL | End date of cohort membership (may equal start date). |

**Rule:** A subject cannot have overlapping cohort membership records for the same cohort_definition_id.

---

### COHORT_DEFINITION

**Purpose:** Contains definitions/rules for cohorts, including the syntax/algorithm used to instantiate them.

| Column Name | Data Type | Required | Description |
|---|---|---|---|
| cohort_definition_id | integer | NOT NULL | Unique row identifier and primary key. |
| cohort_definition_name | varchar(255) | NOT NULL | Name of the cohort definition. |
| cohort_definition_description | TEXT | NULL | Narrative description of the cohort. |
| definition_type_concept_id | integer | NOT NULL | Type of definition (e.g., ATLAS cohort, custom SQL). |
| cohort_definition_syntax | TEXT | NULL | The actual code/query used to generate the cohort. |
| subject_concept_id | integer | NOT NULL | Concept identifying the subject type (Person, Provider, etc.). |
| cohort_initiation_date | date | NULL | Date the cohort definition was created/initiated. |

---

## Part 10: Key Relationships Summary

| Relationship | Cardinality |
|---|---|
| PERSON ← OBSERVATION_PERIOD | 1:n (person can have multiple periods) |
| PERSON ← VISIT_OCCURRENCE | 1:n |
| VISIT_OCCURRENCE ← VISIT_DETAIL | 1:n |
| PERSON ← CONDITION_OCCURRENCE | 1:n |
| PERSON ← DRUG_EXPOSURE | 1:n |
| PERSON ← PROCEDURE_OCCURRENCE | 1:n |
| PERSON ← DEVICE_EXPOSURE | 1:n |
| PERSON ← MEASUREMENT | 1:n |
| PERSON ← OBSERVATION | 1:n |
| PERSON ← DEATH | 1:1 (maximum) |
| PERSON ← NOTE | 1:n |
| PERSON ← SPECIMEN | 1:n |
| NOTE ← NOTE_NLP | 1:n |
| PERSON ← DRUG_ERA | 1:n (derived) |
| PERSON ← DOSE_ERA | 1:n (derived) |
| PERSON ← CONDITION_ERA | 1:n (derived) |
| PERSON ← EPISODE | 1:n |
| EPISODE ← EPISODE_EVENT | 1:n |
| PERSON ← PAYER_PLAN_PERIOD | 1:n |
| PAYER_PLAN_PERIOD ← COST | 1:n |
| LOCATION ← PERSON | 1:n |
| LOCATION ← CARE_SITE | 1:n |
| CARE_SITE ← PROVIDER | 1:n |
| CARE_SITE ← VISIT_OCCURRENCE | 1:n |
| PROVIDER ← VISIT_OCCURRENCE | 1:n |
| FACT_RELATIONSHIP | Cross-table, directional, always symmetric pairs |

### Cross-Table Event Linking (v5.4 New Pattern)
The following fields use a flexible "event_id + field_concept_id" pattern to link records across tables without hardcoded foreign keys:
- `MEASUREMENT.measurement_event_id` + `MEASUREMENT.meas_event_field_concept_id`
- `OBSERVATION.observation_event_id` + `OBSERVATION.obs_event_field_concept_id`
- `NOTE.note_event_id` + `NOTE.note_event_field_concept_id`
- `EPISODE_EVENT.event_id` + `EPISODE_EVENT.episode_event_field_concept_id`

The `*_event_field_concept_id` contains a concept that identifies which table's primary key is stored in the `*_event_id` field (e.g., the concept for "condition_occurrence_id", "specimen_id", etc.).

---

## Part 11: Changes from CDM v5.3 to v5.4

### Field Renames
- `VISIT_OCCURRENCE.admitting_source_concept_id` → `admitted_from_concept_id`
- `VISIT_OCCURRENCE.admitting_source_value` → `admitted_from_source_value`
- `VISIT_OCCURRENCE.discharge_to_concept_id` → `discharged_to_concept_id`
- `VISIT_OCCURRENCE.discharge_to_source_value` → `discharged_to_source_value`
- `VISIT_DETAIL.visit_detail_parent_id` → `parent_visit_detail_id`

### Data Type Changes
- `DEVICE_EXPOSURE.unique_device_id`: varchar(50) → varchar(255)

### New Columns Added

| Table | New Columns |
|---|---|
| PROCEDURE_OCCURRENCE | `procedure_end_date`, `procedure_end_datetime` |
| DEVICE_EXPOSURE | `production_id`, `unit_concept_id`, `unit_source_value`, `unit_source_concept_id` |
| MEASUREMENT | `unit_source_concept_id`, `measurement_event_id`, `meas_event_field_concept_id` |
| OBSERVATION | `value_source_value`, `observation_event_id`, `obs_event_field_concept_id` |
| NOTE | `note_event_id`, `note_event_field_concept_id` |
| LOCATION | `country_concept_id`, `country_source_value`, `latitude`, `longitude` |
| CDM_SOURCE | `cdm_version_concept_id` |
| METADATA | `metadata_id`, `value_as_number` |

### New Tables
- **EPISODE** — clinical episode abstraction (primary use case: oncology)
- **EPISODE_EVENT** — links clinical events to episodes
- **COHORT** — formalized in schema

### Removed Tables
- **ATTRIBUTE_DEFINITION** — removed from v5.4

### Fields Made Mandatory in CDM_SOURCE
- `cdm_source_name`, `cdm_source_abbreviation`, `cdm_holder`, `source_release_date`, `cdm_release_date`

### Vocabulary Field Changes
- `VOCABULARY.vocabulary_reference` → now optional (NULL allowed)
- `VOCABULARY.vocabulary_version` → now optional (NULL allowed)

---

## Part 12: Vocabulary/Concept Requirements by Table

| Table | Required Concept Domains | Common Source Vocabularies |
|---|---|---|
| PERSON | Gender, Race, Ethnicity | HL7 (Gender), OMB (Race/Ethnicity) |
| OBSERVATION_PERIOD | Type Concept | — |
| VISIT_OCCURRENCE | Visit, Type Concept | CMS Place of Service, UB-04 |
| VISIT_DETAIL | Visit (descendant of parent), Type Concept | — |
| CONDITION_OCCURRENCE | Condition, Type Concept | ICD-10-CM, ICD-9-CM, SNOMED, Read |
| DRUG_EXPOSURE | Drug (ingredient level), Route, Type Concept | NDC, RxNorm, Gemscript |
| PROCEDURE_OCCURRENCE | Procedure, Type Concept | CPT4, HCPCS, ICD-10-PCS, OPCS-4, SNOMED |
| DEVICE_EXPOSURE | Device, Unit, Type Concept | NDC, HCPCS |
| MEASUREMENT | Measurement, Unit, Meas Value, Operator, Type Concept | LOINC, local lab codes |
| OBSERVATION | Any non-Condition/Procedure/Drug/Device/Specimen/Measurement domain | LOINC, SNOMED |
| DEATH | Condition (cause), Type Concept | ICD-10, ICD-9 |
| NOTE | Type Concept, LOINC CDO (note class) | LOINC |
| SPECIMEN | Specimen, Unit, Anatomic Site, Type Concept | SNOMED |
| FACT_RELATIONSHIP | Relationship, Domain | — |
| LOCATION | Country | — |
| CARE_SITE | Place of Service | CMS Place of Service |
| PROVIDER | Specialty, Gender | NUCC Provider Taxonomy |
| PAYER_PLAN_PERIOD | Payer, Plan, Sponsor, Stop Reason | — |
| COST | Type Concept, Currency, Revenue Code, DRG | — |
| DRUG_ERA | Drug (ingredient) | RxNorm (ingredient level) |
| DOSE_ERA | Drug (ingredient), Unit | RxNorm |
| CONDITION_ERA | Condition | SNOMED |
| EPISODE | Episode, Type Concept | — |
| EPISODE_EVENT | — (concept identifies field) | — |
