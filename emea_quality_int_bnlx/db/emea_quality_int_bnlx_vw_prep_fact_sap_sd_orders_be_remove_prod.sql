CREATE VIEW emea_quality_int_bnlx.vw_prep_fact_sap_sd_orders_be_remove_prod (
  `0doc_number`,
  `0s_ord_item`,
  `0dsdel_date`,
  `0soursystem`,
  derdato,
  `0lst_a_dd`,
  daedato,
  derdatoh,
  `0doc_date`,
  divestsna,
  `0logsys`,
  `0sched_line`,
  `0overall_st`,
  `0dlv_sts`,
  `0ship_cond`,
  dorqtybu,
  `0cml_cf_qty`,
  `0net_value`,
  dnetvallc,
  `0net_price`,
  `0subtotal_1`,
  `0so_i_cnt`,
  `0comp_code`,
  `0salesorg`,
  `0material`,
  `0sold_to`,
  `0doc_type`,
  `0reason_rej`,
  dflsta,
  dfksta,
  `0payer`,
  `0fiscper`,
  `0gt_bsarksd`,
  `0ship_to`,
  `0billtoprty`,
  `0plant`,
  `0material_short`,
  portfolio_management,
  rls_auth_sid)
WITH SCHEMA BINDING
AS (

Select ordnl.0doc_number,ordnl.0s_ord_item,ordnl.0dsdel_date,ordnl.0soursystem ,ordnl.derdato,ordnl.0lst_a_dd,ordnl.daedato,ordnl.derdatoh,ordnl.0doc_date,ordnl.divestsna,ordnl.0logsys,ordnl.0sched_line, ordnl.0overall_st,ordnl.0dlv_sts,ordnl.0ship_cond,sum(ordnl.dorqtybu) AS dorqtybu,sum(ordnl.0cml_cf_qty) AS 0cml_cf_qty,sum(ordnl.0net_value) AS 0net_value,sum(ordnl.dnetvallc) AS dnetvallc,sum(ordnl.0net_price) AS 0net_price,sum(ordnl.0subtotal_1) AS  0subtotal_1,sum(ordnl.0so_i_cnt) AS 0so_i_cnt,ordnl.0comp_code,ordnl.0salesorg,ordnl.0material,ordnl.0sold_to,ordnl.0doc_type,
ordnl.0reason_rej,ordnl.dflsta,ordnl.dfksta,ordnl.0payer,ordnl.0fiscper,ordnl.0gt_bsarksd,ordnl.0ship_to,ordnl.0billtoprty,ordnl.0plant,ordnl.0material_short,
map.portfolio_management,ordnl.rls_auth_sid
from
(
    
      select  so_doc_id as 0doc_number,so_doc_item as 0s_ord_item,req_deliv_date as 0dsdel_date,fact.source_system_id as 0soursystem ,so_doc_item_creation_date as derdato,last_act_gi_date as 0lst_a_dd,so_doc_item_last_change_date as daedato ,so_doc_creation_date as derdatoh,so_doc_date as 0doc_date,divestment_scenario_id as divestsna ,log_source_system_id as 0logsys,schedule_line_id as 0sched_line,so_doc_item_processing_status as 0overall_st,orig_deliv_status_item_id as 0dlv_sts,ship_cond_id as 0ship_cond,sum(quantity_bu) as dorqtybu,sum(so_conf_qty_su) as 0cml_cf_qty,sum(net_value_dc) as 0net_value,sum(net_value_lc) as dnetvallc,
    sum(net_price) as 0net_price,sum(invoice_gross_value_dc) as 0subtotal_1 ,sum(so_no_of_items) as 0so_i_cnt
    ,comc.company_code_id as 0comp_code,saorg.sales_org_id as 0salesorg,mat.material_id as 0material,sold.sold_to_id as 0sold_to,doc.so_doc_type_id as 0doc_type,
    reg.so_quot_reject_reason_id as 0reason_rej,saf.status_sales_flow_id as dflsta,bsd.bill_status_delivery_id as dfksta,pay.payer_id as 0payer,
    fis.fiscper_id as 0fiscper,cot.cust_order_type_id as 0gt_bsarksd,ship.ship_to_id as 0ship_to,bill.bill_to_id as 0billtoprty ,pl.plant_id as 0plant,
    ltrim(0,mat.material_id) as 0material_short,fact.rls_auth_sid

    from  emea_quality_corr_bnlx.fico_fact_sd_order fact
    left join emea_quality_corr_bnlx.fico_dim_company_code comc on fact.COMPANY_CODE_SID=comc.COMPANY_CODE_SID
    left join emea_quality_corr_bnlx.fico_dim_sales_organization saorg on fact.SALES_ORG_SID=saorg.SALES_ORG_SID
    left join emea_quality_corr_bnlx.fico_dim_material mat on fact.MATERIAL_SID=mat.MATERIAL_SID
    left join emea_quality_corr_bnlx.fico_dim_sold_to sold on fact.SOLD_TO_SID=sold.SOLD_TO_SID
    left join emea_quality_corr_bnlx.fico_dim_so_doc_type doc on fact.SO_DOC_TYPE_SID=doc.SO_DOC_TYPE_SID
    left join emea_quality_corr_bnlx.fico_dim_so_quot_reject_reason reg on fact.SO_QUOT_REJECT_REASON_SID=reg.SO_QUOT_REJECT_REASON_SID
    left join emea_quality_corr_bnlx.fico_dim_status_sales_flow saf on fact.STATUS_SALES_FLOW_SID=saf.STATUS_SALES_FLOW_SID
    left join emea_quality_corr_bnlx.fico_dim_bill_status_delivery bsd on fact.BILL_STATUS_DELIVERY_SID=bsd.BILL_STATUS_DELIVERY_SID
    left join emea_quality_corr_bnlx.fico_dim_payer pay on fact.PAYER_SID=pay.PAYER_SID
    left join emea_quality_corr_bnlx.fico_dim_fiscal_period fis on fact.FISCPER_SID=fis.FISCPER_SID
    left join emea_quality_corr_bnlx.fico_dim_customer_order_type cot  on fact.CUST_ORDER_TYPE_SID=cot.CUST_ORDER_TYPE_SID
    left join emea_quality_corr_bnlx.fico_dim_ship_to ship  on fact.SHIP_TO_SID=ship.SHIP_TO_SID
    left join emea_quality_corr_bnlx.fico_dim_bill_to bill  on fact.BILL_TO_SID=bill.BILL_TO_SID
    left join emea_quality_corr_bnlx.fico_dim_plant pl  on fact.PLANT_SID=pl.PLANT_SID
    where comc.COMPANY_CODE_ID='0159' AND mat.prodh_hl_id_01='16' and coalesce(LOG_SOURCE_SYSTEM_ID,'')!=''
    
    
    GROUP BY so_doc_id ,so_doc_item,req_deliv_date,fact.source_system_id ,so_doc_item_creation_date,last_act_gi_date,so_doc_item_last_change_date ,so_doc_creation_date,so_doc_date,divestment_scenario_id ,log_source_system_id,schedule_line_id,so_doc_item_processing_status,orig_deliv_status_item_id,ship_cond_id,comc.company_code_id,saorg.sales_org_id,mat.material_id,sold.sold_to_id,doc.so_doc_type_id,reg.so_quot_reject_reason_id,
    saf.status_sales_flow_id,bsd.bill_status_delivery_id,pay.payer_id,fis.fiscper_id ,cot.cust_order_type_id,ship.ship_to_id,bill.bill_to_id ,pl.plant_id,fact.rls_auth_sid
    ) ordnl
  Left join 
  (
  Select sap_material_code,portfolio_management,country_code from emea_quality_corr_bnlx.vw_man_ch_product_mapping where country_code='BE'
  )  map on ordnl.0material_short=ltrim(0,map.sap_material_code)
where  IFNULL(map.portfolio_management, '-1') != 'Delisted'
group by ordnl.0doc_number,ordnl.0s_ord_item,ordnl.0dsdel_date,ordnl.0soursystem ,ordnl.derdato,ordnl.0lst_a_dd,ordnl.daedato,ordnl.derdatoh,ordnl.0doc_date,ordnl.divestsna,ordnl.0logsys,ordnl.0sched_line, ordnl.0overall_st,ordnl.0dlv_sts,ordnl.0ship_cond,ordnl.0comp_code,ordnl.0salesorg,ordnl.0material,ordnl.0sold_to,ordnl.0doc_type,ordnl.0reason_rej,ordnl.dflsta,ordnl.dfksta,ordnl.0payer,ordnl.0fiscper,ordnl.0gt_bsarksd,ordnl.0ship_to,ordnl.0billtoprty,ordnl.0plant,ordnl.0material_short,portfolio_management,
ordnl.rls_auth_sid
)