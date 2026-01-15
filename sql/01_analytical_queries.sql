-- Note: for all the queries, I am using the partitioned table for more optimized, better results.

-- Q5: 
SELECT term, AVG(score) AS avg_score
FROM analytics_demo.trends_partitioned
GROUP BY term
ORDER BY avg_score DESC
LIMIT 10;


-- Q6: 
SELECT term, score
FROM analytics_demo.trends_partitioned
WHERE country_name = 'India'
ORDER BY score DESC
LIMIT 10;


-- Q7:
SELECT country_name, COUNT(*) AS num_terms
FROM analytics_demo.trends_partitioned
GROUP BY country_name
ORDER BY num_terms DESC;


-- Q8:
SELECT term, COUNT(DISTINCT country_name) AS countries
FROM analytics_demo.trends_partitioned
GROUP BY term
ORDER BY countries DESC
LIMIT 10;


-- Q9:
SELECT term, STDDEV(score) AS score_stddev
FROM analytics_demo.trends_partitioned
GROUP BY term
ORDER BY score_stddev DESC
LIMIT 10;


-- Q10:
SELECT
  EXTRACT(DAY FROM refresh_date) AS day,
  COUNT(*) AS num_terms
FROM analytics_demo.trends_partitioned
GROUP BY day
ORDER BY day;
