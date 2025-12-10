CREATE TABLE chdaa_prd_lz_emea.emea_curated_disc_bnlx.dim_man_ch_asw_correction_nl_sql (
  date DATE,
  update_by STRING,
  material_code STRING,
  discount DOUBLE,
  material_name STRING,
  extract_by STRING,
  update_date DATE,
  rebates_other DOUBLE,
  d_correction_code STRING,
  customer_name STRING,
  customer_code STRING,
  extract_date DATE,
  ETLIsDeleted BOOLEAN,
  ETLChecksum STRING,
  ETLLineageID STRING,
  ETLLastModifiedDate TIMESTAMP)
USING delta
LOCATION 'abfss://curated@zpdatacoresadpemea.dfs.core.windows.net/discovery/bnlx/dim_man_ch_asw_correction_nl_sql'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 7 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 7 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')