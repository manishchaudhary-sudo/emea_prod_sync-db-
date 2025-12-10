CREATE VIEW emea_raw_src_bnlx.fico_dim_key_figure_copa_fin_legal (
  KEY_FIGURE_SID,
  KEY_FIGURE_ID COMMENT 'Key Figure ID',
  KEY_FIGURE_ALIAS_LONG COMMENT 'Key Figure Alias Long',
  KEY_FIGURE_TYPE COMMENT 'Key Figure Type',
  CONTEXT COMMENT 'Context',
  DOMAIN COMMENT 'Domain',
  SUBDOMAIN COMMENT 'Subdomain',
  KEY_FIGURE_ALIAS COMMENT 'Key Figure Alias',
  KEY_FIGURE COMMENT 'Key Figure',
  KEY_FIGURE_PARENT_ID COMMENT 'Key Figure Parent ID',
  LEVEL COMMENT 'Level',
  POSITION COMMENT 'Positions',
  OPTIME COMMENT 'OPTIME',
  OPTYPE COMMENT 'OPTYPE')
WITH SCHEMA COMPENSATION
AS SELECT
        KEY_FIGURE_SID,
        KEY_FIGURE_ID,
        KEY_FIGURE_ALIAS_LONG,
        KEY_FIGURE_TYPE,
        CONTEXT,
        DOMAIN,
        SUBDOMAIN,
        KEY_FIGURE_ALIAS,
        KEY_FIGURE,
        KEY_FIGURE_PARENT_ID,
        LEVEL,
        POSITION,
        OPTIME,
        OPTYPE
    FROM
        chdaa_prd_cda_fico.fico_consume.dim_key_figure_copa_fin_legal