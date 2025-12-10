CREATE VIEW emea_quality_corr_bnlx.vw_man_ch_asw_correction_nl (
  d_correction_code,
  date,
  update_by,
  material_code,
  material_name,
  discount,
  extract_by,
  update_date,
  customer_name,
  rebates_other,
  customer_code,
  extract_date)
WITH SCHEMA BINDING
AS (
  
Select distinct sha2(ifnull(customer_code,'') || ifnull(material_code,'')|| ifnull(date,''),256) AS d_correction_code,date,update_by,material_code,
material_name,discount,extract_by,update_date,customer_name,rebates_other,customer_code,extract_date
from emea_quality_corr_bnlx.wdy_chnl_map_asw_correction
)