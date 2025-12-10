CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.fico_dim_payer (
  PAYER_SID BIGINT,
  PAYER_ID VARCHAR(10) COMMENT 'Customer ID',
  PAYER VARCHAR(40) COMMENT 'Customer',
  PAYER_CH_ID_01 VARCHAR(2) COMMENT 'Customer Channel ID 1',
  PAYER_CH_ID_02 VARCHAR(2) COMMENT 'Customer Channel ID 2',
  PAYER_CH_01 VARCHAR(40) COMMENT 'Customer Channel 1',
  PAYER_CH_02 VARCHAR(40) COMMENT 'Customer Channel 2',
  PAYER_INDUSTRY_ID VARCHAR(4) COMMENT 'Customer Industry ID',
  PAYER_INDUSTRY VARCHAR(20) COMMENT 'Customer Industry',
  PAYER_REGION_ID VARCHAR(3) COMMENT 'Customer Region ID',
  PAYER_REGION VARCHAR(20) COMMENT 'Customer Region',
  PAYER_COUNTRY_ID VARCHAR(3) COMMENT 'Customer Country ID',
  PAYER_COUNTRY VARCHAR(20) COMMENT 'Customer Country',
  PAYER_CITY VARCHAR(35) COMMENT 'Customer City',
  PAYER_STREET VARCHAR(35) COMMENT 'Customer Street',
  PAYER_POSTAL_CODE VARCHAR(10) COMMENT 'Customer Postal Code',
  OPSYS VARCHAR(10) COMMENT 'OPSYS',
  OPTIME VARCHAR(25) COMMENT 'OPTIME',
  OPTYPE VARCHAR(1) COMMENT 'OPTYPE',
  ETLLastModifiedDate DATE)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/fico_dim_payer'
TBLPROPERTIES (
  'delta.minReaderVersion' = '1',
  'delta.minWriterVersion' = '2')