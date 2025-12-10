CREATE VIEW emea_quality_int_bnlx.vw_dim_prepare_ch_customer_enrichment_dimension_nl (
  customer_country_code,
  customer_status,
  customer_cluster,
  customer_channel,
  customer_organization,
  customer_employee_cwid,
  customer_employee_name,
  customer_main_sap_customer_code_1,
  customer_sap_customer_code,
  customer_sap_customer_name,
  customer_sap_customer_zip_code,
  customer_sap_customer_city,
  customer_sap_customer_country,
  customer_sap_apb_code,
  sap_customer_code_trim,
  `0cust_sales`,
  `0cust_sales___t`,
  `0distr_chan`,
  `0distr_chan___t`,
  `0division`,
  `0division___t`,
  `0salesorg`,
  `0salesorg___t`,
  `0cust_group`,
  `0cust_group___t`,
  `0cust_grp1`,
  `0cust_grp2`,
  `0cust_grp3`,
  `0cust_grp4`,
  `0cust_grp5`,
  dcustgrp1,
  dcustgrp1___t,
  dcustgrp2,
  dcustgrp2___t,
  dcustgrp3,
  dcustgrp3___t,
  dcustgrp4,
  dcustgrp4___t,
  dcustgrp5,
  dcustgrp5___t,
  dctyspcod,
  dctyspcod___t,
  `0cust_sales_trim_sap`,
  `0cust_sales_combined`,
  `0distr_chan_comb`,
  `0salesorg_comb`,
  `0division_comb`,
  `0price_grp`)
WITH SCHEMA BINDING
AS (
Select country_code AS customer_country_code,status AS customer_status,cluster AS customer_cluster,channel AS customer_channel,organization AS customer_organization,employee_cwid AS customer_employee_cwid,employee_name AS customer_employee_name,main_sap_customer_code AS customer_main_sap_customer_code_1,sap_customer_code AS customer_sap_customer_code,sap_customer_name AS customer_sap_customer_name,sap_customer_zip_code AS customer_sap_customer_zip_code,sap_customer_city AS customer_sap_customer_city,sap_customer_country AS customer_sap_customer_country,sap_apb_code AS customer_sap_apb_code,sap_customer_code_trim,
0cust_sales,0cust_sales___t,0distr_chan,0distr_chan___t,0division,0division___t,0salesorg,0salesorg___t,0cust_group,0cust_group___t,0cust_grp1,0cust_grp2,0cust_grp3,0cust_grp4,0cust_grp5,dcustgrp1,dcustgrp1___t,dcustgrp2,dcustgrp2___t,dcustgrp3,dcustgrp3___t,dcustgrp4,dcustgrp4___t,dcustgrp5,
dcustgrp5___t,dctyspcod,dctyspcod___t,0cust_sales_trim_sap,
coalesce(0cust_sales_trim_sap, sap_customer_code_trim) AS 0cust_sales_combined,coalesce(0distr_chan, '00') AS 0distr_chan_comb,
coalesce(0salesorg, 'BNHC') AS 0salesorg_comb,coalesce(0division, '00') AS 0division_comb,0price_grp

from
(
  Select custm.country_code,custm.status,custm.cluster,custm.channel,custm.organization,custm.employee_cwid,custm.employee_name,
  custm.main_sap_customer_code,custm.sap_customer_code,custm.sap_customer_name,custm.sap_customer_zip_code,custm.sap_customer_city,custm.sap_customer_country,
  custm.sap_apb_code,ltrim(0,custm.sap_customer_code) AS sap_customer_code_trim,
  custs.0cust_sales,custs.0cust_sales___t,custs.0distr_chan,custs.0distr_chan___t,custs.0division,custs.0division___t,custs.0salesorg,custs.0salesorg___t,
  custs.0cust_group,custs.0cust_group___t,custs.0cust_grp1,custs.0cust_grp2,custs.0cust_grp3,custs.0cust_grp4,custs.0cust_grp5,custs.dcustgrp1,
  custs.dcustgrp1___t,custs.dcustgrp2,custs.dcustgrp2___t,custs.dcustgrp3,custs.dcustgrp3___t,custs.dcustgrp4,custs.dcustgrp4___t,custs.dcustgrp5,
  custs.dcustgrp5___t,custs.dctyspcod,custs.dctyspcod___t,custs.0cust_sales_trim_sap,custs.0price_grp

From

  (
    
    Select 0cust_sales,0cust_sales___t,0distr_chan,0distr_chan___t,0division,0division___t,0salesorg,0salesorg___t,  0cust_group,0cust_group___t,0cust_grp1,0cust_grp2,0cust_grp3,0cust_grp4,0cust_grp5,dcustgrp1,  dcustgrp1___t,dcustgrp2,dcustgrp2___t,dcustgrp3,dcustgrp3___t,dcustgrp4,dcustgrp4___t,dcustgrp5,  dcustgrp5___t,dctyspcod,dctyspcod___t,0cust_sales_trim_sap,0price_grp from emea_quality_int_bnlx.dim_custsales_p_001 where (0salesorg = 'BNHC' OR 0SALESORG = '' )
  ) custs

  Full outer join

  (
    
    Select d_customer_mapping_code,country_code,status,cluster,channel,organization,employee_cwid,employee_name,  main_sap_customer_code,sap_customer_code,sap_customer_name,sap_customer_zip_code,sap_customer_city,sap_customer_country,  sap_apb_code, ltrim(0,sap_customer_code) AS sap_customer_code_trim 
    from emea_quality_int_bnlx.man_ch_customer_mapping where country_code='NL'
  ) custm on custs.0cust_sales_trim_sap=ltrim(0,custm.sap_customer_code)
)
)