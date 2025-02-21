{{ config(
    materialized='table'
) }}

WITH base AS (
    SELECT
        CAST(date AS DATE) AS date,
        CAST(hour AS INTEGER) AS hour,
        UPPER(symbol) AS symbol,
        UPPER(underlying) AS underlying,
        type,
        strike,
        ROUND(open, 2) AS open,
        ROUND(high, 2) AS high,
        ROUND(low, 2) AS low,
        ROUND(close, 2) AS close,
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
    FROM {{ ref('raw_btc_data_load') }}
    WHERE volume_usdt > 0
)
SELECT DISTINCT *
FROM base
WHERE open IS NOT NULL AND close IS NOT NULL