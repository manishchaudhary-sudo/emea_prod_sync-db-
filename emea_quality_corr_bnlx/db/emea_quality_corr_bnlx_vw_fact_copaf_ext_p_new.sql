CREATE VIEW emea_quality_corr_bnlx.vw_fact_copaf_ext_p_new (
  `0accnt_asgn`,
  `0billtoprty`,
  `0bill_type` COMMENT 'Billing Type ID',
  `0calday` COMMENT 'Date ID',
  `0calmonth` COMMENT 'Month of Year',
  `0calquart1` COMMENT 'Quarter',
  `0calquarter`,
  `0calweek`,
  `0calyear` COMMENT 'Year',
  `0comp_code` COMMENT 'Company Code ID',
  `0coorder` COMMENT 'IO Order ID',
  `0country` COMMENT 'Country ID',
  `0co_area` COMMENT 'Controlling Area ID',
  `0cs_chart` COMMENT 'Consolidation Chart of Accounts ID',
  `0cs_dimen` COMMENT 'CS Dimension ID',
  `0cs_doctype` COMMENT 'CS Document Type ID',
  `0cs_item` COMMENT 'Item ID',
  `0curkey_gc` COMMENT 'Global Currency ID',
  `0curkey_lc` COMMENT 'Currency of Amount Field',
  `0curkey_tc` COMMENT 'Transction Currency ID',
  `0customer` COMMENT 'Customer ID',
  `0cust_sales` COMMENT 'Sales Customer ID',
  `0distr_chan` COMMENT 'Distribution Chain ID',
  `0division` COMMENT 'Division ID',
  `0doc_type` COMMENT 'CS Document Type ID',
  `0fiscper` COMMENT 'Fiscal Period ID',
  `0fiscper3` COMMENT 'Fiscal Month',
  `0fiscvarnt` COMMENT 'Fiscal Variant',
  `0fiscyear` COMMENT 'Fiscal Year',
  `0gi_date` COMMENT 'Goods Issued Date',
  `0gl_account` COMMENT 'G/L Account ID',
  `0material` COMMENT 'Material ID',
  `0matl_grp_1` COMMENT 'Material Group ID',
  `0payer` COMMENT 'Payer ID',
  `0pcompany` COMMENT 'Partner Company ID',
  `0plant` COMMENT 'Plant ID',
  `0prod_hier` COMMENT 'Production Hiearchy ID',
  `0pstng_date` COMMENT 'Posting Date',
  `0salesorg` COMMENT 'Sales Organization ID',
  `0ship_to` COMMENT 'Customer ID',
  `0sold_to` COMMENT 'Customer ID',
  `0unit` COMMENT 'Unit ID',
  `0version` COMMENT 'Version ID',
  `0vtype` COMMENT 'Value Type ID',
  dbg COMMENT 'Business Group ID',
  dctry_fd COMMENT 'Country ID',
  dpc COMMENT 'Profit Center (Controlling View) ID',
  drespl1 COMMENT 'Business Responsibility Level 1',
  drespo COMMENT 'Business Responsibility ID',
  dru COMMENT 'Reporting Unit',
  dsbe COMMENT 'Strategic Business Entity',
  dvf COMMENT 'Value Field ID',
  d_msrca COMMENT 'Merger Source ID',
  d_cs_grpa COMMENT 'Item Group ID',
  d_xdisco,
  d_xgross,
  d_xnetsal,
  rk_quantity,
  rk_fc1_quantity,
  rk_fc2_quantity,
  rk_fc3_quantity,
  rk_quantity_pln,
  ck_net_sales_amt_act,
  ck_discnt_amt_act,
  ck_disc_cash_act,
  ck_disc_act,
  ck_gross_qnty_act,
  ck_rebates_act,
  ck_rebates_other_act,
  ck_returns_act,
  ck_not_assigned_act,
  rk_fc1_amount,
  rk_fc2_amount,
  rk_fc3_amount,
  ck_gross_sales_amt_pln,
  ck_net_sales_amt_pln,
  ck_discnt_amt_pln,
  ck_disc_cash_pln,
  ck_disc_pln,
  ck_gross_qnty_pln,
  ck_rebates_pln,
  ck_rebates_other_pln,
  ck_returns_pln,
  ck_not_assigned_pln,
  ck_gross_sales_amt_act,
  ck_secondary_rebates_act,
  ck_secondary_rebates_pln,
  rls_auth_sid)
WITH SCHEMA BINDING
AS WITH CTE_DGN AS (
  SELECT
    KEY_FIGURE_REL_SID,
    MAX(D_XDISCO) AS D_XDISCO,
    MAX(D_XGROSS) AS D_XGROSS,
    MAX(D_XNETSAL) AS D_XNETSAL
  FROM
    (
      SELECT
        a.KEY_FIGURE_REL_SID,
        CASE
          WHEN b.KEY_FIGURE_ALIAS = 'DISCOUNTS' THEN 'X'
          ELSE ''
        END AS D_XDISCO,
        CASE
          WHEN b.KEY_FIGURE_ALIAS = 'GROSSSALES' THEN 'X'
          ELSE ''
        END AS D_XGROSS,
        CASE
          WHEN b.KEY_FIGURE_ALIAS = 'NETSALES_LV' THEN 'X'
          ELSE ''
        END AS D_XNETSAL
      FROM
        emea_quality_corr_bnlx.fico_dim_key_figure_copa_fin_legal_filter_definition a
        LEFT JOIN emea_quality_corr_bnlx.fico_dim_key_figure_copa_fin_legal b ON b.KEY_FIGURE_SID = a.KEY_FIGURE_SID
        AND b.KEY_FIGURE_ALIAS IN ('GROSSSALES', 'DISCOUNTS', 'NETSALES_LV')
        AND b.KEY_FIGURE_TYPE IN ('RESTRICTED')
    )
  GROUP BY
    KEY_FIGURE_REL_SID
),
CTE_COPAF_EXT AS (
  SELECT
   
    '' AS 0ACCNT_ASGN,
   bt.bill_to_id  AS 0BILLTOPRTY,
    a.BILLING_TYPE_ID AS 0BILL_TYPE,
    d.DATE_ID AS 0CALDAY,
    d.MONTH_OF_YEAR AS 0CALMONTH,
    d.QUARTER AS 0CALQUART1,
   
   CONCAT(d.YEAR,d.QUARTER) AS 0CALQUARTER,
  CONCAT(d.YEAR,CASE WHEN LEN(d.WEEK_ISO)=1 THEN '0' END ,d.WEEK_ISO) AS 0CALWEEK,
    d.YEAR AS 0CALYEAR,
   
    a.COMPANY_CODE_ID AS 0COMP_CODE,
    a.IO_ORDER AS 0COORDER
    ,
    a.COUNTRY_ID AS 0COUNTRY
,
    ca.CO_AREA_ID AS 0CO_AREA,
    corc.CS_CHART_ID AS 0CS_CHART,
    a.CS_DIMENSION_ID AS 0CS_DIMEN,
    a.CS_DOCTYPE_ID AS 0CS_DOCTYPE,
    i.CS_ITEM_ID AS 0CS_ITEM
    ,
    a.CURRENCY_GLOBAL_ID AS 0CURKEY_GC,
    a.CURRENCY_LOCAL_ID AS 0CURKEY_LC,
    a.CURRENCY_TRANSACTION_ID AS 0CURKEY_TC
    ,
    cus.CUST_ID AS 0CUSTOMER
,
    coalesce(scus.SALES_CUST_ID,'') AS 0CUST_SALES
,
    scus.DISTR_CHAN_ID AS 0DISTR_CHAN
,
    scus.DIVISION_ID AS 0DIVISION
,
    a.CS_DOCTYPE_ID AS 0DOC_TYPE,
   
    a.FISCPER_ID AS 0FISCPER,
    fp.FISCMONTH AS 0FISCPER3,
    fp.FISCVARNT_ID AS 0FISCVARNT,
    fp.FISCYEAR AS 0FISCYEAR,
    a.GI_DATE AS 0GI_DATE,
    a.GL_ACCOUNT_ID AS 0GL_ACCOUNT,
   
    m.MATERIAL_ID AS 0MATERIAL,
    m.MATERIAL_GROUP_ID AS 0MATL_GRP_1,
   
    a.PAYER_ID AS 0PAYER,
    a.PARTNER_COMPANY_ID AS 0PCOMPANY,
   
    p.PLANT_ID AS 0PLANT,
    m.PRODH_ID AS 0PROD_HIER,
    a.POSTING_DATE AS 0PSTNG_DATE,
   
    so.SALES_ORG_ID AS 0SALESORG,
   
    st.SHIP_TO_ID AS 0SHIP_TO,
    sdt.SOLD_TO_ID AS 0SOLD_TO,
   
    a.UNIT_ID AS 0UNIT,
   
    v.VERSION_ID AS 0VERSION,
    vt.VALUE_TYPE_ID AS 0VTYPE,
   
    br.BG_CV_ID AS DBG,
   
    cfd.COUNTRY_FD_ID AS DCTRY_FD,
   
    br.PC_CV_ID AS DPC,
   
    br.RESPO_HL_01 AS DRESPL1,
    br.RESPO_ID AS DRESPO,
   
    br.RU_CV AS DRU,
   
    br.SBE_CV AS DSBE,
   
    a.VALUE_FIELD_ID AS DVF,
   
    br.MSRC_ID AS D_MSRCA,
    a.CS_GRP_ID AS D_CS_GRPA,
   
    dgn.D_XDISCO AS D_XDISCO,
   
    dgn.D_XGROSS AS D_XGROSS,
   
    dgn.D_XNETSAL AS D_XNETSAL,
   
 
              a.QUANTITY_ACT,
        a.QUANTITY_BUD,
             
              a.QUANTITY_FC1,
              a.QUANTITY_FC2,
              a.QUANTITY_FC3,
              a.QUANTITY_FCL,
               a.AMOUNT_ACT_GC,
              a.AMOUNT_ACT_LC,
              a.AMOUNT_ACT_GC_PY,
              a.AMOUNT_ACT_GC_BUD,
              a.AMOUNT_BUD_LC,
              a.AMOUNT_BUD_GC,
              a.AMOUNT_FC1_GC,
              a.AMOUNT_FC2_GC,
              a.AMOUNT_FC3_GC,
              a.AMOUNT_FCL_GC,
              a.AMOUNT_FC1_LC,
              a.AMOUNT_FC2_LC,
              a.AMOUNT_FC3_LC,
              a.AMOUNT_FCL_LC,
              a.RLS_AUTH_SID
           
  FROM
    emea_quality_corr_bnlx.fico_fact_copa_fin_legal a
    LEFT JOIN emea_quality_corr_bnlx.fico_dim_date d on d.date = coalesce(a.POSTING_DATE,to_date(concat(left(a.fiscper_id,4),'-',right(a.fiscper_id,2),'-','01'),'yyyy-MM-dd'))
    LEFT JOIN emea_quality_corr_bnlx.fico_dim_material m on a.MATERIAL_SID = m.MATERIAL_SID
    LEFT JOIN emea_quality_corr_bnlx.fico_dim_fiscal_period fp on fp.FISCPER_SID = a.FISCPER_SID
    LEFT JOIN emea_quality_corr_bnlx.fico_dim_country c on c.COUNTRY_SID = a.COUNTRY_SID
    LEFT JOIN emea_quality_corr_bnlx.fico_dim_controlling_area ca on ca.CO_AREA_SID = a.CO_AREA_SID
    LEFT JOIN emea_quality_corr_bnlx.fico_dim_customer_oriented_responsibility_channel corc on corc.COREC_SID = a.COREC_SID
    LEFT JOIN emea_quality_corr_bnlx.fico_dim_item i on i.CS_ITEM_SID = a.CS_ITEM_SID
    LEFT JOIN emea_quality_corr_bnlx.fico_dim_customer cus on cus.CUST_SID = a.CUST_SID
    LEFT JOIN emea_quality_corr_bnlx.fico_dim_sales_customer scus on scus.SALES_CUST_SID = a.SALES_CUST_SID
    LEFT JOIN emea_quality_corr_bnlx.fico_dim_plant p on p.PLANT_SID = a.PLANT_SID
    LEFT JOIN emea_quality_corr_bnlx.fico_dim_sales_organization so ON so.SALES_ORG_SID = a.SALES_ORG_SID
    LEFT JOIN emea_quality_corr_bnlx.fico_dim_ship_to st on st.SHIP_TO_SID = a.SHIP_TO_SID
    LEFT JOIN emea_quality_corr_bnlx.fico_dim_sold_to sdt on sdt.SOLD_TO_SID = a.SOLD_TO_SID
    LEFT JOIN emea_quality_corr_bnlx.fico_dim_version v on v.VERSION_SID = a.VERSION_SID
    LEFT JOIN emea_quality_corr_bnlx.fico_dim_value_type vt on vt.VALUE_TYPE_SID = a.VALUE_TYPE_SID
    LEFT JOIN emea_quality_corr_bnlx.fico_dim_business_responsibility br on br.RESPO_SID = a.RESPO_SID
    LEFT JOIN emea_quality_corr_bnlx.fico_dim_country_of_final_destination cfd on cfd.COUNTRY_FD_SID = a.COUNTRY_FD_SID
    LEFT JOIN emea_quality_corr_bnlx.fico_dim_bill_to bt on a.bill_to_sid=bt.bill_to_sid
    LEFT JOIN CTE_DGN dgn on dgn.KEY_FIGURE_REL_SID = a.KEY_FIGURE_REL_SID
 
  WHERE
  1=1
   
    AND (
      a.COMPANY_CODE_ID = '0188'
      OR a.COMPANY_CODE_ID = '0159'
    )
    and (
      v.VERSION_ID = '000'
      or v.VERSION_ID = 'FC1'
      or v.VERSION_ID = 'FC2'
      or v.VERSION_ID = 'FC3'
    )
   
 
    and
    (
      a.VALUE_FIELD_ID = 'VV000'
      OR a.VALUE_FIELD_ID = 'VV002'
      OR a.VALUE_FIELD_ID = 'VV003'
      OR a.VALUE_FIELD_ID = 'VV004'
      OR a.VALUE_FIELD_ID = 'VV005'
      OR a.VALUE_FIELD_ID = 'VV006'
      OR a.VALUE_FIELD_ID = 'VV106'
      OR a.VALUE_FIELD_ID = 'VV117'
      OR a.VALUE_FIELD_ID = ''
    )
   /* and  (a.obj_type_id ='0PSG' OR a.obj_type_id ='0') */
    and a.cs_doctype_id<>'32'
)
 
 
SELECT
  0ACCNT_ASGN,
  0BILLTOPRTY,
  0BILL_TYPE,
  0CALDAY,
  0CALMONTH,
  0CALQUART1,
  0CALQUARTER,
  0CALWEEK,
  0CALYEAR,
  0COMP_CODE,
  0COORDER,
  0COUNTRY,
  0CO_AREA,
  0CS_CHART,
  0CS_DIMEN,
  0CS_DOCTYPE,
  0CS_ITEM,
  0CURKEY_GC,
  0CURKEY_LC,
  0CURKEY_TC,
  0CUSTOMER,
  0CUST_SALES,
  0DISTR_CHAN,
  0DIVISION,
  0DOC_TYPE,
 
  0FISCPER,
  0FISCPER3,
  0FISCVARNT,
  0FISCYEAR,
  0GI_DATE,
  0GL_ACCOUNT,
  0MATERIAL,
  0MATL_GRP_1,
  0PAYER,
  0PCOMPANY,
  0PLANT,
  0PROD_HIER,
  0PSTNG_DATE,
  0SALESORG,
  0SHIP_TO,
  0SOLD_TO,
  0UNIT,
  0VERSION,
  0VTYPE,
  DBG,
  DCTRY_FD,
 
  DPC,
  DRESPL1,
  DRESPO,
  DRU,
  DSBE,
  DVF,
  D_MSRCA,
  D_CS_GRPA,
  D_XDISCO,
  D_XGROSS,
  D_XNETSAL
 ,SUM(RK_QUANTITY) AS RK_QUANTITY
,SUM(RK_FC1_QUANTITY) AS RK_FC1_QUANTITY
,SUM(RK_FC2_QUANTITY) AS RK_FC2_QUANTITY
,SUM(RK_FC3_QUANTITY) AS RK_FC3_QUANTITY
,SUM(RK_QUANTITY_PLN) AS RK_QUANTITY_PLN
,SUM(CK_NET_SALES_AMT_ACT) AS CK_NET_SALES_AMT_ACT
,SUM(CK_DISCNT_AMT_ACT) AS CK_DISCNT_AMT_ACT
,SUM(CK_DISC_CASH_ACT) AS CK_DISC_CASH_ACT
,SUM(CK_DISC_ACT) AS CK_DISC_ACT
,SUM(CK_GROSS_QNTY_ACT) AS CK_GROSS_QNTY_ACT
,SUM(CK_REBATES_ACT) AS CK_REBATES_ACT
,SUM(CK_REBATES_OTHER_ACT) AS CK_REBATES_OTHER_ACT
,SUM(CK_RETURNS_ACT) AS CK_RETURNS_ACT
,SUM(CK_NOT_ASSIGNED_ACT) AS CK_NOT_ASSIGNED_ACT
,SUM(RK_FC1_AMOUNT) AS RK_FC1_AMOUNT
,SUM(RK_FC2_AMOUNT) AS RK_FC2_AMOUNT
,SUM(RK_FC3_AMOUNT) AS RK_FC3_AMOUNT
,SUM(CK_GROSS_SALES_AMT_PLN) AS CK_GROSS_SALES_AMT_PLN
,SUM(CK_NET_SALES_AMT_PLN) AS CK_NET_SALES_AMT_PLN
,SUM(CK_DISCNT_AMT_PLN) AS CK_DISCNT_AMT_PLN
,SUM(CK_DISC_CASH_PLN) AS CK_DISC_CASH_PLN
,SUM(CK_DISC_PLN) AS CK_DISC_PLN
,SUM(CK_GROSS_QNTY_PLN) AS CK_GROSS_QNTY_PLN
,SUM(CK_REBATES_PLN) AS CK_REBATES_PLN
,SUM(CK_REBATES_OTHER_PLN) AS CK_REBATES_OTHER_PLN
,SUM(CK_RETURNS_PLN) AS CK_RETURNS_PLN
,SUM(CK_NOT_ASSIGNED_PLN) AS CK_NOT_ASSIGNED_PLN
,SUM(CK_GROSS_SALES_AMT_ACT) AS CK_GROSS_SALES_AMT_ACT
,SUM(CK_SECONDARY_REBATES_ACT) AS CK_SECONDARY_REBATES_ACT
,SUM(CK_SECONDARY_REBATES_PLN) AS CK_SECONDARY_REBATES_PLN
,RLS_AUTH_SID
FROM
(
SELECT
  0ACCNT_ASGN,
  0BILLTOPRTY,
  0BILL_TYPE,
  0CALDAY,
  0CALMONTH,
  0CALQUART1,
  0CALQUARTER,
  0CALWEEK,
  0CALYEAR,
  0COMP_CODE,
  0COORDER,
  0COUNTRY,
  0CO_AREA,
  0CS_CHART,
  0CS_DIMEN,
  0CS_DOCTYPE,
  0CS_ITEM,
  0CURKEY_GC,
  0CURKEY_LC,
  0CURKEY_TC,
  0CUSTOMER,
  0CUST_SALES,
  0DISTR_CHAN,
  0DIVISION,
  0DOC_TYPE,
 
  0FISCPER,
  0FISCPER3,
  0FISCVARNT,
  0FISCYEAR,
  0GI_DATE,
  0GL_ACCOUNT,
  0MATERIAL,
  0MATL_GRP_1,
  0PAYER,
  0PCOMPANY,
  0PLANT,
  0PROD_HIER,
  0PSTNG_DATE,
  0SALESORG,
  0SHIP_TO,
  0SOLD_TO,
  0UNIT,
  0VERSION,
  0VTYPE,
  DBG,
  DCTRY_FD,
 
  DPC,
  DRESPL1,
  DRESPO,
  DRU,
  DSBE,
  DVF,
  D_MSRCA,
  D_CS_GRPA,
  D_XDISCO,
  D_XGROSS,
  D_XNETSAL,
CASE WHEN (0CS_ITEM = '0055009110' OR 0CS_ITEM = '0055009115') AND (0VERSION = '000') AND (0VTYPE = '010') THEN QUANTITY_ACT ELSE 0 END AS RK_QUANTITY,
CASE WHEN (0CS_ITEM = '0055009110' OR 0CS_ITEM = '0055009115') AND (0VERSION = 'FC1') AND (0VTYPE = '060') THEN QUANTITY_FC1 ELSE 0 END AS RK_FC1_QUANTITY,
CASE WHEN (0CS_ITEM = '0055009110' OR 0CS_ITEM = '0055009115') AND (0VERSION = 'FC2') AND (0VTYPE = '060') THEN QUANTITY_FC2 ELSE 0 END AS RK_FC2_QUANTITY,
CASE WHEN (0CS_ITEM = '0055009110' OR 0CS_ITEM = '0055009115') AND (0VERSION = 'FC3') AND (0VTYPE = '060') THEN QUANTITY_FC3 ELSE 0 END  AS RK_FC3_QUANTITY,
CASE
    WHEN (
      0CS_ITEM = '0055009110'
      OR 0CS_ITEM = '0055009115'
    )
    AND (0VERSION = '000')
    AND (0VTYPE = '020') THEN QUANTITY_BUD
    ELSE 0
  END AS RK_QUANTITY_PLN,
CASE WHEN (D_XNETSAL = 'X') AND (0VERSION = '000') AND (DVF = 'VV006' OR DVF = 'VV004' OR DVF = 'VV002' OR DVF = 'VV000' OR DVF = 'VV005' OR DVF = 'VV106' OR DVF = 'VV003' OR DVF = 'VV117' OR DVF = '') AND (0VTYPE = '010') THEN AMOUNT_ACT_GC  ELSE 0
  END AS CK_NET_SALES_AMT_ACT,
CASE WHEN (0VERSION = '000') AND (0VTYPE = '010') AND (D_XDISCO = 'X') THEN AMOUNT_ACT_GC ELSE 0 END AS CK_DISCNT_AMT_ACT,
CASE WHEN (DVF = 'VV006') AND (D_XNETSAL = 'X') AND (0VERSION = '000') AND (0VTYPE = '010') THEN AMOUNT_ACT_GC ELSE 0 END AS CK_DISC_CASH_ACT,
CASE WHEN (DVF = 'VV004') AND (0VERSION = '000') AND (D_XNETSAL = 'X') AND (0VTYPE = '010') THEN AMOUNT_ACT_GC ELSE 0 END AS CK_DISC_ACT,
CASE WHEN (DVF = 'VV000') AND (0CS_ITEM = '0055009110' OR 0CS_ITEM = '0055009115') AND (0VERSION = '000') AND (0VTYPE = '010') THEN QUANTITY_ACT ELSE 0 END AS CK_GROSS_QNTY_ACT,
CASE WHEN (DVF = 'VV005') AND (0VERSION = '000') AND (D_XNETSAL = 'X') AND (0VTYPE = '010') THEN AMOUNT_ACT_GC ELSE 0 END AS CK_REBATES_ACT,
CASE WHEN (DVF = 'VV106') AND (0VERSION = '000') AND (D_XNETSAL = 'X') AND (0VTYPE = '010') THEN AMOUNT_ACT_GC ELSE 0 END AS CK_REBATES_OTHER_ACT,
CASE WHEN (DVF = 'VV003') AND (0VERSION = '000') AND (0VTYPE = '010') THEN AMOUNT_ACT_GC ELSE 0 END AS CK_RETURNS_ACT,
CASE WHEN (DVF = '') AND (0VERSION = '000') AND (D_XNETSAL = 'X') AND (0VTYPE = '010') THEN AMOUNT_ACT_GC ELSE 0 END AS CK_NOT_ASSIGNED_ACT,
CASE WHEN (0VERSION = 'FC1') AND (0VTYPE = '060') AND (D_XNETSAL = 'X') THEN AMOUNT_FC1_GC ELSE 0 END AS RK_FC1_AMOUNT,
CASE WHEN (0VERSION = 'FC2') AND (0VTYPE = '060') AND (D_XNETSAL = 'X') THEN AMOUNT_FC2_GC ELSE 0 END AS RK_FC2_AMOUNT,
CASE WHEN (0VERSION = 'FC3') AND (0VTYPE = '060') AND (D_XNETSAL = 'X') THEN AMOUNT_FC3_GC ELSE 0 END AS RK_FC3_AMOUNT,
CASE WHEN (D_XGROSS = 'X') AND (0VERSION = '000') AND (DVF = 'VV002') AND (0VTYPE = '020') THEN AMOUNT_BUD_GC ELSE 0 END AS CK_GROSS_SALES_AMT_PLN,
CASE WHEN (D_XNETSAL = 'X') AND (DVF = 'VV006' OR DVF = 'VV004' OR DVF = 'VV002' OR DVF = 'VV000' OR DVF = 'VV005' OR DVF = 'VV106' OR DVF = 'VV003' OR DVF = 'VV117' OR DVF = '') AND (0VTYPE = '020') THEN AMOUNT_BUD_GC ELSE 0 END AS CK_NET_SALES_AMT_PLN,
CASE WHEN (D_XDISCO = 'X') AND (0VERSION = '000') AND (0VTYPE = '020') THEN AMOUNT_BUD_GC ELSE 0 END AS CK_DISCNT_AMT_PLN,
CASE WHEN (DVF = 'VV006') AND (D_XNETSAL = 'X') AND (0VERSION = '000') AND (0VTYPE = '020') THEN AMOUNT_BUD_GC ELSE 0 END
 AS CK_DISC_CASH_PLN,
CASE WHEN (DVF = 'VV004') AND (0VERSION = '000') AND (0VTYPE = '020') AND (D_XDISCO = 'X') THEN AMOUNT_BUD_GC ELSE 0 END
 AS CK_DISC_PLN,
CASE WHEN (DVF = 'VV000') AND (0CS_ITEM = '0055009110' AND 0CS_ITEM = '0055009115') AND (0VERSION = '000') AND (0VTYPE = '020') THEN QUANTITY_BUD ELSE 0 END AS CK_GROSS_QNTY_PLN,
CASE WHEN (DVF = 'VV005') AND (0VERSION = '000') AND (D_XNETSAL = 'X') AND (0VTYPE = '020') THEN AMOUNT_BUD_GC ELSE 0 END
 AS CK_REBATES_PLN,
CASE WHEN (DVF = 'VV106') AND (0VERSION = '000') AND (D_XNETSAL = 'X') AND (0VTYPE = '020') THEN AMOUNT_BUD_GC ELSE 0 END
 AS CK_REBATES_OTHER_PLN,
CASE WHEN (DVF = 'VV003') AND (0VERSION = '000') AND (0VTYPE = '020') THEN AMOUNT_BUD_GC ELSE 0 END
 AS CK_RETURNS_PLN,
CASE WHEN (DVF = '') AND (0VERSION = '000') AND (D_XNETSAL = 'X') AND (0VTYPE = '020') THEN AMOUNT_BUD_GC ELSE 0 END
 AS CK_NOT_ASSIGNED_PLN,
CASE WHEN (D_XGROSS = 'X') AND (0VERSION = '000') AND (DVF = 'VV002') AND (0VTYPE = '010') THEN AMOUNT_ACT_GC ELSE 0 END
 AS CK_GROSS_SALES_AMT_ACT,
CASE WHEN (DVF = 'VV117') AND (0VERSION = '000') AND (D_XNETSAL = 'X') AND (0VTYPE = '010') THEN AMOUNT_ACT_GC ELSE 0 END AS CK_SECONDARY_REBATES_ACT,
CASE WHEN (DVF = 'VV117') AND (0VERSION = '000') AND (D_XNETSAL = 'X') AND (0VTYPE = '020') THEN AMOUNT_BUD_GC ELSE 0 END AS CK_SECONDARY_REBATES_PLN,
RLS_AUTH_SID
FROM CTE_COPAF_EXT
)A
GROUP BY
  0ACCNT_ASGN,
  0BILLTOPRTY,
  0BILL_TYPE,
  0CALDAY,
  0CALMONTH,
  0CALQUART1,
  0CALQUARTER,
  0CALWEEK,
  0CALYEAR,
  0COMP_CODE,
  0COORDER,
  0COUNTRY,
  0CO_AREA,
  0CS_CHART,
  0CS_DIMEN,
  0CS_DOCTYPE,
  0CS_ITEM,
  0CURKEY_GC,
  0CURKEY_LC,
  0CURKEY_TC,
  0CUSTOMER,
  0CUST_SALES,
  0DISTR_CHAN,
  0DIVISION,
  0DOC_TYPE,
 
  0FISCPER,
  0FISCPER3,
  0FISCVARNT,
  0FISCYEAR,
  0GI_DATE,
  0GL_ACCOUNT,
  0MATERIAL,
  0MATL_GRP_1,
  0PAYER,
  0PCOMPANY,
  0PLANT,
  0PROD_HIER,
  0PSTNG_DATE,
  0SALESORG,
  0SHIP_TO,
  0SOLD_TO,
  0UNIT,
  0VERSION,
  0VTYPE,
  DBG,
  DCTRY_FD,
 
  DPC,
  DRESPL1,
  DRESPO,
  DRU,
  DSBE,
  DVF,
  D_MSRCA,
  D_CS_GRPA,
  D_XDISCO,
  D_XGROSS,
  D_XNETSAL,
  RLS_AUTH_SID