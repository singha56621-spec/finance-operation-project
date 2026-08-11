create database financial_ops;
use financial_ops;

/*
=============================================================================
Project: Business Performance & Financial Operations Analytics
File Name: 01_yoy_growth.sql
Directory: sql_queries/
Description: Calculates Year-over-Year (YoY) revenue growth using a CTE to 
             aggregate by Region and Month before applying window functions.
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
    LAG(Revenue, 12) OVER (PARTITION BY Region ORDER BY YearMonth) AS Revenue_LastYear,
    ROUND(
        (Revenue - LAG(Revenue, 12) OVER (PARTITION BY Region ORDER BY YearMonth)) 
        / LAG(Revenue, 12) OVER (PARTITION BY Region ORDER BY YearMonth) * 100, 
    2) AS YoY_Growth_Pct
FROM region_monthly
ORDER BY Region, YearMonth;