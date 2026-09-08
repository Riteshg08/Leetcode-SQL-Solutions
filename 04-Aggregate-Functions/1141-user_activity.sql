-- Leetcode- 1141. User Activity for the Past 30 Days

-- we use distinct to count the number of unique users who were active on each day in the past 30 days. We filter the activity records to include only those within the specified date range, group the results by activity_date, and order them chronologically.
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM activity
-- If last date is 2019-07-27, then the first date is 2019-06-28. We filter the activity records to include only those within the specified date range.
WHERE activity_date >= '2019-06-28'
  AND activity_date <= '2019-07-27'
-- Group the results by activity_date and order them chronologically.
GROUP BY activity_date
ORDER BY activity_date;