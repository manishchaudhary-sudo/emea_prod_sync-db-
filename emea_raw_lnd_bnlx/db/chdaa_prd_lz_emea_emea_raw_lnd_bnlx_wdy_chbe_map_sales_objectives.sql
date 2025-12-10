CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.wdy_chbe_map_sales_objectives (
  d_sales_objective_code STRING,
  objective_type STRING,
  country_code STRING,
  cluster STRING,
  channel STRING,
  organization STRING,
  date DATE,
  objective_eur INT,
  update_date DATE,
  update_by STRING,
  extract_date DATE,
  extract_by STRING,
  load_id STRING)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/wdy_chbe_map_sales_objectives'
TBLPROPERTIES (
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')