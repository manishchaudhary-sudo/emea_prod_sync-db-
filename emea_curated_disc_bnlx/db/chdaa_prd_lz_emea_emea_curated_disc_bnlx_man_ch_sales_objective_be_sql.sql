CREATE TABLE chdaa_prd_lz_emea.emea_curated_disc_bnlx.man_ch_sales_objective_be_sql (
  ETLLineageID STRING,
  date DATE,
  objective_eur BIGINT,
  cluster STRING,
  update_by STRING,
  extract_by STRING,
  objective_type STRING,
  country_code STRING,
  update_date DATE,
  d_sales_objective_code STRING,
  organization STRING,
  channel STRING,
  extract_date DATE,
  ETLIsDeleted BOOLEAN,
  ETLLastModifiedDate TIMESTAMP,
  ETLChecksum STRING)
USING delta
LOCATION 'abfss://curated@zpdatacoresadpemea.dfs.core.windows.net/discovery/bnlx/man_ch_sales_objective_be_sql'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 7 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 7 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')