select * from global_covid_stats

--Q1 : If null values are present, update them with zeroes for all the columns
select * from global_covid_stats
where province_state is null or country_region is null or latitude is null or longitude is null or report_date is null or confirmed is null or deaths is null or recovered is null

--Q2 : Check total number of rows
select count(*) from global_covid_stats

--Q3 : check what is start date and end date
select min(report_date) as min_date, max(report_date) as max_date
from global_covid_stats

--Q4 : how many months are present in the dataset
SELECT COUNT(DISTINCT TO_CHAR(REPORT_DATE, 'YYYY-MM')) AS total_months
FROM GLOBAL_COVID_STATS;

--Q5 : find monthly average of confirmed, deaths and recovered
select DISTINCT TO_CHAR(REPORT_DATE, 'YYYY-MM') AS total_months, round(avg(confirmed),1) as avg_confirmed, round(avg(deaths),1) as avg_deaths,round(avg(recovered),1)as avg_recovered
from global_covid_stats
group by total_months
order by total_months

--Q6 : find minimum values for confirmed, deaths, recovered per year
--solution 1
select EXTRACT(YEAR FROM report_date) as year, min(confirmed),min(deaths),min(recovered)
from global_covid_stats
group by EXTRACT(YEAR FROM report_date)

--Q7 : 07. Find maximum values of confirmed, deaths, recovered per year
select extract(year from report_date) as year1, max(confirmed) as max_confirmed, max(deaths) as max_deaths, max(recovered) as max_recovered
from global_covid_stats
group by year1
order by year1

--Q8 : The total number of case of confirmed, deaths, recovered each month
select TO_CHAR(REPORT_DATE, 'YYYY-MM') AS total_months, sum(confirmed) as total_confirmed, sum(deaths) as sum_deaths,sum(recovered)as sum_recovered
from global_covid_stats
group by total_months
order by total_months

--Q9 : Find country having highest number of the Confirmed case
select country_region, confirmed
from global_covid_stats
where confirmed in (select max(confirmed)
from global_covid_stats)

--Q10 :  Find Country having lowest number of the death case
select country_region, deaths
from global_covid_stats
where deaths in (select min(deaths)
from global_covid_stats)

--Q11 : Find most frequent value for confirmed, deaths, recovered each month
SELECT 
    TO_CHAR(report_date, 'YYYY-MM') AS month_year,
    MODE() WITHIN GROUP (ORDER BY confirmed) AS most_frequent_confirmed,
    MODE() WITHIN GROUP (ORDER BY deaths) AS most_frequent_deaths,
    MODE() WITHIN GROUP (ORDER BY recovered) AS most_frequent_recovered
FROM 
    global_covid_stats
GROUP BY 
    TO_CHAR(report_date, 'YYYY-MM')
ORDER BY 
    month_year;
