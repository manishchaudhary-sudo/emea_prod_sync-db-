CREATE TABLE chdaa_prd_lz_emea.emea_curated_disc_bnlx.dim_man_ch_customer_targets_nl_sql (
  ETLLineageID STRING,
  ETLChecksum STRING,
  ETLIsDeleted BOOLEAN,
  date DATE,
  ETLLastModifiedDate TIMESTAMP,
  discount_target DOUBLE,
  update_by STRING,
  material_code STRING,
  material_name STRING,
  d_customer_target_code STRING,
  extract_by STRING,
  net_sales_target DOUBLE,
  objective_type STRING,
  gross_sales_target DOUBLE,
  update_date DATE,
  customer_name STRING,
  customer_code STRING,
  extract_date DATE)
USING delta
LOCATION 'abfss://curated@zpdatacoresadpemea.dfs.core.windows.net/discovery/bnlx/dim_man_ch_customer_targets_nl_sql'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 7 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 7 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')