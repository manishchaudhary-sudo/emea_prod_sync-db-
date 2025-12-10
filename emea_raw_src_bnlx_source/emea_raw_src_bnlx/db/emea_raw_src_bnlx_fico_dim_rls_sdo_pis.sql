CREATE VIEW emea_raw_src_bnlx.fico_dim_rls_sdo_pis (
  USERNAME COMMENT 'USERNAME',
  MAIL_ADDR,
  COMPANY_CODE_ID,
  RLS_AUTH_SID)
WITH SCHEMA COMPENSATION
AS SELECT
        USERNAME,
        MAIL_ADDR,
        COMPANY_CODE_ID,
        RLS_AUTH_SID
    FROM
        chdaa_prd_cda_fico.fico_consume.rls_sdo_pis