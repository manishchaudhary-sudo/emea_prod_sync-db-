CREATE TABLE chdaa_prd_lz_emea.emea_quality_enr_bnlx.dim_comp_code_p_001 (
  ETLIsDeleted BOOLEAN,
  ETLChecksum STRING,
  dcgrp STRING,
  `0company` STRING,
  `0company___t` STRING,
  `0country` STRING,
  `0currency` STRING,
  `0comp_code` STRING,
  `0comp_code___t` STRING,
  ETLLastModifiedDate TIMESTAMP,
  ETLLineageID STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/enrichment/bnlx/dim_comp_code_p_001'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')