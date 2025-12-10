CREATE VIEW emea_raw_src_bnlx.fico_dim_floorprice (
  GLOBAL_PRODUCT_SID,
  GLOBAL_PRODUCT,
  FORMULATION_ID COMMENT 'Formulation ID',
  FORMULATION COMMENT 'Formulation',
  FGPS_ID COMMENT 'Finished Good Pack Size ID',
  FORMULATION_UOM COMMENT 'Formulation Unit of Measure',
  FORMULATION_FLAVOUR COMMENT 'Formulation Flavour',
  COMBIPACK_FLAG COMMENT 'Combipack Flag',
  GLOBAL_PRODUCT_SID_TXT,
  FLOORPRICE,
  FLOORPRICE_CURRENCY,
  deletion_date)
WITH SCHEMA COMPENSATION
AS SELECT
        GLOBAL_PRODUCT_SID,
        GLOBAL_PRODUCT,
        FORMULATION_ID,
        FORMULATION,
        FGPS_ID,
        FORMULATION_UOM,
        FORMULATION_FLAVOUR,
        COMBIPACK_FLAG,
        GLOBAL_PRODUCT_SID_TXT,
        '' AS FLOORPRICE,
        '' AS FLOORPRICE_CURRENCY,
        '' AS deletion_date
    FROM
        chdaa_prd_cda_fico.fico_consume.dim_floorprice