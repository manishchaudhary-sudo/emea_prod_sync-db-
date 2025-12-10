CREATE VIEW emea_consume_ceec_pl.ceec_pl_qa_log (
  transaction_source,
  transaction_date,
  transaction_customer_bk,
  transaction_product_bk,
  psdt_akt_synch,
  ETLLastModifiedDate,
  src_unit,
  tgt_unit,
  ETLLastModifiedMonth,
  overall_src_unit,
  overall_tgt_unit)
WITH SCHEMA COMPENSATION
AS SELECT 
  transaction_source,
  transaction_date,
  transaction_customer_bk,
  transaction_product_bk,
  psdt_akt_synch,
  ETLLastModifiedDate,
  src_unit,
  tgt_unit,
  DATE_FORMAT(ETLLastModifiedDate::date, 'MMM-yyyy') AS ETLLastModifiedMonth,
  overall_src_unit,
  overall_tgt_unit
FROM chdaa_prd_lz_emea.emea_curated_disc_ceec.ceec_pl_qa_log