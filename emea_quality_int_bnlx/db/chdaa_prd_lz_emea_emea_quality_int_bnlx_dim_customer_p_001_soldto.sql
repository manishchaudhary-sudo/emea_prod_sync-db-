CREATE TABLE chdaa_prd_lz_emea.emea_quality_int_bnlx.dim_customer_p_001_soldto (
  `0country___t_soldto` STRING,
  `0country_soldto` STRING,
  `0city_soldto` STRING,
  `0street_soldto` STRING,
  `0customer_soldto` STRING,
  `0postal_cd_soldto` STRING,
  `0customer_soldto_trim` STRING,
  `0customer___t_soldto` STRING,
  ETLLastModifiedDate TIMESTAMP,
  ETLLineageID STRING,
  ETLIsDeleted BOOLEAN,
  ETLChecksum STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/integration/bnlx/dim_customer_p_001_soldto'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')