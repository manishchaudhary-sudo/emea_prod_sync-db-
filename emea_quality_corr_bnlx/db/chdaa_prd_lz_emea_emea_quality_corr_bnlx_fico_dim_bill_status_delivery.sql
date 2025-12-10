CREATE TABLE chdaa_prd_lz_emea.emea_quality_corr_bnlx.fico_dim_bill_status_delivery (
  bill_status_delivery_sid STRING,
  bill_status_delivery_id STRING,
  bill_status_delivery STRING,
  ETLLineageID STRING,
  ETLChecksum STRING,
  ETLLastModifiedDate TIMESTAMP,
  ETLIsDeleted BOOLEAN)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/correction/bnlx/fico_dim_bill_status_delivery'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')