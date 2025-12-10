CREATE TABLE chdaa_prd_lz_emea.emea_curated_disc_bnlx.dim_comp_code_p_001 (
  ETLIsDeleted BOOLEAN,
  dcgrp STRING,
  ETLLineageID STRING,
  ETLChecksum STRING,
  `0company` STRING,
  ETLLastModifiedDate TIMESTAMP,
  `0company___t` STRING,
  `0country` STRING,
  `0currency` STRING,
  `0comp_code` STRING,
  `0comp_code___t` STRING)
USING delta
LOCATION 'abfss://curated@zpdatacoresadpemea.dfs.core.windows.net/discovery/bnlx/dim_comp_code_p_001'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 7 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 7 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')