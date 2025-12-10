CREATE VIEW emea_consume_bnlx.woody_nl_aswatson (
  ETLIsDeleted,
  ETLChecksum,
  week_no,
  supplier_number,
  bgb_subgroup,
  net_sales_value,
  formula,
  size_type,
  sku_number,
  bgb_headgroup,
  ean_code_ce,
  brand,
  supplier_name,
  year,
  string,
  sales_volume,
  article_description,
  ETLLastModifiedDate,
  ETLLineageID)
WITH SCHEMA BINDING
AS (
SELECT * FROM chdaa_prd_lz_emea.emea_curated_disc_bnlx.woody_nl_aswatson)