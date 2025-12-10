CREATE TABLE chdaa_prd_lz_emea.emea_quality_enr_ceec.dim_date (
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
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/enrichment/ceec/dim_date'
TBLPROPERTIES (
  'delta.minReaderVersion' = '1',
  'delta.minWriterVersion' = '2')