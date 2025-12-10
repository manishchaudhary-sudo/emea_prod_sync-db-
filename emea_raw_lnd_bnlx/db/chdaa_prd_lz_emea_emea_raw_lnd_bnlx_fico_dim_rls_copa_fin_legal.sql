CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.fico_dim_rls_copa_fin_legal (
  USERNAME VARCHAR(256) COMMENT 'USERNAME',
  MAIL_ADDR STRING,
  SBE_ID STRING,
  RESPO_HL_ID_02 STRING,
  SG_ID STRING,
  BAYREP_DATA_STATUS_ID STRING,
  COMPANY_CODE_ID STRING,
  CS_DOCTYPE_ID STRING,
  BG_ID STRING,
  CS_GRP_ID STRING,
  RLS_AUTH_SID BIGINT,
  ETLLastModifiedDate DATE)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/fico_dim_rls_copa_fin_legal'
TBLPROPERTIES (
  'delta.minReaderVersion' = '1',
  'delta.minWriterVersion' = '2')