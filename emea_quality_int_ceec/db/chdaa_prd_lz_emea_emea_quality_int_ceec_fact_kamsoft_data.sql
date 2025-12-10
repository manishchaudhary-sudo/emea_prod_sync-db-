CREATE TABLE chdaa_prd_lz_emea.emea_quality_int_ceec.fact_kamsoft_data (
  kpi STRING,
  kamsoft_program_id STRING,
  r_product STRING,
  kamsoft_program_name STRING,
  psdt_akt_synch STRING,
  date_corrected STRING,
  r_customer STRING,
  r_batch STRING,
  r_time STRING,
  volume FLOAT,
  source STRING,
  ETLIsDeleted BOOLEAN,
  ETLLastModifiedDate TIMESTAMP,
  ETLChecksum STRING,
  ETLLineageID STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/integration/ceec/fact_kamsoft_data'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 7 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 7 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')