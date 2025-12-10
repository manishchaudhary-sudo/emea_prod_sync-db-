CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.fico_dim_order_reason (
  ORDER_REASON_SID BIGINT,
  ORDER_REASON_ID STRING,
  ORDER_REASON STRING,
  SOURCE_SYSTEM_ID STRING,
  ETLLastModifiedDate TIMESTAMP)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/fico_dim_order_reason'
TBLPROPERTIES (
  'delta.minReaderVersion' = '1',
  'delta.minWriterVersion' = '2')