CREATE VIEW emea_quality_corr_bnlx.vw_dim_customer_p_001 (
  `0customer`,
  `0customer___t`,
  `0postal_cd`,
  `0city`,
  `0country`,
  `0customer_trim`)
WITH SCHEMA BINDING
AS (
  Select cust_id AS 0customer ,cust AS 0customer___t  , cust_postal_code AS 0postal_cd,cust_city AS 0city,cust_country AS 0country , ltrim(0,cust_id) AS 0customer_trim 
  from emea_quality_corr_bnlx.fico_dim_customer
 )