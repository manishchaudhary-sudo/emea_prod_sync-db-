CREATE TABLE chdaa_prd_lz_emea.emea_quality_corr_bnlx.fico_dim_profit_center (
  ETLIsDeleted BOOLEAN,
  ETLLastModifiedDate TIMESTAMP,
  ETLChecksum STRING,
  pc STRING,
  bg_id STRING,
  bg STRING,
  optime STRING,
  sg_id STRING,
  pc_id STRING,
  opsys STRING,
  sbe STRING,
  sbe_id STRING,
  pc_sid STRING,
  ru STRING,
  sg STRING,
  ru_id STRING,
  optype STRING,
  ETLLineageID STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/correction/bnlx/fico_dim_profit_center'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')