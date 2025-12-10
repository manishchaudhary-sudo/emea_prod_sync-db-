CREATE VIEW emea_quality_corr_bnlx.vw_man_ch_customer_targets_nl (
  d_customer_target_code,
  discount_target,
  date,
  update_by,
  material_code,
  material_name,
  extract_by,
  gross_sales_target,
  net_sales_target,
  objective_type,
  update_date,
  customer_name,
  customer_code,
  extract_date)
WITH SCHEMA BINDING
AS (
    
  select sha2(ifnull(discount_target, '') || ifnull(date, '') ||  ifnull(update_by, '') ||  ifnull(material_code, '') ||  ifnull(material_name, '') ||
  ifnull(extract_by, '') ||  ifnull(gross_sales_target, '') ||  ifnull(net_sales_target, '') ||
  ifnull(objective_type, '') ||  ifnull(update_date, '') ||  ifnull(customer_name, '') ||  ifnull(customer_code, '') ||  ifnull(extract_date, ''),256) AS d_customer_target_code,
  discount_target,date,update_by,material_code,material_name,extract_by,gross_sales_target,net_sales_target,objective_type,update_date,
 customer_name,customer_code,extract_date
  from emea_quality_corr_bnlx.wdy_chnl_map_customer_target
  )