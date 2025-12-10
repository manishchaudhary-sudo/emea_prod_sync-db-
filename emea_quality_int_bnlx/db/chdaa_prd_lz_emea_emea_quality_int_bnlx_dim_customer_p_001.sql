CREATE TABLE chdaa_prd_lz_emea.emea_quality_int_bnlx.dim_customer_p_001 (
  `0city` STRING,
  `0country` STRING,
  `0customer___t` STRING,
  `0postal_cd` STRING,
  `0customer_trim` STRING,
  `0customer` STRING,
  ETLLastModifiedDate TIMESTAMP,
  ETLLineageID STRING,
  ETLIsDeleted BOOLEAN,
  ETLChecksum STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/integration/bnlx/dim_customer_p_001'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')