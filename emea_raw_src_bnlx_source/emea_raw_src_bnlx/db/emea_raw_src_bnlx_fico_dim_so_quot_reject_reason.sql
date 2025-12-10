CREATE VIEW emea_raw_src_bnlx.fico_dim_so_quot_reject_reason (
  SO_QUOT_REJECT_REASON_SID,
  SO_QUOT_REJECT_REASON_ID COMMENT 'Reason for rejection of quotations and sales orders ID',
  SO_QUOT_REJECT_REASON COMMENT 'Reason for rejection of quotations and sales orders Text',
  OPSYS COMMENT 'OPSYS',
  OPTIME COMMENT 'OPTIME',
  OPTYPE COMMENT 'OPTYPE')
WITH SCHEMA COMPENSATION
AS SELECT
        SO_QUOT_REJECT_REASON_SID,
        SO_QUOT_REJECT_REASON_ID,
        SO_QUOT_REJECT_REASON,
        OPSYS,
        OPTIME,
        OPTYPE
    FROM
        chdaa_prd_cda_fico.fico_consume.dim_so_quot_reject_reason