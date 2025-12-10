CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.fico_dim_so_doc_item_category (
  SO_DOC_ITEM_CATEG_SID BIGINT,
  SO_DOC_ITEM_CATEG_ID STRING COMMENT 'Sales Order Item Category ID',
  SO_DOC_ITEM_CATEG STRING COMMENT 'Sales Order Item Category',
  SOURCE_SYSTEM_ID VARCHAR(2) COMMENT 'Source System ID',
  OPSYS VARCHAR(10) COMMENT 'OPSYS',
  OPTIME VARCHAR(25) COMMENT 'OPTIME',
  OPTYPE VARCHAR(1) COMMENT 'OPTYPE',
  ETLLastModifiedDate DATE)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/fico_dim_so_doc_item_category'
TBLPROPERTIES (
  'delta.minReaderVersion' = '1',
  'delta.minWriterVersion' = '2')