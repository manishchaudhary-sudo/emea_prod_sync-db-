CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.fico_dim_fiscal_period (
  FISCPER_SID INT,
  FISCPER_ID STRING,
  FISCVARNT_ID VARCHAR(2) COMMENT 'Fiscal Variant',
  FISCPER STRING,
  FISCYEAR VARCHAR(4) COMMENT 'Fiscal Year',
  FISCMONTH VARCHAR(2) COMMENT 'Fiscal Month',
  FISCPER_START_DATE DATE,
  FISCPER_END_DATE DATE,
  OPSYS STRING,
  OPTIME STRING,
  OPTYPE STRING,
  ETLLastModifiedDate DATE)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/fico_dim_fiscal_period'
TBLPROPERTIES (
  'delta.minReaderVersion' = '1',
  'delta.minWriterVersion' = '2')