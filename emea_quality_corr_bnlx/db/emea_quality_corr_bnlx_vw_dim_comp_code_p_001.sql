CREATE VIEW emea_quality_corr_bnlx.vw_dim_comp_code_p_001 (
  `0company`,
  `0company___t`,
  `0comp_code`,
  `0comp_code___t`,
  `0country`,
  `0currency`,
  dcgrp)
WITH SCHEMA BINDING
AS (
Select company_id as 0company,company as 0company___t, company_code_id as 0comp_code,company_code as 0comp_code___t ,country_id as 0country, company_code_cur as 0currency,country_group_id as dcgrp from emea_quality_corr_bnlx.fico_dim_company_code
)