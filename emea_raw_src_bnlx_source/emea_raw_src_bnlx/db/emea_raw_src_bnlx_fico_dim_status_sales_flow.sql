CREATE VIEW emea_raw_src_bnlx.fico_dim_status_sales_flow (
  STATUS_SALES_FLOW_SID COMMENT 'Status Sales Flow SID',
  STATUS_SALES_FLOW_ID COMMENT 'Status Sales Flow ID',
  STATUS_SALES_FLOW COMMENT 'Status Sales Flow Text')
WITH SCHEMA COMPENSATION
AS SELECT
        STATUS_SALES_FLOW_SID,
        STATUS_SALES_FLOW_ID,
        STATUS_SALES_FLOW
    FROM
        chdaa_prd_cda_fico.fico_consume.dim_status_sales_flow