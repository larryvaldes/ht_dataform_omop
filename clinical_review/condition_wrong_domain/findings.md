# Findings: Condition Concepts with Wrong OMOP Domain

**Query:** `clinical_review/condition_wrong_domain.sql`
**Results file:** `bquxjob_3ca40eb4_19d96db0dd1.json`
**Date reviewed:** 2026-04-17

---

## Summary

- **2,191** distinct concept/source combinations mismapped into `condition_occurrence`
- **27,628** total records affected
- All mismatches originate from **SNOMED** codes only

## Domain Breakdown

| Target Domain | Concept Count | % of Total |
|---|---|---|
| Observation | 1,911 | 87% |
| Measurement | 188 | 9% |
| Procedure | 71 | 3% |
| Device / Drug / Other | ~16 | <1% |

## Root Cause

The ETL maps SNOMED codes to `condition_occurrence` based on source context (e.g., problem list) without verifying that the resolved OMOP standard concept belongs to the **Condition** domain. SNOMED `Clinical Finding` and `Context-dependent` classes frequently resolve to Observation in OMOP vocabulary.

## Top Offenders by Record Count

| Concept Name | SNOMED Code | Domain | Patients | Records |
|---|---|---|---|---|
| Patient encounter status | 305058001 | Observation | 1,277 | 4,134 |
| H/O: tissue/organ recipient | 161663000 | Observation | 454 | 864 |
| Fatigue | 84229001 | Observation | 385 | 613 |
| History of autologous bone marrow transplant | 108631000119101 | Observation | 324 | 539 |
| Drug therapy finding | 309298003 | Observation | 218 | 465 |
| Postprocedural state finding | 128926000 | Observation | 392 | 461 |
| Postoperative state | 19585003 | Observation | 295 | 410 |
| Body mass index 30+ - obesity | 162864005 | Observation | 231 | 334 |
| History of multiple myeloma | 120481000119109 | Observation | 126 | 270 |
| Patient immunocompromised | 370388006 | Observation | 192 | 259 |

## Notable Patterns

- **"History of..." (Context-dependent class):** 772 concepts — these are almost always Observation-domain in OMOP (e.g., *History of multiple myeloma*, *H/O: autologous BMT*).
- **Functional/status findings:** Concepts like *Patient encounter status*, *Postoperative state*, *Drug therapy finding* are status/context codes, not clinical conditions.
- **Fatigue (84229001):** Despite being a common symptom, OMOP maps this specific SNOMED code to Observation rather than Condition.

## Recommended Actions

Per the SQL comments, for each affected concept either:
1. **Re-route** the record to the correct OMOP table (`observation`, `measurement`, `procedure_occurrence`)
2. **Remap** to a proper Condition-domain standard concept if a clinical condition is intended

Priority: start with the top 10 by record count, which together account for ~9,000+ records.
