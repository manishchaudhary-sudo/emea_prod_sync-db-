CREATE VIEW emea_raw_src_ceec.vw_m360_ds_um_pt_dim_country (
  id,
  region,
  sub_region,
  cluster,
  description,
  last_load)
WITH SCHEMA BINDING
AS (
  SELECT
ID AS id,
REGION AS region,
SUB_REGION AS sub_region,
CLUSTER AS cluster,
DESCRIPTION AS description,
Last_Load AS last_load
 FROM chdaa_prd_cda_mkt.mkt_curated_prov.leg_m360_ds_um_pt_dim_country
)