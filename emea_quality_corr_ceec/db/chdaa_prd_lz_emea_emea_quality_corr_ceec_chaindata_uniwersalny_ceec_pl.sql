CREATE TABLE chdaa_prd_lz_emea.emea_quality_corr_ceec.chaindata_uniwersalny_ceec_pl (
  numer_zamwienia STRING,
  data_zakupu STRING,
  data_sprzeday_hurtownia STRING,
  zakup STRING,
  dostawca STRING,
  godzina_sprzeday STRING,
  nr_programu STRING,
  ilo_kupiona_po_korekcie STRING,
  aktualnosc STRING,
  termin_wanoci STRING,
  numer_serii STRING,
  bloz07 STRING,
  stan STRING,
  sprzedaz STRING,
  typ_sprzeday STRING,
  horyzont STRING,
  numer_dokumentu STRING,
  typ_przyjcia STRING,
  program STRING,
  id_kamsoft STRING,
  ETLIsDeleted BOOLEAN,
  ETLLastModifiedDate TIMESTAMP,
  ETLChecksum STRING,
  ETLLineageID STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/correction/ceec/chaindata_uniwersalny_ceec_pl'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 7 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 7 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')