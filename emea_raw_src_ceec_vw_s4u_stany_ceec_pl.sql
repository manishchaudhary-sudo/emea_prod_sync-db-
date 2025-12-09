CREATE VIEW emea_raw_src_ceec.vw_s4u_stany_ceec_pl (
  ETLLastModifiedDate,
  symbol_obcy,
  data_stanu,
  load_id,
  numer_apteki,
  psdt_akt_synch,
  global_id,
  ilosc,
  ETLLineageID,
  ETLChecksum,
  ETLIsDeleted)
WITH SCHEMA BINDING
AS (
SELECT 
  ETLLastModifiedDate,
  symbol_obcy,
  data_stanu,
  NULL load_id,
  numer_apteki,
  psdt_akt_synch,
  global_id,
  ilosc,
  ETLLineageID,
  ETLChecksum,
  ETLIsDeleted 
FROM --parquet.`/mnt/crm/s4u/s4u_stany_ceec_pl`
chdaa_prd_cda_crm.crm_consume_emea.s4u_stany_ceec_pl 
where cast(ETLLastModifiedDate as date) >=current_date()
--where cast(ETLLastModifiedDate as date) >='1900-01-01'
)