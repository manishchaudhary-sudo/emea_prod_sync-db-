CREATE TABLE chdaa_prd_lz_emea.emea_quality_corr_ceec.s4u_usuniecia_ceec_pl (
  wykonanie_polecenia_usuniecia TIMESTAMP,
  load_id STRING,
  numer_apteki STRING,
  source STRING,
  ETLIsDeleted BOOLEAN,
  ETLLastModifiedDate TIMESTAMP,
  ETLChecksum STRING,
  ETLLineageID STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/correction/ceec/s4u_usuniecia_ceec_pl'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 7 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 7 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')