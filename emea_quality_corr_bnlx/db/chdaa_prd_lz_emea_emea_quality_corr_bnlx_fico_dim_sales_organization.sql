CREATE TABLE chdaa_prd_lz_emea.emea_quality_corr_bnlx.fico_dim_sales_organization (
  sales_org_sid STRING,
  sales_org STRING,
  optime STRING,
  sales_org_id STRING,
  opsys STRING,
  optype STRING,
  ETLChecksum STRING,
  ETLIsDeleted BOOLEAN,
  ETLLineageID STRING,
  ETLLastModifiedDate TIMESTAMP)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/correction/bnlx/fico_dim_sales_organization'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')