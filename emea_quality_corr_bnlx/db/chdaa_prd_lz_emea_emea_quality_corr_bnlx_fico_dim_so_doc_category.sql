CREATE TABLE chdaa_prd_lz_emea.emea_quality_corr_bnlx.fico_dim_so_doc_category (
  ETLIsDeleted BOOLEAN,
  ETLLineageID STRING,
  optime STRING,
  so_doc_categ_id STRING,
  opsys STRING,
  div_flag STRING,
  so_doc_categ STRING,
  so_doc_categ_sid STRING,
  optype STRING,
  ETLChecksum STRING,
  ETLLastModifiedDate TIMESTAMP)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/correction/bnlx/fico_dim_so_doc_category'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')