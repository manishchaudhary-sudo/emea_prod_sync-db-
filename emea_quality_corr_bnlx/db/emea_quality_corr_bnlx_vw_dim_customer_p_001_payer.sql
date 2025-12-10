CREATE VIEW emea_quality_corr_bnlx.vw_dim_customer_p_001_payer (
  `0country_payer`,
  `0country___t_payer`,
  `0city_payer`,
  `0customer_payer`,
  `0customer___t_payer`,
  `0customer_payer_trim`,
  `0postal_cd_payer`,
  `0street_payer`)
WITH SCHEMA BINDING
AS ( 
  Select payer_country_id as 0country_payer,payer_country as 0country___t_payer,payer_city as 0city_payer, payer_id as 0customer_payer, payer as 0customer___t_payer  ,ltrim(0,payer_id) as 0customer_payer_trim,payer_postal_code AS 0postal_cd_payer,payer_street as 0street_payer  from emea_quality_corr_bnlx.fico_dim_payer
  )