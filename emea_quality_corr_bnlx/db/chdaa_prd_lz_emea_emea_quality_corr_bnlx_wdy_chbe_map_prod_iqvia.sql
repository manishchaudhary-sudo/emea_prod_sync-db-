CREATE TABLE chdaa_prd_lz_emea.emea_quality_corr_bnlx.wdy_chbe_map_prod_iqvia (
  ETLLastModifiedDate TIMESTAMP,
  ETLIsDeleted BOOLEAN,
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
  scope STRING,
  extract_date DATE,
  ETLLineageID STRING,
  ETLChecksum STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/correction/bnlx/wdy_chbe_map_prod_iqvia'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')