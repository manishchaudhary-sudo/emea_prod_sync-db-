CREATE TABLE chdaa_prd_lz_emea.emea_quality_int_ceec.fact_s4u (
  document_id STRING,
  kpi STRING,
  date_distributor_sales TIMESTAMP,
  expiry_date TIMESTAMP,
  sales_type STRING,
  r_time TIMESTAMP,
  purchase_type STRING,
  sales_time TIMESTAMP,
  r_product INT,
  date_purchase DATE,
  distributor STRING,
  r_customer INT,
  sell_in_volume_after_correction FLOAT,
  psdt_akt_synch TIMESTAMP,
  r_batch STRING,
  global_id STRING,
  batch_number STRING,
  volume FLOAT,
  ilosc FLOAT,
  source STRING,
  ETLIsDeleted BOOLEAN,
  ETLLastModifiedDate TIMESTAMP,
  ETLChecksum STRING,
  ETLLineageID STRING)
USING delta
LOCATION 'abfss://quality@zpdatacoresadpemea.dfs.core.windows.net/integration/ceec/fact_s4u'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 7 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 7 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')