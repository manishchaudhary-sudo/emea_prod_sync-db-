CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.fico_dim_sales_organization (
  SALES_ORG_SID BIGINT,
  SALES_ORG_ID VARCHAR(4) COMMENT 'Sales Organization ID',
  SALES_ORG VARCHAR(60) COMMENT 'Sales Organization',
  COMOPS_SCOPE_FLAG_ID VARCHAR(3) COMMENT 'ComOps_Scope_Flag_ID',
  COMOPS_SCOPE_FLAG VARCHAR(60) COMMENT 'ComOps_Scope_Flag',
  OPSYS VARCHAR(10) COMMENT 'OPSYS',
  OPTIME VARCHAR(25) COMMENT 'OPTIME',
  OPTYPE VARCHAR(1) COMMENT 'OPTYPE',
  ETLLastModifiedDate DATE)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/fico_dim_sales_organization'
TBLPROPERTIES (
  'delta.minReaderVersion' = '1',
  'delta.minWriterVersion' = '2')