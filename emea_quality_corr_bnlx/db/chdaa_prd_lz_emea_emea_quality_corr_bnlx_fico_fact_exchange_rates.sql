CREATE TABLE chdaa_prd_lz_emea.emea_quality_corr_bnlx.fico_fact_exchange_rates (
  ETLIsDeleted BOOLEAN,
  ETLLastModifiedDate TIMESTAMP,
  cda_optime STRING,
  date_id STRING,
  optime STRING,
  rate FLOAT,
  currency_from STRING,
  currency_to STRING,
  origin_date DATE,
  exchange_rate_type STRING,
  opsys STRING,
  fiscper_id STRING,
  optype STRING,
  ETLLineageID STRING,
  ETLChecksum STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/correction/bnlx/fico_fact_exchange_rates'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')