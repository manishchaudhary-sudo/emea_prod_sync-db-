CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.fico_dim_so_doc_type (
  SO_DOC_TYPE_SID BIGINT,
  SO_DOC_TYPE_ID VARCHAR(4) COMMENT 'Sales Order Document Type ID',
  SO_DOC_TYPE VARCHAR(20) COMMENT 'Sales Order Document Type',
  DIV_FLAG INT COMMENT 'Divested Flag',
  OPSYS VARCHAR(10) COMMENT 'OPSYS',
  OPTIME VARCHAR(25) COMMENT 'OPTIME',
  OPTYPE VARCHAR(1) COMMENT 'OPTYPE',
  ETLLastModifiedDate DATE)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/fico_dim_so_doc_type'
TBLPROPERTIES (
  'delta.minReaderVersion' = '1',
  'delta.minWriterVersion' = '2')