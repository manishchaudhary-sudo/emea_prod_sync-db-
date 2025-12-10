CREATE VIEW emea_raw_src_bnlx.fico_dim_version (
  VERSION_SID COMMENT 'Version ID',
  VERSION_ID COMMENT 'Version ID',
  VERSION COMMENT 'Version',
  OPSYS COMMENT 'OPSYS',
  OPTIME COMMENT 'OPTIME',
  OPTYPE COMMENT 'OPTYPE')
WITH SCHEMA COMPENSATION
AS SELECT
        VERSION_SID,
        VERSION_ID,
        VERSION,
        OPSYS,
        OPTIME,
        OPTYPE
    FROM
        chdaa_prd_cda_fico.fico_consume.dim_version