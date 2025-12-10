CREATE TABLE chdaa_prd_lz_emea.emea_quality_corr_bnlx.fico_dim_so_doc_type (
  ETLIsDeleted BOOLEAN,
  ETLChecksum STRING,
  optime STRING,
  div_flag INT,
  so_doc_type_sid STRING,
  opsys STRING,
  so_doc_type STRING,
  so_doc_type_id STRING,
  optype STRING,
  ETLLastModifiedDate TIMESTAMP,
  ETLLineageID STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/correction/bnlx/fico_dim_so_doc_type'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')