CREATE TABLE chdaa_prd_lz_emea.emea_quality_corr_ceec.s4u_zakupy_ceec_pl (
  symbol_obcy STRING,
  data_sp_hurtownia TIMESTAMP,
  ilosc_kupiona_po_korekcie FLOAT,
  seria STRING,
  nr_dokumentu_przyjecia STRING,
  ilosc_kupiona FLOAT,
  numer_apteki STRING,
  nazwa_dostawcy STRING,
  data_przyjecia_apteka TIMESTAMP,
  psdt_akt_synch TIMESTAMP,
  global_id STRING,
  typ_przyjecia STRING,
  data_waznosci TIMESTAMP,
  ETLIsDeleted BOOLEAN,
  ETLLastModifiedDate TIMESTAMP,
  ETLChecksum STRING,
  ETLLineageID STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/correction/ceec/s4u_zakupy_ceec_pl'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 7 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 7 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')