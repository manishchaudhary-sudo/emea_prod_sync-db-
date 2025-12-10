CREATE VIEW emea_consume_bnlx.dim_comp_code_p_001 (
  dcgrp,
  `0company`,
  `0company___t`,
  `0country`,
  `0currency`,
  `0comp_code`,
  `0comp_code___t`,
  ETLLineageID,
  ETLIsDeleted,
  ETLChecksum,
  ETLLastModifiedDate)
WITH SCHEMA BINDING
AS (
SELECT 
 dcgrp,
  `0company`,
  `0company___t`,
  `0country`,
  `0currency`,
  `0comp_code`,
  `0comp_code___t`,
  ETLLineageID,
  ETLIsDeleted,
  ETLChecksum,
  ETLLastModifiedDate
 FROM emea_curated_disc_bnlx.dim_comp_code_p_001)