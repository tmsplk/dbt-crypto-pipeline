{{ config(
    materialized='table',
    alias='daily_market_performance'
) }}

WITH curated_data AS (
    SELECT *
    FROM {{ ref('curated_btc_data_transformations') }}
),

daily_aggregation AS (
    SELECT
        date,
        symbol,
        MIN(open) AS daily_open,                     -- First opening price of the day
        MAX(close) AS daily_close,                   -- Last closing price of the day
        MAX(high) AS daily_high,                     -- Highest price of the day
        MIN(low) AS daily_low,                       -- Lowest price of the day
        SUM(volume_contracts) AS total_volume_contracts,
        SUM(volume_usdt) AS total_volume_usdt,
        ROUND(AVG((best_buy_iv + best_sell_iv) / 2), 4) AS avg_daily_implied_volatility,
        ROUND(AVG(mark_iv), 4) AS avg_daily_mark_iv,
        SUM(openinterest_contracts) AS total_open_interest_contracts,
        SUM(openinterest_usdt) AS total_open_interest_usdt,
        ROUND((MAX(close) - MIN(open)) / NULLIF(MIN(open), 0), 4) AS daily_return_pct,
        ROUND(MAX(high) - MIN(low), 2) AS daily_volatility
    FROM curated_data
    GROUP BY date, symbol
    ORDER BY date
)

SELECT *
FROM daily_aggregation