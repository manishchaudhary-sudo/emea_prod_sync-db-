CREATE VIEW emea_raw_src_bnlx.fico_dim_so_doc_type (
  SO_DOC_TYPE_SID,
  SO_DOC_TYPE_ID COMMENT 'Sales Order Document Type ID',
  SO_DOC_TYPE COMMENT 'Sales Order Document Type',
  DIV_FLAG COMMENT 'Divested Flag',
  OPSYS COMMENT 'OPSYS',
  OPTIME COMMENT 'OPTIME',
  OPTYPE COMMENT 'OPTYPE')
WITH SCHEMA COMPENSATION
AS SELECT
        SO_DOC_TYPE_SID,
        SO_DOC_TYPE_ID,
        SO_DOC_TYPE,
        DIV_FLAG,
        OPSYS,
        OPTIME,
        OPTYPE
    FROM
        chdaa_prd_cda_fico.fico_consume.dim_so_doc_type