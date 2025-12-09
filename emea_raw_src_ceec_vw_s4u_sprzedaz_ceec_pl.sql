CREATE VIEW emea_raw_src_ceec.vw_s4u_sprzedaz_ceec_pl (
  ETLIsDeleted,
  ETLChecksum,
  ETLLineageID,
  ETLLastModifiedDate,
  godz_sprzedazy,
  symbol_obcy,
  ilosc_sprzedana,
  nr_faktury_dostawcy,
  load_id,
  typ_sprzedazy,
  numer_apteki,
  psdt_akt_synch,
  global_id,
  data_sprzedazy,
  data_zakupu_apteka)
WITH SCHEMA BINDING
AS (
SELECT 
  ETLIsDeleted,
  ETLChecksum,
  ETLLineageID,
  ETLLastModifiedDate,
  godz_sprzedazy,
  symbol_obcy,
  ilosc_sprzedana,
  nr_faktury_dostawcy,
  NULL load_id,
  typ_sprzedazy,
  numer_apteki,
  psdt_akt_synch,
  global_id,
  data_sprzedazy,
  data_zakupu_apteka 
FROM --parquet.`/mnt/crm/s4u/s4u_sprzedaz_ceec_pl`
chdaa_prd_cda_crm.crm_consume_emea.s4u_sprzedaz_ceec_pl
where cast(ETLLastModifiedDate as date) >=current_date()
--where cast(ETLLastModifiedDate as date) >='1900-01-01'
)