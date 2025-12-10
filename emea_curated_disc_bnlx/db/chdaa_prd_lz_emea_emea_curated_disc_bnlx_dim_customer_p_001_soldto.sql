CREATE TABLE chdaa_prd_lz_emea.emea_curated_disc_bnlx.dim_customer_p_001_soldto (
  ETLIsDeleted BOOLEAN,
  `0country___t_soldto` STRING,
  ETLLineageID STRING,
  `0country_soldto` STRING,
  `0city_soldto` STRING,
  ETLLastModifiedDate TIMESTAMP,
  ETLChecksum STRING,
  `0street_soldto` STRING,
  `0customer_soldto` STRING,
  `0postal_cd_soldto` STRING,
  `0customer_soldto_trim` STRING,
  `0customer___t_soldto` STRING)
USING delta
LOCATION 'abfss://curated@zpdatacoresadpemea.dfs.core.windows.net/discovery/bnlx/dim_customer_p_001_soldto'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 7 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 7 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')