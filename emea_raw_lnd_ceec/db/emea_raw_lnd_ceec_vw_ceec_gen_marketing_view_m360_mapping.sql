CREATE VIEW emea_raw_lnd_ceec.vw_ceec_gen_marketing_view_m360_mapping (
  general_segment,
  Channel,
  country,
  marketing_source,
  Product,
  Pack,
  Corporation,
  Pack_Size,
  Form_1,
  otc4_ID,
  otc4_description,
  otc3_id,
  otc3_description,
  otc2_id,
  otc2_description,
  otc1_id,
  otc1_description,
  nfc123_id,
  nfc123_description,
  nfc12_id,
  nfc12_description,
  nfc1_id,
  nfc1_description,
  Manufacturer,
  Market_Brand,
  Year,
  Week_of_Year,
  Day_of_Year,
  Year_quarter,
  Year_month,
  time_id,
  Sales_Value,
  Sales_Volume,
  Key1,
  Key2,
  Key3,
  Key4,
  cc_manuf_secondary,
  cc_manufacturer_name,
  cc_brand_name,
  cc_country,
  Manufacturer_count,
  manuf_secondary_count,
  cc_product_id,
  data_delivery_date)
WITH SCHEMA BINDING
AS (
Select 
	general_segment,
	Channel,
	country,
	marketing_source,
	Product,
	Pack,
	Corporation,
	Pack_Size,
	Form_1,
	otc4_ID,
	otc4_description,
	otc3_id,
	otc3_description,
	otc2_id,
	otc2_description,
	otc1_id,
	otc1_description,
	nfc123_id,
	nfc123_description,
	nfc12_id,
	nfc12_description,
	nfc1_id,
	nfc1_description,
	Manufacturer,
	Market_Brand,
	Year,
	Week_of_Year,
	Day_of_Year,
	Year_quarter,
	Year_month,
	time_id,
	sum(Sales_Value) AS Sales_Value,
	sum(Sales_Volume) AS Sales_Volume,
	Key1,
	Key2,
	Key3,
	Key4,
	cc_manuf_secondary,
	cc_manufacturer_name,
	cc_brand_name,
	cc_country,
	Manufacturer_count,
	manuf_secondary_count,
	cc_product_id,data_delivery_date


FROM
    (
    Select gen.general_segment,
	gen.Channel,
	gen.country,
	gen.marketing_source,
	gen.Product,
	gen.Pack,
	gen.Corporation,
	gen.Pack_Size,
	gen.Form_1,
	gen.otc4_ID,
	gen.otc4_description,
	gen.otc3_id,
	gen.otc3_description,
	gen.otc2_id,
	gen.otc2_description,
	gen.otc1_id,
	gen.otc1_description,
	gen.nfc123_id,
	gen.nfc123_description,
	gen.nfc12_id,
	gen.nfc12_description,
	gen.nfc1_id,
	gen.nfc1_description,
	gen.Manufacturer,
	gen.Market_Brand,
	gen.Year,
	gen.Week_of_Year,
	gen.Day_of_Year,
	gen.Year_quarter,
	gen.Year_month,
	gen.time_id,
	gen.Sales_Value,
	gen.Sales_Volume,
	gen.Key1,
	gen.Key2,
	gen.Key3,
	gen.Key4,
	gen.cc_manuf_secondary,
	gen.cc_manufacturer_name,
	gen.cc_brand_name,
	gen.cc_country,
	ctnr.Manufacturer_count,
	ctnr.manuf_secondary_count,
	CASE 
		WHEN ctnr.Manufacturer_count=1 and ctnr.manuf_secondary_count=1 
			THEN gen.Product || '-' || gen.Pack || '-' || COALESCE(gen.cc_brand_name,'') 
			ELSE gen.Product || '-' || gen.Pack || '-' || COALESCE(gen.cc_brand_name,'') || '/' || COALESCE(gen.cc_manufacturer_name,'')|| '/' || COALESCE(gen.cc_manuf_secondary,'')
	END AS cc_product_id,data_delivery_date

	
from 
	(
	-- Select Data from marketing_gen_view
	Select 
		general_segment,
		Channel,
		country,
		marketing_source,
		Product,
		Pack,
		Corporation,
		Pack_Size,
		Form_1,
		OTC4_ID,
		OTC4_description,
		OTC3_ID,
		OTC3_description,
		OTC2_ID,
		OTC2_description,
		OTC1_ID,
		OTC1_description,
		NFC123_ID,
		NFC123_description,
		NFC12_ID,
		NFC12_description,
		NFC1_ID,
		NFC1_description,
		Manufacturer,
		Market_Brand,
		Year,
		Week_of_Year,
		Day_of_Year,
		Year_quarter,
		Year_month,
		TIME_ID,
		Sales_Value,
		Sales_Volume,
		UPPER(country)||'-'||COALESCE(Product,'')||'-'||COALESCE(Pack,'')||'-'||COALESCE(Market_Brand,'') as Key1,
		UPPER(country)||'-'||COALESCE(Product,'')||'-'||COALESCE(Pack,'')||'-'||COALESCE(Market_Brand,'')||'/'||COALESCE(Corporation,'') AS key2,
		UPPER(country)||'-'||COALESCE(Product,'')||'-'||COALESCE(Pack,'')||'-'||COALESCE(Market_Brand,'')||'/'||COALESCE(Corporation,'')||'/'||COALESCE(Manufacturer,'') AS Key3,
		UPPER(country)||'-'||COALESCE(Product,'')||'-'||COALESCE(Pack,'')||'-'||COALESCE(Market_Brand,'')||'/'||COALESCE(Corporation,'')||'/'||COALESCE(Manufacturer,'')||'/'||COALESCE(Corporation,'')  AS Key4,
		CASE 
			WHEN country = 'PL' THEN COALESCE(Manufacturer,'')
			ELSE CASE  
					WHEN COALESCE(Corporation,'') = 'error' 
					THEN NULL 
					ELSE COALESCE(Corporation,'')
				END 
		END AS cc_manuf_secondary,
		CASE 
			WHEN country = 'PL' THEN  case  when COALESCE(Corporation,'') = 'error' then NULL else COALESCE(Corporation,'') end
			ELSE COALESCE(Manufacturer,'') 
			END AS cc_manufacturer_name,
	
		CASE  WHEN COALESCE(Market_Brand,'') != 'error' THEN COALESCE(Market_Brand,'')  ELSE '' END AS cc_brand_name,
	
	
		CASE 
			WHEN country='Bulgaria' THEN 'BULGARIA' 
			WHEN country='Czech' THEN 'CZECH REPUBLIC' 
			WHEN country='Hungary' THEN 'HUNGARY' 
			WHEN country='Poland' THEN 'POLAND' 
			WHEN country='Romania' THEN 'ROMANIA' 
			WHEN country='Slovakia' THEN 'SLOVAK REPUBLIC' 
		ELSE NULL 
		END AS cc_country,
		data_delivery_date

	
	FROM emea_raw_lnd_ceec.fact_marketing_gen_view
	WHERE Year >= year(add_months(current_date,-37)) 
	and  MARKETING_SOURCE in ('IQVia_Ex_Retail_PH_Ecomm','Nielsen_Market','Bulgaria_PH','Romania_PH','Czech_MM_1','Czech_PH','Hungary_PH','Slovakia_MM','Slovakia_PH')
	AND (Channel in ('Pharmacy','Other Chains','ePharmacy','National KA','TRADYCYJNY','PHARMACY','TRADITIONAL','INTERNET',
	'Drugstores','Groceries Large','Groceries Medium','Groceries Small','Hypermarkets','Kiosks','Petrol Stations','Supermarkets excl. Discounters',
	'Sweet Alcohol','Total Discounters') 
	OR  Channel in ('MASS MARKET' ) )
	AND (
	General_Segment not in ('CZ Total Czech FOOD/DRUG','SK Total Slovakia FOOD ex. Lidl','SK Total Slovakia FOOD/DRUG','SK Total Slovakia FOOD/DRUG ex. Lidl') 
	or General_Segment is null
		)
	) gen
	
LEFT JOIN 
	(
	-- Count Manufacturer and cc_manuf_secondary based on Product,Pack,cc_brand_name,country
	SELECT
		country,
		Product,
		Pack,
		count(Manufacturer) AS Manufacturer_count,
		count(cc_manuf_secondary) as manuf_secondary_count ,
		cc_brand_name
	FROM
	(
		Select DISTINCT
			country,
			Product,
			Pack,
			Manufacturer,
			CASE WHEN country = 'PL' 
			THEN COALESCE(Manufacturer,'')
			ELSE 
				CASE 
					WHEN COALESCE(Corporation,'') = 'error' 
					THEN NULL ELSE COALESCE(Corporation,'')  
				END 
			END AS cc_manuf_secondary,
	
	
			CASE  
				WHEN COALESCE(Market_Brand,'') != 'error' 
				THEN COALESCE(Market_Brand,'')  ELSE '' 
			END AS cc_brand_name
	
		from emea_raw_lnd_ceec.fact_marketing_gen_view
		WHERE 
			Year >= year(add_months(current_date,-37)) 
			AND  MARKETING_SOURCE in ('IQVia_Ex_Retail_PH_Ecomm','Nielsen_Market','Bulgaria_PH','Romania_PH','Czech_MM_1','Czech_PH','Hungary_PH','Slovakia_MM','Slovakia_PH')
			AND (Channel in ('Pharmacy','Other Chains','ePharmacy','National KA','TRADYCYJNY','PHARMACY','TRADITIONAL','INTERNET','Drugstores','Groceries Large','Groceries Medium','Groceries Small',
				'Hypermarkets','Kiosks','Petrol Stations','Supermarkets excl. Discounters','Sweet Alcohol','Total Discounters') 
				OR  
				Channel in ('MASS MARKET' ) 
				)
			AND (General_Segment not in ('CZ Total Czech FOOD/DRUG','SK Total Slovakia FOOD ex. Lidl','SK Total Slovakia FOOD/DRUG','SK Total Slovakia FOOD/DRUG ex. Lidl') 
				OR General_Segment is null)
				)
			group by 
				Product,
				Pack,
				cc_brand_name,
				country
			) AS ctnr 
	ON gen.country=ctnr.country 
	AND gen.Pack=ctnr.Pack 
	AND gen.Product=ctnr.Product
	and gen.Market_Brand=ctnr.cc_brand_name
	) 
	
	GROUP BY 
		general_segment,
		Channel,
		country,
		marketing_source,
		Product,
		Pack,
		Corporation,
		Pack_Size,
		Form_1,
		otc4_ID,
		otc4_description,
		otc3_id,
		otc3_description,
		otc2_id,
		otc2_description,
		otc1_id,
		otc1_description,
		nfc123_id,
		nfc123_description,
		nfc12_id,
		nfc12_description,
		nfc1_id,
		nfc1_description,
		Manufacturer,
		Market_Brand,
		Year,
		Week_of_Year,
		Day_of_Year,
		Year_quarter,
		Year_month,
		time_id,
		Key1,
		Key2,
		Key3,
		Key4,
		cc_manuf_secondary,
		cc_manufacturer_name,
		cc_brand_name,
		cc_country,
		Manufacturer_count,
		manuf_secondary_count,
		cc_product_id,data_delivery_date

)