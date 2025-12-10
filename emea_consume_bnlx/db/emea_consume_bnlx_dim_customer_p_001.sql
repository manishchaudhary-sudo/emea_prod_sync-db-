CREATE VIEW emea_consume_bnlx.dim_customer_p_001 (
  `0city`,
  `0country`,
  `0customer___t`,
  `0postal_cd`,
  `0customer_trim`,
  `0customer`,
  ETLLineageID,
  ETLChecksum,
  ETLLastModifiedDate,
  ETLIsDeleted)
WITH SCHEMA BINDING
AS (
SELECT 
 `0city`,
  `0country`,
  `0customer___t`,
  `0postal_cd`,
  `0customer_trim`,
  `0customer`,
  ETLLineageID,
  ETLChecksum,
  ETLLastModifiedDate,
  ETLIsDeleted
 FROM emea_curated_disc_bnlx.dim_customer_p_001)