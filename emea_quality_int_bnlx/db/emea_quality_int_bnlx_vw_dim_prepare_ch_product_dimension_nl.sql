CREATE VIEW emea_quality_int_bnlx.vw_dim_prepare_ch_product_dimension_nl (
  `0material`,
  `0material___t`,
  `0matl_type`,
  `0matl_type___t`,
  `0base_uom`,
  `0base_uom___t`,
  dprodh1,
  dprodh1___t,
  dprodh2,
  dprodh2___t,
  dprodh3,
  dprodh3___t,
  dprodh4,
  dprodh4___t,
  dprodh5,
  dprodh5___t,
  dprodh6,
  dprodh6___t,
  dbrand,
  dbrand___t,
  division,
  division___t,
  dbrandf,
  dbrandf___t,
  `0prodh6`,
  `0prodh6___t`,
  dan_cog,
  dan_cog___t,
  `0eanupc`,
  d_fgps,
  d_fgpsu,
  d_cbpck,
  d_cpckd,
  d_pptyp,
  d_trian,
  d_prsite,
  d_pasite,
  dlp_form,
  dlp_form__t,
  d_lcpha,
  `0extmatlgrp`,
  d_gtin1,
  d_gtin1c,
  d_gtin1u,
  d_gtin2,
  d_gtin2c,
  d_gtin2u,
  `0matl_group`,
  d_raube,
  d_gtin1c___t,
  d_gtin1u___t,
  d_gtin2c___t,
  d_gtin2u___t,
  d_raube___t,
  d_uvp,
  `0del_flag`,
  `0sapmaterial_code_trim`,
  product_brand,
  product_brand_cluster,
  product_category,
  product_cnk_material_code,
  product_cnk_material_name,
  product_country_code,
  product_iri_ean_code,
  product_iri_material_name,
  main_sap_material_code,
  product_portfolio_management,
  product_name,
  product_sap_material_code,
  product_sap_material_name,
  product_status,
  product_sub_brand)
WITH SCHEMA BINDING
AS (
Select join1.0material,join1.0material___t,join1.0matl_type,join1.0matl_type___t,join1.0base_uom,join1.0base_uom___t,join1.dprodh1,join1.dprodh1___t,join1.dprodh2,
join1.dprodh2___t,join1.dprodh3,join1.dprodh3___t,join1.dprodh4,join1.dprodh4___t,join1.dprodh5,join1.dprodh5___t,join1.dprodh6,join1.dprodh6___t,join1.dbrand,
join1.dbrand___t,join1.division,join1.division___t,join1.dbrandf,join1.dbrandf___t,join1.0prodh6,join1.0prodh6___t,join1.dan_cog,join1.dan_cog___t,join1.0eanupc,
join1.d_fgps,join1.d_fgpsu,join1.d_cbpck,join1.d_cpckd,join1.d_pptyp,join1.d_trian,join1.d_prsite,join1.d_pasite,join1.dlp_form,join1.dlp_form__t,join1.d_lcpha,
join1.0extmatlgrp,join1.d_gtin1,join1.d_gtin1c,join1.d_gtin1u,join1.d_gtin2,join1.d_gtin2c,join1.d_gtin2u,join1.0matl_group,join1.d_raube,join1.d_gtin1c___t,
join1.d_gtin1u___t,join1.d_gtin2c___t,join1.d_gtin2u___t,join1.d_raube___t,join1.d_uvp,join1.0del_flag,
ltrim(0,join1.0material_combined) AS 0sapmaterial_code_trim,
join2.brand AS product_brand,join2.brand_cluster AS product_brand_cluster,join2.category AS product_category,join2.cnk_material_code AS product_cnk_material_code,join2.cnk_material_name AS product_cnk_material_name ,join2.country_code AS product_country_code,
join2.iri_ean_code AS product_iri_ean_code,join2.iri_material_name AS product_iri_material_name,join2.main_sap_material_code,join2.portfolio_management AS product_portfolio_management,join2.product_name,
join2.sap_material_code AS product_sap_material_code,join2.sap_material_name AS product_sap_material_name,join2.status AS product_status,join2.sub_brand AS product_sub_brand
 from 
(
    (
        Select sapmat.0material,sapmat.0material___t,sapmat.0matl_type,sapmat.0matl_type___t,sapmat.0base_uom,sapmat.0base_uom___t,sapmat.dprodh1,sapmat.dprodh1___t,
        sapmat.dprodh2,sapmat.dprodh2___t,sapmat.dprodh3,sapmat.dprodh3___t,sapmat.dprodh4,sapmat.dprodh4___t,sapmat.dprodh5,sapmat.dprodh5___t,sapmat.dprodh6,
        sapmat.dprodh6___t,sapmat.dbrand,sapmat.dbrand___t,sapmat.division,sapmat.division___t,sapmat.dbrandf,sapmat.dbrandf___t,sapmat.0prodh6,sapmat.0prodh6___t,
        sapmat.dan_cog,sapmat.dan_cog___t,sapmat.0eanupc,sapmat.d_fgps,sapmat.d_fgpsu,sapmat.d_cbpck,sapmat.d_cpckd,sapmat.d_pptyp,sapmat.d_trian,sapmat.d_prsite,
        sapmat.d_pasite,sapmat.dlp_form,sapmat.dlp_form__t,sapmat.d_lcpha,sapmat.0extmatlgrp,sapmat.d_gtin1,sapmat.d_gtin1c,sapmat.d_gtin1u,sapmat.d_gtin2,
        sapmat.d_gtin2c,sapmat.d_gtin2u,sapmat.0matl_group,sapmat.d_raube,sapmat.d_gtin1c___t,sapmat.d_gtin1u___t,sapmat.d_gtin2c___t,sapmat.d_gtin2u___t,
        sapmat.d_raube___t,sapmat.d_uvp,sapmat.0del_flag,sapmat.0material_trim,prodm.main_sap_material_code,prodm.sap_material_code,
        coalesce(sapmat.0material, prodm.sap_material_code) AS 0material_combined
        from
        (
          (
            
            select 0material,0material___t,0matl_type,0matl_type___t,0base_uom,0base_uom___t,dprodh1,dprodh1___t,dprodh2,dprodh2___t,dprodh3,dprodh3___t,dprodh4,
                  dprodh4___t,dprodh5,dprodh5___t,dprodh6,dprodh6___t,dbrand,dbrand___t,division,division___t,dbrandf,dbrandf___t,0prodh6,0prodh6___t,dan_cog,dan_cog___t,0eanupc,d_fgps,d_fgpsu,d_cbpck,d_cpckd,d_pptyp,d_trian,d_prsite,d_pasite,dlp_form,dlp_form__t,d_lcpha,0extmatlgrp,d_gtin1,d_gtin1c,d_gtin1u,d_gtin2,d_gtin2c,d_gtin2u,0matl_group,d_raube,d_gtin1c___t,d_gtin1u___t,d_gtin2c___t,d_gtin2u___t,d_raube___t,d_uvp,0del_flag,0material_trim
            from emea_quality_int_bnlx.dim_material_p_001 WHERE dprodh1 = '16'
          ) sapmat
          Full outer join
          (
            
            Select distinct country_code,main_sap_material_code,portfolio_management,sap_material_code
                  from emea_quality_int_bnlx.man_ch_product_mapping WHERE country_code='NL' AND portfolio_management != 'Delisted'
          ) prodm on sapmat.0material_trim=prodm.sap_material_code
        )
    ) join1

    left join

    (
        Select promdc.brand,promdc.brand_cluster,promdc.category,promdc.cnk_material_code,promdc.cnk_material_name,promdc.country_code,promdc.d_product_mapping_code,
        promdc.extract_by,promdc.extract_date,promdc.iri_ean_code,promdc.iri_material_name,promdc.main_sap_material_code,promdc.portfolio_management,promdc.product_name,promdc.sap_material_code,promdc.sap_material_name,promdc.status,promdc.sub_brand,promdc.update_by,promdc.update_date
        from
        (
          (
            
            Select distinct main_sap_material_code from emea_quality_int_bnlx.man_ch_product_mapping  where country_code='NL'
          ) Prodm
          inner join
          (
            Select distinct brand,brand_cluster,category,cnk_material_code,cnk_material_name,country_code,d_product_mapping_code,extract_by,extract_date,iri_ean_code,
          iri_material_name,main_sap_material_code,portfolio_management,product_name,sap_material_code,sap_material_name,status,sub_brand,update_by,update_date 
          from emea_quality_int_bnlx.man_ch_product_mapping WHERE country_code='NL' AND portfolio_management != 'Delisted'
          ) promdc  on Prodm.main_sap_material_code=promdc.sap_material_code
        )
    ) join2 on join1.main_sap_material_code=join2.sap_material_code
)
)