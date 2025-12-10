CREATE VIEW emea_quality_int_ceec.vw_fact_uniwersalny_transactions (
  transaction_row_id,
  transaction_source,
  time_id,
  transaction_customer_id,
  transaction_customer_bk,
  transaction_product_id,
  transaction_product_bk,
  batch_id,
  data_delivery_date,
  psdt_akt_synch,
  kpi,
  Volume,
  Kamsoft_program_name,
  Kamsoft_program_ID,
  sell_in_volume_before_correction,
  Date_purchase,
  Expiry_date,
  Batch_number,
  Distributor,
  Sales_type,
  Document_ID,
  Order_ID,
  Sales_time,
  Purchase_type,
  Date_distributor_sales,
  Discount_packet,
  Date_start_discount_packet,
  Date_end_discount_packet,
  Date_order_forward,
  Chain_order_ID,
  Chain_Customer_name,
  Discount_percentage,
  ExFactory_price,
  Estimated_compensation_value,
  Estimated_order_value_exfactory_price,
  Estimated_order_value_ex_factory_price_after_compensation,
  Order_status,
  Rep_comments,
  Distributor_comments,
  Internal_comments,
  Product_objections,
  Additional_info,
  Date_corrected,
  Global_ID,
  ETLLastModifiedDate)
WITH SCHEMA BINDING
AS (
select
uuid() transaction_row_id
,t.source as transaction_source
--,DATE_FORMAT(TO_DATE(t.r_time, 'MM/dd/yyyy'), 'yyyy-MM-dd') as time_id
,t.r_time as time_id
,cu.CUSTOMER_ID as transaction_customer_id
,t.r_customer as transaction_customer_bk
,pr.PRODUCT_ID as transaction_product_id
,t.r_product	as transaction_product_bk
,t.r_batch as batch_id
,current_date as data_delivery_date
,coalesce(t.psdt_akt_synch, current_date) as psdt_akt_synch
,t.kpi
,t.Volume
,t.Kamsoft_program_name
,t.Kamsoft_program_ID
,t.Sell_In_Volume_after_correction sell_in_volume_before_correction
,t.Date_purchase
,NULL AS Expiry_date
,t.Batch_number
,t.Distributor
,t.Sales_type
,t.Document_ID
,t.Order_ID
,t.Sales_time
,t.Purchase_type
,NULL AS Date_distributor_sales
,NULL AS Discount_packet
,NULL AS Date_start_discount_packet
,NULL AS Date_end_discount_packet
,NULL AS Date_order_forward
,NULL AS Chain_order_ID
,NULL AS Chain_Customer_name
,NULL AS Discount_percentage
,pr.ExFactory_price
,NULL AS Estimated_compensation_value
,round(t.Volume * pr.ExFactory_price, 2) as Estimated_order_value_exfactory_price
,NULL AS Estimated_order_value_ex_factory_price_after_compensation
,NULL AS Order_status
,NULL AS Rep_comments
,NULL AS Distributor_comments
,NULL AS Internal_comments
,NULL AS Product_objections
,NULL AS Additional_info
,NULL AS Date_corrected
,NULL AS Global_ID 
,t.ETLLastModifiedDate

FROM
 emea_quality_int_ceec.fact_chain_uniwersalny t
  
 join emea_quality_int_ceec.dim_products pr 
	on pr.PRODUCT_BK = t.r_product 
	and  t.r_time >= pr.PRODUCT_VALID_FROM 
	and  t.r_time < pr.PRODUCT_VALID_TO

 join emea_quality_int_ceec.dim_customers cu  
	on cu.CUSTOMER_BK = t.r_customer 
	and cu.customer_is_valid=true  -- always get active customer since the date is not properly is not properly matching
	
)