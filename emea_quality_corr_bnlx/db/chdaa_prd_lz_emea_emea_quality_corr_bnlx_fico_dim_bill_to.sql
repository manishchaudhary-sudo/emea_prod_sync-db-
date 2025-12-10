CREATE TABLE chdaa_prd_lz_emea.emea_quality_corr_bnlx.fico_dim_bill_to (
  ETLChecksum STRING,
  ETLLastModifiedDate TIMESTAMP,
  bill_to_id STRING,
  bill_to_region_id STRING,
  bill_to_ch_02 STRING,
  optime STRING,
  bill_to_country STRING,
  bill_to_industry_id STRING,
  bill_to_postal_code STRING,
  bill_to_city STRING,
  bill_to_ch_id_02 STRING,
  bill_to_industry STRING,
  bill_to STRING,
  bill_to_sid STRING,
  bill_to_ch_id_01 STRING,
  bill_to_ch_01 STRING,
  bill_to_region STRING,
  opsys STRING,
  bill_to_street STRING,
  bill_to_country_id STRING,
  optype STRING,
  ETLLineageID STRING,
  ETLIsDeleted BOOLEAN)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/correction/bnlx/fico_dim_bill_to'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')