CREATE TABLE chdaa_prd_lz_emea.emea_curated_disc_ceec.ceec_pl_qa_log (
  transaction_source VARCHAR(100),
  transaction_date DATE,
  transaction_customer_bk BIGINT,
  transaction_product_bk BIGINT,
  psdt_akt_synch DATE,
  ETLLastModifiedDate TIMESTAMP,
  src_unit DECIMAL(18,2),
  tgt_unit DECIMAL(18,2),
  overall_src_unit DECIMAL(18,2),
  overall_tgt_unit DECIMAL(18,2))
USING delta
LOCATION 'abfss://curated@zpdatacoresadpemea.dfs.core.windows.net/discovery/ceec/ceec_pl_qa_log'
TBLPROPERTIES (
  'delta.checkpoint.writeStatsAsJson' = 'false',
  'delta.checkpoint.writeStatsAsStruct' = 'true',
  'delta.deletedFileRetentionDuration' = 'interval 0 days',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.logRetentionDuration' = 'interval 0 days',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')