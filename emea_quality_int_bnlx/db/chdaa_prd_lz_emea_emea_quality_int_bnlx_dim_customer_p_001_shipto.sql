CREATE TABLE chdaa_prd_lz_emea.emea_quality_int_bnlx.dim_customer_p_001_shipto (
  `0country_shipto` STRING,
  `0customer___t_shipto` STRING,
  `0customer_shipto_trim` STRING,
  `0customer_shipto` STRING,
  `0postal_cd_shipto` STRING,
  `0country___t_shipto` STRING,
  `0city_shipto` STRING,
  `0street_shipto` STRING,
  ETLLastModifiedDate TIMESTAMP,
  ETLLineageID STRING,
  ETLIsDeleted BOOLEAN,
  ETLChecksum STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/integration/bnlx/dim_customer_p_001_shipto'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')