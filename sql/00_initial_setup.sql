-- Creating our own dataset

CREATE SCHEMA IF NOT EXISTS analytics_demo;


--Q1: Creating a small base table inside our dataset

CREATE TABLE analytics_demo.trends_base AS
SELECT *
FROM `bigquery-public-data.google_trends.international_top_terms`
WHERE refresh_date BETWEEN '2023-01-01' AND '2023-01-31'
  AND country_name IN (
    'India', 'Bangladesh', 'Pakistan',
    'United States', 'United Kingdom'
  );


--Q2: Creating an unpartitioned table using data from the base table

CREATE TABLE analytics_demo.trends_unpartitioned AS
SELECT * FROM analytics_demo.trends_base;


--Q3: Creating a partitioned table using data from the base table, partitioned by 'refresh_date'

CREATE TABLE analytics_demo.trends_partitioned
PARTITION BY refresh_date AS
SELECT * FROM analytics_demo.trends_base;


--Q4: Creating a partitioned and clustered table using data from the base table

CREATE TABLE analytics_demo.trends_partitioned_clustered
PARTITION BY refresh_date
CLUSTER BY country_name, term AS
SELECT * FROM analytics_demo.trends_base;
