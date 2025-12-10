CREATE TABLE chdaa_prd_lz_emea.emea_curated_disc_bnlx.dim_customer_p_001_shipto (
  `0country_shipto` STRING,
  `0customer___t_shipto` STRING,
  `0customer_shipto_trim` STRING,
  `0customer_shipto` STRING,
  `0postal_cd_shipto` STRING,
  `0country___t_shipto` STRING,
  `0city_shipto` STRING,
  `0street_shipto` STRING,
  ETLChecksum STRING,
  ETLLineageID STRING,
  ETLIsDeleted BOOLEAN,
  ETLLastModifiedDate TIMESTAMP)
USING delta
LOCATION 'abfss://curated@zpdatacoresadpemea.dfs.core.windows.net/discovery/bnlx/dim_customer_p_001_shipto'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 7 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 7 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')