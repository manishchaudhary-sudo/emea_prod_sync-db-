CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.woody_nl_aswatson (
  ETLLastModifiedDate TIMESTAMP,
  ETLIsDeleted BOOLEAN,
  ETLLineageID STRING,
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
  ETLChecksum STRING)
USING delta
OPTIONS (
  'mergeSchema' = 'true')
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/woody_nl_aswatson'
TBLPROPERTIES (
  'delta.minReaderVersion' = '1',
  'delta.minWriterVersion' = '2')