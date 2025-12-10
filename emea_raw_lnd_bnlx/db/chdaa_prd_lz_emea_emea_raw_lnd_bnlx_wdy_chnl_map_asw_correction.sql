CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.wdy_chnl_map_asw_correction (
  d_correction_code STRING,
  date DATE,
  customer_code STRING,
  customer_name STRING,
  material_code STRING,
  material_name STRING,
  discount FLOAT,
  rebates_other FLOAT,
  update_date DATE,
  update_by STRING,
  extract_date DATE,
  extract_by STRING,
  load_id STRING)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/wdy_chnl_map_asw_correction'
TBLPROPERTIES (
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')