CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.fico_dim_key_figure_copa_fin_legal (
  KEY_FIGURE_SID INT,
  KEY_FIGURE_ID VARCHAR(4) COMMENT 'Key Figure ID',
  KEY_FIGURE_ALIAS_LONG VARCHAR(60) COMMENT 'Key Figure Alias Long',
  KEY_FIGURE_TYPE VARCHAR(15) COMMENT 'Key Figure Type',
  CONTEXT VARCHAR(60) COMMENT 'Context',
  DOMAIN VARCHAR(4) COMMENT 'Domain',
  SUBDOMAIN VARCHAR(4) COMMENT 'Subdomain',
  KEY_FIGURE_ALIAS VARCHAR(60) COMMENT 'Key Figure Alias',
  KEY_FIGURE VARCHAR(60) COMMENT 'Key Figure',
  KEY_FIGURE_PARENT_ID VARCHAR(4) COMMENT 'Key Figure Parent ID',
  LEVEL VARCHAR(10) COMMENT 'Level',
  POSITION VARCHAR(10) COMMENT 'Positions',
  OPTIME VARCHAR(25) COMMENT 'OPTIME',
  OPTYPE VARCHAR(1) COMMENT 'OPTYPE',
  ETLLastModifiedDate DATE)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/fico_dim_key_figure_copa_fin_legal'
TBLPROPERTIES (
  'delta.minReaderVersion' = '1',
  'delta.minWriterVersion' = '2')