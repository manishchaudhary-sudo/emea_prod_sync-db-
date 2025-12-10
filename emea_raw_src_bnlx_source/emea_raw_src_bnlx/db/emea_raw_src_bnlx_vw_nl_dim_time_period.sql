CREATE VIEW emea_raw_src_bnlx.vw_nl_dim_time_period (
  ETLIsDeleted,
  time_period_identifier_code,
  d_time_period_code,
  file_name,
  load_id,
  time_period_entry_type,
  time_period_date,
  time_period_description,
  time_period_length,
  time_period_stub_id,
  ETLLineageID,
  ETLLastModifiedDate,
  ETLChecksum)
WITH SCHEMA BINDING
AS (SELECT * FROM  chdaa_prd_cda_mkt.mkt_consume_emea.nl_dim_time_period)