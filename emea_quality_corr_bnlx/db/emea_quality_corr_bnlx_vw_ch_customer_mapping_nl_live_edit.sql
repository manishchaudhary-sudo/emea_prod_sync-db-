CREATE VIEW emea_quality_corr_bnlx.vw_ch_customer_mapping_nl_live_edit (
  d_customer_mapping_code,
  country_code,
  status,
  cluster,
  channel,
  organization,
  employee_cwid,
  employee_name,
  main_sap_customer_code,
  sap_customer_code,
  sap_customer_name,
  sap_customer_zip_code,
  sap_customer_city,
  sap_customer_country,
  sap_apb_code,
  update_date,
  update_by,
  extract_date,
  extract_by,
  dummy)
WITH SCHEMA BINDING
AS (
with fico_customer as 
(
Select 
	distinct 
	0cust_sales
	,0comp_code
	,DBG
	,CASE 0comp_code  WHEN '0188' then 'NL' WHEN '0159' then 'BE'
	ELSE 'NA' end AS country_code
	,ltrim(0,0cust_sales) AS 0cust_sales_trim,'NEW' AS status
 from emea_quality_corr_bnlx.vw_fact_copaf_ext_p_new 
 where DBG='16' and DVF!='VV117' and left(0FISCPER,4)!='2016'
)


select 

   null AS d_customer_mapping_code
  ,fc.country_code as country_code
  ,fc.status as status
  ,null AS cluster
  ,null AS channel
  ,null AS organization
  ,null AS employee_cwid
  ,null AS employee_name
  ,fc.0cust_sales_trim as main_sap_customer_code
  ,fc.0cust_sales_trim as sap_customer_code
  ,cust.0customer___t as sap_customer_name
  ,cust.0postal_cd as sap_customer_zip_code
  ,cust.0city sap_customer_city
  ,cust.0country sap_customer_country
  ,null AS sap_apb_code
  ,null AS update_date
  ,null AS update_by
  ,null AS extract_date
  ,null AS extract_by
  ,-1 dummy

from 
fico_customer fc 

left join emea_quality_corr_bnlx.vw_dim_customer_p_001 cust
on fc.0cust_sales_trim=cust.0customer_trim

left join emea_quality_corr_bnlx.vw_man_ch_customer_mapping custm  
on fc.0cust_sales_trim=custm.sap_customer_code

where coalesce(fc.0cust_sales_trim,'') != '' 
AND custm.d_customer_mapping_code is null 
and fc.country_code='NL'

union 

Select 
d_customer_mapping_code
,country_code,status
,cluster
,channel
,organization
,employee_cwid
,employee_name
,main_sap_customer_code
,sap_customer_code
,sap_customer_name
,sap_customer_zip_code
,sap_customer_city
,sap_customer_country
,sap_apb_code
,update_date
,update_by
,extract_date
,extract_by
,1 AS dummy 
from emea_quality_corr_bnlx.vw_man_ch_customer_mapping
where country_code='NL'

)