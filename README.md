# covid19-insights-postgresql
SQL project to analyze global COVID-19 statistics using PostgreSQL. Includes monthly/yearly aggregations, data cleaning, trend analysis, and mode calculations.

#  Global COVID-19 Analysis (PostgreSQL)

Analyze global COVID-19 data using SQL. This project focuses on data cleaning, time-based aggregations, and generating insights with PostgreSQL.

---

## Dataset

Table: `global_covid_stats`

Key columns:
- `report_date`, `province_state`, `country_region`
- `latitude`, `longitude`
- `confirmed`, `deaths`, `recovered`

---

##  Key Insights & Tasks

###  Data Cleaning
- Replaced `NULL` values with `0`.

###  Time-Series Analysis
- Dataset duration & row count
- Monthly totals & averages
- Yearly min/max values

###  Country-Level Insights
- Country with highest confirmed cases
- Country with lowest deaths

###  Mode Analysis
- Most frequent values (monthly) for confirmed, deaths, recovered

---

##  Tech Stack
- **PostgreSQL**
- Raw SQL for analysis
