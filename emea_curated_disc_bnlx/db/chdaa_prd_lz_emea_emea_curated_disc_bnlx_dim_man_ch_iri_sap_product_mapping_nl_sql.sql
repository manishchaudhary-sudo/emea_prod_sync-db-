CREATE TABLE chdaa_prd_lz_emea.emea_curated_disc_bnlx.dim_man_ch_iri_sap_product_mapping_nl_sql (
  d_product_mapping_code STRING,
  update_by STRING,
  extract_by STRING,
  iri_material_name STRING,
  status STRING,
  sap_material_name STRING,
  country_code STRING,
  update_date DATE,
  sap_material_code STRING,
  dummy INT,
  scope STRING,
  iri_ean_code STRING,
  extract_date DATE,
  ETLLineageID STRING,
  ETLIsDeleted BOOLEAN,
  ETLLastModifiedDate TIMESTAMP,
  ETLChecksum STRING)
USING delta
LOCATION 'abfss://curated@zpdatacoresadpemea.dfs.core.windows.net/discovery/bnlx/dim_man_ch_iri_sap_product_mapping_nl_sql'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 7 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 7 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')