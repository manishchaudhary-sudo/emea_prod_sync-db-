CREATE TABLE chdaa_prd_lz_emea.emea_quality_enr_bnlx.man_ch_sales_objective_be (
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
  ETLLineageID STRING,
  ETLIsDeleted BOOLEAN,
  ETLChecksum STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/enrichment/bnlx/man_sales_objective_be'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')