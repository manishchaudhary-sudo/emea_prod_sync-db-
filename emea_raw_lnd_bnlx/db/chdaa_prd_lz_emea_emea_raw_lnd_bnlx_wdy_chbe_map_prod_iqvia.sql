CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.wdy_chbe_map_prod_iqvia (
  d_product_mapping_code STRING,
  country_code STRING,
  status STRING,
  sap_material_code STRING,
  sap_material_name STRING,
  iqvia_fcc STRING,
  iqvia_ndf STRING,
  scope STRING,
  update_date DATE,
  update_by STRING,
  extract_date DATE,
  extract_by STRING)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/wdy_chbe_map_prod_iqvia'
TBLPROPERTIES (
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')