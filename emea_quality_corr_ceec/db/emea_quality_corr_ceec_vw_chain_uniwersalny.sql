CREATE VIEW emea_quality_corr_ceec.vw_chain_uniwersalny (
  source,
  r_time,
  r_customer,
  r_product,
  r_batch,
  kpi,
  volume,
  horyzont,
  Kamsoft_program_name,
  Kamsoft_program_ID,
  Sell_In_Volume_after_correction,
  Date_purchase,
  Expiry_date,
  Batch_number,
  Distributor,
  Sales_type,
  Document_ID,
  Order_ID,
  Sales_time,
  Purchase_type,
  Date_distributor_sales,
  PSDT_AKT_SYNCH)
WITH SCHEMA BINDING
AS (
select 
	v_src AS source
	,data_zakupu AS r_time
	,id_kamsoft AS r_customer
	,BLOZ AS r_product
	,null AS r_batch
	,kpi
	,sum(volume) AS volume 
	,horyzont
	,Program AS Kamsoft_program_name
	,Nr_programu AS Kamsoft_program_ID
	,sum(ilo_kupiona_po_korekcie) AS Sell_In_Volume_after_correction
	,data_zakupu AS Date_purchase
	,termin_wanoci AS Expiry_date
	,numer_serii AS Batch_number
	,Dostawca AS Distributor
	,typ_sprzeday AS Sales_type
	,numer_dokumentu AS Document_ID,
	numer_zamwienia AS Order_ID
	,godzina_sprzeday AS Sales_time
	,typ_przyjcia AS Purchase_type
	,data_sprzeday_hurtownia AS Date_distributor_sales
	,current_date AS PSDT_AKT_SYNCH
from
     (
	select  
		'Common' as v_src
		,to_date(split(aktualnosc,'/')[2]||'-'||split(aktualnosc,'/')[0]||'-'||split(aktualnosc,'/')[1]) aktualnosc
		,BLOZ07	as BLOZ
		, id_kamsoft
		,'Sell-Out' as kpi
		, sprzedaz	as volume
		,horyzont
		,Program
		,Nr_programu
		,ilo_kupiona_po_korekcie
		,to_date(split(data_zakupu,'/')[2]||'-'||split(data_zakupu,'/')[0]||'-'||split(data_zakupu,'/')[1]) data_zakupu
		,termin_wanoci
		,numer_serii
		,Dostawca
		,typ_sprzeday
		,numer_dokumentu
		,numer_zamwienia
		,godzina_sprzeday
		,typ_przyjcia
		,data_sprzeday_hurtownia
	from emea_quality_corr_ceec.chaindata_uniwersalny_ceec_pl 
	where /*ERROR is null and PATH = v_path and NAME = v_name */
		(sprzedaz >0 or sprzedaz <0)

	union all

	select 
		'Common' as v_src
		,to_date(split(aktualnosc,'/')[2]||'-'||split(aktualnosc,'/')[0]||'-'||split(aktualnosc,'/')[1]) aktualnosc
		,BLOZ07
		,id_kamsoft
		,'Sell-In' AS kpi
		,zakup as volume
		,horyzont
		,Program
		,Nr_programu
		,ilo_kupiona_po_korekcie
		,to_date(split(data_zakupu,'/')[2]||'-'||split(data_zakupu,'/')[0]||'-'||split(data_zakupu,'/')[1]) data_zakupu
		,termin_wanoci
		,numer_serii
		,Dostawca
		,typ_sprzeday
		,numer_dokumentu
		,numer_zamwienia
		,godzina_sprzeday
		,typ_przyjcia
		,data_sprzeday_hurtownia
	from emea_quality_corr_ceec.chaindata_uniwersalny_ceec_pl 
	where /*ERROR is null *and PATH = v_path and NAME = v_name */
  (zakup >0 or zakup <0)

  union all

  select 
	'Common' as v_src
	,to_date(split(aktualnosc,'/')[2]||'-'||split(aktualnosc,'/')[0]||'-'||split(aktualnosc,'/')[1]) aktualnosc
	, BLOZ07
	, id_kamsoft
	,'Stock' AS kpi
	,stan as volume
	,horyzont,Program
	,Nr_programu
	,ilo_kupiona_po_korekcie
	,to_date(split(data_zakupu,'/')[2]||'-'||split(data_zakupu,'/')[0]||'-'||split(data_zakupu,'/')[1]) data_zakupu
	,termin_wanoci
	,numer_serii,Dostawca
	, typ_sprzeday
	,numer_dokumentu
	,numer_zamwienia
	,godzina_sprzeday
	,typ_przyjcia
	,data_sprzeday_hurtownia
  from 
  emea_quality_corr_ceec.chaindata_uniwersalny_ceec_pl /*where ERROR is null and PATH = v_path and NAME = v_name */
	)
 group by v_src
	,aktualnosc
	,id_kamsoft
	,BLOZ
	,r_batch,kpi
	,horyzont,Program
	,Nr_programu
	,ilo_kupiona_po_korekcie
	,data_zakupu
	,termin_wanoci
	,numer_serii
	,Dostawca
	,typ_sprzeday
	,numer_dokumentu
	,numer_zamwienia
	,godzina_sprzeday
	,typ_przyjcia
	,data_sprzeday_hurtownia
)