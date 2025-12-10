CREATE VIEW emea_raw_lnd_ceec.vw_ceec_m360_mapping_final_view (
  CC_PRODUCT_ID_2,
  CC_SAM,
  CC_BAM,
  SAM,
  CATEGORY_M360,
  SEGMENT_M360,
  TYPE_OF_THE_KEY,
  KEY_MAIN,
  BAM,
  BRAND_BY_MANUFACTURER COMMENT 'Brand by Manufacturer',
  BRAND_LOCAL_NAME COMMENT 'Brand Local Name',
  BRAND_NAME COMMENT 'Brand Name',
  CATEGORY_NAME COMMENT 'Category Name',
  cc_product_id,
  Channel,
  Corporation,
  country,
  country_description,
  CURRENCY,
  COUNTRY_MAP,
  DATA_SOURCE COMMENT 'Data Source',
  Day_of_Year,
  Form_1,
  general_segment,
  IS_BRAND_PRODUCED_BY_BAYER COMMENT 'Is Brand Produced By Bayer',
  Key1,
  Key2,
  Key3,
  Key4,
  LOCAL_ATC4_DESCRIPTION COMMENT 'Local Atc4 Description',
  LOCAL_CATEGORY_NAME COMMENT 'Local Category Name',
  LOCAL_FORM COMMENT 'Local Form',
  LOCAL_INGREDIENT COMMENT 'Local Ingredient',
  LOCAL_KEY_BUSINESS_CATEGORY COMMENT 'Local Key Business Category',
  LOCAL_OTC4_DESCRIPTION COMMENT 'Local Otc4 Description',
  LOCAL_PRODUCT_SUB_TYPE COMMENT 'Local Product Sub Type',
  LOCAL_PRODUCT_TYPE COMMENT 'Local Product Type',
  LOCAL_SEGMENT_NAME COMMENT 'Local Segment Name',
  LOCAL_SUB_CATEGORY_NAME COMMENT 'Local Sub Category Name',
  LOCAL_USER COMMENT 'Local User',
  Manufacturer,
  MANUFACTURER_CORPORATION COMMENT 'Manufacturer Corporation',
  MANUFACTURER_LOCAL_NAME COMMENT 'Manufacturer Local Name',
  Market_Brand,
  marketing_source,
  nfc1_description,
  nfc1_id,
  nfc12_description,
  nfc12_id,
  nfc123_description,
  nfc123_id,
  otc1_description,
  otc1_id,
  otc2_description,
  otc2_id,
  otc3_description,
  otc3_id,
  otc4_description,
  otc4_ID,
  Pack,
  PACK_DESCRIPTION COMMENT 'Pack Description',
  PACK_FORM COMMENT 'Pack Form',
  PACK_FORM_EXTD COMMENT 'Pack Form Extd',
  Pack_Size,
  PACK_SIZE_GROUP COMMENT 'Pack Size Group',
  PACK_SIZE_MEASURE COMMENT 'Pack Size Measure',
  PACK_SIZE_STR COMMENT 'Pack Size',
  PACK_SIZE_VALUE COMMENT 'Pack Size Value',
  PEER_GROUP_FLAG COMMENT 'Peer Group Flag',
  POWER_BRAND_FLAG COMMENT 'Power Brand Flag',
  POWER_BRAND_TYPE COMMENT 'Power Brand Type',
  Product,
  PRODUCT_DESCRIPTION COMMENT 'Product Description',
  PRODUCT_ID COMMENT 'Id',
  ID_VERSION COMMENT 'Version',
  PRODUCT_LOCAL_DESCRIPTION COMMENT 'Product Local Description',
  PRODUCT_TYPE COMMENT 'Product Type',
  Sales_Value,
  Sales_Volume,
  SEGMENT_BCH COMMENT 'Segment Bch',
  SEGMENT_BCH_BRAND COMMENT 'Segment Bch Brand',
  SEGMENT_NAME COMMENT 'Segment Name',
  SUB_BRAND_NAME COMMENT 'Sub Brand Name',
  SUB_CATEGORY_NAME COMMENT 'Sub Category Name',
  time_id,
  UOV_FACTOR_RULE COMMENT 'Global UoV Factor Rule',
  VERSION COMMENT 'Version',
  Week_of_Year,
  Year,
  Year_month,
  Year_quarter,
  REGION,
  SUB_REGION,
  CLUSTER,
  LOAD_DATE,
  PROJECTED COMMENT 'Bayer Flag',
  COUNTRY_PRODUCT_LOCAL_DESCRIPTION COMMENT 'Local Sku Entity',
  IS_M360_COUNTRY)
WITH SCHEMA BINDING
AS (

with country_cte as
 (
    select 
    case when lower(description) ='slovak republic' then 'slovakia'
         when  lower(description) ='czech republic' then 'czech' 
         else lower(description) 
    end country_join,
     case when lower(description)='bulgaria' then 'BGN'
          when lower(description)='czech republic' then 'CZK'
          when lower(description)='slovak republic' then 'EUR'
          when lower(description)='hungary' then 'HUF'
          when lower(description)='poland' then 'PLN'
          when lower(description)='romania' then 'RON'
          else '' end currency,
      case when lower(description)='bulgaria' then 'BG'
          when lower(description)='czech republic' then 'CZ'
          when lower(description)='slovak republic' then 'SK'
          when lower(description)='hungary' then 'HU'
          when lower(description)='poland' then 'PL'
          when lower(description)='romania' then 'RO'
          else '' end country_map,

    *
    from emea_raw_lnd_ceec.mkt_m360_ds_um_pt_dim_country
)

select 

CASE WHEN (LEFT(prd.id,5))='00000' THEN `PRODUCT_LOCAL_DESCRIPTION`||'-'||`BRAND_NAME` else DESCRIPTION ||'-'||prd.ID END CC_PRODUCT_ID_2,
CASE WHEN DESCRIPTION||'-'||prd.id= CC_PRODUCT_ID_2 THEN 1 ELSE '0' END CC_SAM,
CASE WHEN DESCRIPTION||'-'||prd.id= CC_PRODUCT_ID_2 THEN 1 ELSE '0' END CC_BAM,

CASE WHEN CC_Product_ID_2 = Key4 THEN CC_SAM
     WHEN CC_Product_ID_2 = Key3 THEN CC_SAM
     WHEN CC_Product_ID_2 = Key2 THEN CC_SAM
     WHEN CC_Product_ID_2 = Key1 THEN CC_SAM
     ELSE '0' END SAM,

CASE WHEN CC_Product_ID_2 = Key4 THEN `CATEGORY_NAME`
     WHEN CC_Product_ID_2 = Key3 THEN `CATEGORY_NAME`
     WHEN CC_Product_ID_2 = Key2 THEN `CATEGORY_NAME`
     WHEN CC_Product_ID_2 = Key1 THEN `CATEGORY_NAME`
     ELSE NULL END CATEGORY_M360,

CASE WHEN CC_Product_ID_2 = Key4 THEN `SEGMENT_NAME`
     WHEN CC_Product_ID_2 = Key3 THEN `SEGMENT_NAME`
     WHEN CC_Product_ID_2 = Key2 THEN `SEGMENT_NAME`
     WHEN CC_Product_ID_2 = Key1 THEN `SEGMENT_NAME`
     ELSE NULL END SEGMENT_M360,

CASE WHEN CC_Product_ID_2 = Key4 THEN Key4
     WHEN CC_Product_ID_2 = Key3 THEN Key3
     WHEN CC_Product_ID_2 = Key2 THEN Key2
     WHEN CC_Product_ID_2 = Key1 THEN Key1
     ELSE '0'
END TYPE_OF_THE_KEY,

CASE WHEN TYPE_OF_THE_KEY=Key4 THEN Key4
     WHEN TYPE_OF_THE_KEY=Key3 THEN Key3
     WHEN TYPE_OF_THE_KEY=Key2 THEN Key2
     WHEN TYPE_OF_THE_KEY=Key1 THEN Key1
ELSE '0'
    END KEY_MAIN,

CASE WHEN CC_Product_ID_2 = Key4 THEN CC_BAM
     WHEN CC_Product_ID_2 = Key3 THEN CC_BAM
     WHEN CC_Product_ID_2 = Key2 THEN CC_BAM
     WHEN CC_Product_ID_2 = Key1 THEN CC_BAM
     ELSE '0'
END BAM,

`BRAND_BY_MANUFACTURER`,
`BRAND_LOCAL_NAME`,
`BRAND_NAME`,
`CATEGORY_NAME`,
`cc_product_id`,
`Channel`,
`Corporation`,
count.`ID` country,
count.description country_description,
count.CURRENCY,
count.COUNTRY_MAP,
`DATA_SOURCE`,
`Day_of_Year`,
`Form_1`,
`general_segment`,
`IS_BRAND_PRODUCED_BY_BAYER`,
`Key1`,
`Key2`,
`Key3`,
`Key4`,
`LOCAL_ATC4_DESCRIPTION`,
`LOCAL_CATEGORY_NAME`,
`LOCAL_FORM`,
`LOCAL_INGREDIENT`,
`LOCAL_KEY_BUSINESS_CATEGORY`,
`LOCAL_OTC4_DESCRIPTION`,
`LOCAL_PRODUCT_SUB_TYPE`,
`LOCAL_PRODUCT_TYPE`,
`LOCAL_SEGMENT_NAME`,
`LOCAL_SUB_CATEGORY_NAME`,
`LOCAL_USER`,
`Manufacturer`,
`MANUFACTURER_CORPORATION`,
`MANUFACTURER_LOCAL_NAME`,
`Market_Brand`,
`marketing_source`,
`nfc1_description`,
`nfc1_id`,
`nfc12_description`,
`nfc12_id`,
`nfc123_description`,
`nfc123_id`,
`otc1_description`,
`otc1_id`,
`otc2_description`,
`otc2_id`,
`otc3_description`,
`otc3_id`,
`otc4_description`,
`otc4_ID`,
`Pack`,
`PACK_DESCRIPTION`,
`PACK_FORM`,
`PACK_FORM_EXTD`,
`Pack_Size`,
`PACK_SIZE_GROUP`,
`PACK_SIZE_MEASURE`,
`PACK_SIZE_STR`,
`PACK_SIZE_VALUE`,
`PEER_GROUP_FLAG`,
`POWER_BRAND_FLAG`,
`POWER_BRAND_TYPE`,
`Product`,
`PRODUCT_DESCRIPTION`,
prd.`ID` PRODUCT_ID,
prd.version ID_VERSION,
`PRODUCT_LOCAL_DESCRIPTION`,
`PRODUCT_TYPE`,
`Sales_Value`,
`Sales_Volume`,
`SEGMENT_BCH`,
`SEGMENT_BCH_BRAND`,
`SEGMENT_NAME`,
`SUB_BRAND_NAME`,
`SUB_CATEGORY_NAME`,
`time_id`,
`UOV_FACTOR_RULE`,
`VERSION`,
`Week_of_Year`,
`Year`,
`Year_month`,
`Year_quarter`,
count.REGION,
count.SUB_REGION,
count.CLUSTER,
data_delivery_date LOAD_DATE,
prd.bayer_flag PROJECTED,
prd.local_sku_entity COUNTRY_PRODUCT_LOCAL_DESCRIPTION,
1 IS_M360_COUNTRY

--  count(*)
from emea_raw_lnd_ceec.vw_ceec_gen_marketing_view_m360_mapping fact -- 4198219

left join emea_raw_lnd_ceec.mkt_m360_ds_um_pt_dim_product prd
on fact.cc_product_id||lower(fact.marketing_source)=prd.id||lower(prd.data_source)

--where prd.id is null  --4186170

left join country_cte count
on lower(lower(fact.country))=country_join
)