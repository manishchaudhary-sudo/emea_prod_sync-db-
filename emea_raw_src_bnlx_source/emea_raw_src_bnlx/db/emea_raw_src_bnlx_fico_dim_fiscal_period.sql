CREATE VIEW emea_raw_src_bnlx.fico_dim_fiscal_period (
  FISCPER_SID,
  FISCPER_ID,
  FISCVARNT_ID COMMENT 'Fiscal Variant',
  FISCPER,
  FISCYEAR COMMENT 'Fiscal Year',
  FISCMONTH COMMENT 'Fiscal Month',
  FISCPER_START_DATE,
  FISCPER_END_DATE,
  OPSYS,
  OPTIME,
  OPTYPE)
WITH SCHEMA COMPENSATION
AS SELECT
        FISCPER_SID,
        FISCPER_ID,
        FISCVARNT_ID,
        FISCPER,
        FISCYEAR,
        FISCMONTH,
        FISCPER_START_DATE,
        FISCPER_END_DATE,
        OPSYS,
        OPTIME,
        OPTYPE
    FROM
        chdaa_prd_cda_fico.fico_consume.dim_fiscal_period