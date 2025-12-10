CREATE TABLE chdaa_prd_lz_emea.emea_quality_corr_bnlx.fico_dim_fiscal_period (
  ETLLastModifiedDate TIMESTAMP,
  ETLIsDeleted BOOLEAN,
  ETLLineageID STRING,
  optime STRING,
  fiscper_sid STRING,
  fiscper STRING,
  fiscyear STRING,
  fiscper_start_date DATE,
  opsys STRING,
  fiscvarnt_id STRING,
  fiscper_end_date DATE,
  fiscper_id STRING,
  fiscmonth STRING,
  optype STRING,
  ETLChecksum STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/correction/bnlx/fico_dim_fiscal_period'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')