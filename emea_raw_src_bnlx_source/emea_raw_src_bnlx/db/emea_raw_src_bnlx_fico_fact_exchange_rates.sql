CREATE VIEW emea_raw_src_bnlx.fico_fact_exchange_rates (
  DATE_SID,
  FISCPER_SID,
  DATE_ID,
  FISCPER_ID,
  EXCHANGE_RATE_TYPE COMMENT 'Exchange Rate Type',
  CURRENCY_FROM COMMENT 'Currency From',
  CURRENCY_TO COMMENT 'Currency To',
  RATE,
  ORIGIN_DATE,
  OPSYS,
  OPTIME,
  OPTYPE,
  CDA_OPTIME)
WITH SCHEMA COMPENSATION
AS SELECT
        DATE_SID,
        FISCPER_SID,
        '' AS DATE_ID,
        '' AS FISCPER_ID,
        EXCHANGE_RATE_TYPE,
        CURRENCY_FROM,
        CURRENCY_TO,
        RATE,
        ORIGIN_DATE,
        '' AS OPSYS,
        '' AS OPTIME,
        '' AS OPTYPE,
        '' AS CDA_OPTIME        
    FROM
        chdaa_prd_cda_fico.fico_consume.fact_exchange_rates