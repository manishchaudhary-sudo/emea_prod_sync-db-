CREATE VIEW emea_consume_bnlx.nl_dim_time_period (
  time_period_identifier_code,
  d_time_period_code,
  file_name,
  load_id,
  time_period_entry_type,
  time_period_date,
  time_period_description,
  time_period_length,
  time_period_stub_id,
  ETLIsDeleted,
  ETLChecksum,
  ETLLastModifiedDate,
  ETLLineageID)
WITH SCHEMA BINDING
AS (
SELECT * FROM chdaa_prd_lz_emea.emea_curated_disc_bnlx.nl_dim_time_period)