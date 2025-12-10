CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_ceec.mkt_m360_ds_um_pt_dim_country (
  last_load TIMESTAMP,
  cluster STRING,
  sub_region STRING,
  description STRING,
  region STRING,
  id STRING,
  ETLIsDeleted BOOLEAN,
  ETLLastModifiedDate TIMESTAMP,
  ETLChecksum STRING,
  ETLLineageID STRING)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/ceec/mkt_m360_ds_um_pt_dim_country'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '1',
  'delta.minWriterVersion' = '2')