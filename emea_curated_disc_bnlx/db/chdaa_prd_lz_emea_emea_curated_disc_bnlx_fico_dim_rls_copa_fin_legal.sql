CREATE TABLE chdaa_prd_lz_emea.emea_curated_disc_bnlx.fico_dim_rls_copa_fin_legal (
  ETLIsDeleted BOOLEAN,
  ETLChecksum STRING,
  mail_addr STRING,
  bayrep_data_status_id STRING,
  bg_id STRING,
  cs_grp_id STRING,
  respo_hl_id_02 STRING,
  sg_id STRING,
  cs_doctype_id STRING,
  rls_auth_sid BIGINT,
  sbe_id STRING,
  username STRING,
  ETLLastModifiedDate TIMESTAMP,
  ETLLineageID STRING)
USING delta
LOCATION 'abfss://curated@zpdatacoresadpemea.dfs.core.windows.net/discovery/bnlx/fico_dim_rls_copa_fin_legal'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 7 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 7 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')