/*
=============================================================================
Project: Business Performance & Financial Operations Analytics
File Name: 04_moving_average_trend.sql
Directory: sql_queries/
Description: Calculates a 3-month moving average of revenue by region to 
             smooth variance and establish a baseline for linear forecasting.
=============================================================================
*/

WITH region_monthly AS (
    SELECT 
        Region, 
        YearMonth, 
        SUM(Revenue) AS Revenue
    FROM monthly_unit_performance
    GROUP BY Region, YearMonth
)
SELECT
    Region,
    YearMonth,
    Revenue,
    ROUND(AVG(Revenue) OVER (
        PARTITION BY Region 
        ORDER BY YearMonth 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ), 2) AS 3_Month_Moving_Avg
FROM region_monthly
ORDER BY Region, YearMonth;