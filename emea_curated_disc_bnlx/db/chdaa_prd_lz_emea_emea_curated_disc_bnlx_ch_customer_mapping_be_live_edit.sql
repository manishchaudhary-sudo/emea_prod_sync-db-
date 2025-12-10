CREATE TABLE chdaa_prd_lz_emea.emea_curated_disc_bnlx.ch_customer_mapping_be_live_edit (
  employee_cwid STRING,
  sap_customer_country STRING,
  sap_customer_zip_code STRING,
  cluster STRING,
  ETLIsDeleted BOOLEAN,
  employee_name STRING,
  update_by STRING,
  ETLChecksum STRING,
  sap_customer_city STRING,
  ETLLastModifiedDate TIMESTAMP,
  d_customer_mapping_code STRING,
  main_sap_customer_code STRING,
  extract_by STRING,
  ETLLineageID STRING,
  sap_customer_code STRING,
  status STRING,
  sap_customer_name STRING,
  country_code STRING,
  sap_apb_code STRING,
  update_date DATE,
  dummy INT,
  organization STRING,
  channel STRING,
  extract_date DATE)
USING delta
LOCATION 'abfss://curated@zpdatacoresadpemea.dfs.core.windows.net/discovery/bnlx/ch_customer_mapping_be_live_edit'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 7 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 7 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')