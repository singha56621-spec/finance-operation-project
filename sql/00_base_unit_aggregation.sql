/*
=============================================================================
Project: Business Performance & Financial Operations Analytics
File Name: 00_base_unit_aggregation.sql
Directory: sql_queries/
Description: Aggregates row-level transaction data into monthly business unit 
             summaries, calculating total revenue, cost, profit, and margin.
=============================================================================
*/

WITH monthly_unit AS (
    SELECT
        Region,
        Category,
        DATE_FORMAT(Order_Date, '%Y-%m') AS YearMonth,
        SUM(Sales) AS Revenue,
        SUM(Cost) AS Cost,
        SUM(Profit) AS Profit,
        ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Margin_Pct
    FROM cleaned_transactions
    GROUP BY 
        Region, 
        Category, 
        DATE_FORMAT(Order_Date, '%Y-%m')
)
SELECT * 
FROM monthly_unit 
ORDER BY Region, Category, YearMonth;