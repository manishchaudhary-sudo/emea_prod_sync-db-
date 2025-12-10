CREATE TABLE chdaa_prd_lz_emea.emea_quality_corr_ceec.s4u_stany_ceec_pl (
  symbol_obcy STRING,
  data_stanu DATE,
  numer_apteki STRING,
  psdt_akt_synch TIMESTAMP,
  global_id STRING,
  ilosc FLOAT,
  ETLIsDeleted BOOLEAN,
  ETLLastModifiedDate TIMESTAMP,
  ETLChecksum STRING,
  ETLLineageID STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/correction/ceec/s4u_stany_ceec_pl'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 7 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 7 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')