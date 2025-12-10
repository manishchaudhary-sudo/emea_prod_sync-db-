CREATE VIEW emea_quality_int_ceec.vw_fact_s4u_transactions (
  transaction_row_id,
  transaction_source,
  time_id,
  transaction_customer_id,
  transaction_customer_bk,
  transaction_product_id,
  transaction_product_bk,
  data_delivery_date,
  psdt_akt_synch,
  kpi,
  volume,
  kamsoft_program_name,
  kamsoft_program_id,
  sell_in_volume_before_correction,
  date_purchase,
  expiry_date,
  batch_number,
  distributor,
  sales_type,
  document_id,
  order_id,
  sales_time,
  purchase_type,
  date_distributor_sales,
  discount_packet,
  date_start_discount_packet,
  date_end_discount_packet,
  date_order_forward,
  chain_order_id,
  chain_customer_name,
  discount_percentage,
  exfactory_price,
  estimated_compensation_value,
  estimated_order_value_exfactory_price,
  estimated_order_value_ex_factory_price_after_compensation,
  order_status,
  rep_comments,
  distributor_comments,
  internal_comments,
  product_objections,
  additional_info,
  date_corrected,
  global_id,
  ETLLastModifiedDate)
WITH SCHEMA BINDING
AS (
select uuid() transaction_row_id,
	t.source as transaction_source
	,t.r_time as time_id
	,cu.customer_id	as transaction_customer_id
	,t.r_customer as transaction_customer_bk
	,pr.product_id as transaction_product_id
	,t.r_product as transaction_product_bk
	,current_date	as data_delivery_date
	,coalesce(t.psdt_akt_synch,current_date)	as psdt_akt_synch
	,t.kpi as kpi
	,t.volume as volume
	,null as kamsoft_program_name
	,null as kamsoft_program_id
	,t.sell_in_volume_after_correction sell_in_volume_before_correction  --- there is no after in transaction table, the value is mapped to before
	,t.date_purchase as date_purchase
	,t.expiry_date as expiry_date
	,t.batch_number as batch_number
	,t.distributor as distributor
	,t.sales_type as sales_type
	,t.document_id as document_id
	,null as order_id
	,t.sales_time as sales_time
	,t.purchase_type as purchase_type
	,t.date_distributor_sales as date_distributor_sales
	,null as discount_packet
	,null as date_start_discount_packet
	,null as date_end_discount_packet
	,null as date_order_forward
	,null as chain_order_id
	,null as chain_customer_name
	,null as discount_percentage
	,pr.exfactory_price
	,null as estimated_compensation_value
	,round(t.volume * pr.exfactory_price, 2) as estimated_order_value_exfactory_price
	,null as estimated_order_value_ex_factory_price_after_compensation
	,null as order_status
	,null as rep_comments
	,null as distributor_comments
	,null as internal_comments
	,null as product_objections
	,null as additional_info
	,null as date_corrected -- kamsoft only					
	,t.global_id as global_id -- s4u only
    ,t.ETLLastModifiedDate

from emea_quality_int_ceec.fact_s4u t --- should be replaced with emea_quality_int_ceec.s4u_data
left join emea_quality_int_ceec.dim_products pr 
on pr.product_bk = t.r_product
and  cast(t.r_time as date) >= cast(pr.product_valid_from as date) 
and  cast(t.r_time as date)< cast(pr.product_valid_to as date)
left join emea_quality_int_ceec.dim_customers cu on cu.customer_bk = t.r_customer
and  cast(t.r_time as date) >= cast(cu.customer_valid_from as date) 
and  cast(t.r_time as date)< cast(cu.customer_valid_to as date)
)