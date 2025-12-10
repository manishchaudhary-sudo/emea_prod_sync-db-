CREATE TABLE chdaa_prd_lz_emea.emea_quality_corr_bnlx.woody_nl_aswatson (
  week_no STRING,
  supplier_number STRING,
  bgb_subgroup STRING,
  net_sales_value FLOAT,
  formula STRING,
  size_type STRING,
  sku_number STRING,
  bgb_headgroup STRING,
  ean_code_ce STRING,
  brand STRING,
  supplier_name STRING,
  year STRING,
  string STRING,
  sales_volume FLOAT,
  article_description STRING,
  ETLChecksum STRING,
  ETLIsDeleted BOOLEAN,
  ETLLineageID STRING,
  ETLLastModifiedDate TIMESTAMP)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/correction/bnlx/woody_nl_aswatson'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')