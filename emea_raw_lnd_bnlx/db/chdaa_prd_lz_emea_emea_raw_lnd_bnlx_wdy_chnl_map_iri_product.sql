CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.wdy_chnl_map_iri_product (
  d_product_mapping_code STRING,
  country_code STRING,
  status STRING,
  sap_material_code STRING,
  sap_material_name STRING,
  iri_ean_code STRING,
  iri_material_name STRING,
  update_date DATE,
  update_by STRING,
  extract_date DATE,
  extract_by STRING,
  scope STRING)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/wdy_chnl_map_iri_product'
TBLPROPERTIES (
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')