CREATE VIEW emea_consume_esalesweb.fact_transaction_for_esales_web4 (
  year,
  bloz,
  account_id,
  last_modified_date,
  sell_in_volume_M1,
  sell_out_volume_M1,
  stock_volume_M1,
  sell_in_estimated_M1,
  sell_out_estimated_M1,
  sell_in_volume_M2,
  sell_out_volume_M2,
  stock_volume_M2,
  sell_in_estimated_M2,
  sell_out_estimated_M2,
  sell_in_volume_M3,
  sell_out_volume_M3,
  stock_volume_M3,
  sell_in_estimated_M3,
  sell_out_estimated_M3,
  sell_in_volume_M4,
  sell_out_volume_M4,
  stock_volume_M4,
  sell_in_estimated_M4,
  sell_out_estimated_M4,
  sell_in_volume_M5,
  sell_out_volume_M5,
  stock_volume_M5,
  sell_in_estimated_M5,
  sell_out_estimated_M5,
  sell_in_volume_M6,
  sell_out_volume_M6,
  stock_volume_M6,
  sell_in_estimated_M6,
  sell_out_estimated_M6,
  sell_in_volume_M7,
  sell_out_volume_M7,
  stock_volume_M7,
  sell_in_estimated_M7,
  sell_out_estimated_M7,
  sell_in_volume_M8,
  sell_out_volume_M8,
  stock_volume_M8,
  sell_in_estimated_M8,
  sell_out_estimated_M8,
  sell_in_volume_M9,
  sell_out_volume_M9,
  stock_volume_M9,
  sell_in_estimated_M9,
  sell_out_estimated_M9,
  sell_in_volume_M10,
  sell_out_volume_M10,
  stock_volume_M10,
  sell_in_estimated_M10,
  sell_out_estimated_M10,
  sell_in_volume_M11,
  sell_out_volume_M11,
  stock_volume_M11,
  sell_in_estimated_M11,
  sell_out_estimated_M11,
  sell_in_volume_M12,
  sell_out_volume_M12,
  stock_volume_M12,
  sell_in_estimated_M12,
  sell_out_estimated_M12)
WITH SCHEMA COMPENSATION
AS SELECT
    fact.year,
    fact.bloz,
    account_id,
    MAX(fact.ETLLastModifiedDate) AS last_modified_date,
    
    --- M1
    SUM(CASE WHEN kpi = 'Sell-In'  AND month = 1 THEN volume ELSE 0 END) AS sell_in_volume_M1,
    SUM(CASE WHEN kpi = 'Sell-Out' AND month = 1 THEN volume ELSE 0 END) AS sell_out_volume_M1,
    SUM(CASE WHEN kpi = 'Stock'    AND month = 1 THEN volume ELSE 0 END) AS stock_volume_M1,
    SUM(CASE WHEN kpi = 'Sell-In'  AND month = 1 THEN estimated_order_value_exfactory_price ELSE 0 END) AS sell_in_estimated_M1,
    SUM(CASE WHEN kpi = 'Sell-Out' AND month = 1 THEN estimated_order_value_exfactory_price ELSE 0 END) AS sell_out_estimated_M1,

    --- M2
    SUM(CASE WHEN kpi = 'Sell-In'  AND month = 2 THEN volume ELSE 0 END) AS sell_in_volume_M2,
    SUM(CASE WHEN kpi = 'Sell-Out' AND month = 2 THEN volume ELSE 0 END) AS sell_out_volume_M2,
    SUM(CASE WHEN kpi = 'Stock'    AND month = 2 THEN volume ELSE 0 END) AS stock_volume_M2,
    SUM(CASE WHEN kpi = 'Sell-In'  AND month = 2 THEN estimated_order_value_exfactory_price ELSE 0 END) AS sell_in_estimated_M2,
    SUM(CASE WHEN kpi = 'Sell-Out' AND month = 2 THEN estimated_order_value_exfactory_price ELSE 0 END) AS sell_out_estimated_M2,

    --- M3
    SUM(CASE WHEN kpi = 'Sell-In'  AND month = 3 THEN volume ELSE 0 END) AS sell_in_volume_M3,
    SUM(CASE WHEN kpi = 'Sell-Out' AND month = 3 THEN volume ELSE 0 END) AS sell_out_volume_M3,
    SUM(CASE WHEN kpi = 'Stock'    AND month = 3 THEN volume ELSE 0 END) AS stock_volume_M3,
    SUM(CASE WHEN kpi = 'Sell-In'  AND month = 3 THEN estimated_order_value_exfactory_price ELSE 0 END) AS sell_in_estimated_M3,
    SUM(CASE WHEN kpi = 'Sell-Out' AND month = 3 THEN estimated_order_value_exfactory_price ELSE 0 END) AS sell_out_estimated_M3,

    --- M4
    SUM(CASE WHEN kpi = 'Sell-In'  AND month = 4 THEN volume ELSE 0 END) AS sell_in_volume_M4,
    SUM(CASE WHEN kpi = 'Sell-Out' AND month = 4 THEN volume ELSE 0 END) AS sell_out_volume_M4,
    SUM(CASE WHEN kpi = 'Stock'    AND month = 4 THEN volume ELSE 0 END) AS stock_volume_M4,
    SUM(CASE WHEN kpi = 'Sell-In'  AND month = 4 THEN estimated_order_value_exfactory_price ELSE 0 END) AS sell_in_estimated_M4,
    SUM(CASE WHEN kpi = 'Sell-Out' AND month = 4 THEN estimated_order_value_exfactory_price ELSE 0 END) AS sell_out_estimated_M4,

    --- M5
    SUM(CASE WHEN kpi = 'Sell-In'  AND month = 5 THEN volume ELSE 0 END) AS sell_in_volume_M5,
    SUM(CASE WHEN kpi = 'Sell-Out' AND month = 5 THEN volume ELSE 0 END) AS sell_out_volume_M5,
    SUM(CASE WHEN kpi = 'Stock'    AND month = 5 THEN volume ELSE 0 END) AS stock_volume_M5,
    SUM(CASE WHEN kpi = 'Sell-In'  AND month = 5 THEN estimated_order_value_exfactory_price ELSE 0 END) AS sell_in_estimated_M5,
    SUM(CASE WHEN kpi = 'Sell-Out' AND month = 5 THEN estimated_order_value_exfactory_price ELSE 0 END) AS sell_out_estimated_M5,

    --- M6
    SUM(CASE WHEN kpi = 'Sell-In'  AND month = 6 THEN volume ELSE 0 END) AS sell_in_volume_M6,
    SUM(CASE WHEN kpi = 'Sell-Out' AND month = 6 THEN volume ELSE 0 END) AS sell_out_volume_M6,
    SUM(CASE WHEN kpi = 'Stock'    AND month = 6 THEN volume ELSE 0 END) AS stock_volume_M6,
    SUM(CASE WHEN kpi = 'Sell-In'  AND month = 6 THEN estimated_order_value_exfactory_price ELSE 0 END) AS sell_in_estimated_M6,
    SUM(CASE WHEN kpi = 'Sell-Out' AND month = 6 THEN estimated_order_value_exfactory_price ELSE 0 END) AS sell_out_estimated_M6,

    --- M7
    SUM(CASE WHEN kpi = 'Sell-In'  AND month = 7 THEN volume ELSE 0 END) AS sell_in_volume_M7,
    SUM(CASE WHEN kpi = 'Sell-Out' AND month = 7 THEN volume ELSE 0 END) AS sell_out_volume_M7,
    SUM(CASE WHEN kpi = 'Stock'    AND month = 7 THEN volume ELSE 0 END) AS stock_volume_M7,
    SUM(CASE WHEN kpi = 'Sell-In'  AND month = 7 THEN estimated_order_value_exfactory_price ELSE 0 END) AS sell_in_estimated_M7,
    SUM(CASE WHEN kpi = 'Sell-Out' AND month = 7 THEN estimated_order_value_exfactory_price ELSE 0 END) AS sell_out_estimated_M7,

    --- M8
    SUM(CASE WHEN kpi = 'Sell-In'  AND month = 8 THEN volume ELSE 0 END) AS sell_in_volume_M8,
    SUM(CASE WHEN kpi = 'Sell-Out' AND month = 8 THEN volume ELSE 0 END) AS sell_out_volume_M8,
    SUM(CASE WHEN kpi = 'Stock'    AND month = 8 THEN volume ELSE 0 END) AS stock_volume_M8,
    SUM(CASE WHEN kpi = 'Sell-In'  AND month = 8 THEN estimated_order_value_exfactory_price ELSE 0 END) AS sell_in_estimated_M8,
    SUM(CASE WHEN kpi = 'Sell-Out' AND month = 8 THEN estimated_order_value_exfactory_price ELSE 0 END) AS sell_out_estimated_M8,

    --- M9
    SUM(CASE WHEN kpi = 'Sell-In'  AND month = 9 THEN volume ELSE 0 END) AS sell_in_volume_M9,
    SUM(CASE WHEN kpi = 'Sell-Out' AND month = 9 THEN volume ELSE 0 END) AS sell_out_volume_M9,
    SUM(CASE WHEN kpi = 'Stock'    AND month = 9 THEN volume ELSE 0 END) AS stock_volume_M9,
    SUM(CASE WHEN kpi = 'Sell-In'  AND month = 9 THEN estimated_order_value_exfactory_price ELSE 0 END) AS sell_in_estimated_M9,
    SUM(CASE WHEN kpi = 'Sell-Out' AND month = 9 THEN estimated_order_value_exfactory_price ELSE 0 END) AS sell_out_estimated_M9,

    --- M10
    SUM(CASE WHEN kpi = 'Sell-In'  AND month = 10 THEN volume ELSE 0 END) AS sell_in_volume_M10,
    SUM(CASE WHEN kpi = 'Sell-Out' AND month = 10 THEN volume ELSE 0 END) AS sell_out_volume_M10,
    SUM(CASE WHEN kpi = 'Stock'    AND month = 10 THEN volume ELSE 0 END) AS stock_volume_M10,
    SUM(CASE WHEN kpi = 'Sell-In'  AND month = 10 THEN estimated_order_value_exfactory_price ELSE 0 END) AS sell_in_estimated_M10,
    SUM(CASE WHEN kpi = 'Sell-Out' AND month = 10 THEN estimated_order_value_exfactory_price ELSE 0 END) AS sell_out_estimated_M10,

    --- M11
    SUM(CASE WHEN kpi = 'Sell-In'  AND month = 11 THEN volume ELSE 0 END) AS sell_in_volume_M11,
    SUM(CASE WHEN kpi = 'Sell-Out' AND month = 11 THEN volume ELSE 0 END) AS sell_out_volume_M11,
    SUM(CASE WHEN kpi = 'Stock'    AND month = 11 THEN volume ELSE 0 END) AS stock_volume_M11,
    SUM(CASE WHEN kpi = 'Sell-In'  AND month = 11 THEN estimated_order_value_exfactory_price ELSE 0 END) AS sell_in_estimated_M11,
    SUM(CASE WHEN kpi = 'Sell-Out' AND month = 11 THEN estimated_order_value_exfactory_price ELSE 0 END) AS sell_out_estimated_M11,

    --- M12
    SUM(CASE WHEN kpi = 'Sell-In'  AND month = 12 THEN volume ELSE 0 END) AS sell_in_volume_M12,
    SUM(CASE WHEN kpi = 'Sell-Out' AND month = 12 THEN volume ELSE 0 END) AS sell_out_volume_M12,
    SUM(CASE WHEN kpi = 'Stock'    AND month = 12 THEN volume ELSE 0 END) AS stock_volume_M12,
    SUM(CASE WHEN kpi = 'Sell-In'  AND month = 12 THEN estimated_order_value_exfactory_price ELSE 0 END) AS sell_in_estimated_M12,
    SUM(CASE WHEN kpi = 'Sell-Out' AND month = 12 THEN estimated_order_value_exfactory_price ELSE 0 END) AS sell_out_estimated_M12

FROM
    chdaa_prd_lz_emea.emea_consume_ceec_pl.fact_transaction_for_esales_web2 fact
LEFT JOIN
    chdaa_prd_lz_emea.emea_curated_disc_ceec.dim_customers cust ON fact.id_external_reporting = cust.customer_bk
        AND cust.customer_is_valid = true
                AND cust.id_esalesweb is not null
LEFT JOIN chdaa_prd_lz_emea.emea_quality_corr_ceec.esalesweb_account_organization esales_org
    ON cust.id_esalesweb = esales_org.organization_id
        AND cust.customer_is_valid = true
      
WHERE
    (year = YEAR(CURRENT_DATE) OR year = YEAR(CURRENT_DATE) - 1) -- current year + prev year
    AND kpi != 'Order'
                  AND fact.time_id>=is_member_start
                      AND (fact.time_id< is_member_end or is_member_end is null)

GROUP BY fact.year, fact.bloz, account_id