CREATE TABLE chdaa_prd_lz_emea.emea_curated_disc_ceec.fact_transaction_for_esales_web (
  kpi STRING,
  id_external_reporting BIGINT,
  year INT,
  estimated_order_value_exfactory_price DECIMAL(18,2),
  transaction_source STRING,
  bloz STRING,
  volume DECIMAL(18,2),
  month INT,
  data_delivery_date DATE,
  ETLIsDeleted BOOLEAN,
  ETLLastModifiedDate TIMESTAMP,
  ETLChecksum STRING,
  ETLLineageID STRING)
USING delta
LOCATION 'abfss://curated@zpdatacoresadpemea.dfs.core.windows.net/discovery/ceec/fact_transaction_for_esales_web'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 7 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 7 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')