CREATE VIEW emea_raw_src_ceec.vw_kamsoft_ceec_pl (
  ETLChecksum,
  ETLIsDeleted,
  path,
  quantity,
  hist,
  load_id,
  name,
  change,
  error,
  row_number,
  programid,
  programname,
  changedate,
  bloz7,
  pharmacy,
  report,
  partition,
  generated,
  reportdate,
  filename,
  ETLLastModifiedDate,
  ETLLineageID)
WITH SCHEMA BINDING
AS (
SELECT
  ETLChecksum,
  ETLIsDeleted,
  path,
  quantity,
  hist,
  load_id,
  name,
  change,
  error,
  row_number,
  programid,
  programname,
  changedate,
  bloz7,
  pharmacy,
  report,
  partition,
  src.generated,
  reportdate,
  filename,
  src.ETLLastModifiedDate,
  ETLLineageID
  FROM --parquet.`/mnt/crm/kamsoft/kamsoft_ceec_pl`
  chdaa_prd_cda_crm.crm_consume_emea.kamsoft_ceec_pl src 
  join (
    select generated,max(ETLLastModifiedDate) as ETLLastModifiedDate
    from chdaa_prd_cda_crm.crm_consume_emea.kamsoft_ceec_pl 
    where --cast(ETLLastModifiedDate as date) >=current_date()
    length(generated)<=10
    group by generated 
  ) latest
  on src.generated=latest.generated
  and src.ETLLastModifiedDate=latest.ETLLastModifiedDate
  
  where 
  --cast(src.generated as date) >=current_date()
  --where cast(src.generated as date) >='2025-03-19'
  cast(src.generated as date) not in  (select distinct cast(data_delivery_date as date) from 
chdaa_prd_lz_emea.emea_consume_ceec_pl.fact_transactions
  where transaction_source='Kamsoft')


  and length(src.generated)<=10
  
)