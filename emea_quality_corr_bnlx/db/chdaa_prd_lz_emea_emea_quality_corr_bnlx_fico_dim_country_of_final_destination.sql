CREATE TABLE chdaa_prd_lz_emea.emea_quality_corr_bnlx.fico_dim_country_of_final_destination (
  ETLIsDeleted BOOLEAN,
  ETLChecksum STRING,
  country_fd_hl_id_06 STRING,
  country_fd_hl_04 STRING,
  optime STRING,
  country_fd_hl_id_03 STRING,
  country_fd_hl_06 STRING,
  country_fd_id STRING,
  country_fd_hl_02 STRING,
  country_fd_sid STRING,
  country_fd_hl_id_05 STRING,
  country_fd STRING,
  country_fd_hl_05 STRING,
  country_fd_hl_id_04 STRING,
  country_fd_hl_id_01 STRING,
  country_fd_hl_01 STRING,
  opsys STRING,
  country_fd_hl_03 STRING,
  country_fd_hl_id_02 STRING,
  optype STRING,
  ETLLastModifiedDate TIMESTAMP,
  ETLLineageID STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/correction/bnlx/fico_dim_country_of_final_destination'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')