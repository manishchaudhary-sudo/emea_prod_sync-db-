CREATE TABLE chdaa_prd_lz_emea.emea_curated_disc_bnlx.woody_nl_aswatson (
  ETLIsDeleted BOOLEAN,
  ETLChecksum STRING,
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
  ETLLastModifiedDate TIMESTAMP,
  ETLLineageID STRING)
USING delta
LOCATION 'abfss://curated@zpdatacoresadpemea.dfs.core.windows.net/discovery/bnlx/woody_nl_aswatson'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')