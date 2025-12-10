CREATE TABLE chdaa_prd_lz_emea.emea_quality_int_bnlx.fico_dim_rls_sdo_pis (
  company_code_id STRING,
  mail_addr STRING,
  rls_auth_sid STRING,
  username STRING,
  divested_flag STRING,
  ETLLastModifiedDate TIMESTAMP,
  ETLLineageID STRING,
  ETLIsDeleted BOOLEAN,
  ETLChecksum STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/integration/bnlx/fico_dim_rls_sdo_pis'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')