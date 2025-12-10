CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.fico_dim_transaction_code (
  TRANSACTION_CODE_SID BIGINT COMMENT 'Transaction Code SID',
  TRANSACTION_CODE_ID VARCHAR(2) COMMENT 'Transaction Code ID',
  TRANSACTION_CODE VARCHAR(20) COMMENT 'Transaction Code',
  ETLLastModifiedDate DATE)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/fico_dim_transaction_code'
TBLPROPERTIES (
  'delta.minReaderVersion' = '1',
  'delta.minWriterVersion' = '2')