CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.landing_execution (
  sourceCatalog STRING,
  sourceDbname STRING,
  targetDbname STRING,
  tableName STRING,
  tgtPath STRING)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/configuration/landing_execution'
TBLPROPERTIES (
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.appendOnly' = 'supported',
  'delta.feature.deletionVectors' = 'supported',
  'delta.feature.invariants' = 'supported',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')