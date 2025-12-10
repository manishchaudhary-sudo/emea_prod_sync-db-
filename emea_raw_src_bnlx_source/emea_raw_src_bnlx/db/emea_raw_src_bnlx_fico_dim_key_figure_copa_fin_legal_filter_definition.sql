CREATE VIEW emea_raw_src_bnlx.fico_dim_key_figure_copa_fin_legal_filter_definition (
  KEY_FIGURE_SID,
  KEY_FIGURE_ID COMMENT 'Key Figure ID',
  RESTRICTION_GROUP COMMENT 'Restriction Group',
  KEY_FIGURE_REL_SID,
  DOC_TYPE_ID,
  CS_ITEM_ID,
  CS_ITEM_SUB_ID,
  MULTIPLIER,
  OPTIME COMMENT 'OPTIME',
  OPTYPE COMMENT 'OPTYPE')
WITH SCHEMA COMPENSATION
AS SELECT
        KEY_FIGURE_SID,
        KEY_FIGURE_ID,
        RESTRICTION_GROUP,
        KEY_FIGURE_REL_SID,
        DOC_TYPE_ID,
        CS_ITEM_ID,
        CS_ITEM_SUB_ID,
        MULTIPLIER,
        OPTIME,
        OPTYPE
    FROM
        chdaa_prd_cda_fico.fico_consume.dim_key_figure_copa_fin_legal_filter_definition