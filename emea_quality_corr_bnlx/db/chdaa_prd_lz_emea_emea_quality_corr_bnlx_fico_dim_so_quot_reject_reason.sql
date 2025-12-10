CREATE TABLE chdaa_prd_lz_emea.emea_quality_corr_bnlx.fico_dim_so_quot_reject_reason (
  optime STRING,
  so_quot_reject_reason STRING,
  so_quot_reject_reason_id STRING,
  opsys STRING,
  so_quot_reject_reason_sid STRING,
  optype STRING,
  ETLChecksum STRING,
  ETLLineageID STRING,
  ETLIsDeleted BOOLEAN,
  ETLLastModifiedDate TIMESTAMP)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/correction/bnlx/fico_dim_so_quot_reject_reason'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')