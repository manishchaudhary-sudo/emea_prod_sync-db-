CREATE VIEW emea_quality_corr_bnlx.vw_dim_customer_p_001_billto (
  `0country_billto`,
  `0country___t_billto`,
  `0city_billto`,
  `0customer_billto`,
  `0customer___t_billto`,
  `0customer_billto_trim`,
  `0postal_cd_billto`,
  `0street_billto`)
WITH SCHEMA BINDING
AS (
Select distinct bill_to_country_id as 0country_billto,bill_to_country as 0country___t_billto,bill_to_city as  0city_billto, bill_to_id as 0customer_billto, bill_to as 0customer___t_billto,ltrim(0,bill_to_id) as 0customer_billto_trim,bill_to_postal_code AS 0postal_cd_billto,bill_to_street AS 0street_billto
 from emea_quality_corr_bnlx.fico_dim_bill_to
)