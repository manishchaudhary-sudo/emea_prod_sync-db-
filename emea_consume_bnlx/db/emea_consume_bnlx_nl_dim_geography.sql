CREATE VIEW emea_consume_bnlx.nl_dim_geography (
  ETLLineageID,
  geography_identifier_code,
  d_geography_code,
  file_name,
  load_id,
  geography_level,
  geography_description,
  geography_entry_type,
  geography_stub_id,
  ETLLastModifiedDate,
  ETLChecksum,
  ETLIsDeleted)
WITH SCHEMA BINDING
AS (
SELECT * FROM chdaa_prd_lz_emea.emea_curated_disc_bnlx.nl_dim_geography)