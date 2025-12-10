CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.fico_fact_exchange_rates (
  DATE_SID INT,
  FISCPER_SID INT,
  DATE_ID STRING,
  FISCPER_ID STRING,
  EXCHANGE_RATE_TYPE VARCHAR(4) COMMENT 'Exchange Rate Type',
  CURRENCY_FROM VARCHAR(5) COMMENT 'Currency From',
  CURRENCY_TO VARCHAR(5) COMMENT 'Currency To',
  RATE DECIMAL(38,19),
  ORIGIN_DATE DATE,
  OPSYS STRING,
  OPTIME STRING,
  OPTYPE STRING,
  CDA_OPTIME STRING,
  ETLLastModifiedDate DATE)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/fico_fact_exchange_rates'
TBLPROPERTIES (
  'delta.minReaderVersion' = '1',
  'delta.minWriterVersion' = '2')