CREATE VIEW emea_consume_ceec_pl.f_tran_mark_user_view3 (
  BLOZ7,
  Brand,
  Brand_group,
  Category,
  Contract,
  Data_Channel,
  FCT_Tool_name,
  Is_Commercial,
  Is_Contracted,
  Is_MSL_List,
  KPI,
  Market_Brand,
  Market_Category,
  Pharmacy_type,
  Product_type,
  SKU_Name,
  SKU_Short_Name,
  Status,
  Year_month,
  Year_quarter,
  Value,
  Value_RSP,
  Volume,
  rep_email_commercial,
  rep_email_commercial_2)
WITH SCHEMA BINDING
AS select BLOZ7,Brand,Brand_group,Category,Contract,Data_Channel,FCT_Tool_name,Is_Commercial,Is_Contracted,Is_MSL_List,KPI,Market_Brand,Market_Category,Pharmacy_type,Product_type,SKU_Name,SKU_Short_Name,Status,Year_month,Year_quarter,CAST(sum(Value) AS DECIMAL(18, 2)) AS Value,CAST(Sum(Value_RSP) AS DECIMAL(18, 2)) AS Value_RSP,CAST(sum(Volume) AS DECIMAL(18, 2)) as Volume,rep_email_commercial,rep_email_commercial_2

from
(
  select BLOZ7,Brand,Brand_group,Category,Contract,Data_Channel,FCT_Tool_name,Is_Commercial,Is_Contracted,Is_MSL_List,KPI,Market_Brand,Market_Category,Pharmacy_type,Product_type,SKU_Name,SKU_Short_Name,Status,Year_month,Year_quarter,sum(Value) AS Value,Sum(Value_RSP) AS Value_RSP,sum(Volume) as Volume,rep_email_commercial,rep_email_commercial_2
  from
  (
  select BLOZ7,Brand,Brand_group,Category,null as Contract,
        case 
          when MARKETING_SOURCE = 'IQVia_Ex_Retail_Customizowane'		then 'ExRetail PH'
          when MARKETING_SOURCE = 'Nielsen_Market'		then 'ExRetail MM'
          when MARKETING_SOURCE = 'IQVia_Ex_Distributor_PH' 	then 'ExDistributor PH'
          when MARKETING_SOURCE = 'IQVia_Ex_Retail_PH_Ecomm' and Channel = 'INTERNET' 	then 'ExRetail Ecomm'
          when MARKETING_SOURCE = 'IQVia_Ex_Retail_PH_Ecomm' and Channel = 'TRADYCYJNY'	then 'ExRetail PH'
          when MARKETING_SOURCE = 'IQVia_Ex_Distributor_PH_Rx'	then 'ExDistributor PH'
        end as Data_Channel,
        FCT_Tool_name,Is_Commercial,Is_Contracted,Is_MSL_List,
        case MARKETING_SOURCE
          when 'IQVia_Ex_Retail_Customizowane'			then 'Sell-Out'
          when 'Nielsen_Market'						then 'Sell-Out'
          when 'IQVia_Ex_Distributor_PH'			then 'Sell-In'
          when 'IQVia_Ex_Retail_PH_Ecomm' 		then 'Sell-Out'
          when 'IQVia_Ex_Distributor_PH_Rx'		then 'Sell-In'
        end as KPI,
        Market_Brand,	Market_Category,
        case MARKETING_SOURCE
          when 'IQVia_Ex_Retail_Customizowane'			then 'Apteka'
          when 'Nielsen_Market'						then 'Mass market'
          when 'IQVia_Ex_Distributor_PH'			then 'Apteka'
          when 'IQVia_Ex_Retail_PH_Ecomm' 		then 'Apteka Internetowa'
          when 'IQVia_Ex_Distributor_PH_Rx'		then 'Apteka'
        end as Pharmacy_type,
        Product_type,	SKU_Name,SKU_Short_Name,Status,Year_month,Year_quarter,
        case MARKETING_SOURCE
          when 'IQVia_Ex_Retail_Customizowane'		then Sales_Volume 
          when 'Nielsen_Market'					then Sales_Volume
          when 'IQVia_Ex_Distributor_PH'		then Unit
          when 'IQVia_Ex_Retail_PH_Ecomm' 	then Sales_Volume
          when 'IQVia_Ex_Distributor_PH_Rx'	then Unit_Rx
        end * ExFactory_price as Value,
        case MARKETING_SOURCE
          when 'IQVia_Ex_Retail_Customizowane'		then Sales_Value
          when 'Nielsen_Market'					then Sales_Value
          when 'IQVia_Ex_Distributor_PH'		then Value_Transaction_Price_PLN
          when 'IQVia_Ex_Retail_PH_Ecomm' 	then Sales_Value
          when 'IQVia_Ex_Distributor_PH_Rx'	then Unit_Rx
        end as Value_RSP,
        case MARKETING_SOURCE
          when 'IQVia_Ex_Retail_Customizowane'		then Sales_Volume 
          when 'Nielsen_Market'					then Sales_Volume
          when 'IQVia_Ex_Distributor_PH'		then Unit
          when 'IQVia_Ex_Retail_PH_Ecomm' 	then Sales_Volume
          when 'IQVia_Ex_Distributor_PH_Rx'	then Unit_Rx
        end as Volume,
        null AS rep_email_commercial,
        null as rep_email_commercial_2

      from emea_curated_disc_ceec.fact_marketing_gen_view 
	  where MARKETING_SOURCE in ('IQVia_Ex_Retail_Customizowane','Nielsen_Market','IQVia_Ex_Distributor_PH'
,'IQVia_Ex_Retail_PH_Ecomm','IQVia_Ex_Distributor_PH_Rx') --and Market_Brand='Blf Total'
      ) Sum
      group by BLOZ7,Brand,Brand_group,Category,Contract,Data_Channel,FCT_Tool_name,Is_Commercial,Is_Contracted,Is_MSL_List,KPI,Market_Brand,Market_Category,Pharmacy_type,Product_type,SKU_Name,SKU_Short_Name,Status,Year_month,Year_quarter,rep_email_commercial,rep_email_commercial_2

    UNION

        Select 
		BLOZ7
		,Brand
		,Brand_group
		,Category
		,null as Contract
		,'ExRetail PH' as Data_Channel
		,FCT_Tool_name
		,Is_Commercial
		,Is_Contracted
		,Is_MSL_List,
      'Stock' as KPI
	  ,Market_Brand
	  ,Market_Category,'Apteka' as Pharmacy_type
	  ,Product_type
	  ,SKU_Name
	  ,SKU_Short_Name
	  ,Status
	  ,Year_month
	  ,Year_quarter
	  ,sum(Stock_units * ExFactory_price) as Value
	  ,null  as Value_RSP
	  ,sum(Stock_units) as Volume
      ,null as rep_email_commercial
      ,null as rep_email_commercial_2
      from  emea_curated_disc_ceec.fact_marketing_gen_view 
	  where  MARKETING_SOURCE ='IQVia_Ex_Retail_Customizowane'
      group by BLOZ7,Brand,Brand_group,Category,FCT_Tool_name,Is_Commercial,Is_Contracted,Is_MSL_List,Market_Brand,Market_Category,Product_type,SKU_Name,SKU_Short_Name,
      Status,Year_month,Year_quarter

    UNION
    select 	BLOZ7,Brand,Brand_group,Category,	Contract,
	case KPI 
				when 'Sell-In'	then 'ExDistributor Source' 
				when 'Sell-Out'		then 'ExRetail Source' 
				when 'Stock'		then 'ExRetail Source' 
			end as Data_Channel,
			FCT_Tool_name,Is_Commercial,Is_Contracted,Is_MSL_List,KPI,null as Market_Brand,	null as Market_Category,Pharmacy_type,Product_type,SKU_Name,SKU_Short_Name,
			Status,	Year_month,	Year_quarter,Estimated_order_value_exfactory_price as Value,null as Value_RSP,Volume,rep_email_commercial,rep_email_commercial_2
		from emea_curated_disc_ceec.vw_f_transactions_user_view

  ) Final
group by BLOZ7,Brand,Brand_group,Category,Contract,Data_Channel,FCT_Tool_name,Is_Commercial,Is_Contracted,Is_MSL_List,KPI,Market_Brand,Market_Category,Pharmacy_type,Product_type,SKU_Name,SKU_Short_Name,Status,Year_month,Year_quarter,rep_email_commercial,rep_email_commercial_2