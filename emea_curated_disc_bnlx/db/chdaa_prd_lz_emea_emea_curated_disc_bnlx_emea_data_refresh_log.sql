CREATE TABLE chdaa_prd_lz_emea.emea_curated_disc_bnlx.emea_data_refresh_log (
  etl_ingestion_date TIMESTAMP DEFAULT current_timestamp(),
  job_name STRING,
  lineage_id STRING,
  app STRING,
  object_type STRING,
  table_name STRING,
  source_desc STRING,
  audit_column_expression STRING,
  audit_date TIMESTAMP,
  last_modified_date TIMESTAMP)
USING delta
LOCATION 'abfss://curated@zpdatacoresadpemea.dfs.core.windows.net/discovery/bnlx/emea_data_refresh_log'
TBLPROPERTIES (
  'delta.checkpoint.writeStatsAsJson' = 'false',
  'delta.checkpoint.writeStatsAsStruct' = 'true',
  'delta.deletedFileRetentionDuration' = 'interval 7 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.allowColumnDefaults' = 'supported',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 7 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')