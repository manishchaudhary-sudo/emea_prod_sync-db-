CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.fico_dim_plant (
  PLANT_SID BIGINT,
  PLANT_ID VARCHAR(4) COMMENT 'Plant ID',
  PLANT VARCHAR(40) COMMENT 'Plant',
  OPSYS VARCHAR(10) COMMENT 'OPSYS',
  OPTIME VARCHAR(25) COMMENT 'OPTIME',
  OPTYPE VARCHAR(1) COMMENT 'OPTYPE',
  ETLLastModifiedDate DATE)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/fico_dim_plant'
TBLPROPERTIES (
  'delta.minReaderVersion' = '1',
  'delta.minWriterVersion' = '2')