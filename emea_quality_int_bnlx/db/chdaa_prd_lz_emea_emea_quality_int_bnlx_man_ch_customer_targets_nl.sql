CREATE TABLE chdaa_prd_lz_emea.emea_quality_int_bnlx.man_ch_customer_targets_nl (
  discount_target FLOAT,
  date DATE,
  update_by STRING,
  material_code STRING,
  material_name STRING,
  d_customer_target_code STRING,
  extract_by STRING,
  gross_sales_target FLOAT,
  net_sales_target FLOAT,
  objective_type STRING,
  update_date DATE,
  customer_name STRING,
  customer_code STRING,
  extract_date DATE,
  ETLLastModifiedDate TIMESTAMP,
  ETLLineageID STRING,
  ETLIsDeleted BOOLEAN,
  ETLChecksum STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/integration/bnlx/man_ch_customer_targets_nl'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')