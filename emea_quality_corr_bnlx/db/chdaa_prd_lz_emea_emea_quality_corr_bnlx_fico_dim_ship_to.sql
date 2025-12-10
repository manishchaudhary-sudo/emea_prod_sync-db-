CREATE TABLE chdaa_prd_lz_emea.emea_quality_corr_bnlx.fico_dim_ship_to (
  ETLLineageID STRING,
  ship_to_ch_id_02 STRING,
  optime STRING,
  ship_to_street STRING,
  ship_to_postal_code STRING,
  ship_to_country_id STRING,
  ship_to_id STRING,
  ship_to_city STRING,
  ship_to_region STRING,
  ship_to STRING,
  ship_to_ch_02 STRING,
  ship_to_region_id STRING,
  opsys STRING,
  ship_to_ch_id_01 STRING,
  ship_to_sid STRING,
  ship_to_country STRING,
  ship_to_industry STRING,
  ship_to_ch_01 STRING,
  optype STRING,
  ship_to_industry_id STRING,
  ETLIsDeleted BOOLEAN,
  ETLLastModifiedDate TIMESTAMP,
  ETLChecksum STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/correction/bnlx/fico_dim_ship_to'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')