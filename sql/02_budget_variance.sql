/*
=============================================================================
Project: Business Performance & Financial Operations Analytics
File Name: 02_budget_variance.sql
Directory: sql_queries/
Description: Computes the variance between actual revenue and budgeted targets,
             sorting to surface the most underperforming regions.
=============================================================================
*/

SELECT
    Region,
    Category,
    YearMonth,
    Revenue AS Actual_Revenue,
    Budget,
    ROUND(Revenue - Budget, 2) AS Variance,
    ROUND((Revenue - Budget) / Budget * 100, 2) AS Variance_Pct
FROM monthly_unit_performance
ORDER BY Variance_Pct ASC;