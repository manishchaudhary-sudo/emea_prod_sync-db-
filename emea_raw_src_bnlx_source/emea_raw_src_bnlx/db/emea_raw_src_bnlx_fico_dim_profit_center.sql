CREATE VIEW emea_raw_src_bnlx.fico_dim_profit_center (
  PC_SID,
  PC_ID COMMENT 'Profit Center ID',
  PC COMMENT 'Profit Center',
  BG_ID COMMENT 'Business Group ID',
  BG COMMENT 'Business Group',
  RU_ID COMMENT 'Reporting Unit ID',
  RU COMMENT 'Reporting Unit',
  SBE_ID COMMENT 'Strategic Business Entity ID',
  SBE COMMENT 'Strategic Business Entity',
  SG_ID COMMENT 'Sub Group ID',
  SG COMMENT 'Sub Group',
  OPSYS COMMENT 'OPSYS',
  OPTIME COMMENT 'OPTIME',
  OPTYPE COMMENT 'OPTYPE')
WITH SCHEMA COMPENSATION
AS SELECT
        PC_SID,
        PC_ID,
        PC,
        BG_ID,
        BG,
        RU_ID,
        RU,
        SBE_ID,
        SBE,
        SG_ID,
        SG,
        OPSYS,
        OPTIME,
        OPTYPE
    FROM
        chdaa_prd_cda_fico.fico_consume.dim_profit_center