CREATE TABLE chdaa_prd_lz_emea.emea_quality_corr_bnlx.fico_dim_key_figure_copa_fin_legal_filter_definition (
  optime STRING,
  cs_item_id STRING,
  key_figure_sid STRING,
  multiplier INT,
  doc_type_id STRING,
  cs_item_sub_id STRING,
  key_figure_rel_sid STRING,
  restriction_group STRING,
  key_figure_id STRING,
  optype STRING,
  ETLChecksum STRING,
  ETLIsDeleted BOOLEAN,
  ETLLineageID STRING,
  ETLLastModifiedDate TIMESTAMP)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/correction/bnlx/fico_dim_key_figure_copa_fin_legal_filter_definition'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')