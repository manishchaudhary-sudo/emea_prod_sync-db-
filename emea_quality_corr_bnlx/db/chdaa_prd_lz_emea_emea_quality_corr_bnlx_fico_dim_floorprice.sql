CREATE TABLE chdaa_prd_lz_emea.emea_quality_corr_bnlx.fico_dim_floorprice (
  ETLIsDeleted BOOLEAN,
  ETLLastModifiedDate TIMESTAMP,
  floorprice FLOAT,
  formulation_uom STRING,
  deletion_date TIMESTAMP,
  formulation_id STRING,
  global_product_sid_txt STRING,
  combipack_flag STRING,
  fgps_id STRING,
  global_product_sid STRING,
  floorprice_currency STRING,
  formulation STRING,
  global_product STRING,
  formulation_flavour STRING,
  ETLLineageID STRING,
  ETLChecksum STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/correction/bnlx/fico_dim_floorprice'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')