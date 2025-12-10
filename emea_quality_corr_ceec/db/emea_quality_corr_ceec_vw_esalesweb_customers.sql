CREATE VIEW emea_quality_corr_ceec.vw_esalesweb_customers (
  CUSTOMER_ID,
  CUSTOMER_BK,
  CUSTOMER_SOURCE,
  CUSTOMER_VALID_FROM,
  CUSTOMER_VALID_TO,
  CUSTOMER_IS_VALID,
  CUSTOMER_CHANGE_TYPE,
  CUSTOMER_CHANGE_TIMESTAMP,
  CUSTOMER_LAD,
  ID_Acres,
  ID_External_reporting,
  ID_Farmaprom,
  ID_eSalesWeb,
  Area_Commercial,
  Rep_Name_Commercial,
  Rep_ID_Commercial,
  Rep_email_Commercial,
  Rep_email_Commercial_2,
  Rep_Name_Education,
  Rep_ID_Education,
  Area_Education,
  Pharmacy_name,
  City,
  Adress,
  ZIP_Code,
  NIP,
  IQVIA_brick,
  Commercial_Segment,
  Education_Segment,
  DNV_Commercial,
  DNV_Education,
  Phone_number,
  Position,
  Attributes,
  ID_Chain_Customer,
  Name_Chain_Customer,
  Last_visit_Commercial,
  Last_visit_Education,
  Chain_Customer_Account,
  email,
  Customer_Group,
  Group_Owner,
  Group_Type,
  IS_Ordering,
  IS_Self_Service,
  Behind_counter_exposition,
  Behind_glass_exposition,
  Store_window,
  Is_dermatological,
  Chain_type,
  Contract,
  Importance,
  Is_Kamsoft,
  Kamsoft_agreement,
  Pharmacy_status,
  ID_Customer,
  Pharmacy_type,
  External_source,
  ETLLastModifiedDate,
  LastModifiedDate)
WITH SCHEMA BINDING
AS (

with organization_latest_change as

(

select organization_id,max(changed) changed_date
from 
(

select o.organization_id,changed from emea_raw_lnd_ceec.esalesweb_organization o where o.client_variant_id='1365795415'
UNION
select o.organization_id,changed from emea_raw_lnd_ceec.esalesweb_organization_external_system o where o.client_variant_id='1365795415'  
UNION
select o.organization_id,changed from emea_raw_lnd_ceec.esalesweb_organization_contract o where client_variant_id='1365795415'  
UNION
select o.organization_id,changed from emea_raw_lnd_ceec.esalesweb_organization_owner o where client_variant_id='1365795415'
UNION
select o.organization_id,changed from emea_raw_lnd_ceec.esalesweb_organization_rating o where client_variant_id='1365795415'
UNION
select o.organization_id,changed from emea_raw_lnd_ceec.esalesweb_account_organization o where client_variant_id='1365795415'
UNION
select o.organization_id,changed from emea_raw_lnd_ceec.esalesweb_organization_attribute o where client_variant_id='1365795415'
) group by organization_id
),
esales_customer as 
(
select

	trim(oes2.external_system_no) as id_kamsoft,
	oes1.external_system_no as id_farmaprom,
	oat3.selection_description as area,
	Organization_Owner_Commercial ph_si,
	ocd.cwid kod_si,
	ocd.email kod_si_email,
	ocd.email_2 kod_si_email_2,
	omc.Organization_Owner_medical_Care ph_so,
	omc.cwid kod_so,
	
	o.company_name nazwa_pd,
	o.b_city miejscowosc,
	o.b_street_address1 adres,
	o.b_zip kod,
	o.vat_number nip,
	b.brick cegielka,
	orr1.rating_value as segment_si,
	o.phone telefon,
	replace(ao1.account_no,'S','') as id_sieci,
	ao1.account_name as siec,
	
	ao1.user_id as wlasciciel,
	o.email,
	
	
	--'' typ_sieci,
	--'' ostatnia_wiz_com,
	--'' area_so,
	
	----  above 3 feilds will be replaced with below 
	
	act.chain_type  typ_sieci,
	date_started ostatnia_wiz_com,
	team.team area_so,
	
	
	kv1.contract kontrakt,
    case when o.status=9 then 'usunięta' -- Deleted
         when o.status=0 then 'nieaktywna' -- Inactive
         when o.status=1  then 'aktywna' -- Active
         when o.status=8 then 'nowy' --New
         else null end status,
	 o.organization_no id_apteki_sieci,
	ao1.account_no id_apteki_sieci_acc,
	kv.keyword_value as typ_apteki,
	oat1.selection_description as zrodlo,
    o.organization_id id_esalesweb,
	id_apteki_sieci as id_pd,

-- Added dummy columns to sync with HANA feilds
null as segment_so,
null as dnv_si,
null as dnv_so,
null as usytuowanie,
null as atrybuty,
null as ostatnia_wiz_edu,
null as grupa,
null as wlasciciel_grupy,
null as typ_grupy,
null as apteka_zamawiajaca,
null as samoobsluga_otc,
null as ekspozycja_za_farmaceuta,
null as ekspozycja_za_szyba,
null as witryna_okienna,
null as apteka_dermatologiczna,
null as wazne,
null as ma_kamsoft,
null as zgoda_na_kamsoft


from (SELECT 
		*
	   FROM emea_raw_lnd_ceec.esalesweb_organization o 
	   WHERE  o.client_variant_id='1365795415'
		  ) o  --31559

left join 
		(
			select 
				oe.organization_id
				,oe.client_variant_id,trim(external_system_no) external_system_no
        
				,row_number() over( partition by trim(external_system_no) order by cast(oe.changed as date) desc, case when o.status=9 then 'usunięta' -- Deleted
         when o.status=0 then 'nieaktywna' -- Inactive
         when o.status=1  then 'aktywna' -- Active
         when o.status=8 then 'nowy' --New
         else null end ,o.organization_no ) rw_num
			from emea_raw_lnd_ceec.esalesweb_organization_external_system oe
      left join  emea_raw_lnd_ceec.esalesweb_organization o
      on  o.organization_id=oe.organization_id
	    and cast(o.client_variant_id as bigint)=cast(oe.client_variant_id as bigint)
			where trim(external_system_id) = 'SGEBK_K9LAGYUU'
			and coalesce(oe.SORT_INDEX,0)=0 
      and oe.deleted=0
		)
		oes1
	on o.organization_id=oes1.organization_id
	and o.client_variant_id=oes1.client_variant_id
	and oes1.rw_num=1
left join 
		(
		select 
				oe.organization_id
				,oe.client_variant_id,trim(external_system_no) external_system_no
        
				,row_number() over( partition by trim(external_system_no) order by cast(oe.changed as date) desc, case when o.status=9 then 'usunięta' -- Deleted
         when o.status=0 then 'nieaktywna' -- Inactive
         when o.status=1  then 'aktywna' -- Active
         when o.status=8 then 'nowy' --New
         else null end ,o.organization_no ) rw_num
			from emea_raw_lnd_ceec.esalesweb_organization_external_system oe
      left join  emea_raw_lnd_ceec.esalesweb_organization o
      on  o.organization_id=oe.organization_id
	    and cast(o.client_variant_id as bigint)=cast(oe.client_variant_id as bigint)
			where trim(external_system_id) = 'SGEBK_K9LABZ0G'
			and coalesce(oe.SORT_INDEX,0)=0 
      and oe.deleted=0
		) oes2
	on o.organization_id=oes2.organization_id
	and o.client_variant_id=oes2.client_variant_id
	and oes2.rw_num=1

left join emea_raw_lnd_ceec.esalesweb_brick b
	on b.brick_id=o.brick_id
	and o.client_variant_id=b.client_variant_id
	and b.deleted=0

--- removed in accelerator ,since the lgic is not used

/*left join emea_raw_lnd_ceec.esalesweb_organization_contract oc
	on o.organization_id=oc.organization_id
	and oc.is_active=1
	and o.client_variant_id=oc.client_variant_id
	and oc.deleted=0
*/


left join emea_raw_lnd_ceec.esalesweb_keyword_value kv
	on o.sub_type=kv.keyword_value_id
	and kv.keyword_id='OrganizationSubTypes'
	and locale_code='pl'
	and o.client_variant_id=kv.client_variant_id
	and kv.deleted=0
	and kv.active=1

left join (select 
				orr.organization_id
				,r.rating_value
				,r.rating_id
				,orr.client_variant_id
			from emea_raw_lnd_ceec.esalesweb_organization_rating orr
			inner join emea_raw_lnd_ceec.esalesweb_rating r
				on orr.rating_id=r.rating_id
				and orr.client_variant_id=r.client_variant_id
				and orr.deleted=0
				and orr.product_line_id='OTC'
				and orr.rating_year=left((date_part('year', CURRENT_DATE))::string,4)
			) orr1
	on o.organization_id=orr1.organization_id
	and o.client_variant_id=orr1.client_variant_id
	
left join (select 
				ao.account_id
				,ao.organization_id
				,ao.client_variant_id
				,a.account_no
				,a.account_name
				,a.user_id
				,a.type,row_number() over( partition by ao.organization_id order by ao.USERCHANGED desc) rw_num
			from emea_raw_lnd_ceec.esalesweb_account_organization ao
			inner join emea_raw_lnd_ceec.esalesweb_account a
				on a.account_id=ao.account_id 
				and a.client_variant_id=ao.client_variant_id 
				and ao.deleted=0 
				and ao.status<>'9'
			) ao1
	on o.organization_id=ao1.organization_id
    and o.client_variant_id=ao1.client_variant_id
	
	-- added in accelerator , since one org has multiple account, picking the latest one
  and ao1.rw_num=1

left join (select 
				oat.organization_id
				,oat.client_variant_id
				,ats.selection_description
        ,row_number() over( partition by oat.organization_id order by oat.changed desc) rw_num
			from emea_raw_lnd_ceec.esalesweb_organization_attribute oat
			inner join emea_raw_lnd_ceec.esalesweb_attribute_selection ats
				on oat.attribute_id=ats.attribute_id
				and oat.value_selection_id=ats.attribute_selection_id
				and oat.client_variant_id=ats.client_variant_id
				and oat.deleted=0
				and oat.attribute_id='TARGET_DATA_SOURCE'
			) oat1
	on o.organization_id=oat1.organization_id
	and o.client_variant_id=oat1.client_variant_id
  and oat1.rw_num=1
left join (select 
				oat2.organization_id
				,oat2.client_variant_id
				,ats2.selection_description
        ,row_number() over( partition by oat2.organization_id order by oat2.changed desc) rw_num
			from emea_raw_lnd_ceec.esalesweb_organization_attribute oat2
			inner join emea_raw_lnd_ceec.esalesweb_attribute_selection ats2
				on oat2.attribute_id=ats2.attribute_id
				and oat2.value_selection_id=ats2.attribute_selection_id
				and oat2.client_variant_id=ats2.client_variant_id
				and oat2.deleted=0
				and oat2.attribute_id='SEGMENT_KAM_RAS'
			)oat3
	on o.organization_id=oat3.organization_id
	and o.client_variant_id=oat3.client_variant_id
  and  oat3.rw_num=1


left join (select 
				account_type_id
				,client_variant_id
				,account_type_name as chain_type 
		   from emea_raw_lnd_ceec.esalesweb_account_type   
		  ) act 
	on act.client_variant_id=ao1.client_variant_id 
	and act.account_type_id=ao1.type



left join (select  
				keyword_value as contract,keyword_value_id ,client_variant_id
		   from emea_raw_lnd_ceec.esalesweb_keyword_value  
		   where keyword_id='OrganizationSectors'  and locale_code='pl' 
		  ) kv1
on kv1.keyword_value_id=o.sector
and kv1.client_variant_id=o.client_variant_id

left join (
          SELECT 
            MAX(CASE WHEN RN = 1 THEN organization_id END) AS organization_id,
            MAX(CASE WHEN RN = 1 THEN cwid END) AS cwid,
            MAX(CASE WHEN RN = 1 THEN Organization_Owner_Commercial END) AS Organization_Owner_Commercial,
            MAX(CASE WHEN RN = 1 THEN email END) AS email,
            MAX(CASE WHEN RN = 2 THEN email END) AS email_2
        FROM (
              SELECT DISTINCT
                  organization_id,
                  uu.cwid,
                  (uu.lastname || ' ' || uu.firstname) AS Organization_Owner_Commercial,
                  uu.email,
                  ROW_NUMBER() OVER (PARTITION BY organization_id ORDER BY oo.changed desc, COALESCE(is_contractor_cwid, 1)) AS RN
              FROM emea_raw_lnd_ceec.esalesweb_organization_owner oo
              INNER JOIN emea_raw_lnd_ceec.esalesweb_um_users uu  ON uu.cwid = oo.user_id
              WHERE oo.deleted = 0 AND oo.client_variant_id = '1365795415' AND oo.product_line_id = 'OTC' 
              --AND uu.email LIKE 'aneta.stuleblat%' --AND organization_id = 'EPAJL_K4WQ9H57'
            ) A where RN=1 --- need to pick only latest , even if two email is mapped
              GROUP BY organization_id
		) ocd 
	on ocd.organization_id=o.organization_id


left join (select distinct
			oo.organization_id
			,uu.cwid,(uu.lastname||' '||uu.firstname) Organization_Owner_medical_Care,
      ROW_NUMBER() OVER (PARTITION BY oo.organization_id ORDER BY oo.changed desc,COALESCE(is_contractor_cwid, 1)) AS RN
			from emea_raw_lnd_ceec.esalesweb_organization_owner oo
			inner join emea_raw_lnd_ceec.esalesweb_um_users uu
			on uu.cwid=oo.user_id
			where oo.deleted=0 
			and oo.client_variant_id='1365795415'  
			--and oo.organization_id='SGPGI_O_FD1A12A3C1B213' 
			and oo.product_line_id='MED_CARE'
			) omc
on omc.organization_id=o.organization_id
and omc.RN=1 --- need to pick only latest , even if two email is mapped




left join 
(select USER_ID,team from emea_raw_lnd_ceec.esalesweb_user_profile where 
deleted=0 and client_variant_id='1365795415'

) team
on team.user_id=omc.cwid

left join 
(
select user_id,MAX(date_started) date_started from emea_raw_lnd_ceec.esalesweb_activity 
where client_variant_id='1365795415'
GROUP BY user_id

) act_detail
on act_detail.user_id=ocd.cwid


)

SELECT distinct 
	sha2(id_kamsoft,256)		as CUSTOMER_ID,
	id_kamsoft					as CUSTOMER_BK,
	'eSalesWeb'						as CUSTOMER_SOURCE,
	cast(null as date)			as CUSTOMER_VALID_FROM,
	cast(null as date)			as CUSTOMER_VALID_TO,
	cast(null as string)	as CUSTOMER_IS_VALID,
	cast(null as string)	as CUSTOMER_CHANGE_TYPE,
	cast(null as timestamp)		as CUSTOMER_CHANGE_TIMESTAMP,
	'N'							as CUSTOMER_LAD,
	id_pd						as ID_Acres,
	cast(id_kamsoft as int)					as ID_External_reporting,
	id_farmaprom				as ID_Farmaprom,
	id_esalesweb				as ID_eSalesWeb,
	area						as Area_Commercial,
	ph_si						as Rep_Name_Commercial,
	kod_si						as Rep_ID_Commercial,
	kod_si_email				as Rep_email_Commercial,
	kod_si_email_2				as Rep_email_Commercial_2,
	ph_so						as Rep_Name_Education,
	kod_so						as Rep_ID_Education,
	area_so						as Area_Education,
	nazwa_pd					as Pharmacy_name,
	miejscowosc					as City,
	adres						as Adress,
	kod							as ZIP_Code,
	nip							as NIP,
	cast(cegielka as int)		as IQVIA_brick,
	segment_si					as Commercial_Segment,
	segment_so					as Education_Segment,
	case dnv_si when 'tak' then 'Y' when 'nie' then 'N' end	as DNV_Commercial,
	case dnv_so when 'tak' then 'Y' when 'nie' then 'N' end	as DNV_Education,
	telefon						as Phone_number,
	usytuowanie					as Position,
	atrybuty					as Attributes,
	id_sieci					as ID_Chain_Customer,
	siec						as Name_Chain_Customer,
	ostatnia_wiz_com			as Last_visit_Commercial,
	ostatnia_wiz_edu			as Last_visit_Education,
	wlasciciel					as Chain_Customer_Account,
	email						as email,
	grupa						as Customer_Group,
	wlasciciel_grupy			as Group_Owner,
	typ_grupy					as Group_Type,
	case apteka_zamawiajaca when 'tak' then 'Y' when 'nie' then 'N' end		as IS_Ordering,
	case samoobsluga_otc when 'tak' then 'Y' when 'nie' then 'N' end			as IS_Self_Service,
	case ekspozycja_za_farmaceuta when 'tak' then 'Y' when 'nie' then 'N' end	as Behind_counter_exposition,
	case ekspozycja_za_szyba when 'tak' then 'Y' when 'nie' then 'N' end		as Behind_glass_exposition,
	case witryna_okienna when 'tak' then 'Y' when 'nie' then 'N' end			as Store_window,
	case apteka_dermatologiczna when 'tak' then 'Y' when 'nie' then 'N' end	as Is_dermatological,
	typ_sieci					as Chain_type,
	kontrakt					as Contract,
	case wazne when 'tak' then 'Y' when 'nie' then 'N' end						as Importance,
	case ma_kamsoft when 'tak' then 'Y' when 'nie' then 'N' end					as Is_Kamsoft,
	case zgoda_na_kamsoft when 'tak' then 'Y' when 'nie' then 'N' end			as Kamsoft_agreement,
	status						as Pharmacy_status,
	case when typ_sieci is null then id_apteki_sieci else id_apteki_sieci_acc end as ID_Customer,
	typ_apteki					as Pharmacy_type,
	zrodlo						as External_source,
  current_timestamp as ETLLastModifiedDate
  ,CAST(changed_date AS DATE) as LastModifiedDate
from (
	select ec.*,org_lc.changed_date,row_number() over (partition by id_kamsoft order by changed_date desc,status, id_pd) as rn
	from esales_customer ec
	join organization_latest_change org_lc
	on org_lc.organization_id=ec.id_esalesweb
	where id_kamsoft is not null and id_kamsoft != 0 
) t where t.RN = 1

)