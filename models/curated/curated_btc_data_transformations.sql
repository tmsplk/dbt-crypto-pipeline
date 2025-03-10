{{ config(
    materialized='table'
) }}

WITH clean_data AS (
    SELECT *
    FROM {{ ref('clean_btc_data_transformations') }}
),
curated_eoh_summary_data AS (
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
        best_buy_iv,
        best_sell_iv,
        mark_iv,
        (close - open) / NULLIF(open, 0) AS return_pct,
        high - low AS intraday_volatility,
        (best_buy_iv + best_sell_iv) / 2 AS avg_implied_volatility,
        best_ask_price - best_bid_price AS bid_ask_spread,
        CASE WHEN best_bid_qty > best_ask_qty THEN 'Bullish' ELSE 'Bearish' END AS order_book_signal,
        delta,
        gamma,
        vega,
        theta,
        openinterest_contracts,
        openinterest_usdt
    FROM clean_data
)
SELECT *
FROM curated_eoh_summary_data