CREATE TABLE chdaa_prd_lz_emea.emea_quality_corr_bnlx.fico_dim_key_figure_copa_fin_legal (
  ETLLastModifiedDate TIMESTAMP,
  position STRING,
  key_figure_type STRING,
  subdomain STRING,
  optime STRING,
  level STRING,
  key_figure_sid STRING,
  key_figure_alias STRING,
  key_figure_alias_long STRING,
  key_figure STRING,
  domain STRING,
  key_figure_id STRING,
  context STRING,
  optype STRING,
  key_figure_parent_id STRING,
  ETLLineageID STRING,
  ETLChecksum STRING,
  ETLIsDeleted BOOLEAN)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/correction/bnlx/fico_dim_key_figure_copa_fin_legal'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')