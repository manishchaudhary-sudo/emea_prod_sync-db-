CREATE TABLE chdaa_prd_lz_emea.emea_curated_disc_bnlx.fico_dim_rls_sdo_pis (
  ETLLastModifiedDate TIMESTAMP,
  ETLIsDeleted BOOLEAN,
  ETLChecksum STRING,
  ETLLineageID STRING,
  company_code_id STRING,
  mail_addr STRING,
  rls_auth_sid STRING,
  username STRING,
  divested_flag STRING)
USING delta
LOCATION 'abfss://curated@zpdatacoresadpemea.dfs.core.windows.net/discovery/bnlx/fico_dim_rls_sdo_pis'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 7 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 7 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')