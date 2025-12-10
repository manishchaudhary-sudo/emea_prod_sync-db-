CREATE VIEW emea_raw_src_bnlx.fico_dim_so_doc_item_category (
  SO_DOC_ITEM_CATEG_SID,
  SO_DOC_ITEM_CATEG_ID COMMENT 'Sales Order Item Category ID',
  SO_DOC_ITEM_CATEG COMMENT 'Sales Order Item Category',
  SOURCE_SYSTEM_ID COMMENT 'Source System ID',
  OPSYS COMMENT 'OPSYS',
  OPTIME COMMENT 'OPTIME',
  OPTYPE COMMENT 'OPTYPE')
WITH SCHEMA COMPENSATION
AS SELECT
        SO_DOC_ITEM_CATEG_SID,
        SO_DOC_ITEM_CATEG_ID,
        SO_DOC_ITEM_CATEG,
        SOURCE_SYSTEM_ID,
        OPSYS,
        OPTIME,
        OPTYPE
    FROM
        chdaa_prd_cda_fico.fico_consume.dim_so_doc_item_category