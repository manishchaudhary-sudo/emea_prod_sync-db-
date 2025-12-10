CREATE TABLE chdaa_prd_lz_emea.emea_quality_enr_bnlx.man_ch_customer_mapping (
  ETLLastModifiedDate TIMESTAMP,
  ETLChecksum STRING,
  employee_cwid STRING,
  sap_customer_country STRING,
  sap_customer_zip_code STRING,
  cluster STRING,
  employee_name STRING,
  update_by STRING,
  sap_customer_city STRING,
  d_customer_mapping_code STRING,
  main_sap_customer_code STRING,
  extract_by STRING,
  sap_customer_code STRING,
  status STRING,
  sap_customer_name STRING,
  country_code STRING,
  sap_apb_code STRING,
  update_date DATE,
  organization STRING,
  channel STRING,
  extract_date DATE,
  ETLIsDeleted BOOLEAN,
  ETLLineageID STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/enrichment/bnlx/man_ch_customer_mapping'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')