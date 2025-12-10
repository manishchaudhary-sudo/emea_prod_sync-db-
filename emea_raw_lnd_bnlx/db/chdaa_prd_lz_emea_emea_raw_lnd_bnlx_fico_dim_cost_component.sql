CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.fico_dim_cost_component (
  COST_COMP_SID BIGINT,
  COST_COMP_ID VARCHAR(3) COMMENT 'Cost Component ID',
  COST_COMP VARCHAR(20) COMMENT 'Cost Component',
  COST_COMP_GROUP_ID VARCHAR(3) COMMENT 'Cost Component Group ID',
  COST_COMP_GROUP VARCHAR(40) COMMENT 'Cost Component Group',
  COST_COMP_SUBGROUP_ID VARCHAR(3) COMMENT 'Cost Component Subgroup ID',
  COST_COMP_SUBGROUP VARCHAR(40) COMMENT 'Cost Component Subgroup',
  OPSYS VARCHAR(10) COMMENT 'OPSYS',
  OPTIME VARCHAR(25) COMMENT 'OPTIME',
  OPTYPE VARCHAR(1) COMMENT 'OPTYPE',
  ETLLastModifiedDate DATE)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/fico_dim_cost_component'
TBLPROPERTIES (
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')