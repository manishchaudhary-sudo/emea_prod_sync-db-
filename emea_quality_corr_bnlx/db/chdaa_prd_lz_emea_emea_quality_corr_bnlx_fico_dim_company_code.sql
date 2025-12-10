CREATE TABLE chdaa_prd_lz_emea.emea_quality_corr_bnlx.fico_dim_company_code (
  ETLChecksum STRING,
  ETLIsDeleted BOOLEAN,
  company_code_id STRING,
  company_ab_status STRING,
  company_code STRING,
  company_cons_unit STRING,
  company_ab_status_id STRING,
  optime STRING,
  country_group_id STRING,
  company_code_sid STRING,
  company_supply_chain_role_id STRING,
  country_id STRING,
  company_code_cur STRING,
  company_id STRING,
  opsys STRING,
  company STRING,
  company_cons_unit_id STRING,
  company_supply_chain_role STRING,
  optype STRING,
  ETLLastModifiedDate TIMESTAMP,
  ETLLineageID STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/correction/bnlx/fico_dim_company_code'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')