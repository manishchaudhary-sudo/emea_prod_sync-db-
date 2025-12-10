CREATE VIEW emea_raw_src_bnlx.fico_dim_cost_component (
  COST_COMP_SID,
  COST_COMP_ID COMMENT 'Cost Component ID',
  COST_COMP COMMENT 'Cost Component',
  COST_COMP_GROUP_ID COMMENT 'Cost Component Group ID',
  COST_COMP_GROUP COMMENT 'Cost Component Group',
  COST_COMP_SUBGROUP_ID COMMENT 'Cost Component Subgroup ID',
  COST_COMP_SUBGROUP COMMENT 'Cost Component Subgroup',
  OPSYS COMMENT 'OPSYS',
  OPTIME COMMENT 'OPTIME',
  OPTYPE COMMENT 'OPTYPE')
WITH SCHEMA COMPENSATION
AS SELECT
        COST_COMP_SID,
        COST_COMP_ID,
        COST_COMP,
        COST_COMP_GROUP_ID,
        COST_COMP_GROUP,
        COST_COMP_SUBGROUP_ID,
        COST_COMP_SUBGROUP,
        OPSYS,
        OPTIME,
        OPTYPE
    FROM
        chdaa_prd_cda_fico.fico_consume.dim_cost_component