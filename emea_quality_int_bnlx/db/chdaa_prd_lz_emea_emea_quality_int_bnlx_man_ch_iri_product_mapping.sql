CREATE TABLE chdaa_prd_lz_emea.emea_quality_int_bnlx.man_ch_iri_product_mapping (
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
  ETLLastModifiedDate TIMESTAMP,
  ETLLineageID STRING,
  ETLIsDeleted BOOLEAN,
  ETLChecksum STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/integration/bnlx/man_ch_iri_product_mapping'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')