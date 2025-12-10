CREATE TABLE chdaa_prd_lz_emea.emea_curated_disc_ceec.dim_date (
  time_id DATE,
  year INT,
  quarter INT,
  month INT,
  week_of_year INT,
  day_of_year INT,
  day_of_month INT,
  day_of_week INT,
  year_quarter STRING,
  year_month STRING)
USING delta
LOCATION 'abfss://curated@zpdatacoresadpemea.dfs.core.windows.net/discovery/ceec/dim_date'
TBLPROPERTIES (
  'delta.checkpoint.writeStatsAsJson' = 'false',
  'delta.checkpoint.writeStatsAsStruct' = 'true',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')