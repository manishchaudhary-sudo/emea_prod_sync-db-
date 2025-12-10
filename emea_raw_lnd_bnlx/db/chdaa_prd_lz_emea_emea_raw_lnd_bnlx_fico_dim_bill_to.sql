CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.fico_dim_bill_to (
  BILL_TO_SID BIGINT,
  BILL_TO_ID VARCHAR(10) COMMENT 'Customer ID',
  BILL_TO VARCHAR(40) COMMENT 'Customer',
  BILL_TO_CH_ID_01 VARCHAR(2) COMMENT 'Customer Channel ID 1',
  BILL_TO_CH_ID_02 VARCHAR(2) COMMENT 'Customer Channel ID 2',
  BILL_TO_CH_01 VARCHAR(40) COMMENT 'Customer Channel 1',
  BILL_TO_CH_02 VARCHAR(40) COMMENT 'Customer Channel 2',
  BILL_TO_INDUSTRY_ID VARCHAR(4) COMMENT 'Customer Industry ID',
  BILL_TO_INDUSTRY VARCHAR(20) COMMENT 'Customer Industry',
  BILL_TO_REGION_ID VARCHAR(3) COMMENT 'Customer Region ID',
  BILL_TO_REGION VARCHAR(20) COMMENT 'Customer Region',
  BILL_TO_COUNTRY_ID VARCHAR(3) COMMENT 'Customer Country ID',
  BILL_TO_COUNTRY VARCHAR(20) COMMENT 'Customer Country',
  BILL_TO_CITY VARCHAR(35) COMMENT 'Customer City',
  BILL_TO_STREET VARCHAR(35) COMMENT 'Customer Street',
  BILL_TO_POSTAL_CODE VARCHAR(10) COMMENT 'Customer Postal Code',
  OPSYS VARCHAR(10) COMMENT 'OPSYS',
  OPTIME VARCHAR(25) COMMENT 'OPTIME',
  OPTYPE VARCHAR(1) COMMENT 'OPTYPE',
  ETLLastModifiedDate DATE)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/fico_dim_bill_to'
TBLPROPERTIES (
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')