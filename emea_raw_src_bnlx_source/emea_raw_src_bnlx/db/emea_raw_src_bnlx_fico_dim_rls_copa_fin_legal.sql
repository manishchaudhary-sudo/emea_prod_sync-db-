CREATE VIEW emea_raw_src_bnlx.fico_dim_rls_copa_fin_legal (
  USERNAME COMMENT 'USERNAME',
  MAIL_ADDR,
  SBE_ID,
  RESPO_HL_ID_02,
  SG_ID,
  BAYREP_DATA_STATUS_ID,
  COMPANY_CODE_ID,
  CS_DOCTYPE_ID,
  BG_ID,
  CS_GRP_ID,
  RLS_AUTH_SID)
WITH SCHEMA COMPENSATION
AS SELECT
        USERNAME,
        MAIL_ADDR,
        SBE_ID,
        RESPO_HL_ID_02,
        SG_ID,
        BAYREP_DATA_STATUS_ID,
        COMPANY_CODE_ID,
        CS_DOCTYPE_ID,
        BG_ID,
        CS_GRP_ID,
        RLS_AUTH_SID
    FROM
        chdaa_prd_cda_fico.fico_consume.rls_copa_fin_legal