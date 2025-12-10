CREATE VIEW emea_raw_src_bnlx.fico_dim_item (
  CS_ITEM_SID,
  CS_CHART_ID COMMENT 'Consolidation Chart of Accounts ID',
  CS_ITEM_ID COMMENT 'Item ID',
  CS_ITEM COMMENT 'Item',
  CLUSTER,
  CS_ITEM_GROUP_1,
  OPSYS COMMENT 'OPSYS',
  OPTIME COMMENT 'OPTIME',
  OPTYPE COMMENT 'OPTYPE')
WITH SCHEMA COMPENSATION
AS SELECT
        CS_ITEM_SID,
        CS_CHART_ID,
        CS_ITEM_ID,
        CS_ITEM,
        CLUSTER,
        CS_ITEM_GROUP_1,
        OPSYS,
        OPTIME,
        OPTYPE
    FROM
        chdaa_prd_cda_fico.fico_consume.dim_item