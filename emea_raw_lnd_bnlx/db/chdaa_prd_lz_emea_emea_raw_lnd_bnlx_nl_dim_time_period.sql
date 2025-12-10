CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.nl_dim_time_period (
  ETLIsDeleted BOOLEAN,
  ETLLastModifiedDate TIMESTAMP,
  ETLChecksum STRING,
  time_period_identifier_code STRING,
  d_time_period_code STRING,
  file_name STRING,
  load_id STRING,
  time_period_entry_type STRING,
  time_period_date DATE,
  time_period_description STRING,
  time_period_length STRING,
  time_period_stub_id STRING,
  ETLLineageID STRING)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/nl_dim_time_period'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')