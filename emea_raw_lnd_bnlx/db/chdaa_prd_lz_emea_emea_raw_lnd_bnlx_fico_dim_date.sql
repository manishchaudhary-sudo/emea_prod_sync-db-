CREATE TABLE chdaa_prd_lz_emea.emea_raw_lnd_bnlx.fico_dim_date (
  DATE_SID INT COMMENT 'Date SID',
  DATE_ID STRING COMMENT 'Date ID',
  DATE DATE COMMENT 'Date',
  YEAR INT COMMENT 'Year',
  MONTH INT COMMENT 'Month',
  QUARTER INT COMMENT 'Quarter',
  QUARTER_NAME STRING COMMENT 'Quarter Name',
  QUARTER_OF_YEAR_NAME STRING COMMENT 'Quarter of Year Name',
  QUARTER_OF_YEAR INT COMMENT 'Quarter of Year',
  MONTH_NAME STRING COMMENT 'Month Name',
  MONTH_NAME_SHORT STRING COMMENT 'Month Name Short',
  MONTH_OF_YEAR_NAME STRING COMMENT 'Month of Year Name',
  MONTH_OF_YEAR INT COMMENT 'Month of Year',
  WEEK_ISO INT COMMENT 'ISO Week',
  DAY_OF_WEEK_ISO INT COMMENT 'Day of Week ISO',
  DAY_OF_WEEK_SUN INT COMMENT 'Day of Week Sunday',
  DAY_NAME STRING COMMENT 'Day Name',
  DAY_NAME_SHORT STRING COMMENT 'Day Name Short',
  DAY_OF_MONTH INT COMMENT 'Day of Month',
  OPSYS STRING COMMENT 'OPSYS',
  OPTIME STRING COMMENT 'OPTIME',
  OPTYPE STRING COMMENT 'OPTYPE',
  ETLLastModifiedDate DATE)
USING delta
LOCATION 'abfss://raw@zpdatacoresadpemea.dfs.core.windows.net/landing/bnlx/fico_dim_date'
TBLPROPERTIES (
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')