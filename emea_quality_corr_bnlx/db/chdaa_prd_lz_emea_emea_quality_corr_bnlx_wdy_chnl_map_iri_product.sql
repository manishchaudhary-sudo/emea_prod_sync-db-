CREATE TABLE chdaa_prd_lz_emea.emea_quality_corr_bnlx.wdy_chnl_map_iri_product (
  ETLLastModifiedDate TIMESTAMP,
  ETLChecksum STRING,
  d_product_mapping_code STRING,
  update_by STRING,
  extract_by STRING,
  iri_material_name STRING,
  status STRING,
  sap_material_name STRING,
  country_code STRING,
  update_date DATE,
  sap_material_code STRING,
  scope STRING,
  iri_ean_code STRING,
  extract_date DATE,
  ETLIsDeleted BOOLEAN,
  ETLLineageID STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/correction/bnlx/wdy_chnl_map_iri_product'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')