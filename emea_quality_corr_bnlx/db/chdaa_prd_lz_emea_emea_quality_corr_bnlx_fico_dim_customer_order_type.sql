CREATE TABLE chdaa_prd_lz_emea.emea_quality_corr_bnlx.fico_dim_customer_order_type (
  ETLLastModifiedDate TIMESTAMP,
  cust_order_type_id STRING,
  optime STRING,
  div_flag INT,
  cust_order_type STRING,
  opsys STRING,
  cust_order_type_sid STRING,
  optype STRING,
  ETLChecksum STRING,
  ETLIsDeleted BOOLEAN,
  ETLLineageID STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/correction/bnlx/fico_dim_customer_order_type'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')