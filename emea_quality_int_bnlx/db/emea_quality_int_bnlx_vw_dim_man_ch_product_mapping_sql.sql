CREATE VIEW emea_quality_int_bnlx.vw_dim_man_ch_product_mapping_sql (
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
Select A.d_product_mapping_code,A.country_code,A.status,A.category,A.brand_cluster,A.brand,A.sub_brand, A.portfolio_management,A.product_name,A.main_sap_material_code,A.sap_material_code,
A.cnk_material_code,A.cnk_material_name,A.iri_material_name,A.update_date,A.update_by ,A.extract_date,A.extract_by, A.iri_ean_code,A.sap_material_name, count(A.dummy_measure) AS dummy_measure
FROM
    ( 
      Select null AS d_product_mapping_code,country_code,status,null AS category,null AS brand_cluster,null AS brand,null AS sub_brand,null AS portfolio_management,null AS product_name,main_sap_material_code,sap_material_code,null AS cnk_material_code,null AS cnk_material_name,null AS iri_material_name,null AS update_date,null AS update_by,null AS extract_date,null AS extract_by,null AS iri_ean_code,sap_material_name ,null AS dummy_measure
    from 
        (
        Select join1.0material_trim,join1.country_code,join1.status,matp.0material___t, join1.0material_trim AS main_sap_material_code, join1.0material_trim AS sap_material_code,matp.0material___t AS sap_material_name
        From
        (
            (
                Select fico.0material,fico.0material_trim,fico.country_code,fico.status,prodm.d_product_mapping_code
                from
                (
                  (
                  
                  
                  
                  Select distinct 0material, 0comp_code,DBG ,
                  CASE 0comp_code  WHEN '0188' then 'NL'
                    WHEN '0159' then 'BE' 	 ELSE 'NA' end AS country_code,ltrim(0,0material) AS 0material_trim,'NEW' AS status 
                    from emea_quality_int_bnlx.fact_copaf_ext_p_new where DBG='16' and DVF!='VV117' and left(0FISCPER,4)!='2016'

                  ) fico 
                  left join 

                  emea_quality_int_bnlx.man_ch_product_mapping prodm  on fico.country_code=prodm.country_code and fico.0material_trim=prodm.sap_material_code
                  ) Where d_product_mapping_code is null and coalesce(0material_trim,'') != ''
                
            ) join1

              left join  
                ( 
                Select 0material,0material___t from emea_quality_int_bnlx.dim_material_p_001 where dprodh1='16'
                )  matp on matp.0material=join1.0material
        )
    )

    UNION

    Select d_product_mapping_code,country_code, status,category,brand_cluster,brand,sub_brand,portfolio_management,product_name,main_sap_material_code,sap_material_code,cnk_material_code,cnk_material_name,iri_material_name,update_date,update_by,extract_date,extract_by,iri_ean_code,sap_material_name ,1 AS dummy_measure 
    from emea_quality_int_bnlx.man_ch_product_mapping

    ) A
      group by d_product_mapping_code,country_code,status,category,brand_cluster,brand,sub_brand, portfolio_management,product_name,main_sap_material_code,sap_material_code,cnk_material_code,cnk_material_name,iri_material_name,update_date,update_by, extract_date,extract_by ,iri_ean_code,sap_material_name
)