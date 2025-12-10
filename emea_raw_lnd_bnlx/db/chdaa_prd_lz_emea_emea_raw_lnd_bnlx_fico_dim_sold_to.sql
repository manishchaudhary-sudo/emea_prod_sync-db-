CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.fico_dim_sold_to (
  SOLD_TO_SID BIGINT,
  SOLD_TO_ID VARCHAR(10) COMMENT 'Customer ID',
  SOLD_TO VARCHAR(40) COMMENT 'Customer',
  SOLD_TO_CH_ID_01 VARCHAR(2) COMMENT 'Customer Channel ID 1',
  SOLD_TO_CH_ID_02 VARCHAR(2) COMMENT 'Customer Channel ID 2',
  SOLD_TO_CH_01 VARCHAR(40) COMMENT 'Customer Channel 1',
  SOLD_TO_CH_02 VARCHAR(40) COMMENT 'Customer Channel 2',
  SOLD_TO_CLASS_ID VARCHAR(2) COMMENT 'Customer Classification ID',
  SOLD_TO_CLASS VARCHAR(20) COMMENT 'Customer Classification',
  SOLD_TO_ACCNT_GRP_ID VARCHAR(4) COMMENT 'Customer Account Group ID',
  SOLD_TO_ACCNT_GRP VARCHAR(40) COMMENT 'Customer Account Group',
  SOLD_TO_INDUSTRY_ID VARCHAR(4) COMMENT 'Customer Industry ID',
  SOLD_TO_INDUSTRY VARCHAR(20) COMMENT 'Customer Industry',
  SOLD_TO_REGION_ID VARCHAR(3) COMMENT 'Customer Region ID',
  SOLD_TO_REGION VARCHAR(20) COMMENT 'Customer Region',
  SOLD_TO_COUNTRY_ID VARCHAR(3) COMMENT 'Customer Country ID',
  SOLD_TO_COUNTRY VARCHAR(20) COMMENT 'Customer Country',
  SOLD_TO_POSTAL_CODE VARCHAR(10) COMMENT 'Customer Postal Code',
  SOLD_TO_CITY VARCHAR(35) COMMENT 'Customer City',
  SOLD_TO_STREET VARCHAR(35) COMMENT 'Customer Street',
  OPSYS VARCHAR(10) COMMENT 'OPSYS',
  OPTIME VARCHAR(25) COMMENT 'OPTIME',
  OPTYPE VARCHAR(1) COMMENT 'OPTYPE',
  ETLLastModifiedDate DATE)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/fico_dim_sold_to'
TBLPROPERTIES (
  'delta.minReaderVersion' = '1',
  'delta.minWriterVersion' = '2')