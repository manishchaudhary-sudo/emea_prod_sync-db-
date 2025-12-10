CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.fico_dim_company_code (
  COMPANY_CODE_SID BIGINT,
  COMPANY_CODE_ID VARCHAR(4) COMMENT 'Company Code ID',
  COMPANY_CODE VARCHAR(40) COMMENT 'Company Code',
  COMPANY_ID VARCHAR(6) COMMENT 'Company ID',
  COMPANY VARCHAR(40) COMMENT 'Company',
  COUNTRY_ID VARCHAR(3) COMMENT 'Country ID',
  COMPANY_CODE_CUR VARCHAR(3) COMMENT 'Company Code Currency',
  COMPANY_CONS_UNIT_ID VARCHAR(18) COMMENT 'Company Consolidation Unit ID',
  COMPANY_CONS_UNIT VARCHAR(60) COMMENT 'Company Consolidation Unit',
  COMPANY_AB_STATUS_ID VARCHAR(1) COMMENT 'Company AB Status ID',
  COMPANY_AB_STATUS VARCHAR(20) COMMENT 'Company AB Status',
  COMPANY_SUPPLY_CHAIN_ROLE_ID VARCHAR(1) COMMENT 'Company Supply Chain Role ID',
  COMPANY_SUPPLY_CHAIN_ROLE VARCHAR(40) COMMENT 'Company Supply Chain Role',
  COUNTRY_GROUP_ID VARCHAR(32) COMMENT 'Country Group ID',
  OPSYS VARCHAR(10) COMMENT 'OPSYS',
  OPTIME VARCHAR(25) COMMENT 'OPTIME',
  OPTYPE VARCHAR(1) COMMENT 'OPTYPE',
  ETLLastModifiedDate DATE)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/fico_dim_company_code'
TBLPROPERTIES (
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')