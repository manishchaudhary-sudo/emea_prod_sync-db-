CREATE VIEW emea_raw_src_bnlx.fico_dim_controlling_area (
  CO_AREA_SID,
  CO_AREA_ID COMMENT 'Controlling Area ID',
  CO_AREA COMMENT 'Controlling Area',
  CO_AREA_CUR COMMENT 'Controlling Area Currency',
  OPSYS COMMENT 'OPSYS',
  OPTIME COMMENT 'OPTIME',
  OPTYPE COMMENT 'OPTYPE')
WITH SCHEMA COMPENSATION
AS SELECT
        CO_AREA_SID,
        CO_AREA_ID,
        CO_AREA,
        CO_AREA_CUR,
        OPSYS,
        OPTIME,
        OPTYPE
    FROM
        chdaa_prd_cda_fico.fico_consume.dim_controlling_area