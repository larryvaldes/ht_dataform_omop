# =============================================================================
# run_cdm_inspection_r.r — EHDEN CdmInspection via R
#
# Run this instead of run_cdm_inspection.sh once the R/JDBC connector is fixed.
# It produces the official EHDEN Word-document inspection report.
#
# Prerequisites:
#   1. R >= 4.1.0 and Java installed
#   2. Achilles must have been run and its results tables must exist
#      in resultsDatabaseSchema (same as cdmDatabaseSchema here: "dataform")
#   3. EHDEN CdmInspection installed:
#        remotes::install_github("OHDSI/ROhdsiWebApi")
#        remotes::install_github("EHDEN/CdmInspection")
#   4. BigQuery JDBC driver at DATABASECONNECTOR_JAR_FOLDER
#      (already present at ~/Documents/GitHub/DataQualityDashboard/drivers)
#   5. gcloud ADC configured: gcloud auth application-default login
#
# Usage: Rscript run_cdm_inspection_r.r
# =============================================================================

# JDBC driver location (already downloaded)
Sys.setenv(DATABASECONNECTOR_JAR_FOLDER =
  "/Users/larry/Documents/GitHub/DataQualityDashboard/drivers")

library(DatabaseConnector)
library(CdmInspection)

# ── Connection ────────────────────────────────────────────────────────────────
# OAuthType=3 → Application Default Credentials (gcloud auth application-default login)
# EnableSession=1 → required for BigQuery to accept BEGIN/COMMIT from DatabaseConnector
connectionDetails <- DatabaseConnector::createConnectionDetails(
  dbms            = "bigquery",
  connectionString = paste0(
    "jdbc:bigquery://https://www.googleapis.com/bigquery/v2:443",
    ";ProjectId=healthtree-production",
    ";OAuthType=3",
    ";EnableSession=1",
    ";Timeout=60"
  ),
  user     = "",
  password = ""
)

# ── Run Inspection ────────────────────────────────────────────────────────────
CdmInspection::cdmInspection(
  connectionDetails      = connectionDetails,
  cdmDatabaseSchema      = "dataform",
  resultsDatabaseSchema  = "dataform",   # Achilles results live here
  scratchDatabaseSchema  = "dataform",
  vocabDatabaseSchema    = "dataform",
  databaseId             = "HT_OMOP",
  databaseName           = "HealthTree OMOP",
  databaseDescription    = "HealthTree OMOP CDM v5.4 on BigQuery (healthtree-production)",
  smallCellCount         = 5,
  runVocabularyChecks    = TRUE,
  runDataTablesChecks    = TRUE,
  runPerformanceChecks   = TRUE,
  runWebAPIChecks        = FALSE,        # no ATLAS instance configured
  sqlOnly                = FALSE,
  outputFolder           = file.path(dirname(sys.frame(1)$ofile), "cdm_inspection_r_output"),
  verboseMode            = TRUE
)
