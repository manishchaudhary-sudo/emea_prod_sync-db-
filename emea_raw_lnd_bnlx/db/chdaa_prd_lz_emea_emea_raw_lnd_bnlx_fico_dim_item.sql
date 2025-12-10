CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.fico_dim_item (
  CS_ITEM_SID BIGINT,
  CS_CHART_ID VARCHAR(2) COMMENT 'Consolidation Chart of Accounts ID',
  CS_ITEM_ID VARCHAR(10) COMMENT 'Item ID',
  CS_ITEM VARCHAR(60) COMMENT 'Item',
  CLUSTER STRING,
  CS_ITEM_GROUP_1 STRING,
  OPSYS VARCHAR(10) COMMENT 'OPSYS',
  OPTIME VARCHAR(25) COMMENT 'OPTIME',
  OPTYPE VARCHAR(1) COMMENT 'OPTYPE',
  ETLLastModifiedDate DATE)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/fico_dim_item'
TBLPROPERTIES (
  'delta.minReaderVersion' = '1',
  'delta.minWriterVersion' = '2')