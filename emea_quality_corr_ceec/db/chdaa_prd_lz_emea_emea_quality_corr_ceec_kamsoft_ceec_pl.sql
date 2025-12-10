CREATE TABLE chdaa_prd_lz_emea.emea_quality_corr_ceec.kamsoft_ceec_pl (
  path STRING,
  quantity FLOAT,
  hist STRING,
  load_id STRING,
  name STRING,
  change STRING,
  error STRING,
  row_number BIGINT,
  programid STRING,
  programname STRING,
  changedate STRING,
  bloz7 STRING,
  pharmacy STRING,
  report STRING,
  partition BIGINT,
  generated STRING,
  reportdate STRING,
  filename STRING,
  ETLIsDeleted BOOLEAN,
  ETLLastModifiedDate TIMESTAMP,
  ETLChecksum STRING,
  ETLLineageID STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/correction/ceec/kamsoft_ceec_pl'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 7 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 7 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')