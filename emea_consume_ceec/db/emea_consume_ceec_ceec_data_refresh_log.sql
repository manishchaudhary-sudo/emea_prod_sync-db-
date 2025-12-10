CREATE VIEW emea_consume_ceec.ceec_data_refresh_log (
  Lineage_id,
  etl_ingestion_date,
  source_table,
  audit_expression,
  source_audit_date,
  data_shared_on,
  target_table,
  target_audit_date,
  emea_refresh_date,
  data_share_status,
  emea_refresh_status)
WITH SCHEMA COMPENSATION
AS (
select   src.Lineage_id,
  coalesce(src.etl_ingestion_date, tgt.etl_ingestion_date) as etl_ingestion_date,
  src.table_name as source_table,
  src.audit_column_expression as audit_expression,
  src.audit_date as source_audit_date,
  src.last_modified_date as data_shared_on,
  coalesce(tgt.table_name, 'Not Mapped') as target_table,
  tgt.audit_date as target_audit_date,
  tgt.last_modified_date as emea_refresh_date,
  case 
    when datediff(src.etl_ingestion_date,src.last_modified_date) = 0 
    then 'Success: Data shared from Source CDA' 
    else 'Failed: Data not shared from Source CDA' 
  end as data_share_status,
  case 
    when tgt.last_modified_date > src.etl_ingestion_date and src.audit_date != tgt.audit_date 
    then 'Warning !! Data refreshed Partially'
    when tgt.last_modified_date > src.etl_ingestion_date and src.audit_date = tgt.audit_date 
    then 'Succeeded: Data refreshed in EMEA'
    when tgt.last_modified_date < src.etl_ingestion_date 
    then 'Data yet to be processed in EMEA'
    else 'Error' 
  end as emea_refresh_status
from
  (select * from emea_curated_disc_ceec.emea_data_refresh_log where object_type='Source') src
left join
  (select * from emea_curated_disc_ceec.emea_data_refresh_log where object_type='Target') tgt
on src.source_desc = tgt.source_desc
and src.lineage_id = tgt.lineage_id
and src.app = tgt.app
--where src.app = 'BENELUX'
)