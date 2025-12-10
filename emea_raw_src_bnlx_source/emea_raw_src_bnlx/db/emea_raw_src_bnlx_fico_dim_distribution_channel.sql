CREATE VIEW emea_raw_src_bnlx.fico_dim_distribution_channel (
  DISTR_CHAN_SID,
  DISTR_CHAN_ID COMMENT 'Distribution Channel ID',
  DISTR_CHAN COMMENT 'Distribution Channel',
  OPSYS COMMENT 'OPSYS',
  OPTIME COMMENT 'OPTIME',
  OPTYPE COMMENT 'OPTYPE')
WITH SCHEMA COMPENSATION
AS SELECT
        DISTR_CHAN_SID,
        DISTR_CHAN_ID,
        DISTR_CHAN,
        OPSYS,
        OPTIME,
        OPTYPE
    FROM
        chdaa_prd_cda_fico.fico_consume.dim_distribution_channel