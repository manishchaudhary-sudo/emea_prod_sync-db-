CREATE VIEW emea_consume_esalesweb.fact_transaction_for_esales_web2 (
  time_id,
  year,
  month,
  transaction_source,
  data_delivery_date,
  kpi,
  bloz,
  id_external_reporting,
  ETLLastModifiedDate,
  volume,
  estimated_order_value_exfactory_price)
WITH SCHEMA COMPENSATION
AS (select 
time_id
,year
,month
,transaction_source
,data_delivery_date
,kpi
,bloz
,id_external_reporting
,ETLLastModifiedDate
,volume
,estimated_order_value_exfactory_price
 from  emea_consume_ceec_pl.fact_transaction_for_esales_web2)