CREATE VIEW emea_quality_corr_bnlx.vw_ch_product_mapping_be_live_edit (
  d_product_mapping_code,
  country_code,
  status,
  category,
  brand_cluster,
  brand,
  sub_brand,
  portfolio_management,
  product_name,
  main_sap_material_code,
  sap_material_code,
  cnk_material_code,
  cnk_material_name,
  iri_material_name,
  update_date,
  update_by,
  extract_date,
  extract_by,
  iri_ean_code,
  sap_material_name,
  dummy_measure)
WITH SCHEMA BINDING
AS (
with fico_product as
(
Select 
	distinct 
	0material
	,0comp_code
	,DBG 
	,CASE 0comp_code  WHEN '0188' then 'NL'
		WHEN '0159' then 'BE' ELSE 'NA' end AS country_code
	,ltrim(0,0material) AS 0material_trim
	,'NEW' AS status 
from emea_quality_corr_bnlx.vw_fact_copaf_ext_p_new 
	where 
		DBG='16' and DVF!='VV117' and left(0FISCPER,4)!='2016'
),
material
( 
Select 
	0material
	,0material___t 
from emea_quality_int_bnlx.dim_material_p_001 
where dprodh1='16'
)  

select * from (
Select 
	null AS d_product_mapping_code
	,fp.country_code
	,fp.status
	,null AS category
	,null AS brand_cluster
	,null AS brand
	,null AS sub_brand
	,null AS portfolio_management
	,null AS product_name
	,0material_trim as main_sap_material_code
	,0material_trim as sap_material_code
	,null AS cnk_material_code
	,null AS cnk_material_name
	,null AS iri_material_name
	,null AS update_date
	,null AS update_by
	,null AS extract_date
	,null AS extract_by
	,null AS iri_ean_code
	,0material___t as sap_material_name 
	,null AS dummy_measure 


from fico_product fp 
left join emea_quality_corr_bnlx.vw_man_ch_product_mapping prod_map  

on fp.country_code=prod_map.country_code 
and fp.0material_trim=prod_map.sap_material_code

left join material mat 
on mat.0material=fp.0material

where d_product_mapping_code is null and coalesce(0material_trim,'') != ''
and fp.country_code='BE'

union 

Select 
	d_product_mapping_code
	,country_code
	, status
	,category
	,brand_cluster
	,brand
	,sub_brand
	,portfolio_management
	,product_name
    ,main_sap_material_code
	,sap_material_code
	,cnk_material_code
	,cnk_material_name
	,iri_material_name
	,update_date
	,update_by
	,extract_date,extract_by
	,iri_ean_code
	,sap_material_name 
	,1 AS dummy_measure 
from emea_quality_corr_bnlx.vw_man_ch_product_mapping
)
where country_code='BE'
)