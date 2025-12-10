CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.fico_dim_country (
  COUNTRY_SID BIGINT,
  COUNTRY_ID VARCHAR(3) COMMENT 'Country ID',
  COUNTRY VARCHAR(20) COMMENT 'Country',
  COUNTRY_HL_ID_01 VARCHAR(32) COMMENT 'Country Hierarchy Level ID 1',
  COUNTRY_HL_ID_02 VARCHAR(32) COMMENT 'Country Hierarchy Level ID 2',
  COUNTRY_HL_ID_03 VARCHAR(32) COMMENT 'Country Hierarchy Level ID 3',
  COUNTRY_HL_ID_04 VARCHAR(32) COMMENT 'Country Hierarchy Level ID 4',
  COUNTRY_HL_ID_05 VARCHAR(32) COMMENT 'Country Hierarchy Level ID 5',
  COUNTRY_HL_ID_06 VARCHAR(32) COMMENT 'Country Hierarchy Level ID 6',
  COUNTRY_HL_01 VARCHAR(60) COMMENT 'Country Hierarchy Level 1',
  COUNTRY_HL_02 VARCHAR(60) COMMENT 'Country Hierarchy Level 2',
  COUNTRY_HL_03 VARCHAR(60) COMMENT 'Country Hierarchy Level 3',
  COUNTRY_HL_04 VARCHAR(60) COMMENT 'Country Hierarchy Level 4',
  COUNTRY_HL_05 VARCHAR(60) COMMENT 'Country Hierarchy Level 5',
  COUNTRY_HL_06 VARCHAR(60) COMMENT 'Country Hierarchy Level 6',
  COUNTRY_CURRENCY_ID VARCHAR(3) COMMENT 'Country Currency ID',
  OPSYS VARCHAR(10) COMMENT 'OPSYS',
  OPTIME VARCHAR(25) COMMENT 'OPTIME',
  OPTYPE VARCHAR(1) COMMENT 'OPTYPE',
  ETLLastModifiedDate DATE)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/fico_dim_country'
TBLPROPERTIES (
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')