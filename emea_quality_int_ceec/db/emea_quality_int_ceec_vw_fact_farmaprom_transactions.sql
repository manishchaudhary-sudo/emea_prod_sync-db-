CREATE VIEW emea_quality_int_ceec.vw_fact_farmaprom_transactions (
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
  Volume,
  Kamsoft_program_name,
  Kamsoft_program_ID,
  Sell_In_Volume_before_correction,
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
Select uuid() transaction_row_id,
	fact.data_source transaction_source
	,fact.r_time as time_id
	,coalesce(cust.customer_id,'-2') as transaction_customer_id
	,coalesce(cu.customer_bk,cu1.customer_bk) as transaction_customer_bk
	,pr.product_id transaction_product_id
	,fact.r_product as transaction_product_bk
	,current_date as data_delivery_date
	,coalesce(fact.psdt_akt_synch , current_date) as psdt_akt_synch /* S4U only */
	,fact.kpi
	,fact.Volume
	,NULL AS Kamsoft_program_name
	,NULL AS Kamsoft_program_ID
	,NULL AS Sell_In_Volume_before_correction
	,NULL AS Date_purchase,NULL AS Expiry_date
	,NULL AS Batch_number
	,fact.Distributor
	,NULL AS Sales_type
	,NULL AS Document_ID
	,fact.Order_ID
	,NULL AS Sales_time
	,NULL AS Purchase_type
	,NULL AS Date_distributor_sales
	,fact.Discount_packet
	,fact.Date_start_discount_packet,fact.Date_end_discount_packet
	,fact.Date_order_forward
	,fact.Chain_order_ID
	,fact.Chain_Customer_name
	,fact.Discount_percentage
	,pr.ExFactory_price AS ExFactory_price
	,round(fact.Volume * pr.ExFactory_price * fact.Discount_percentage /100, 2) as Estimated_compensation_value
	,round(fact.Volume * pr.ExFactory_price, 2) as Estimated_order_value_exfactory_price
	,round(fact.Volume * pr.ExFactory_price, 2) - round(fact.Volume * pr.ExFactory_price * fact.Discount_percentage /100, 2) as Estimated_order_value_ex_factory_price_after_compensation
	,fact.Order_status
	,fact.Rep_comments
	,fact.Distributor_comments
	,fact.Internal_comments
	,fact.Product_objections
	,fact.Additional_info
	,NULL AS Date_corrected /*Kamsoft only*/ 
	,fact.Global_ID /*S4U only*/
    ,fact.ETLLastModifiedDate
FROM
(select 
	orderlpr_source as data_source
	,Data_zamowienia AS r_time
	,ID_apteki AS r_customer
	,NULL AS psdt_akt_synch
	,BLOZ7 AS r_product
	,'Order' AS kpi /*common_lib:kpi_order*/
	,Liczba AS Volume
	,Nazwa_hurtowni AS Distributor
	,Numer_zamowienia AS Order_ID
	,Pakiet AS Discount_packet
	,Pakiet_do AS Date_start_discount_packet
	,Pakiet_od AS Date_end_discount_packet
	,Data_wysylki_do_hurtowni AS Date_order_forward
	,ID_zamowienia_sieciowego AS Chain_order_ID
	,Siec_firmowa_nazwa AS Chain_Customer_name
	,Rabat AS Discount_percentage
	,Status_produktu_w_zamowieniu AS Order_status
	,UwagiOdPrzedstawicielaHurtowni AS Rep_comments
	,UwagiOdHurtowni AS Distributor_comments
	,UwagiWewnetrzne AS Internal_comments
	,Uwaga_do_produktu AS Product_objections
	,Dodatkowa_informacja AS Additional_info
	,ID_przypisanie_statusu_produktu_do_zamowienia AS Global_ID
    ,ETLLastModifiedDate
	from emea_quality_int_ceec.fact_farmaprom_orderlineprocessing
	where ORDERLPR_IS_VALID = 'Y'
	
	--- exclude deleted orders or including latest orders
	and 
	orderlpr_bk 
	in (select distinct orderlpr_bk 
from emea_quality_corr_ceec.vw_farmaprom_orderlineprocessing)

) fact
left join emea_quality_int_ceec.dim_products pr 
  on pr.PRODUCT_BK = fact.r_product 
  and  cast(fact.r_time as date) >= cast(pr.PRODUCT_VALID_FROM as date)
   and  cast(fact.r_time as date) < cast(pr.PRODUCT_VALID_TO as date)
left join 

(   
  select 
		*
		,row_number() over (partition by id_farmaprom order by customer_valid_from desc) rw_num 
  from
     (select 
        id_farmaprom
        ,customer_bk
        ,min(customer_valid_from) customer_valid_from
        ,max(customer_valid_to) customer_valid_to
	from emea_quality_int_ceec.dim_customers 
    where id_farmaprom is not null 
    group by id_farmaprom
        ,customer_bk
		) 
) cu  
  on cu.id_farmaprom = fact.r_customer 
  and  cast(fact.r_time as date) >= cast(cu.CUSTOMER_VALID_FROM as date)
  and  cast(fact.r_time as date) < cast(cu.CUSTOMER_VALID_TO as date)
  and cu.rw_num=1

----

left join 

(   select id_farmaprom,customer_bk ,customer_valid_from,customer_valid_to
,row_number() over (partition by id_farmaprom order by customer_valid_from desc) rw_num
        
    from emea_quality_int_ceec.dim_customers 
    where id_farmaprom is not null 
    and customer_valid_from<=(current_date-1) and customer_valid_to>=(current_date-1)
     ) cu1 
  on cu1.id_farmaprom = fact.r_customer 
  --and  fact.r_time >= cu.CUSTOMER_VALID_FROM 
  --and  fact.r_time < cu.CUSTOMER_VALID_TO
  and cu1.rw_num=1


----

left join  emea_quality_int_ceec.dim_customers cust 
on cust.customer_bk=coalesce(cu.customer_bk,cu1.customer_bk)
  and  cast(fact.r_time as date) >= cast(cust.CUSTOMER_VALID_FROM as date) 
  and  cast(fact.r_time as date) < cast(cust.CUSTOMER_VALID_TO as date) 

)