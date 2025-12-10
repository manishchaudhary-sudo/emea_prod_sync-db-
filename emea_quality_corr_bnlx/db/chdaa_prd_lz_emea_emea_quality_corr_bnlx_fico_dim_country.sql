CREATE TABLE chdaa_prd_lz_emea.emea_quality_corr_bnlx.fico_dim_country (
  country_hl_02 STRING,
  country_hl_04 STRING,
  country_hl_id_02 STRING,
  country_hl_01 STRING,
  optime STRING,
  country_hl_id_03 STRING,
  country STRING,
  country_hl_id_06 STRING,
  country_sid STRING,
  country_hl_id_04 STRING,
  country_id STRING,
  country_hl_06 STRING,
  opsys STRING,
  country_hl_03 STRING,
  country_hl_id_01 STRING,
  country_hl_05 STRING,
  country_hl_id_05 STRING,
  optype STRING,
  ETLIsDeleted BOOLEAN,
  ETLLastModifiedDate TIMESTAMP,
  ETLLineageID STRING,
  ETLChecksum STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/correction/bnlx/fico_dim_country'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')