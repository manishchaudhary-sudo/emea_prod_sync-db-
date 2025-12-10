CREATE TABLE chdaa_prd_lz_emea.emea_curated_disc_bnlx.dim_man_ch_iqvia_sap_product_mapping_be_sql (
  d_product_mapping_code STRING,
  update_by STRING,
  iqvia_fcc STRING,
  extract_by STRING,
  status STRING,
  sap_material_name STRING,
  iqvia_ndf STRING,
  country_code STRING,
  update_date DATE,
  sap_material_code STRING,
  dummy INT,
  scope STRING,
  extract_date DATE,
  ETLChecksum STRING,
  ETLIsDeleted BOOLEAN,
  ETLLineageID STRING,
  ETLLastModifiedDate TIMESTAMP)
USING delta
LOCATION 'abfss://curated@zpdatacoresadpemea.dfs.core.windows.net/discovery/bnlx/dim_man_ch_iqvia_sap_product_mapping_be_sql'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 7 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 7 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')