CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.fico_dim_floorprice (
  GLOBAL_PRODUCT_SID BIGINT,
  GLOBAL_PRODUCT STRING,
  FORMULATION_ID VARCHAR(60) COMMENT 'Formulation ID',
  FORMULATION VARCHAR(256) COMMENT 'Formulation',
  FGPS_ID VARCHAR(10) COMMENT 'Finished Good Pack Size ID',
  FORMULATION_UOM VARCHAR(50) COMMENT 'Formulation Unit of Measure',
  FORMULATION_FLAVOUR VARCHAR(30) COMMENT 'Formulation Flavour',
  COMBIPACK_FLAG VARCHAR(3) COMMENT 'Combipack Flag',
  GLOBAL_PRODUCT_SID_TXT STRING,
  FLOORPRICE STRING,
  FLOORPRICE_CURRENCY STRING,
  deletion_date STRING,
  ETLLastModifiedDate DATE)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/fico_dim_floorprice'
TBLPROPERTIES (
  'delta.minReaderVersion' = '1',
  'delta.minWriterVersion' = '2')