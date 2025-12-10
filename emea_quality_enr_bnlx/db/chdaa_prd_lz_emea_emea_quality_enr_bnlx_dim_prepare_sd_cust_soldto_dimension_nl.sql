CREATE TABLE chdaa_prd_lz_emea.emea_quality_enr_bnlx.dim_prepare_sd_cust_soldto_dimension_nl (
  ETLChecksum STRING,
  ETLLineageID STRING,
  ETLIsDeleted BOOLEAN,
  ETLLastModifiedDate TIMESTAMP,
  employee_cwid STRING,
  `0country___t_soldto` STRING,
  cluster STRING,
  employee_name STRING,
  `0country_soldto` STRING,
  d_customer_mapping_code STRING,
  main_sap_customer_code_1 STRING,
  status STRING,
  country_code STRING,
  sap_apb_code STRING,
  `0city_soldto` STRING,
  `0street_soldto` STRING,
  `0customer_soldto` STRING,
  `0postal_cd_soldto` STRING,
  `0customer_soldto_trim` STRING,
  organization STRING,
  `0customer___t_soldto` STRING,
  channel STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/enrichment/bnlx/dim_prepare_sd_cust_soldto_dimension_nl'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')