CREATE VIEW emea_quality_corr_bnlx.vw_dim_customer_p_001_soldto (
  `0country_soldto`,
  `0country___t_soldto`,
  `0postal_cd_soldto`,
  `0street_soldto`,
  `0city_soldto`,
  `0customer_soldto`,
  `0customer___t_soldto`,
  `0customer_soldto_trim`)
WITH SCHEMA BINDING
AS (
  Select sold_to_country_id as 0country_soldto, sold_to_country as 0country___t_soldto,sold_to_postal_code as 0postal_cd_soldto, sold_to_street as 0street_soldto,sold_to_city as 0city_soldto, sold_to_id as 0customer_soldto ,sold_to as 0customer___t_soldto , ltrim(0,sold_to_id) as 0customer_soldto_trim
  from emea_quality_corr_bnlx.fico_dim_sold_to
  )