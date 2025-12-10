CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_ceec.s4u_sprzedaz_ceec_pl (
  godz_sprzedazy TIMESTAMP,
  symbol_obcy STRING,
  ilosc_sprzedana FLOAT,
  nr_faktury_dostawcy STRING,
  typ_sprzedazy STRING,
  numer_apteki STRING,
  psdt_akt_synch TIMESTAMP,
  global_id STRING,
  data_sprzedazy DATE,
  data_zakupu_apteka DATE,
  ETLIsDeleted BOOLEAN,
  ETLLastModifiedDate TIMESTAMP,
  ETLChecksum STRING,
  ETLLineageID STRING)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/ceec/s4u_sprzedaz_ceec_pl'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 7 days',
  'delta.logRetentionDuration' = 'interval 7 days',
  'delta.minReaderVersion' = '1',
  'delta.minWriterVersion' = '2')