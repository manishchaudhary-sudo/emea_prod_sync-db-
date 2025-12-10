CREATE TABLE chdaa_prd_lz_emea.emea_curated_disc_ceec.fact_transaction_for_esales_web2 (
  kpi STRING,
  time_id TIMESTAMP,
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
COMMENT 'The fact_transaction_for_esales_web2 table contains data related to transactions made on the eSales web platform. It includes key performance indicators (KPIs), such as estimated order value and volume, as well as information about the transaction source and data delivery date. The table also includes timestamps for when the data was last modified and a unique identifier for each transaction. This table is crucial for analyzing sales performance and tracking the success of the eSales web platform.'
LOCATION 'abfss://curated@zpdatacoresadpemea.dfs.core.windows.net/discovery/ceec/fact_transaction_for_esales_web2'
TBLPROPERTIES (
  'delta.deletedFileRetentionDuration' = 'interval 7 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 7 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')