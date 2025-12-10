CREATE VIEW emea_quality_corr_bnlx.vw_dim_salesorg_p_001 (
  `0salesorg`,
  `0salesorg___t`)
WITH SCHEMA BINDING
AS (
Select sales_org_id as 0salesorg, sales_org as 0salesorg___t from emea_quality_corr_bnlx.fico_dim_sales_organization
)