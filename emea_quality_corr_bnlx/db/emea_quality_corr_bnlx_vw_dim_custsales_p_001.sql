CREATE VIEW emea_quality_corr_bnlx.vw_dim_custsales_p_001 (
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
  `0cust_sales_trim`,
  `0price_grp`)
WITH SCHEMA BINDING
AS (
  Select sales_cust_id as 0cust_sales , sales_cust as 0cust_sales___t , distr_chan_id as 0distr_chan , distr_chain as 0distr_chan___t , division_id as 0division , division as 0division___t , sales_org_id as 0salesorg , sales_org as 0salesorg___t , cust_grp_id as 0cust_group , cust_grp as 0cust_group___t ,cust_grp_hl_id_01 as 0cust_grp1 , cust_grp_hl_id_02 as 0cust_grp2 , cust_grp_hl_id_03 as 0cust_grp3 , cust_grp_hl_id_04 as 0cust_grp4 , cust_grp_hl_id_05 as 0cust_grp5, cust_grp_hl_id_01 as dcustgrp1 , cust_grp_hl_01 as dcustgrp1___t , cust_grp_hl_id_02 as dcustgrp2 , cust_grp_hl_02 as dcustgrp2___t ,  cust_grp_hl_id_03 as dcustgrp3 , cust_grp_hl_03 as dcustgrp3___t , cust_grp_hl_id_04 as dcustgrp4 , cust_grp_hl_04 as dcustgrp4___t ,  cust_grp_hl_id_05 as dcustgrp5 , cust_grp_hl_05 as dcustgrp5___t, cust_country_code_id as dctyspcod ,  cust_country_code as dctyspcod___t  ,ltrim(0,sales_cust_id)  as 0cust_sales_trim_sap,ltrim(0,0cust_sales) AS 0cust_sales_trim,price_group_id as 0price_grp
 from emea_quality_corr_bnlx.fico_dim_sales_customer
 )