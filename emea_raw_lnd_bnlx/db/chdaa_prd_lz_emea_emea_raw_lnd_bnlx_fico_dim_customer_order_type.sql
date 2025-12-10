CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.fico_dim_customer_order_type (
  CUST_ORDER_TYPE_SID BIGINT,
  CUST_ORDER_TYPE_ID VARCHAR(4) COMMENT 'Customer Order Type ID',
  CUST_ORDER_TYPE VARCHAR(60) COMMENT 'Customer Order Type',
  DIV_FLAG INT COMMENT 'Divested Flag',
  OPSYS VARCHAR(10) COMMENT 'OPSYS',
  OPTIME VARCHAR(25) COMMENT 'OPTIME',
  OPTYPE VARCHAR(1) COMMENT 'OPTYPE',
  ETLLastModifiedDate DATE)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/fico_dim_customer_order_type'
TBLPROPERTIES (
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')