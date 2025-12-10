CREATE TABLE chdaa_prd_lz_emea.emea_quality_int_bnlx.man_ch_sales_objective_be (
  ETLIsDeleted BOOLEAN,
  ETLChecksum STRING,
  date DATE,
  cluster STRING,
  update_by STRING,
  objective_eur INT,
  extract_by STRING,
  objective_type STRING,
  country_code STRING,
  update_date DATE,
  d_sales_objective_code STRING,
  organization STRING,
  channel STRING,
  extract_date DATE,
  ETLLastModifiedDate TIMESTAMP,
  ETLLineageID STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/integration/bnlx/man_sales_objective_be'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')