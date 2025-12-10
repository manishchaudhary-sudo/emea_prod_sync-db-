CREATE TABLE chdaa_prd_lz_emea.emea_quality_int_bnlx.dim_customer_p_001_payer (
  `0country___t_payer` STRING,
  `0customer___t_payer` STRING,
  `0customer_payer` STRING,
  `0city_payer` STRING,
  `0postal_cd_payer` STRING,
  `0street_payer` STRING,
  `0country_payer` STRING,
  `0customer_payer_trim` STRING,
  ETLLastModifiedDate TIMESTAMP,
  ETLLineageID STRING,
  ETLIsDeleted BOOLEAN,
  ETLChecksum STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/integration/bnlx/dim_customer_p_001_payer'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')