CREATE VIEW emea_consume_bnlx.dim_salesorg_p_001 (
  ETLLastModifiedDate,
  ETLChecksum,
  `0salesorg___t`,
  `0salesorg`,
  ETLLineageID,
  ETLIsDeleted)
WITH SCHEMA BINDING
AS (
SELECT 
  ETLLastModifiedDate,
  ETLChecksum,
  `0salesorg___t`,
  `0salesorg`,
  ETLLineageID,
  ETLIsDeleted
 FROM emea_curated_disc_bnlx.dim_salesorg_p_001)