CREATE VIEW emea_raw_src_bnlx.fico_dim_so_doc_category (
  SO_DOC_CATEG_SID,
  SO_DOC_CATEG_ID COMMENT 'Sales Order Document Category ID',
  SO_DOC_CATEG COMMENT 'Sales Order Document Category',
  DIV_FLAG COMMENT 'Divested Flag',
  OPSYS COMMENT 'OPSYS',
  OPTIME COMMENT 'OPTIME',
  OPTYPE COMMENT 'OPTYPE')
WITH SCHEMA COMPENSATION
AS SELECT
        SO_DOC_CATEG_SID,
        SO_DOC_CATEG_ID,
        SO_DOC_CATEG,
        DIV_FLAG,
        OPSYS,
        OPTIME,
        OPTYPE
    FROM
        chdaa_prd_cda_fico.fico_consume.dim_so_doc_category