CREATE VIEW emea_quality_corr_ceec.vw_s4u_data (
  source,
  r_time,
  r_customer,
  r_product,
  r_batch,
  psdt_akt_synch,
  kpi,
  volume,
  document_id,
  sell_in_volume_after_correction,
  expiry_date,
  batch_number,
  distributor,
  purchase_type,
  date_distributor_sales,
  global_id,
  ilosc,
  date_purchase,
  sales_type,
  sales_time)
WITH SCHEMA BINDING
AS SELECT
  'S4U-purch' as source,
  data_przyjecia_apteka as r_time,
  cast(
    case
      when rtrim(ltrim(numer_apteki)) RLIKE '[0-9]{1,}' then rtrim(ltrim(numer_apteki))
    end as int
  ) as r_customer,
  cast(
    case
      when rtrim(ltrim(symbol_obcy)) RLIKE '[0-9]{7}' then rtrim(ltrim(symbol_obcy))
    end as int
  ) as r_product,
  NULL AS r_batch,
  psdt_akt_synch,
  'Sell-In' as kpi,
  ilosc_kupiona_po_korekcie as volume,
  nr_dokumentu_przyjecia as document_id,
  ilosc_kupiona as sell_in_volume_after_correction,
  data_waznosci as expiry_date,
  seria as batch_number,
  nazwa_dostawcy as distributor,
  typ_przyjecia as purchase_type,
  data_sp_hurtownia as date_distributor_sales,
  global_id,
  null as ilosc,
  NULL AS date_purchase,
  NULL AS sales_type,
  NULL sales_time
FROM
  emea_quality_corr_ceec.s4u_zakupy_ceec_pl

UNION ALL

SELECT
  'S4U-stock' as source,
  data_stanu as r_time,
  cast(
    case
      when rtrim(ltrim(numer_apteki)) RLIKE '[0-9]{1,}' then rtrim(ltrim(numer_apteki))
    end as int
  ) as r_customer,
  cast(
    case
      when rtrim(ltrim(symbol_obcy)) RLIKE '[0-9]{7}' then rtrim(ltrim(symbol_obcy))
    end as int
  ) as r_product,
  NULL AS r_batch,
  psdt_akt_synch,
  'Stock' as kpi,
  ilosc AS volume,
  NULL AS document_id,
  NULL AS `sell-in_volume_after_correction`,
  NULL AS expiry_date,
  NULL AS batch_number,
  NULL AS distributor,
  NULL AS purchase_type,
  NULL AS date_distributor_sales,
  global_id,
  ilosc,
  NULL AS date_purchase,
  NULL AS sales_type,
  NULL sales_time
from
  emea_quality_corr_ceec.s4u_stany_ceec_pl

UNION ALL
SELECT
  'S4U-sale' AS source,
  data_sprzedazy AS r_time,
  CAST(
    CASE
      WHEN RTRIM(LTRIM(numer_apteki)) RLIKE '[0-9]{1,}' THEN RTRIM(LTRIM(numer_apteki))
    END AS INT
  ) AS r_customer,
  CAST(
    CASE
      WHEN RTRIM(LTRIM(symbol_obcy)) RLIKE '[0-9]{7}' THEN RTRIM(LTRIM(symbol_obcy))
    END AS INT
  ) AS r_product,
  NULL AS r_batch,
  psdt_akt_synch,
  'Sell-Out' AS kpi,
  ilosc_sprzedana AS volume,
  nr_faktury_dostawcy AS document_id,
  NULL AS `sell-in_volume_after_correction`,
  NULL AS expiry_date,
  NULL AS batch_number,
  NULL AS distributor,
  NULL AS purchase_type,
  NULL AS date_distributor_sales,
  global_id,
    null as ilosc,
  data_zakupu_apteka AS date_purchase,
  typ_sprzedazy AS sales_type,
  godz_sprzedazy  AS sales_time
FROM
  emea_quality_corr_ceec.s4u_sprzedaz_ceec_pl