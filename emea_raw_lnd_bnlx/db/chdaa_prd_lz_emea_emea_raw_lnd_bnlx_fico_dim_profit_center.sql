CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.fico_dim_profit_center (
  PC_SID BIGINT,
  PC_ID VARCHAR(10) COMMENT 'Profit Center ID',
  PC VARCHAR(40) COMMENT 'Profit Center',
  BG_ID VARCHAR(2) COMMENT 'Business Group ID',
  BG VARCHAR(40) COMMENT 'Business Group',
  RU_ID VARCHAR(5) COMMENT 'Reporting Unit ID',
  RU VARCHAR(40) COMMENT 'Reporting Unit',
  SBE_ID VARCHAR(4) COMMENT 'Strategic Business Entity ID',
  SBE VARCHAR(40) COMMENT 'Strategic Business Entity',
  SG_ID VARCHAR(2) COMMENT 'Sub Group ID',
  SG VARCHAR(40) COMMENT 'Sub Group',
  OPSYS VARCHAR(10) COMMENT 'OPSYS',
  OPTIME VARCHAR(25) COMMENT 'OPTIME',
  OPTYPE VARCHAR(1) COMMENT 'OPTYPE',
  ETLLastModifiedDate DATE)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/fico_dim_profit_center'
TBLPROPERTIES (
  'delta.minReaderVersion' = '1',
  'delta.minWriterVersion' = '2')