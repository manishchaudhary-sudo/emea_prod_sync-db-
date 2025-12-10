CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_ceec.mkt_m360_ds_um_pt_dim_distribution (
  channel_name STRING,
  data_source STRING,
  country STRING,
  channel_group STRING,
  channel_ecommerce STRING,
  channel_local_name STRING,
  version STRING,
  etl_last_load TIMESTAMP,
  id STRING,
  ETLIsDeleted BOOLEAN,
  ETLLastModifiedDate TIMESTAMP,
  ETLChecksum STRING,
  ETLLineageID STRING)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/ceec/mkt_m360_ds_um_pt_dim_distribution'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '1',
  'delta.minWriterVersion' = '2')