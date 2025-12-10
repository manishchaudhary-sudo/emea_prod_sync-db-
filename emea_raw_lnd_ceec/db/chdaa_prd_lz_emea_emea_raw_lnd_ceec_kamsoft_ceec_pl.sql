CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_ceec.kamsoft_ceec_pl (
  ETLChecksum STRING,
  ETLLastModifiedDate TIMESTAMP,
  ETLIsDeleted BOOLEAN,
  ETLLineageID STRING,
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
  filename STRING)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/ceec/kamsoft_ceec_pl'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 7 days',
  'delta.logRetentionDuration' = 'interval 7 days',
  'delta.minReaderVersion' = '1',
  'delta.minWriterVersion' = '2')