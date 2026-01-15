-- Q12:
CREATE TABLE analytics_demo.country_region AS
SELECT DISTINCT
  country_name,
  CASE
    WHEN country_name IN ('India', 'Bangladesh', 'Pakistan') THEN 'South Asia'
    WHEN country_name IN ('United States', 'United Kingdom') THEN 'Western'
    ELSE 'Other'
  END AS region
FROM analytics_demo.trends_partitioned;


-- Q13:
SELECT
  cr.region,
  AVG(t.score) AS avg_score
FROM analytics_demo.trends_partitioned t
JOIN analytics_demo.country_region cr
ON t.country_name = cr.country_name
GROUP BY cr.region
ORDER BY avg_score DESC;
