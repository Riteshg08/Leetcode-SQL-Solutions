--  Write your MySQL query statement below

-- Establishing the whole group means that day sum
WITH daily AS (
    SELECT visited_on,
    SUM(amount) AS daily_amount
    FROM customer
    GROUP BY visited_on
),
rolling AS (
    SELECT visited_on,
    -- calculating sum of 7 days
    SUM(daily_amount) OVER (
        ORDER BY visited_on
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS amount,
    -- calculating average for 7 days
    AVG(daily_amount) OVER (
        ORDER BY visited_on
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS average_amount,
    -- Assigning the row number so that we can get values conatining 7 days info
    ROW_NUMBER() OVER (
         ORDER BY visited_on
    ) AS rnk
    FROM daily
)
SELECT visited_on,amount,ROUND(average_amount,2) AS average_amount
FROM rolling
WHERE rnk>=7;
