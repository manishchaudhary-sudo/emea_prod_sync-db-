CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.fico_dim_rls_sdo_pis (
  USERNAME VARCHAR(256) COMMENT 'USERNAME',
  MAIL_ADDR STRING,
  COMPANY_CODE_ID STRING,
  RLS_AUTH_SID BIGINT,
  ETLLastModifiedDate DATE)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/fico_dim_rls_sdo_pis'
TBLPROPERTIES (
  'delta.minReaderVersion' = '1',
  'delta.minWriterVersion' = '2')