CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.wdy_chnl_map_customer_target (
  d_customer_target_code INT,
  customer_code STRING,
  customer_name STRING,
  material_code STRING,
  material_name STRING,
  objective_type STRING,
  date DATE,
  gross_sales_target FLOAT,
  discount_target FLOAT,
  net_sales_target FLOAT,
  update_date DATE,
  update_by STRING,
  extract_date DATE,
  extract_by STRING,
  load_id STRING)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/wdy_chnl_map_customer_target'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')