CREATE VIEW emea_consume_bnlx.dim_customer_p_001_soldto (
  `0country___t_soldto`,
  `0country_soldto`,
  `0city_soldto`,
  `0street_soldto`,
  `0customer_soldto`,
  `0postal_cd_soldto`,
  `0customer_soldto_trim`,
  `0customer___t_soldto`,
  ETLLineageID,
  ETLChecksum,
  ETLLastModifiedDate,
  ETLIsDeleted)
WITH SCHEMA BINDING
AS (
SELECT 
 `0country___t_soldto`,
  `0country_soldto`,
  `0city_soldto`,
  `0street_soldto`,
  `0customer_soldto`,
  `0postal_cd_soldto`,
  `0customer_soldto_trim`,
  `0customer___t_soldto`,
  ETLLineageID,
  ETLChecksum,
  ETLLastModifiedDate,
  ETLIsDeleted
 FROM emea_curated_disc_bnlx.dim_customer_p_001_soldto)