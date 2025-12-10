CREATE VIEW emea_raw_src_bnlx.fico_dim_customer_order_type (
  CUST_ORDER_TYPE_SID,
  CUST_ORDER_TYPE_ID COMMENT 'Customer Order Type ID',
  CUST_ORDER_TYPE COMMENT 'Customer Order Type',
  DIV_FLAG COMMENT 'Divested Flag',
  OPSYS COMMENT 'OPSYS',
  OPTIME COMMENT 'OPTIME',
  OPTYPE COMMENT 'OPTYPE')
WITH SCHEMA COMPENSATION
AS SELECT
        CUST_ORDER_TYPE_SID,
        CUST_ORDER_TYPE_ID,
        CUST_ORDER_TYPE,
        DIV_FLAG,
        OPSYS,
        OPTIME,
        OPTYPE
    FROM
        chdaa_prd_cda_fico.fico_consume.dim_customer_order_type