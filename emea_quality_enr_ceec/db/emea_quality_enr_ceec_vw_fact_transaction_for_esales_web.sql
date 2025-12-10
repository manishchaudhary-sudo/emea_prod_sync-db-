CREATE VIEW emea_quality_enr_ceec.vw_fact_transaction_for_esales_web (
  year,
  month,
  transaction_source,
  data_delivery_date,
  kpi,
  bloz,
  id_external_reporting,
  volume,
  estimated_order_value_exfactory_price)
WITH SCHEMA BINDING
AS (
select 
	year(transaction_time_time_id) year
	,month(transaction_time_time_id) month
	,'n/a' transaction_source
	,data_delivery_date
	,kpi
	,transaction_product_bk bloz
	,transaction_customer_bk id_external_reporting
	,CAST(sum(volume) AS DECIMAL(18, 2)) volume
	,CAST(sum(estimated_order_value_exfactory_price) AS DECIMAL(18, 2)) estimated_order_value_exfactory_price
from emea_quality_enr_ceec.vw_f_transactions_user_view/*emea_quality_enr_ceec.fact_transactions*/
where 
	kpi in ('Order', 'Sell-Out', 'Sell-In') 
	and transaction_time_time_id >= string(year(current_date)-1) || '-01-01'
group by 
	year(transaction_time_time_id) 
	,month(transaction_time_time_id) 
	,transaction_source 
	,data_delivery_date
	,kpi
	,transaction_product_bk
	,transaction_customer_bk

union

select 

	year
	,month
	,source
	,data_delivery_date
	,kpi
	,BLOZ
	,ID_external_reporting
	,CAST(volume AS DECIMAL(18, 2)) volume
	,CAST(Estimated_order_value_exfactory_price AS DECIMAL(18, 2)) Estimated_order_value_exfactory_price

from 
	(select 
		transaction_time_time_id time_id
		,year(transaction_time_time_id) year
		,month(transaction_time_time_id) month
		,transaction_source source
		,data_delivery_date
		,kpi
		,transaction_product_bk BLOZ
		,transaction_customer_bk ID_external_reporting
		,volume
		,Estimated_order_value_exfactory_price
		,row_number() over (partition by transaction_source,kpi,year(transaction_time_time_id),month(transaction_time_time_id),transaction_product_bk,transaction_customer_bk 
		order by transaction_time_time_id desc,data_delivery_date desc ,volume desc ) rw_num
	from emea_quality_enr_ceec.vw_f_transactions_user_view /*emea_quality_enr_ceec.fact_transactions*/
	where 
		kpi in ('Stock') 
		and transaction_time_time_id >= string(year(current_date)-1) || '-01-01'
	)
where rw_num=1
)