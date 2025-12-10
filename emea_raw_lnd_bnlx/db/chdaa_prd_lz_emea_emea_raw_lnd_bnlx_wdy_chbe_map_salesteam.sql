CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.wdy_chbe_map_salesteam (
  d_team_code STRING,
  division STRING,
  business STRING,
  bu_manager_name STRING,
  bu_manager_cwid STRING,
  team STRING,
  area_manager_name STRING,
  area_manager_cwid STRING,
  region STRING,
  user_type STRING,
  status STRING,
  employee_name STRING,
  employee_cwid STRING,
  start_date DATE,
  end_date DATE,
  territory STRING,
  update_date DATE,
  update_by STRING,
  extract_date DATE,
  extract_by STRING)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/wdy_chbe_map_salesteam'
TBLPROPERTIES (
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')