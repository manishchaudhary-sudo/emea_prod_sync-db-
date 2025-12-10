CREATE TABLE chdaa_prd_lz_emea.emea_curated_disc_bnlx.dim_salesorg_p_001 (
  ETLLineageID STRING,
  `0salesorg___t` STRING,
  ETLChecksum STRING,
  `0salesorg` STRING,
  ETLIsDeleted BOOLEAN,
  ETLLastModifiedDate TIMESTAMP)
USING delta
LOCATION 'abfss://curated@zpdatacoresadpemea.dfs.core.windows.net/discovery/bnlx/dim_salesorg_p_001'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 7 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 7 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')