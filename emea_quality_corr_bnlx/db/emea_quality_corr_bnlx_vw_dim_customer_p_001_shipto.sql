CREATE VIEW emea_quality_corr_bnlx.vw_dim_customer_p_001_shipto (
  `0country_shipto`,
  `0country___t_shipto`,
  `0city_shipto`,
  `0customer_shipto`,
  `0customer___t_shipto`,
  `0customer_shipto_trim`,
  `0postal_cd_shipto`,
  `0street_shipto`)
WITH SCHEMA BINDING
AS (
  Select ship_to_country_id as 0country_shipto,ship_to_country as 0country___t_shipto,ship_to_city as 0city_shipto, ship_to_id as 0customer_shipto,ship_to as 0customer___t_shipto,ltrim(0,ship_to_id) as 0customer_shipto_trim,ship_to_postal_code as 0postal_cd_shipto,ship_to_street as 0street_shipto   from emea_quality_corr_bnlx.fico_dim_ship_to 
  )