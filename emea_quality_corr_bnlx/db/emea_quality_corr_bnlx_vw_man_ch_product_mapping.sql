CREATE VIEW emea_quality_corr_bnlx.vw_man_ch_product_mapping (
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
  sap_material_name)
WITH SCHEMA BINDING
AS (
Select d_product_mapping_code,country_code, status,category,brand_cluster,brand,sub_brand,portfolio_management,product_name,main_sap_material_code,sap_material_code,cnk_material_code,cnk_material_name,iri_material_name,update_date,update_by,extract_date,extract_by,iri_ean_code,sap_material_name
FROM
(
SELECT distinct sha2(ifnull(country_code,'') || ifnull(sap_material_code,''),256) AS d_product_mapping_code,country_code,'Processed' AS status,category,brand_cluster,brand,sub_brand,portfolio_management,product_name,main_sap_material_code,sap_material_code,cnk_material_code,cnk_material_name,iri_material_name,update_date,update_by,extract_date,extract_by,iri_ean_code,sap_material_name  
FROM emea_quality_corr_bnlx.wdy_chbe_map_product
UNION
SELECT distinct sha2(ifnull(country_code,'') || ifnull(sap_material_code,''),256) AS d_product_mapping_code,country_code, 'Processed' AS status,category,brand_cluster,brand,sub_brand,portfolio_management,product_name,main_sap_material_code,sap_material_code,cnk_material_code,cnk_material_name,iri_material_name,update_date,update_by,extract_date,extract_by,iri_ean_code,sap_material_name  
FROM emea_quality_corr_bnlx.wdy_chnl_map_product
)
)