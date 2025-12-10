CREATE TABLE chdaa_prd_lz_emea.emea_quality_corr_bnlx.fico_dim_payer (
  payer_city STRING,
  payer_region STRING,
  optime STRING,
  payer_ch_id_02 STRING,
  payer_ch_01 STRING,
  payer_ch_id_01 STRING,
  payer_industry_id STRING,
  payer_ch_02 STRING,
  payer_country STRING,
  payer_region_id STRING,
  payer_industry STRING,
  opsys STRING,
  payer_sid STRING,
  payer STRING,
  payer_postal_code STRING,
  payer_street STRING,
  payer_country_id STRING,
  payer_id STRING,
  optype STRING,
  ETLIsDeleted BOOLEAN,
  ETLLastModifiedDate TIMESTAMP,
  ETLChecksum STRING,
  ETLLineageID STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/correction/bnlx/fico_dim_payer'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')