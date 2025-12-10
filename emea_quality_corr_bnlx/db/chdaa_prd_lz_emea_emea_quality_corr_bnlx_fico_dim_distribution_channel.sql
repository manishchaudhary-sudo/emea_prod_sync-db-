CREATE TABLE chdaa_prd_lz_emea.emea_quality_corr_bnlx.fico_dim_distribution_channel (
  ETLChecksum STRING,
  ETLIsDeleted BOOLEAN,
  distr_chan_id STRING,
  optime STRING,
  distr_chan_sid STRING,
  distr_chan STRING,
  opsys STRING,
  optype STRING,
  ETLLastModifiedDate TIMESTAMP,
  ETLLineageID STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/correction/bnlx/fico_dim_distribution_channel'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')