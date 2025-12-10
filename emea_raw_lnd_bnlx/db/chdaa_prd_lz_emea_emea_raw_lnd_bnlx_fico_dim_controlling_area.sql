CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.fico_dim_controlling_area (
  CO_AREA_SID BIGINT,
  CO_AREA_ID VARCHAR(4) COMMENT 'Controlling Area ID',
  CO_AREA VARCHAR(40) COMMENT 'Controlling Area',
  CO_AREA_CUR VARCHAR(3) COMMENT 'Controlling Area Currency',
  OPSYS VARCHAR(10) COMMENT 'OPSYS',
  OPTIME VARCHAR(25) COMMENT 'OPTIME',
  OPTYPE VARCHAR(1) COMMENT 'OPTYPE',
  ETLLastModifiedDate DATE)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/fico_dim_controlling_area'
TBLPROPERTIES (
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')