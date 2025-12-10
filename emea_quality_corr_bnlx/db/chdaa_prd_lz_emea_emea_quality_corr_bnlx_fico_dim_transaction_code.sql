CREATE TABLE chdaa_prd_lz_emea.emea_quality_corr_bnlx.fico_dim_transaction_code (
  ETLLastModifiedDate TIMESTAMP,
  transaction_code STRING,
  transaction_code_id STRING,
  transaction_code_sid STRING,
  ETLIsDeleted BOOLEAN,
  ETLLineageID STRING,
  ETLChecksum STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/correction/bnlx/fico_dim_transaction_code'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')