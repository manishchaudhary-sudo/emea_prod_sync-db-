CREATE TABLE chdaa_prd_lz_emea.emea_quality_corr_bnlx.wdy_chnl_map_asw_correction (
  date DATE,
  update_by STRING,
  material_code STRING,
  material_name STRING,
  discount FLOAT,
  extract_by STRING,
  load_id STRING,
  update_date DATE,
  d_correction_code STRING,
  customer_name STRING,
  rebates_other FLOAT,
  customer_code STRING,
  extract_date DATE,
  ETLChecksum STRING,
  ETLIsDeleted BOOLEAN,
  ETLLineageID STRING,
  ETLLastModifiedDate TIMESTAMP)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/correction/bnlx/wdy_chnl_map_asw_correction'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')