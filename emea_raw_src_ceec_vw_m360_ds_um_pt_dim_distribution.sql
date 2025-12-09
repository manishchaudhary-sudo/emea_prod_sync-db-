CREATE VIEW emea_raw_src_ceec.vw_m360_ds_um_pt_dim_distribution (
  id,
  country,
  version,
  channel_name,
  channel_group,
  channel_local_name,
  data_source,
  channel_ecommerce,
  etl_last_load)
WITH SCHEMA BINDING
AS (
  SELECT 
  `ID` AS id,
`COUNTRY` AS country,
`VERSION` AS version,
`CHANNEL.NAME` AS channel_name,
`CHANNEL.GROUP` AS channel_group,
`CHANNEL.LOCAL.NAME` AS channel_local_name,
`DATA_SOURCE` AS data_source,
`CHANNEL_ECOMMERCE` AS channel_ecommerce,
`ETL_Last_Load` AS etl_last_load
 FROM chdaa_prd_cda_mkt.mkt_curated_prov.leg_m360_ds_um_pt_dim_distribution
)