CREATE VIEW emea_quality_corr_bnlx.vw_man_ch_sales_objective_be (
  d_sales_objective_code,
  objective_type,
  country_code,
  channel,
  organization,
  date,
  objective_eur,
  update_date,
  update_by,
  extract_date,
  extract_by,
  cluster)
WITH SCHEMA BINDING
AS SELECT
  DISTINCT d_sales_objective_code,
  objective_type,
  country_code,
  channel,
  organization,
  date,
  objective_eur,
  update_date,
  update_by,
  extract_date,
  extract_by,
  cluster
 
FROM
  (
    SELECT
      sha2(
        ifnull(objective_type, '') || ifnull(country_code, '') || ifnull(channel, '') || ifnull(organization, '') || ifnull(date, '') || ifnull(objective_eur, '') || ifnull(update_date, '') || ifnull(update_by, '') || ifnull(extract_date, '') || ifnull(extract_by, '') || ifnull(cluster, ''),
        256
      ) as d_sales_objective_code,
      objective_type,
      country_code,
      channel,
      organization,
      date,
      objective_eur,
      update_date,
      update_by,
      extract_date,
      extract_by,
      cluster
    FROM
      emea_quality_corr_bnlx.wdy_chbe_map_sales_objectives

  )