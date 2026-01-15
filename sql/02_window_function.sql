-- Q11: 
SELECT
  country_name,
  term,
  score,
  RANK() OVER (
    PARTITION BY country_name
    ORDER BY score DESC
  ) AS rank_in_country
FROM analytics_demo.trends_partitioned;
