CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.fico_dim_version (
  VERSION_SID VARCHAR(3) COMMENT 'Version ID',
  VERSION_ID VARCHAR(3) COMMENT 'Version ID',
  VERSION VARCHAR(40) COMMENT 'Version',
  OPSYS VARCHAR(10) COMMENT 'OPSYS',
  OPTIME VARCHAR(25) COMMENT 'OPTIME',
  OPTYPE VARCHAR(1) COMMENT 'OPTYPE',
  ETLLastModifiedDate DATE)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/fico_dim_version'
TBLPROPERTIES (
  'delta.minReaderVersion' = '1',
  'delta.minWriterVersion' = '2')