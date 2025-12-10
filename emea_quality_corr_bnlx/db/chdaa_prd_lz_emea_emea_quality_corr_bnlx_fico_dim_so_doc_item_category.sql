CREATE TABLE chdaa_prd_lz_emea.emea_quality_corr_bnlx.fico_dim_so_doc_item_category (
  so_doc_item_categ_id STRING,
  optime STRING,
  so_doc_item_categ_sid STRING,
  source_system_id STRING,
  so_doc_item_categ STRING,
  opsys STRING,
  optype STRING,
  ETLLineageID STRING,
  ETLLastModifiedDate TIMESTAMP,
  ETLIsDeleted BOOLEAN,
  ETLChecksum STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/correction/bnlx/fico_dim_so_doc_item_category'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')