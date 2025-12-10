CREATE TABLE chdaa_prd_lz_emea.emea_quality_corr_bnlx.fico_dim_item (
  ETLChecksum STRING,
  ETLLastModifiedDate TIMESTAMP,
  cs_item_sid STRING,
  cluster STRING,
  optime STRING,
  cs_item_id STRING,
  cs_item STRING,
  cs_chart_id STRING,
  cs_item_group_1 STRING,
  opsys STRING,
  optype STRING,
  ETLLineageID STRING,
  ETLIsDeleted BOOLEAN)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/correction/bnlx/fico_dim_item'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')