CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.fico_dim_bill_status_delivery (
  BILL_STATUS_DELIVERY_SID BIGINT COMMENT 'Bill Status Delivery SID',
  BILL_STATUS_DELIVERY_ID VARCHAR(2) COMMENT 'Bill Status Delivery ID',
  BILL_STATUS_DELIVERY VARCHAR(256) COMMENT 'Bill Status Delivery Text',
  ETLLastModifiedDate DATE)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/fico_dim_bill_status_delivery'
TBLPROPERTIES (
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')