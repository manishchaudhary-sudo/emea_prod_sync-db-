CREATE VIEW emea_consume_bnlx.dim_customer_p_001_payer (
  ETLIsDeleted,
  ETLLastModifiedDate,
  `0country___t_payer`,
  `0customer___t_payer`,
  `0customer_payer`,
  `0city_payer`,
  `0postal_cd_payer`,
  `0street_payer`,
  `0country_payer`,
  `0customer_payer_trim`,
  ETLLineageID,
  ETLChecksum)
WITH SCHEMA BINDING
AS (
SELECT 
 ETLIsDeleted,
  ETLLastModifiedDate,
  `0country___t_payer`,
  `0customer___t_payer`,
  `0customer_payer`,
  `0city_payer`,
  `0postal_cd_payer`,
  `0street_payer`,
  `0country_payer`,
  `0customer_payer_trim`,
  ETLLineageID,
  ETLChecksum
 FROM emea_curated_disc_bnlx.dim_customer_p_001_payer)