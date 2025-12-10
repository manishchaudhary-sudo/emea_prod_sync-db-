CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.nl_dim_geography (
  geography_identifier_code STRING,
  d_geography_code STRING,
  file_name STRING,
  load_id STRING,
  geography_level STRING,
  geography_description STRING,
  geography_entry_type STRING,
  geography_stub_id STRING,
  ETLLastModifiedDate TIMESTAMP,
  ETLIsDeleted BOOLEAN,
  ETLLineageID STRING,
  ETLChecksum STRING)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/nl_dim_geography'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')