CREATE VIEW emea_consume_bnlx.bnlx_mkt_data_refresh_info (
  Country,
  file_name,
  ConsumeObjectName,
  data_uploaded_date,
  Consume_data_refresh_date,
  data_refresh_status)
WITH SCHEMA COMPENSATION
AS (

with target_audit_info as (
select 'nl_dim_geography' as ConsumeObjectName,'DESC' as file_name,max(ETLLastModifiedDate) as ETLLastModifiedDate
from emea_curated_disc_bnlx.nl_dim_geography 
union 
select 'nl_dim_product' as ConsumeObjectName,'DESC' as file_name,max(ETLLastModifiedDate) as ETLLastModifiedDate
from emea_curated_disc_bnlx.nl_dim_product 
union
select 'nl_fact_sales' as ConsumeObjectName,'MOVE' as file_name,max(ETLLastModifiedDate) as ETLLastModifiedDate
from emea_curated_disc_bnlx.nl_fact_sales union
select 'fact_iri_data_records_sql' as ConsumeObjectName,'MOVE' as file_name,max(ETLLastModifiedDate) as ETLLastModifiedDate
from emea_curated_disc_bnlx.fact_iri_data_records_sql)

 (
  select 
  Country,
  src.file_name,
ConsumeObjectName
,data_uploaded_date
,ETLLastModifiedDate Consume_data_refresh_date
,case when ETLLastModifiedDate>data_uploaded_date then 'Latest data available' else 'Data yet to be processed' end data_refresh_status 
from target_audit_info tgt
left join emea_curated_disc_bnlx.vw_bnlx_ceec_audit_info src --- need to conusmed from mkt view ( SQL file 1)
on  tgt.file_name=RIGHT(src.file_name,4)
)
)