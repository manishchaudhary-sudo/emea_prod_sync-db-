CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.fico_dim_distribution_channel (
  DISTR_CHAN_SID BIGINT,
  DISTR_CHAN_ID VARCHAR(2) COMMENT 'Distribution Channel ID',
  DISTR_CHAN VARCHAR(20) COMMENT 'Distribution Channel',
  OPSYS VARCHAR(10) COMMENT 'OPSYS',
  OPTIME VARCHAR(25) COMMENT 'OPTIME',
  OPTYPE VARCHAR(1) COMMENT 'OPTYPE',
  ETLLastModifiedDate DATE)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/fico_dim_distribution_channel'
TBLPROPERTIES (
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')