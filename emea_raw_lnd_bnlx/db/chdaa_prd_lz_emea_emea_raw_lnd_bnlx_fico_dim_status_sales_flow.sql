CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.fico_dim_status_sales_flow (
  STATUS_SALES_FLOW_SID BIGINT COMMENT 'Status Sales Flow SID',
  STATUS_SALES_FLOW_ID VARCHAR(2) COMMENT 'Status Sales Flow ID',
  STATUS_SALES_FLOW VARCHAR(256) COMMENT 'Status Sales Flow Text',
  ETLLastModifiedDate DATE)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/fico_dim_status_sales_flow'
TBLPROPERTIES (
  'delta.minReaderVersion' = '1',
  'delta.minWriterVersion' = '2')