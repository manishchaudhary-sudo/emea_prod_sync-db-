CREATE VIEW emea_consume_bnlx.dim_customer_p_001_billto (
  ETLChecksum,
  ETLIsDeleted,
  `0country___t_billto`,
  `0street_billto`,
  `0country_billto`,
  `0customer___t_billto`,
  `0customer_billto_trim`,
  `0postal_cd_billto`,
  `0customer_billto`,
  `0city_billto`,
  ETLLastModifiedDate,
  ETLLineageID)
WITH SCHEMA BINDING
AS (
SELECT 
  ETLChecksum,
  ETLIsDeleted,
  `0country___t_billto`,
  `0street_billto`,
  `0country_billto`,
  `0customer___t_billto`,
  `0customer_billto_trim`,
  `0postal_cd_billto`,
  `0customer_billto`,
  `0city_billto`,
  ETLLastModifiedDate,
  ETLLineageID
FROM emea_curated_disc_bnlx.dim_customer_p_001_billto)