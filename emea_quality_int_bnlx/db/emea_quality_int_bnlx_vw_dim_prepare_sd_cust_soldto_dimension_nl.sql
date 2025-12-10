CREATE VIEW emea_quality_int_bnlx.vw_dim_prepare_sd_cust_soldto_dimension_nl (
  status,
  sap_apb_code,
  organization,
  main_sap_customer_code_1,
  employee_name,
  employee_cwid,
  d_customer_mapping_code,
  country_code,
  cluster,
  channel,
  `0country_soldto`,
  `0country___t_soldto`,
  `0postal_cd_soldto`,
  `0street_soldto`,
  `0city_soldto`,
  `0customer_soldto`,
  `0customer___t_soldto`,
  `0customer_soldto_trim`)
WITH SCHEMA BINDING
AS (
Select join3.status,
join3.sap_apb_code,join3.organization,join3.main_sap_customer_code_1,join3.employee_name,join3.employee_cwid,join3.d_customer_mapping_code,join3.country_code,join3.cluster,join3.channel,join4.0country_soldto, join4.0country___t_soldto, join4.0postal_cd_soldto, join4.0street_soldto, join4.0city_soldto, join4.0customer_soldto, join4.0customer___t_soldto, join4.0customer_soldto_trim 
FROM
(
    (
    Select join1.d_customer_mapping_code,join1.country_code,join1.status,join1.cluster,join1.channel,join1.organization,join1.employee_cwid,join1.employee_name,join1.main_sap_customer_code AS main_sap_customer_code_1,join2.sap_customer_code,join1.sap_customer_name,join1.sap_customer_zip_code,join1.sap_customer_city,join1.sap_customer_country,join1.sap_apb_code,join1.update_date,join1.update_by,join1.extract_date,join1.extract_by,
    ltrim(0,join2.sap_customer_code) AS 0customer_code_trim
    from
      (
      (
        Select sap.d_customer_mapping_code,sap.country_code,sap.status,sap.cluster,sap.channel,sap.organization,sap.employee_cwid,sap.employee_name,
        sap.main_sap_customer_code,sap.sap_customer_code,sap.sap_customer_name,sap.sap_customer_zip_code,sap.sap_customer_city,sap.sap_customer_country,sap.sap_apb_code,sap.update_date,sap.update_by,sap.extract_date,sap.extract_by
      FROM
      (
              (
                
                Select distinct main_sap_customer_code from emea_quality_int_bnlx.man_ch_customer_mapping where country_code='NL'
              ) Mainsap

              inner join

              (
                
                Select distinct d_customer_mapping_code,country_code,status,cluster,channel,organization,employee_cwid,employee_name,main_sap_customer_code,sap_customer_code,sap_customer_name,sap_customer_zip_code,sap_customer_city,sap_customer_country,sap_apb_code,update_date,update_by,extract_date,extract_by  from emea_quality_int_bnlx.man_ch_customer_mapping where country_code='NL'
              ) sap   on Mainsap.main_sap_customer_code=sap.sap_customer_code
      )
      ) join1

      inner join
      (
        Select distinct main_sap_customer_code,sap_customer_code from emea_quality_int_bnlx.man_ch_customer_mapping where country_code='NL'
      ) join2  ON join1.main_sap_customer_code=join2.main_sap_customer_code
      )
    ) join3

  RIGHT outer join
    (
    Select 0country_soldto, 0country___t_soldto, 0postal_cd_soldto, 0street_soldto, 0city_soldto, 0customer_soldto, 0customer___t_soldto, 0customer_soldto_trim 
    from emea_quality_int_bnlx.dim_customer_p_001_soldto
    ) join4 on join3.0customer_code_trim=join4.0customer_soldto_trim
)
)