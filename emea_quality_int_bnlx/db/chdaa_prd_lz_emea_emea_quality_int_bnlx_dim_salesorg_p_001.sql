CREATE TABLE chdaa_prd_lz_emea.emea_quality_int_bnlx.dim_salesorg_p_001 (
  ETLIsDeleted BOOLEAN,
  ETLChecksum STRING,
  `0salesorg___t` STRING,
  `0salesorg` STRING,
  ETLLastModifiedDate TIMESTAMP,
  ETLLineageID STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/integration/bnlx/dim_salesorg_p_001'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')