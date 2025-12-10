CREATE VIEW emea_consume_ceec.ceec_mkt_data_refresh_info (
  Country,
  file_name,
  ConsumeObjectName,
  data_uploaded_date,
  Consume_data_refresh_date,
  data_refresh_status)
WITH SCHEMA COMPENSATION
AS (

with target_adit_info as (
  select 'ceec_pl_sales' as ConsumeObjectName,marketing_source,max(ETLLastModifiedDate) as ETLLastModifiedDate
from emea_curated_disc_ceec.ceec_pl_sales group by marketing_source

union select 'ceec_sales' as ConsumeObjectName,marketing_source,max(ETLLastModifiedDate) as ETLLastModifiedDate
from emea_curated_disc_ceec.ceec_sales group by marketing_source

union select 'fact_marketing_gen_view' as ConsumeObjectName,marketing_source,max(ETLLastModifiedDate) as ETLLastModifiedDate
from emea_curated_disc_ceec.fact_marketing_gen_view group by marketing_source

union select 'pl_sales' as ConsumeObjectName,marketing_source,max(ETLLastModifiedDate) as ETLLastModifiedDate
from emea_curated_disc_ceec.pl_sales group by marketing_source

)

 
(
  select 
  Country,
  file_name,
ConsumeObjectName
,data_uploaded_date
,ETLLastModifiedDate Consume_data_refresh_date
,case when ETLLastModifiedDate>data_uploaded_date then 'Latest data available' else 'Data yet to be processed' end data_refresh_status 
from target_adit_info tgt
left join emea_curated_disc_ceec.vw_bnlx_ceec_audit_info src --- need to conusmed from mkt view ( SQL file 1)
on  tgt.marketing_source=src.file_name
)
)