CREATE TABLE chdaa_prd_lz_emea.emea_curated_disc_bnlx.dim_man_ch_sales_team_be_sql (
  ETLLineageID STRING,
  ETLChecksum STRING,
  ETLLastModifiedDate TIMESTAMP,
  ETLIsDeleted BOOLEAN,
  employee_cwid STRING,
  area_manager_cwid STRING,
  start_date DATE,
  employee_name STRING,
  update_by STRING,
  team STRING,
  business STRING,
  area_manager_name STRING,
  user_type STRING,
  extract_by STRING,
  status STRING,
  d_team_code STRING,
  territory STRING,
  update_date DATE,
  bu_manager_cwid STRING,
  division STRING,
  region STRING,
  end_date DATE,
  bu_manager_name STRING,
  extract_date DATE)
USING delta
LOCATION 'abfss://curated@zpdatacoresadpemea.dfs.core.windows.net/discovery/bnlx/dim_man_ch_sales_team_be_sql'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 7 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 7 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')