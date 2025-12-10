CREATE VIEW emea_quality_int_ceec.vw_fact_kamsoft_transactions (
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
select sha2( coalesce(string(t.source),'')
			|| coalesce(string(t.r_time),'')
			|| coalesce(string(cu.customer_id),'')
			|| coalesce(string(t.r_customer),'')
			|| coalesce(string(pr.product_id),'')
			|| coalesce(string(t.r_product) ,'')
			|| coalesce(string(t.psdt_akt_synch),'')
			|| coalesce(string(t.kpi),'')
			|| coalesce(string(t.volume),'')
			|| coalesce(string(t.kamsoft_program_name),'')
			|| coalesce(string(t.kamsoft_program_id),'')
			|| coalesce(string(pr.exfactory_price),'')
			|| coalesce(string(round(t.volume * pr.exfactory_price, 2)),'' )
			|| coalesce(string(t.date_corrected),''),256) transaction_row_id,
	t.source as transaction_source
	,t.r_time as time_id
	,cu.customer_id	as transaction_customer_id
	,t.r_customer as transaction_customer_bk
	,pr.product_id as transaction_product_id
	,t.r_product as transaction_product_bk
	,psdt_akt_synch	as data_delivery_date
	,coalesce(t.psdt_akt_synch
	,current_date)	as psdt_akt_synch
	,t.kpi as kpi
	,t.volume as volume
	,t.kamsoft_program_name
	,t.kamsoft_program_id
	,0 sell_in_volume_before_correction  --- there is no after in transaction table, the value is mapped to before
	,null as date_purchase
	,null as expiry_date
	,null as batch_number
	,null as distributor
	,null as sales_type
	,null as document_id
	,null as order_id
	,null as sales_time
	,null as purchase_type
	,null as date_distributor_sales
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
	,t.date_corrected -- kamsoft only					
	,null as global_id -- s4u only
    ,t.ETLLastModifiedDate

 from emea_quality_int_ceec.fact_kamsoft_data t --- should be replaced with emea_quality_int_ceec.kamsoft_data
left join emea_quality_int_ceec.dim_products pr 
on pr.product_bk = t.r_product
and  cast(t.r_time as date) >= cast(pr.product_valid_from as date) and  cast(t.r_time as date) < cast(pr.product_valid_to as date)
left join emea_quality_int_ceec.dim_customers cu on cu.customer_bk = t.r_customer
and  cast(t.r_time as date) >= cast(cu.customer_valid_from as date) and  cast(t.r_time as date) < cast(cu.customer_valid_to as date)
				
-- removed below filters in accelerator. a_row.""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""r_time"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" is comming from a cursor CU_DATY
-- not sure why cursor used in HANA, need to compare with dwh.transaction

--where t.r_time = a_row.""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""r_time"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" and t.""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""r_batch"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" = p_batch 

  )