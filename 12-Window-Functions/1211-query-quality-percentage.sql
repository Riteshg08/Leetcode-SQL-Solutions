-- leetcode 1211. Queries Quality Percentage
-- The problem is to calculate the quality percentage of queries based on their execution time.

-- Here, we are using a window function to calculate the quality of each query based on its rating and position. 
-- The quality is calculated as the sum of the rating divided by the position, rounded to two decimal places. 
-- We also calculate the percentage of poor queries (those with a rating less than 3) by counting them and dividing
--  by the total number of queries, then multiplying by 100 to get a percentage.
SELECT query_name,ROUND(SUM(rating/position)/COUNT(*),2) AS quality,
ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) / COUNT(*) * 100,2) AS poor_query_percentage
FROM queries
GROUP BY query_name;