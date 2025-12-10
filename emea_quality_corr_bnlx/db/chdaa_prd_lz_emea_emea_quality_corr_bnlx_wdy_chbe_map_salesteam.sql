CREATE TABLE chdaa_prd_lz_emea.emea_quality_corr_bnlx.wdy_chbe_map_salesteam (
  ETLIsDeleted BOOLEAN,
  ETLLineageID STRING,
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
  extract_date DATE,
  ETLChecksum STRING,
  ETLLastModifiedDate TIMESTAMP)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/correction/bnlx/wdy_chbe_map_salesteam'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')