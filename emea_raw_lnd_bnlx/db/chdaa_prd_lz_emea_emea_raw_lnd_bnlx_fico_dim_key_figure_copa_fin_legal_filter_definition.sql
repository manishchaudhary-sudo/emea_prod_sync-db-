CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.fico_dim_key_figure_copa_fin_legal_filter_definition (
  KEY_FIGURE_SID INT,
  KEY_FIGURE_ID VARCHAR(60) COMMENT 'Key Figure ID',
  RESTRICTION_GROUP VARCHAR(10) COMMENT 'Restriction Group',
  KEY_FIGURE_REL_SID BIGINT,
  DOC_TYPE_ID STRING,
  CS_ITEM_ID STRING,
  CS_ITEM_SUB_ID STRING,
  MULTIPLIER BIGINT,
  OPTIME VARCHAR(25) COMMENT 'OPTIME',
  OPTYPE VARCHAR(1) COMMENT 'OPTYPE',
  ETLLastModifiedDate DATE)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/fico_dim_key_figure_copa_fin_legal_filter_definition'
TBLPROPERTIES (
  'delta.minReaderVersion' = '1',
  'delta.minWriterVersion' = '2')