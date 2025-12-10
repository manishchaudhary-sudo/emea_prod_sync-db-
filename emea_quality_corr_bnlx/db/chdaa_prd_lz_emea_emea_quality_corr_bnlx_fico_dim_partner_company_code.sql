CREATE TABLE chdaa_prd_lz_emea.emea_quality_corr_bnlx.fico_dim_partner_company_code (
  partner_company_cons_unit_id STRING,
  optime STRING,
  country_group_id STRING,
  partner_company_id STRING,
  partner_company STRING,
  partner_company_supply_chain_role_id STRING,
  partner_company_code_cur STRING,
  partner_company_cons_unit STRING,
  partner_company_supply_chain_role STRING,
  partner_company_ab_status_id STRING,
  country_id STRING,
  opsys STRING,
  partner_company_code_sid STRING,
  partner_company_ab_status STRING,
  partner_company_code_id STRING,
  partner_company_code STRING,
  optype STRING,
  ETLLastModifiedDate TIMESTAMP,
  ETLLineageID STRING,
  ETLIsDeleted BOOLEAN,
  ETLChecksum STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/correction/bnlx/fico_dim_partner_company_code'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')