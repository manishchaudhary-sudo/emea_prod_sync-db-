CREATE VIEW emea_raw_src_bnlx.fico_dim_transaction_code (
  TRANSACTION_CODE_SID COMMENT 'Transaction Code SID',
  TRANSACTION_CODE_ID COMMENT 'Transaction Code ID',
  TRANSACTION_CODE COMMENT 'Transaction Code')
WITH SCHEMA COMPENSATION
AS SELECT
        TRANSACTION_CODE_SID,
        TRANSACTION_CODE_ID,
        TRANSACTION_CODE
    FROM
        chdaa_prd_cda_fico.fico_consume.dim_transaction_code