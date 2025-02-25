{{ config(
    materialized='view'
) }}

WITH combined_eoh_summary_data AS (
    SELECT *
    FROM {{ ref('BTCUSDT-EOHSummary-2023-10-20') }}
    UNION ALL
    SELECT *
    FROM {{ ref('BTCUSDT-EOHSummary-2023-10-21') }}
    UNION ALL
    SELECT *
    FROM {{ ref('BTCUSDT-EOHSummary-2023-10-22') }}
    UNION ALL
    SELECT *
    FROM {{ ref('BTCUSDT-EOHSummary-2023-10-23') }}
)
SELECT
    date,
    hour,
    symbol,
    underlying,
    type,
    strike,
    open,
    high,
    low,
    close,
    volume_contracts,
    volume_usdt,
    best_bid_price,
    best_ask_price,
    best_bid_qty,
    best_ask_qty,
    best_buy_iv,
    best_sell_iv,
    mark_price,
    mark_iv,
    delta,
    gamma,
    vega,
    theta,
    openinterest_contracts,
    openinterest_usdt
FROM combined_eoh_summary_data