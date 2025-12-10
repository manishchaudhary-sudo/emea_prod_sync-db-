CREATE VIEW emea_quality_int_bnlx.vw_dim_man_ch_customer_mapping_sql (
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
Select d_customer_mapping_code,country_code,status,cluster,channel,organization,employee_cwid,employee_name,main_sap_customer_code,sap_customer_code,sap_customer_name,sap_customer_zip_code,sap_customer_city,sap_customer_country,sap_apb_code,update_date,update_by,extract_date,extract_by,sum(dummy) AS dummy
from
( 
  Select null AS d_customer_mapping_code,join2.country_code,join2.status,null AS cluster,null AS channel,null AS organization,null AS employee_cwid,null AS employee_name,
  join2.main_sap_customer_code, join2.sap_customer_code,join2.sap_customer_name, join2.sap_customer_zip_code,join2.sap_customer_city,join2.sap_customer_country,null AS sap_apb_code,null AS update_date,null AS update_by,null AS extract_date,null AS extract_by,join2.dummy
  from
      (
          ( 
            Select dctyspcod,0cust_sales_trim,0cust_sales,0salesorg,0distr_chan,0division, 
            CASE 0salesorg  WHEN 'BNHC' then 'NL' 
              WHEN 'BBHC' then 'BE' 
              ELSE 'NA' end country_code  from emea_quality_int_bnlx.dim_custsales_p_001
              where  0distr_chan = '00' AND 0division = '00' AND (0salesorg = 'BNHC' OR 0salesorg = 'BBHC')
          ) custsal 

        right outer join

          ( 
              Select join1.0cust_sales_trim,join1.0comp_code,join1.status,join1.country_code,cust.0customer___t,cust.0postal_cd,cust.0city,cust.0country,
              join1.0cust_sales_trim AS main_sap_customer_code, join1.0cust_sales_trim AS sap_customer_code,cust.0customer___t AS sap_customer_name, cust.0postal_cd AS sap_customer_zip_code,cust.0city AS sap_customer_city,cust.0country AS sap_customer_country, -1 AS dummy
              from
              (
                (
                Select fico.0cust_sales_trim,fico.0comp_code,fico.status,fico.country_code,custm.d_customer_mapping_code
                from
                (
                  (
                    
                    Select distinct 0cust_sales,0comp_code,DBG ,
                    CASE 0comp_code  WHEN '0188' then 'NL' WHEN '0159' then 'BE' 	 ELSE 'NA' end AS country_code,ltrim(0,0cust_sales) AS 0cust_sales_trim,'NEW' AS status
                   from emea_quality_int_bnlx.fact_copaf_ext_p_new where DBG='16' and DVF!='VV117' and left(0FISCPER,4)!='2016'

                  )fico
                  left join
                    emea_quality_int_bnlx.man_ch_customer_mapping custm  on fico.0cust_sales_trim=custm.sap_customer_code
                ) where coalesce(fico.0cust_sales_trim,'') != '' AND custm.d_customer_mapping_code is null 
                
                ) join1
                left join emea_quality_int_bnlx.dim_customer_p_001 cust on join1.0cust_sales_trim=cust.0customer_trim
              )
          ) join2  on custsal.0cust_sales_trim=join2.0cust_sales_trim and custsal.country_code=join2.country_code
      )

union

Select d_customer_mapping_code,country_code,status,cluster,channel,organization,employee_cwid,employee_name,main_sap_customer_code,sap_customer_code,
sap_customer_name,sap_customer_zip_code,sap_customer_city,sap_customer_country,sap_apb_code,update_date,update_by,extract_date,extract_by,1 AS dummy from 
emea_quality_int_bnlx.man_ch_customer_mapping
) A
group by d_customer_mapping_code,country_code,status,cluster,channel,organization,employee_cwid,employee_name,main_sap_customer_code,sap_customer_code,
sap_customer_name,sap_customer_zip_code,sap_customer_city,sap_customer_country,sap_apb_code,update_date,update_by,extract_date,extract_by
)