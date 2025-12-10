CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.fico_dim_so_quot_reject_reason (
  SO_QUOT_REJECT_REASON_SID BIGINT,
  SO_QUOT_REJECT_REASON_ID VARCHAR(2) COMMENT 'Reason for rejection of quotations and sales orders ID',
  SO_QUOT_REJECT_REASON VARCHAR(60) COMMENT 'Reason for rejection of quotations and sales orders Text',
  OPSYS VARCHAR(10) COMMENT 'OPSYS',
  OPTIME VARCHAR(25) COMMENT 'OPTIME',
  OPTYPE VARCHAR(1) COMMENT 'OPTYPE',
  ETLLastModifiedDate DATE)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/fico_dim_so_quot_reject_reason'
TBLPROPERTIES (
  'delta.minReaderVersion' = '1',
  'delta.minWriterVersion' = '2')