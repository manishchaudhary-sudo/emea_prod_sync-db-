CREATE VIEW emea_raw_src_bnlx.fico_dim_value_type (
  VALUE_TYPE_SID COMMENT 'Value Type ID',
  VALUE_TYPE_ID COMMENT 'Value Type ID',
  VALUE_TYPE COMMENT 'Value Type',
  OPSYS COMMENT 'OPSYS',
  OPTIME COMMENT 'OPTIME',
  OPTYPE COMMENT 'OPTYPE')
WITH SCHEMA COMPENSATION
AS SELECT
        VALUE_TYPE_SID,
        VALUE_TYPE_ID,
        VALUE_TYPE,
        OPSYS,
        OPTIME,
        OPTYPE
    FROM
        chdaa_prd_cda_fico.fico_consume.dim_value_type