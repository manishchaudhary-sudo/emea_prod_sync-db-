CREATE TABLE chdaa_prd_lz_emea.emea_curated_disc_bnlx.dim_customer_p_001_billto (
  ETLLastModifiedDate TIMESTAMP,
  ETLIsDeleted BOOLEAN,
  ETLChecksum STRING,
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
LOCATION 'abfss://curated@zpdatacoresadpemea.dfs.core.windows.net/discovery/bnlx/dim_customer_p_001_billto'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 7 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 7 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')