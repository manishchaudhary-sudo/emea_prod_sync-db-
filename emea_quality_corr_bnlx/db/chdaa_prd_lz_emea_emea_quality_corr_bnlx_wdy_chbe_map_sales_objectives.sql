CREATE TABLE chdaa_prd_lz_emea.emea_quality_corr_bnlx.wdy_chbe_map_sales_objectives (
  date DATE,
  cluster STRING,
  update_by STRING,
  extract_by STRING,
  load_id STRING,
  objective_eur INT,
  objective_type STRING,
  country_code STRING,
  update_date DATE,
  d_sales_objective_code STRING,
  organization STRING,
  channel STRING,
  extract_date DATE,
  ETLChecksum STRING,
  ETLLastModifiedDate TIMESTAMP,
  ETLIsDeleted BOOLEAN,
  ETLLineageID STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/correction/bnlx/wdy_chbe_map_sales_objectives'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')