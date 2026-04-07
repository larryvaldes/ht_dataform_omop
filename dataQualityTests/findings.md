# Data Quality Findings — HealthTree OMOP Dataset

**Generated:** 2026-04-07
**DQD Overall Score:** 91.9 / 100 (644 passed, 57 failed)

---

## Finding 1 — Incorrect Death Dates (Action Required by Clinical Team)

### Summary
Three patients have a recorded death date in the system that is contradicted by years of subsequent clinical activity. These are almost certainly data entry errors in `HT.users.passedAwayDate` and should be reviewed and corrected in the source system.

### Affected Patients

#### Patient A — `userId: uN3BjMksyQaFeLtzVrKcH4tc9lW2`
- **Recorded death date:** 2019-07-10
- **Clinical records resume:** 2024-08-28 (5+ years after recorded death)
- **Latest clinical record:** 2026-03-06
- **Post-death records:** 7,399 measurements
- **Assessment:** Almost certainly alive. Records beginning 5 years after the recorded death date make it implausible that this date is correct. Largest contributor to DQD violations.

#### Patient B — `userId: 3872`
- **Recorded death date:** 2022-04-03
- **First post-death record:** 2022-06-22 (80 days after death — within sync window)
- **Latest clinical record:** 2025-05-19 (1,142 days / ~3 years after death)
- **Post-death records:** 557 measurements
- **Assessment:** Initial records could be explained by the 90-day data sync window, but activity continuing for 3 years suggests the death date is likely incorrect.

#### Patient C — `userId: 10445`
- **Recorded death date:** 2022-10-28
- **First post-death record:** 2022-11-02 (5 days after death)
- **Latest clinical record:** 2024-08-07 (649 days / ~1.8 years after death)
- **Post-death records:** 3,484 measurements
- **Assessment:** Records begin almost immediately after death and continue for nearly 2 years. Likely incorrect death date, though less certain than Patient A.

### Impact
These three patients account for **11,440 of the 11,626 total post-death clinical records** in the dataset (98%). Correcting their death dates in the source system would resolve the majority of `plausibleBeforeDeath` DQD failures across measurement, drug_exposure, condition_occurrence, and procedure_occurrence tables.

### Requested Action
Please verify and correct `passedAwayDate` for the three `userId` values above in the HealthTree source system (`HT.users`). No changes to the ETL pipeline are needed — the OMOP dataset will update automatically on the next Dataform run after the source is corrected.

---

## Finding 2 — Inverted Episode Dates (Fixed in ETL)

### Summary
200 Lines of Therapy records (4.1%) in `ANISH.linesOfTherapy` had `endDate < startDate`, with inversions ranging from 83 to 2,223 days. These are data entry errors in the source.

### Resolution
Fixed in ETL (`episode_lines_parent.sqlx`, commit `3dde349`): when `endDate < startDate`, the end date is set to NULL (treating the LoT as ongoing) rather than propagating the invalid date. All records are preserved.

### Recommended Action
The root cause is in `ANISH.linesOfTherapy`. The clinical team may want to review and correct these LoT records in the source to recover accurate end dates.

---

## Finding 3 — Observation Period Logic (Fixed in ETL)

### Summary
56.3% of observation period end dates fell after the patient's death date. The `observation_period` table was previously built using only the `observation` table as the date source, and had no death date or birth date guards.

### Resolution
Fixed in ETL (`observation_period.sqlx`, commit `ec592c2`): the observation period now spans all 10 clinical event tables and is capped at the death date for deceased patients.

---

## DQD Score Breakdown (as of 2026-04-07)

| Level | Category | Passed | Failed | Score |
|---|---|---|---|---|
| FIELD | Plausibility | 55 | 40 | 57.9% |
| FIELD | Completeness | 29 | 5 | 85.3% |
| FIELD | Conformance | 52 | 5 | 91.2% |
| TABLE | Completeness | 16 | 1 | 94.1% |
| CONCEPT | Plausibility | 466 | 6 | 98.7% |
| TABLE | Plausibility | 1 | 0 | 100% |
| TABLE | Conformance | 25 | 0 | 100% |

The remaining FIELD Plausibility failures (40) are dominated by the three patients with incorrect death dates described in Finding 1. Correcting those source records is expected to bring the overall score above 95.
