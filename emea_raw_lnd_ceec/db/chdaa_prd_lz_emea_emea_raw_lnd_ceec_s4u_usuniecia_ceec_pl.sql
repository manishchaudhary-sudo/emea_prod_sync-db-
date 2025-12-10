CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_ceec.s4u_usuniecia_ceec_pl (
  wykonanie_polecenia_usuniecia TIMESTAMP,
  load_id STRING,
  numer_apteki STRING,
  source STRING,
  ETLIsDeleted BOOLEAN,
  ETLLastModifiedDate TIMESTAMP,
  ETLChecksum STRING,
  ETLLineageID STRING)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/ceec/s4u_usuniecia_ceec_pl'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 7 days',
  'delta.logRetentionDuration' = 'interval 7 days',
  'delta.minReaderVersion' = '1',
  'delta.minWriterVersion' = '2')