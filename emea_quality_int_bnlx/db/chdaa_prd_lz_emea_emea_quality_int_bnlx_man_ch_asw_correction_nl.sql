CREATE TABLE chdaa_prd_lz_emea.emea_quality_int_bnlx.man_ch_asw_correction_nl (
  ETLIsDeleted BOOLEAN,
  ETLChecksum STRING,
  date DATE,
  update_by STRING,
  material_code STRING,
  material_name STRING,
  discount FLOAT,
  extract_by STRING,
  update_date DATE,
  d_correction_code STRING,
  customer_name STRING,
  rebates_other FLOAT,
  customer_code STRING,
  extract_date DATE,
  ETLLastModifiedDate TIMESTAMP,
  ETLLineageID STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/integration/bnlx/man_ch_asw_correction_nl'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')