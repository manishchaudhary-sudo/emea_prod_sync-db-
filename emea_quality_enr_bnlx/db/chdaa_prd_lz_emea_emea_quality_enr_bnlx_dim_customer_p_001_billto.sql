CREATE TABLE chdaa_prd_lz_emea.emea_quality_enr_bnlx.dim_customer_p_001_billto (
  ETLIsDeleted BOOLEAN,
  ETLChecksum STRING,
  ETLLastModifiedDate TIMESTAMP,
  ETLLineageID STRING,
  `0country___t_billto` STRING,
  `0street_billto` STRING,
  `0country_billto` STRING,
  `0customer___t_billto` STRING,
  `0customer_billto_trim` STRING,
  `0postal_cd_billto` STRING,
  `0customer_billto` STRING,
  `0city_billto` STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/enrichment/bnlx/dim_customer_p_001_billto'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')