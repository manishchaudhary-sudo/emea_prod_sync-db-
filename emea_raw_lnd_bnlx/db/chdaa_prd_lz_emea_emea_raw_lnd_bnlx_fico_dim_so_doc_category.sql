CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.fico_dim_so_doc_category (
  SO_DOC_CATEG_SID BIGINT,
  SO_DOC_CATEG_ID VARCHAR(2) COMMENT 'Sales Order Document Category ID',
  SO_DOC_CATEG VARCHAR(60) COMMENT 'Sales Order Document Category',
  DIV_FLAG INT COMMENT 'Divested Flag',
  OPSYS VARCHAR(10) COMMENT 'OPSYS',
  OPTIME VARCHAR(25) COMMENT 'OPTIME',
  OPTYPE VARCHAR(1) COMMENT 'OPTYPE',
  ETLLastModifiedDate DATE)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/fico_dim_so_doc_category'
TBLPROPERTIES (
  'delta.minReaderVersion' = '1',
  'delta.minWriterVersion' = '2')