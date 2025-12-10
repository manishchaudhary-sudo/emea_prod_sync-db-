CREATE VIEW emea_quality_corr_ceec.vw_kamsoft_data (
  source,
  r_time,
  r_customer,
  r_product,
  r_batch,
  kpi,
  volume,
  Kamsoft_program_ID,
  Kamsoft_program_name,
  psdt_akt_synch,
  Date_corrected)
WITH SCHEMA BINDING
AS (
  select 
		source
		,aktualnosc AS r_time,
		id_kamsoft AS r_customer,
		BLOZ AS r_product,
		'' AS r_batch,
		kpi,
        volume,
        ProgramId AS Kamsoft_program_ID,
		ProgramName AS Kamsoft_program_name,
		Generated AS psdt_akt_synch,
		skorygowane AS Date_corrected
	from 
  (
		select 
		'Kamsoft' AS source /*kamsoft_id*/,
		case when coalesce(Hist, '') = 'T' then ChangeDate 
			else ReportDate end as aktualnosc, 
		case when coalesce(Hist, '') = 'T' or coalesce(Change, '') = 'Y' then ChangeDate 
			else ReportDate end as skorygowane,
		BLOZ7 as BLOZ,
		Pharmacy			as id_kamsoft, 
		case Report
			when 'S' then 'Sell-Out' /*common_lib:kpi_sale*/ 
			when 'Z' then 'Sell-In' /*common_lib:kpi_purchase*/ 
			when 'M' then 'Stock' /*common_lib:kpi_stock*/ 	end as kpi, 
		Quantity as volume,
		ProgramId,
		ProgramName,
		Generated
		from emea_quality_corr_ceec.kamsoft_ceec_pl	
		where (Report != 'M' or coalesce(Change, '') != 'Y') -- pomijanie dla Stock zmian, Kamsoft źle to wystawia, decyzja MMO 2020-06-22
	)
  )