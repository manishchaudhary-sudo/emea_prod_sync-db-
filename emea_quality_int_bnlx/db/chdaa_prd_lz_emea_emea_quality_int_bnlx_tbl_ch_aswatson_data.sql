CREATE TABLE chdaa_prd_lz_emea.emea_quality_int_bnlx.tbl_ch_aswatson_data (
  ETLIsDeleted BOOLEAN,
  ETLChecksum STRING,
  date DATE,
  sales_volume DOUBLE,
  supplier_number STRING,
  ean_code STRING,
  bgb_subgroup STRING,
  formula STRING,
  size_type STRING,
  sku_number STRING,
  net_sales_value DOUBLE,
  week_number STRING,
  bgb_headgroup STRING,
  brand STRING,
  supplier_name STRING,
  year STRING,
  article_description STRING,
  ETLLastModifiedDate TIMESTAMP,
  ETLLineageID STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/integration/bnlx/tbl_ch_aswatson_data'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')