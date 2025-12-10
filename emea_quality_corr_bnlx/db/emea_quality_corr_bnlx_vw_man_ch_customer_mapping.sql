CREATE VIEW emea_quality_corr_bnlx.vw_man_ch_customer_mapping (
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
  extract_by)
WITH SCHEMA BINDING
AS SELECT   DISTINCT d_customer_mapping_code,country_code,status,cluster,channel,organization,employee_cwid,employee_name,main_sap_customer_code,sap_customer_code,
sap_customer_name,sap_customer_zip_code,sap_customer_city,sap_customer_country,sap_apb_code,update_date,update_by,extract_date,extract_by

FROM
  (
    SELECT sha2(ifnull(country_code, '') || ifnull(sap_customer_code, ''),256) as d_customer_mapping_code,country_code,'Processed' AS status,cluster,channel,organization,employee_cwid,employee_name,main_sap_customer_code,sap_customer_code,sap_customer_name,sap_customer_zip_code,sap_customer_city,sap_customer_country,sap_apb_code,update_date,update_by,extract_date,extract_by
  FROM emea_quality_corr_bnlx.wdy_chbe_map_customer

UNION

SELECT  sha2(ifnull(country_code, '') || ifnull(sap_customer_code, ''), 256) as d_customer_mapping_code,country_code,'Processed' AS status,cluster,
    channel,organization,employee_cwid,employee_name,main_sap_customer_code,sap_customer_code,sap_customer_name,sap_customer_zip_code,sap_customer_city,
    sap_customer_country,sap_apb_code,update_date,update_by,extract_date,extract_by
    FROM  emea_quality_corr_bnlx.wdy_chnl_map_customer
  )