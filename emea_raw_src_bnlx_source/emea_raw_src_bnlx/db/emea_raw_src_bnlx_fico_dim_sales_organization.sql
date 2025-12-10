CREATE VIEW emea_raw_src_bnlx.fico_dim_sales_organization (
  SALES_ORG_SID,
  SALES_ORG_ID COMMENT 'Sales Organization ID',
  SALES_ORG COMMENT 'Sales Organization',
  COMOPS_SCOPE_FLAG_ID COMMENT 'ComOps_Scope_Flag_ID',
  COMOPS_SCOPE_FLAG COMMENT 'ComOps_Scope_Flag',
  OPSYS COMMENT 'OPSYS',
  OPTIME COMMENT 'OPTIME',
  OPTYPE COMMENT 'OPTYPE')
WITH SCHEMA COMPENSATION
AS SELECT
        SALES_ORG_SID,
        SALES_ORG_ID,
        SALES_ORG,
        COMOPS_SCOPE_FLAG_ID,
        COMOPS_SCOPE_FLAG,
        OPSYS,
        OPTIME,
        OPTYPE
    FROM
        chdaa_prd_cda_fico.fico_consume.dim_sales_organization