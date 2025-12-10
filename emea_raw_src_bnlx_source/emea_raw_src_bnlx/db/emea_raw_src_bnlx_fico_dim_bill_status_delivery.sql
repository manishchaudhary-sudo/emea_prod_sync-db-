CREATE VIEW emea_raw_src_bnlx.fico_dim_bill_status_delivery (
  BILL_STATUS_DELIVERY_SID COMMENT 'Bill Status Delivery SID',
  BILL_STATUS_DELIVERY_ID COMMENT 'Bill Status Delivery ID',
  BILL_STATUS_DELIVERY COMMENT 'Bill Status Delivery Text')
WITH SCHEMA COMPENSATION
AS SELECT
        BILL_STATUS_DELIVERY_SID,
        BILL_STATUS_DELIVERY_ID,
        BILL_STATUS_DELIVERY
    FROM
        chdaa_prd_cda_fico.fico_consume.dim_bill_status_delivery