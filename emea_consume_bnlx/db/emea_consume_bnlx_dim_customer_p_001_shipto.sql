CREATE VIEW emea_consume_bnlx.dim_customer_p_001_shipto (
  ETLLastModifiedDate,
  ETLIsDeleted,
  `0country_shipto`,
  `0customer___t_shipto`,
  `0customer_shipto_trim`,
  `0customer_shipto`,
  `0postal_cd_shipto`,
  `0country___t_shipto`,
  `0city_shipto`,
  `0street_shipto`,
  ETLLineageID,
  ETLChecksum)
WITH SCHEMA BINDING
AS (
SELECT 
 ETLLastModifiedDate,
  ETLIsDeleted,
  `0country_shipto`,
  `0customer___t_shipto`,
  `0customer_shipto_trim`,
  `0customer_shipto`,
  `0postal_cd_shipto`,
  `0country___t_shipto`,
  `0city_shipto`,
  `0street_shipto`,
  ETLLineageID,
  ETLChecksum
 FROM emea_curated_disc_bnlx.dim_customer_p_001_shipto)