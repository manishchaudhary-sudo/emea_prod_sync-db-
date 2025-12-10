CREATE VIEW emea_curated_disc_ceec.vw_bnlx_ceec_audit_info (
  Country,
  file_name,
  data_uploaded_date)
WITH SCHEMA COMPENSATION
AS (
select * from chdaa_prd_cda_mkt.mkt_consume_emea.bnlx_ceec_audit_info
where Country in ('CEEC','PL')
)