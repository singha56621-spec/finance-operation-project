# Financial Operations & Budget Variance Analytics

## 📌 Project Overview
This project is an end-to-end Data Analytics and FP&A (Financial Planning & Analysis) portfolio piece. It focuses on diagnosing the root cause of budget underperformance across regional business units. 

Instead of just reporting historical numbers, this project utilizes a complete data pipeline—from raw data extraction in **Python**, to unit economic aggregation in **SQL**, to statistical diagnostic analytics, and finally to an interactive executive dashboard in **Excel**—to provide data-driven, leadership-ready recommendations.

## 🎯 The Business Problem
The business was experiencing unexpected profitability drops and missing baseline budget targets across certain regions. Leadership needed answers to three critical questions:
1. Which regions are missing their budget targets, and by how much?
2. Is the margin erosion driven by rising supply chain costs (cost-per-unit), falling demand (volume), or aggressive pricing strategies (discounting)?
3. What is the near-term revenue forecast if current trends continue?

---

## 🛠️ Methodology & Tech Stack
* **Python (Pandas, NumPy):** Used for Data Engineering, ETL, deriving missing unit economics (Cost, Margin %), handling missing values, and generating statistical correlations and forecasting baselines.
* **MySQL (Window Functions, CTEs):** Used for querying 9,995 rows of raw transactional data to aggregate monthly unit performance, calculate Year-over-Year (YoY) growth, and rank regional cost metrics.
* **Microsoft Excel (PivotTables, Slicers, Data Modeling):** Used as the final BI presentation layer to deliver an interactive, dynamic dashboard mirroring standard corporate financial reporting.

---


## 🧠 Diagnostic Findings (The "So What?")
Through mathematical decomposition and statistical analysis of the 9,995 transactions, I successfully isolated the exact cause of margin erosion in the company's weakest unit:

1. **Budget Variance:** The **West** region was identified as the primary underperformer, missing its budget target by **-1.48%**.
2. **Root Cause De-bunked:** Proved that the missing profit was *not* a supply chain issue (cost-per-unit only increased by a negligible **1.89%**) and *not* a demand issue (volume actually surged by **46.75%**).
3. **The Real Problem (Pricing Strategy):** Uncovered a severe **-76.06% negative correlation** between the discount depth applied and the resulting profit margin. The region is unnecessarily sacrificing its own profits to drive sales.
4. **Trend Forecast:** Based on 3-month moving averages, the West region's revenue is projected to naturally grow by **22.56%** next quarter.

---

## 💡 Strategic Business Recommendations
Based on the data, I recommend leadership take the following immediate actions:

1. **Cap Discretionary Discounting Immediately:** The data shows a devastating -76.06% correlation between discounting and margin erosion. Since demand (volume) is already growing at 46%, heavy discounting is no longer necessary to win sales. Cap all discounts at a strict 20% maximum.
2. **Halt Supplier Renegotiations in the West:** Because cost-per-unit only rose 1.89%, procurement teams should not waste resources trying to lower input costs in this region. The profitability problem is purely pricing-driven.
3. **Prepare for a 22% Revenue Surge:** Forecasts indicate a 22.56% baseline top-line revenue growth in the West. By capping discounts now, the business will capture a massively improved profit margin on this upcoming surge in volume.

---

## 📂 Project Structure & Step-by-Step Execution

### Phase 1: Data Engineering & Cleaning (Python)
* **File:** `notebooks/01_data_cleaning.ipynb`
* **Process:** Ingested the raw dataset, standardized data types, and engineered critical missing financial columns (`Cost` and `Margin_Pct`) required for downstream unit economics.
* **Output:** `cleaned_transactions.csv`

### Phase 2: Relational Database & Aggregation (MySQL)
* **Files:** `sql_queries/` folder
* **Process:** Built Common Table Expressions (CTEs) to group row-level transactional data into a summarized `Region` + `Category` + `YearMonth` grain. Calculated YoY growth, budget variance, and ranked cost-per-unit severity using SQL Window Functions.
* **Output:** `monthly_unit_performance.csv`, `cost_per_unit_data.csv`

### Phase 3: Diagnostic Analytics (Python)
* **File:** `notebooks/02_eda_orientation.ipynb`
* **Process:** Ran a root-cause decomposition formula to isolate volume growth vs. cost inflation. Calculated the Pearson correlation coefficient between discounts and margins, and built a 3-month rolling average trend model. 
* **Output:** `moving_average_data.csv`

### Phase 4: Business Intelligence (Excel)
* **File:** `dashboard/Executive_Dashboard.xlsx`
* **Process:** Imported the clean, aggregated datasets into Excel to build a front-end BI tool. Utilized dynamic PivotTables, interactive Slicers, and Conditional Formatting to create a leadership-ready presentation of the diagnostic findings.
