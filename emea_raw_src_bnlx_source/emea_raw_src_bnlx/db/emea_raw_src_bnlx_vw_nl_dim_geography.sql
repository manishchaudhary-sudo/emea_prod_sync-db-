CREATE VIEW emea_raw_src_bnlx.vw_nl_dim_geography (
  geography_identifier_code,
  d_geography_code,
  file_name,
  load_id,
  geography_level,
  geography_description,
  geography_entry_type,
  geography_stub_id,
  ETLIsDeleted,
  ETLChecksum,
  ETLLastModifiedDate,
  ETLLineageID)
WITH SCHEMA BINDING
AS (SELECT * FROM  chdaa_prd_cda_mkt.mkt_consume_emea.nl_dim_geography)