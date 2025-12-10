CREATE VIEW emea_consume_ceec.fact_marketing_gen_view_all_countries (
  MARKETING_ID,
  MARKETING_SOURCE,
  MARKETING_TIME_TIME_ID,
  MARKETING_PRODUCT_PRODUCT_ID,
  MARKETING_PRODUCT_BK,
  MARKETING_BATCH_BATCH_ID,
  DATA_DELIVERY_DATE,
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
  Strength,
  Reimbursment,
  Registration,
  Launch_Date,
  COUNTRY,
  AREA,
  REGION,
  Channel,
  General_Segment,
  Detailed_Segment,
  Sales_Value,
  Sales_Volume,
  Sales_Units,
  ND_Stock,
  WD_Stock,
  ND_Selling,
  Rotation,
  Avg_Monthly_Sales_Units_per_handler,
  Stock_units,
  Unit,
  Counting_Unit,
  Value_List_Price_PLN,
  Value_List_Price_EURO,
  Value_Transaction_Price_PLN,
  Value_Transaction_Price_EURO,
  Purchase_Units,
  Purchase_Value,
  ND_Purchase,
  WD_Selling,
  WD_Purchase,
  Numeric_OOS,
  Margin_PLN,
  Margin_PRCNT,
  Stock_Turn_PRCNT,
  Stock_yield_PLN,
  Cash_Rate_of_Sale_PLN,
  Avg_Monthly_Stock_Units_per_handler,
  Avg_Monthly_Purchase_Units_per_handler,
  Weighted_Out_of_Stock_PRCNT,
  Sales_Units_Share_in_Handlers_PRCNT,
  Sales_Value_Share_in_Handlers_PRCNT,
  Avg_Price_per_Units_Eq,
  Avg_Price_per_Item,
  Unweighted_Rate_of_Sales_Unit_Eq,
  Unweighted_Rate_of_Sales_Item,
  Value_Transaction_Price,
  Counting_Unit_Rx,
  Unit_Rx,
  Market_Brand,
  Market_Category,
  Sales_Value_Share,
  Sales_Units_Share,
  Purchase_Value_Share,
  Stock_Units_Share,
  Purchase_Units_Share,
  Retail_Price_PLN,
  Purchase_Price_PLN,
  PRODUCT_ID,
  PRODUCT_BK,
  PRODUCT_SOURCE,
  PRODUCT_VALID_FROM,
  PRODUCT_VALID_TO,
  PRODUCT_IS_VALID,
  PRODUCT_CHANGE_TYPE,
  PRODUCT_CHANGE_TIMESTAMP,
  PRODUCT_LAD,
  BLOZ7,
  EAN,
  SAP_ID,
  SKU_Name,
  SKU_Short_Name,
  BAZYL,
  Nr_pozwolenia,
  PKWiU,
  SAP_Name,
  Status,
  Brand_group,
  Brand,
  Is_Commercial,
  Is_MassMarket,
  Is_MSL_List,
  Is_Contracted,
  Category,
  FCT_Tool_name,
  Product_type,
  Attribute,
  Active_substance_dosage,
  Key_words,
  Form,
  Units_volume,
  Unit_of_measurement,
  VAT,
  ExFactory_price,
  time_id,
  year,
  quarter,
  month,
  week_of_year,
  day_of_year,
  day_of_month,
  day_of_week,
  year_quarter,
  year_month,
  load_id,
  file_name,
  ETLLastModifiedDate)
WITH SCHEMA BINDING
AS (
  
with vw_ceec_pl_sales_all_countries as 
(
--Get the data from pl(IQVia_Ex_Retail_Customizowane,IQVia_Ex_Retail_PH_Ecomm,Nielsen_Market)
SELECT MARKETING_ID , MARKETING_SOURCE , marketing_time_time_id AS MARKETING_TIME_TIME_ID 
, MARKETING_PRODUCT_PRODUCT_ID AS MARKETING_PRODUCT_PRODUCT_ID , -2 AS MARKETING_PRODUCT_BK 
, -2 AS MARKETING_BATCH_BATCH_ID , 
DATA_DELIVERY_DATE , Product , Pack , Corporation , Pack_Size 
, Form_1 AS Form_1 , OTC4_ID , OTC4_description 
, OTC3_ID , OTC3_description , OTC2_ID , OTC2_description 
, replace(trim(otc1_id),'""""""""""""""""','') OTC1_ID 
,replace(trim(OTC1_description),'""""""""""""""""','') OTC1_description 
, NFC123_ID , NFC123_description , NFC12_ID , NFC12_description 
, NFC1_ID , NFC1_description , Manufacturer 
, Strength, Reimbursment , Registration 
, cast(Launch_Date as VARCHAR(20)) Launch_Date , COUNTRY 
, AREA , REGION , Channel , General_Segment , Detailed_Segment
 , Sales_Value , Sales_Volume , Sales_Units , ND_Stock , WD_Stock , ND_Selling 
 , Rotation , Avg_Monthly_Sales_Units_per_handler ,  Stock_units ,  Unit , Counting_Unit ,  Value_List_Price_PLN ,  Value_List_Price_EURO ,  Value_Transaction_Price_PLN ,  Value_Transaction_Price_EURO ,  Purchase_Units , Purchase_Value , ND_Purchase , WD_Selling , WD_Purchase , Numeric_OOS , Margin_PLN , Margin_PRCNT , Stock_Turn_PRCNT , Stock_yield_PLN , Cash_Rate_of_Sale_PLN , Avg_Monthly_Stock_Units_per_handler , Avg_Monthly_Purchase_Units_per_handler , Weighted_Out_of_Stock_PRCNT , Sales_Units_Share_in_Handlers_PRCNT , Sales_Value_Share_in_Handlers_PRCNT , Avg_Price_per_Units_Eq , Avg_Price_per_Item , Unweighted_Rate_of_Sales_Unit_Eq , Unweighted_Rate_of_Sales_Item , Value_Transaction_Price ,  Counting_Unit_Rx ,  Unit_Rx 
 , Market_Brand AS Market_Brand , Market_Category AS Market_Category 
 , Sales_Value_Share , Sales_Units_Share , Purchase_Value_Share , Stock_Units_Share , Purchase_Units_Share , Retail_Price_PLN , Purchase_Price_PLN ,current_timestamp() AS latest_update_timestamp,transaction_id,  load_id, file_name
,current_timestamp() ETLLastModifiedDate
 FROM emea_curated_disc_ceec.ceec_pl_sales
 where country IN ('Poland','Polska')

UNION
--Get the data from ceec('Bulgaria_PH','Romania_PH','Romania_PH_RX','Czech_MM_1','Czech_MM_2','Slovakia_MM','Czech_PH','Slovakia_PH','Hungary_PH')
Select transaction_id AS MARKETING_ID, marketing_source,time_id AS MARKETING_TIME_TIME_ID,'-2' AS MARKETING_PRODUCT_PRODUCT_ID ,-2 AS MARKETING_PRODUCT_BK, 0 AS MARKETING_BATCH_BATCH_ID,
to_date(current_date, 'dd MMM yyyy' ) AS DATA_DELIVERY_DATE,Product , Pack , Corporation , Pack_Size , Form_1 , OTC4_ID , OTC4_description , OTC3_ID , OTC3_description , OTC2_ID , OTC2_description , replace(trim(otc1_id),'""""""""""""""""','') OTC1_ID ,replace(trim(OTC1_description),'""""""""""""""""','') OTC1_description , NFC123_ID , NFC123_description , NFC12_ID , NFC12_description , NFC1_ID , NFC1_description , Manufacturer ,  Strength , Reimbursment , Registration , case when len(Launch_Date) < 8 then replace(Launch_Date,'/','-') || '-01' else Launch_Date end Launch_Date , COUNTRY , AREA , REGION , Channel , General_Segment , Detailed_Segment,
Sales_Value , Sales_Volume ,  Sales_Units , ND_Stock , WD_Stock , ND_Selling , Rotation , Avg_Monthly_Sales_Units_per_handler , Stock_units , Unit ,  Counting_Unit ,  Value_List_Price_PLN ,  Value_List_Price_EURO ,  Value_Transaction_Price_PLN , Value_Transaction_Price_EURO , Purchase_Units ,Purchase_Value , ND_Purchase , WD_Selling , WD_Purchase , Numeric_OOS , Margin_PLN , Margin_PRCNT , Stock_Turn_PRCNT , Stock_yield_PLN , Cash_Rate_of_Sale_PLN , Avg_Monthly_Stock_Units_per_handler , Avg_Monthly_Purchase_Units_per_handler , Weighted_Out_of_Stock_PRCNT , Sales_Units_Share_in_Handlers_PRCNT , Sales_Value_Share_in_Handlers_PRCNT , Avg_Price_per_Units_Eq , Avg_Price_per_Item , Unweighted_Rate_of_Sales_Unit_Eq , Unweighted_Rate_of_Sales_Item , Value_Transaction_Price , Counting_Unit_Rx , Unit_Rx , Market_Brand , Market_Category , Sales_Value_Share , Sales_Units_Share , Purchase_Value_Share , Stock_Units_Share , Purchase_Units_Share , Retail_Price_PLN , Purchase_Price_PLN,latest_update_timestamp,transaction_id,  load_id, file_name
,current_timestamp() ETLLastModifiedDate 
from 
emea_curated_disc_ceec.ceec_sales 
--where MARKETING_SOURCE in ('Bulgaria_PH','Romania_PH','Romania_PH_RX','Czech_MM_1','Czech_MM_2','Slovakia_MM','Czech_PH','Slovakia_PH','Hungary_PH')
 )


Select mkt.MARKETING_ID , mkt.MARKETING_SOURCE , mkt.MARKETING_TIME_TIME_ID ,mkt.MARKETING_PRODUCT_PRODUCT_ID , mkt.MARKETING_PRODUCT_BK , mkt.MARKETING_BATCH_BATCH_ID , 
mkt.DATA_DELIVERY_DATE , mkt.Product , mkt.Pack , mkt.Corporation , mkt.Pack_Size , mkt.Form_1 , mkt.OTC4_ID , mkt.OTC4_description , mkt.OTC3_ID , mkt.OTC3_description , mkt.OTC2_ID , mkt.OTC2_description , 
mkt.OTC1_ID , mkt.OTC1_description , mkt.NFC123_ID , mkt.NFC123_description ,mkt.NFC12_ID , mkt.NFC12_description , mkt.NFC1_ID , mkt.NFC1_description , mkt.Manufacturer , mkt.Strength , mkt.Reimbursment , 
mkt.Registration , mkt.Launch_Date , mkt.COUNTRY , mkt.AREA , mkt.REGION , mkt.Channel , mkt.General_Segment , mkt.Detailed_Segment , mkt.Sales_Value , mkt.Sales_Volume , mkt.Sales_Units , mkt.ND_Stock , 
mkt.WD_Stock , mkt.ND_Selling , mkt.Rotation , mkt.Avg_Monthly_Sales_Units_per_handler , mkt.Stock_units , mkt.Unit , mkt.Counting_Unit , mkt.Value_List_Price_PLN , mkt.Value_List_Price_EURO , 
mkt.Value_Transaction_Price_PLN , mkt.Value_Transaction_Price_EURO , mkt.Purchase_Units , mkt.Purchase_Value , mkt.ND_Purchase , mkt.WD_Selling , mkt.WD_Purchase , mkt.Numeric_OOS , mkt.Margin_PLN , 
mkt.Margin_PRCNT , mkt.Stock_Turn_PRCNT , mkt.Stock_yield_PLN , mkt.Cash_Rate_of_Sale_PLN , mkt.Avg_Monthly_Stock_Units_per_handler , mkt.Avg_Monthly_Purchase_Units_per_handler , 
mkt.Weighted_Out_of_Stock_PRCNT , mkt.Sales_Units_Share_in_Handlers_PRCNT , mkt.Sales_Value_Share_in_Handlers_PRCNT , mkt.Avg_Price_per_Units_Eq , mkt.Avg_Price_per_Item , 
mkt.Unweighted_Rate_of_Sales_Unit_Eq , mkt.Unweighted_Rate_of_Sales_Item , mkt.Value_Transaction_Price , mkt.Counting_Unit_Rx , mkt.Unit_Rx , mkt.Market_Brand , mkt.Market_Category , mkt.Sales_Value_Share , 
mkt.Sales_Units_Share ,mkt.Purchase_Value_Share , mkt.Stock_Units_Share , mkt.Purchase_Units_Share , mkt.Retail_Price_PLN , mkt.Purchase_Price_PLN ,
'-2' AS PRODUCT_ID, '-2'	AS	PRODUCT_BK,'SYSTEM' AS PRODUCT_SOURCE, to_date('01 01 0001', 'dd MM yyyy' ) AS 	PRODUCT_VALID_FROM, to_date('31 12 9999', 'dd MM yyyy' ) AS PRODUCT_VALID_TO,
'Y' AS PRODUCT_IS_VALID,	'I' AS PRODUCT_CHANGE_TYPE,to_date('01 01 0001', 'dd MM yyyy' ) AS PRODUCT_CHANGE_TIMESTAMP,'N' AS PRODUCT_LAD,Null AS BLOZ7,Null AS EAN,null AS SAP_ID,'error' AS SKU_Name,
'error' AS SKU_Short_Name,null AS BAZYL,'error' AS Nr_pozwolenia,'error' AS PKWiU,'error' AS SAP_Name,'error' AS Status,'error' AS Brand_group,'error' AS Brand,'E' AS Is_Commercial,'E' AS Is_MassMarket,
'E' AS Is_MSL_List,'E' AS Is_Contracted,'error' AS Category,'error' AS FCT_Tool_name,'error' AS Product_type,'error' AS Attribute,'error' AS Active_substance_dosage,'error' AS Key_words,
'error' AS Form,'error' AS Units_volume,'error' AS Unit_of_measurement, NULL AS VAT, NULL AS ExFactory_price,
Tim.time_id,Tim.year,Tim.quarter,Tim.month,Tim.week_of_year,Tim.day_of_year,Tim.day_of_month,Tim.day_of_week,Tim.year_quarter,Tim.year_month, mkt.load_id,
mkt.file_name, current_timestamp() ETLLastModifiedDate
FROM

(
SELECT MARKETING_ID , MARKETING_SOURCE , MARKETING_TIME_TIME_ID , MARKETING_PRODUCT_PRODUCT_ID , MARKETING_PRODUCT_BK , MARKETING_BATCH_BATCH_ID , 
DATA_DELIVERY_DATE , Product , Pack , Corporation , Pack_Size , Form_1 , OTC4_ID , OTC4_description , OTC3_ID , OTC3_description , OTC2_ID , OTC2_description , OTC1_ID , OTC1_description , NFC123_ID , NFC123_description , NFC12_ID , NFC12_description , NFC1_ID , NFC1_description , Manufacturer , Strength , Reimbursment , Registration 

,case when to_date(launch_date,'yyyy-MM-dd') is null and launch_date is not null then to_date('0000-01-01','yyyy-MM-dd') else 
to_date(launch_date,'yyyy-MM-dd') end  launch_date
, COUNTRY , AREA , REGION , Channel , General_Segment , Detailed_Segment , SUM(Sales_Value) AS Sales_Value , SUM(Sales_Volume) AS Sales_Volume , SUM(Sales_Units) AS Sales_Units , ND_Stock , WD_Stock , ND_Selling , Rotation , Avg_Monthly_Sales_Units_per_handler , SUM(Stock_units) AS Stock_units , SUM(Unit) AS Unit , SUM(Counting_Unit) AS Counting_Unit , SUM(Value_List_Price_PLN) AS Value_List_Price_PLN , SUM(Value_List_Price_EURO) AS Value_List_Price_EURO , 
SUM(Value_Transaction_Price_PLN) AS Value_Transaction_Price_PLN , SUM(Value_Transaction_Price_EURO) AS Value_Transaction_Price_EURO , SUM(Purchase_Units) AS Purchase_Units , SUM(Purchase_Value) AS Purchase_Value , ND_Purchase , WD_Selling , WD_Purchase , Numeric_OOS , Margin_PLN , Margin_PRCNT , Stock_Turn_PRCNT , Stock_yield_PLN , Cash_Rate_of_Sale_PLN , Avg_Monthly_Stock_Units_per_handler , Avg_Monthly_Purchase_Units_per_handler , Weighted_Out_of_Stock_PRCNT , Sales_Units_Share_in_Handlers_PRCNT , Sales_Value_Share_in_Handlers_PRCNT , Avg_Price_per_Units_Eq , Avg_Price_per_Item , Unweighted_Rate_of_Sales_Unit_Eq , Unweighted_Rate_of_Sales_Item , Value_Transaction_Price , SUM(Counting_Unit_Rx) AS Counting_Unit_Rx , SUM(Unit_Rx) AS Unit_Rx , Market_Brand , Market_Category , Sales_Value_Share , Sales_Units_Share , Purchase_Value_Share , Stock_Units_Share , Purchase_Units_Share , Retail_Price_PLN , Purchase_Price_PLN, load_id,file_name
FROM  vw_ceec_pl_sales_all_countries
GROUP BY MARKETING_ID , MARKETING_SOURCE , MARKETING_TIME_TIME_ID , MARKETING_PRODUCT_PRODUCT_ID , MARKETING_PRODUCT_BK , MARKETING_BATCH_BATCH_ID , DATA_DELIVERY_DATE , Product , Pack , Corporation , Pack_Size , Form_1 , OTC4_ID , OTC4_description , OTC3_ID , OTC3_description , OTC2_ID , OTC2_description , OTC1_ID , OTC1_description , NFC123_ID , NFC123_description , NFC12_ID , NFC12_description , NFC1_ID , NFC1_description , Manufacturer , Strength , Reimbursment , Registration , Launch_Date , COUNTRY , AREA , REGION , Channel , General_Segment , Detailed_Segment , ND_Stock , WD_Stock , ND_Selling , Rotation , Avg_Monthly_Sales_Units_per_handler , ND_Purchase , WD_Selling , WD_Purchase , Numeric_OOS , Margin_PLN , Margin_PRCNT , Stock_Turn_PRCNT , Stock_yield_PLN , Cash_Rate_of_Sale_PLN , Avg_Monthly_Stock_Units_per_handler , Avg_Monthly_Purchase_Units_per_handler , Weighted_Out_of_Stock_PRCNT , Sales_Units_Share_in_Handlers_PRCNT , Sales_Value_Share_in_Handlers_PRCNT , Avg_Price_per_Units_Eq , Avg_Price_per_Item , Unweighted_Rate_of_Sales_Unit_Eq , Unweighted_Rate_of_Sales_Item , Value_Transaction_Price , Market_Brand , Market_Category , Sales_Value_Share , Sales_Units_Share , Purchase_Value_Share , Stock_Units_Share , Purchase_Units_Share , Retail_Price_PLN , Purchase_Price_PLN , load_id,file_name

) MKT
INNER JOIN emea_quality_enr_ceec.dim_date Tim on MKT.MARKETING_TIME_TIME_ID=Tim.time_id


)