CREATE TABLE chdaa_prd_lz_emea.emea_quality_enr_bnlx.man_ch_product_mapping (
  ETLLastModifiedDate TIMESTAMP,
  ETLLineageID STRING,
  ETLChecksum STRING,
  ETLIsDeleted BOOLEAN,
  cnk_material_code STRING,
  d_product_mapping_code STRING,
  update_by STRING,
  sub_brand STRING,
  portfolio_management STRING,
  extract_by STRING,
  iri_material_name STRING,
  status STRING,
  brand_cluster STRING,
  product_name STRING,
  sap_material_name STRING,
  main_sap_material_code STRING,
  country_code STRING,
  update_date DATE,
  brand STRING,
  sap_material_code STRING,
  iri_ean_code STRING,
  cnk_material_name STRING,
  category STRING,
  extract_date DATE)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/enrichment/bnlx/man_ch_product_mapping'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')