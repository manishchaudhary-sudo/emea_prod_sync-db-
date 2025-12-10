CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.fico_dim_customer_oriented_responsibility_channel (
  COREC_SID BIGINT,
  DCOREC_ID VARCHAR(1) COMMENT 'Country-oriented Responsibility Channel ID',
  CUST_ID VARCHAR(10) COMMENT 'Customer ID',
  CS_CHART_ID VARCHAR(2) COMMENT 'Consolidation Chart of Accounts ID',
  CS_ITEM_ID VARCHAR(10) COMMENT 'Item ID',
  PC_ID VARCHAR(10) COMMENT 'Profit Center (Global View) posted ID',
  MATERIAL_ID VARCHAR(18) COMMENT 'Material ID',
  COUNTRY_FD_ID VARCHAR(3) COMMENT 'Country of Final Destination ID',
  PLANT_ID VARCHAR(4) COMMENT 'Plant ID',
  SALES_ORG_ID VARCHAR(4) COMMENT 'Sales Organization ID',
  DISTR_CHAN_ID VARCHAR(2) COMMENT 'Distribution Channel ID',
  DIVISION_ID VARCHAR(2) COMMENT 'Divison ID',
  CUST_CHAN_LOCAL_HL_ID_01_TYPE VARCHAR(15) COMMENT 'Local Customer Channel Hierarchy Level 1 ID Type',
  CUST_CHAN_LOCAL_HL_ID_02_TYPE VARCHAR(15) COMMENT 'Local Customer Channel Hierarchy Level 2 ID Type',
  CUST_CHAN_LOCAL_HL_ID_03_TYPE VARCHAR(15) COMMENT 'Local Customer Channel Hierarchy Level 3 ID Type',
  CUST_CHAN_LOCAL_HL_ID_01 VARCHAR(32) COMMENT 'Local Customer Channel Hierarchy Level ID 1',
  CUST_CHAN_LOCAL_HL_ID_02 VARCHAR(32) COMMENT 'Local Customer Channel Hierarchy Level ID 2',
  CUST_CHAN_LOCAL_HL_ID_03 VARCHAR(32) COMMENT 'Local Customer Channel Hierarchy Level ID 3',
  CUST_CHAN_LOCAL_HL_01 VARCHAR(60) COMMENT 'Local Customer Channel Hierarchy Level 1',
  CUST_CHAN_LOCAL_HL_02 VARCHAR(60) COMMENT 'Local Customer Channel Hierarchy Level 2',
  CUST_CHAN_LOCAL_HL_03 VARCHAR(60) COMMENT 'Local Customer Channel Hierarchy Level 3',
  OPSYS VARCHAR(10) COMMENT 'OPSYS',
  OPTIME VARCHAR(25) COMMENT 'OPTIME',
  OPTYPE VARCHAR(1) COMMENT 'OPTYPE',
  ETLLastModifiedDate DATE)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/fico_dim_customer_oriented_responsibility_channel'
TBLPROPERTIES (
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')