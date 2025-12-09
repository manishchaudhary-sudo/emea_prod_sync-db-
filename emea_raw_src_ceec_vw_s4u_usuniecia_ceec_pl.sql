CREATE VIEW emea_raw_src_ceec.vw_s4u_usuniecia_ceec_pl (
  wykonanie_polecenia_usuniecia,
  ETLIsDeleted,
  ETLLineageID,
  ETLLastModifiedDate,
  ETLChecksum,
  numer_apteki,
  load_id,
  source)
WITH SCHEMA BINDING
AS (
SELECT 
wykonaniepoleceniausuniecia wykonanie_polecenia_usuniecia,
ETLIsDeleted,
ETLLineageID,
ETLLastModifiedDate,
ETLChecksum,
numerapteki numer_apteki,
string(date_format(current_timestamp(), 'ddMMyyyyHHmmss')) load_id,
'S4U-sale' source
FROM --parquet.`/mnt/crm/s4u/s4u_usuniecia_ceec_pl`
chdaa_prd_cda_crm.crm_consume_emea.s4u_usuniecia_ceec_pl 
where cast(ETLLastModifiedDate as date) >=current_date()
--where cast(ETLLastModifiedDate as date) >='1900-01-01'
)