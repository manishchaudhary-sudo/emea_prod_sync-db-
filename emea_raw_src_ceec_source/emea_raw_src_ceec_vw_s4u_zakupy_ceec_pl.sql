CREATE VIEW emea_raw_src_ceec.vw_s4u_zakupy_ceec_pl (
  ETLLastModifiedDate,
  ETLIsDeleted,
  ETLChecksum,
  ETLLineageID,
  symbol_obcy,
  data_sp_hurtownia,
  ilosc_kupiona_po_korekcie,
  seria,
  KZ_GLOBAL_ID,
  nr_dokumentu_przyjecia,
  ilosc_kupiona,
  numer_apteki,
  nazwa_dostawcy,
  data_przyjecia_apteka,
  psdt_akt_synch,
  typ_przyjecia,
  data_waznosci)
WITH SCHEMA BINDING
AS (
SELECT   
  ETLLastModifiedDate,
  ETLIsDeleted,
  ETLChecksum,
  ETLLineageID,
  symbol_obcy,
  data_sp_hurtownia,
  ilosc_kupiona_po_korekcie,
  seria,
  KZ_GLOBAL_ID,
  nr_dokumentu_przyjecia,
  ilosc_kupiona,
  numer_apteki,
  nazwa_dostawcy,
  data_przyjecia_apteka,
  psdt_akt_synch,
  typ_przyjecia,
  data_waznosci
FROM -- parquet.`/mnt/crm/s4u/s4u_zakupy_ceec_pl`
chdaa_prd_cda_crm.crm_consume_emea.s4u_zakupy_ceec_pl 
where cast(ETLLastModifiedDate as date) >=current_date()
--where cast(ETLLastModifiedDate as date) >='1900-01-01'
)