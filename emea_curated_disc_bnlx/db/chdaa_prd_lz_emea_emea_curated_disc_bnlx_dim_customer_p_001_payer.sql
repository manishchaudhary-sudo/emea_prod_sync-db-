CREATE TABLE chdaa_prd_lz_emea.emea_curated_disc_bnlx.dim_customer_p_001_payer (
  ETLLineageID STRING,
  ETLLastModifiedDate TIMESTAMP,
  ETLChecksum STRING,
  ETLIsDeleted BOOLEAN,
  `0country___t_payer` STRING,
  `0customer___t_payer` STRING,
  `0customer_payer` STRING,
  `0city_payer` STRING,
  `0postal_cd_payer` STRING,
  `0street_payer` STRING,
  `0country_payer` STRING,
  `0customer_payer_trim` STRING)
USING delta
LOCATION 'abfss://curated@zpdatacoresadpemea.dfs.core.windows.net/discovery/bnlx/dim_customer_p_001_payer'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 7 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 7 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')