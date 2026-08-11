/*
=============================================================================
Project: Business Performance & Financial Operations Analytics
File Name: 03_cost_per_unit_ranking.sql
Directory: sql_queries/
Description: Computes the cost per unit sold and ranks regions/categories 
             to isolate rising supply costs from falling demand volumes.
=============================================================================
*/

SELECT
    Region,
    Category,
    YearMonth,
    Cost,
    Quantity,
    ROUND(Cost / Quantity, 2) AS Cost_Per_Unit,
    RANK() OVER(PARTITION BY Region, Category ORDER BY ROUND(Cost / Quantity, 2) DESC) as Cost_Severity_Rank
FROM monthly_unit_performance
WHERE Quantity > 0
ORDER BY Region, Category, YearMonth;