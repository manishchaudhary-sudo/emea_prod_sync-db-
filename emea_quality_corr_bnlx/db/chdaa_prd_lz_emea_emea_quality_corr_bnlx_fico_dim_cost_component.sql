CREATE TABLE chdaa_prd_lz_emea.emea_quality_corr_bnlx.fico_dim_cost_component (
  ETLLastModifiedDate TIMESTAMP,
  ETLIsDeleted BOOLEAN,
  ETLLineageID STRING,
  cost_comp_id STRING,
  optime STRING,
  cost_comp_sid STRING,
  cost_comp_subgroup STRING,
  cost_comp_group STRING,
  cost_comp_subgroup_id STRING,
  cost_comp STRING,
  opsys STRING,
  cost_comp_group_id STRING,
  optype STRING,
  ETLChecksum STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/correction/bnlx/fico_dim_cost_component'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')