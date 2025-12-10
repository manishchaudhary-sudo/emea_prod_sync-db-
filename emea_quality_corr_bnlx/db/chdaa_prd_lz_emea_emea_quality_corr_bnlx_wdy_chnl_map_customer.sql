CREATE TABLE chdaa_prd_lz_emea.emea_quality_corr_bnlx.wdy_chnl_map_customer (
  ETLIsDeleted BOOLEAN,
  ETLChecksum STRING,
  employee_cwid STRING,
  sap_customer_country STRING,
  sap_customer_zip_code STRING,
  cluster STRING,
  update_by STRING,
  employee_name STRING,
  sap_customer_city STRING,
  main_sap_customer_code STRING,
  d_customer_mapping_code STRING,
  extract_by STRING,
  sap_customer_code STRING,
  status STRING,
  sap_customer_name STRING,
  load_id STRING,
  country_code STRING,
  sap_apb_code STRING,
  update_date DATE,
  organization STRING,
  channel STRING,
  extract_date DATE,
  ETLLastModifiedDate TIMESTAMP,
  ETLLineageID STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/correction/bnlx/wdy_chnl_map_customer'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')