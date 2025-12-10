CREATE VIEW emea_raw_src_bnlx.fico_dim_plant (
  PLANT_SID,
  PLANT_ID COMMENT 'Plant ID',
  PLANT COMMENT 'Plant',
  OPSYS COMMENT 'OPSYS',
  OPTIME COMMENT 'OPTIME',
  OPTYPE COMMENT 'OPTYPE')
WITH SCHEMA COMPENSATION
AS SELECT
        PLANT_SID,
        PLANT_ID,
        PLANT,
        OPSYS,
        OPTIME,
        OPTYPE
    FROM
        chdaa_prd_cda_fico.fico_consume.dim_plant