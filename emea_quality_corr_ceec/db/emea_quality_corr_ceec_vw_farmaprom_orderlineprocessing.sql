CREATE VIEW emea_quality_corr_ceec.vw_farmaprom_orderlineprocessing (
  orderlpr_id,
  orderlpr_bk,
  orderlpr_source,
  orderlpr_valid_from,
  orderlpr_valid_to,
  orderlpr_is_valid,
  orderlpr_change_type,
  orderlpr_change_timestamp,
  orderlpr_lad,
  orderlpr_batch,
  ID_przypisanie_statusu_produktu_do_zamowienia,
  ID_przypisanie_produktu_do_zamowienia,
  ID_zamowienia,
  Data_zamowienia,
  ID_produktu,
  BLOZ7,
  ID_apteki,
  id_kamsoft,
  Liczba,
  Nazwa_hurtowni,
  Numer_zamowienia,
  Pakiet,
  Pakiet_do,
  Pakiet_od,
  Data_wysylki_do_hurtowni,
  ID_zamowienia_sieciowego,
  Siec_firmowa_nazwa,
  Rabat,
  Status_produktu_w_zamowieniu,
  UwagiOdPrzedstawicielaHurtowni,
  UwagiOdHurtowni,
  UwagiWewnetrzne,
  Uwaga_do_produktu,
  Dodatkowa_informacja,
  lastModifiedDate,
  ETLLastModifiedDate)
WITH SCHEMA BINDING
AS (
Select 
	NULL as orderlpr_id,
	(ID_przypisanie_statusu_produktu_do_zamowienia * 100 )
		+ case Status_produktu_w_zamowieniu 
			when 'odebrane' 	then 1 
			when 'wstrzymane'	then 2
			when 'wysłane'		then 3
			when 'odrzucone'	then 8 
			when 'zrealizowane' then 9 else 0
		end as orderlpr_bk ,
	'Farmaprom'	as orderlpr_source
	,NULL	AS orderlpr_valid_from 
	,NULL	AS orderlpr_valid_to
	,NULL AS orderlpr_is_valid
	,NULL 	AS orderlpr_change_type
	,NULL AS orderlpr_change_timestamp
	,'N'	as orderlpr_lad 
	,1		as orderlpr_batch
	,ID_przypisanie_statusu_produktu_do_zamowienia
	,ID_przypisanie_produktu_do_zamowienia
	,ID_zamowienia,Data_zamowienia
	,z.ID_produktu
	,P.BLOZ AS BLOZ7
	,ID_apteki
	,NULL AS id_kamsoft
    ,Liczba
	,Nazwa_hurtowni
	,Numer_zamowienia
	,Pakiet,Pakiet_do
	,Pakiet_od
	,Data_wysylki_do_hurtowni
	,ID_zamowienia_sieciowego
	,Siec_firmowa_nazwa
	,Rabat
	,Status_produktu_w_zamowieniu
	,UwagiOdPrzedstawicielaHurtowni
	,UwagiOdHurtowni
	,UwagiWewnetrzne
	,Uwaga_do_produktu
	,Dodatkowa_informacja
	,lastModifiedDate
  ,z.ETLLastModifiedDate
from (
	select 
		ID_przypisanie_statusu_produktu_do_zamowienia,
		max(ID_przypisanie_produktu_do_zamowienia)	as ID_przypisanie_produktu_do_zamowienia,
		max(ID_zamowienia)							as ID_zamowienia,
		max(Data_zamowienia)							as Data_zamowienia,
		max(ID_produktu)								as ID_produktu,
		max(ID_apteki)								as ID_apteki,
		sum(Liczba)									as Liczba,
		max(Nazwa_hurtowni)							as Nazwa_hurtowni,
		max(Numer_zamowienia)							as Numer_zamowienia,
		max(Pakiet)									as Pakiet,
		max(Pakiet_do)								as Pakiet_do,
		max(Pakiet_od)								as Pakiet_od,
		max(Data_wysylki_do_hurtowni)					as Data_wysylki_do_hurtowni,
		max(ID_zamowienia_sieciowego)					as ID_zamowienia_sieciowego,
		max(Siec_firmowa_nazwa)						as Siec_firmowa_nazwa,
		max(Rabat)									as Rabat,
		Status_produktu_w_zamowieniu,
		max(UwagiOdPrzedstawicielaHurtowni)			as UwagiOdPrzedstawicielaHurtowni,
		max(UwagiOdHurtowni)							as UwagiOdHurtowni,
		max(UwagiWewnetrzne)							as UwagiWewnetrzne,
		max(Uwaga_do_produktu)						as Uwaga_do_produktu,
   
   --- sorted the column to avoid track history on Dodatkowa_informacja - value order change
		max(array_join(sort_array(split(Dodatkowa_informacja,','),true),','))						as Dodatkowa_informacja,
		max(Data_zamowienia)						as lastModifiedDate,
    max(ETLLastModifiedDate) as ETLLastModifiedDate
	from emea_quality_corr_ceec.farmaprom_sales_current
	group by ID_przypisanie_statusu_produktu_do_zamowienia, Status_produktu_w_zamowieniu
) z
left join emea_quality_corr_ceec.farmaprom_product_brand_current p on p.ID_produktu = z.ID_produktu

)