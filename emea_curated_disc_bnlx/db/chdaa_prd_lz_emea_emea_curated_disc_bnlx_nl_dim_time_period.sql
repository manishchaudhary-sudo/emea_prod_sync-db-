CREATE TABLE chdaa_prd_lz_emea.emea_curated_disc_bnlx.nl_dim_time_period (
  time_period_identifier_code STRING,
  d_time_period_code STRING,
  file_name STRING,
  load_id STRING,
  time_period_entry_type STRING,
  time_period_date DATE,
  time_period_description STRING,
  time_period_length STRING,
  time_period_stub_id STRING,
  ETLIsDeleted BOOLEAN,
  ETLChecksum STRING,
  ETLLastModifiedDate TIMESTAMP,
  ETLLineageID STRING)
USING delta
LOCATION 'abfss://curated@zpdatacoresadpemea.dfs.core.windows.net/discovery/bnlx/nl_dim_time_period'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')