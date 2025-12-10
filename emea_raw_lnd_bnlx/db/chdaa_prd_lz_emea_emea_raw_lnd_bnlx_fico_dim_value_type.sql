CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.fico_dim_value_type (
  VALUE_TYPE_SID VARCHAR(3) COMMENT 'Value Type ID',
  VALUE_TYPE_ID VARCHAR(3) COMMENT 'Value Type ID',
  VALUE_TYPE VARCHAR(40) COMMENT 'Value Type',
  OPSYS VARCHAR(10) COMMENT 'OPSYS',
  OPTIME VARCHAR(25) COMMENT 'OPTIME',
  OPTYPE VARCHAR(1) COMMENT 'OPTYPE',
  ETLLastModifiedDate DATE)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/fico_dim_value_type'
TBLPROPERTIES (
  'delta.minReaderVersion' = '1',
  'delta.minWriterVersion' = '2')