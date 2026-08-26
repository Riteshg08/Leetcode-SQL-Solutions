
SELECT 
    month,
    country,
    trans_count,
    approved_count,
    trans_total_amount,
    approved_total_amount

FROM (

    -- Create month from the transaction date
    -- Example: 2018-12-18 becomes 2018-12
    SELECT DISTINCT
        DATE_FORMAT(trans_date, '%Y-%m') AS month,
        country,

        -- Count all transactions for each month and country
        COUNT(*) OVER (
            PARTITION BY DATE_FORMAT(trans_date, '%Y-%m'), country
        ) AS trans_count,

        -- Count only approved transactions
        -- In MySQL, true = 1 and false = 0
        SUM(state = 'approved') OVER (
            PARTITION BY DATE_FORMAT(trans_date, '%Y-%m'), country
        ) AS approved_count,

        -- Add the amount of all transactions
        SUM(amount) OVER (
            PARTITION BY DATE_FORMAT(trans_date, '%Y-%m'), country
        ) AS trans_total_amount,

        -- Add amount only when the transaction is approved
        -- For other transactions, we add 0
        SUM(
            CASE
                WHEN state = 'approved' THEN amount
                ELSE 0
            END
        ) OVER (
            PARTITION BY DATE_FORMAT(trans_date, '%Y-%m'), country
        ) AS approved_total_amount

    -- Get the data from Transactions table
    FROM Transactions

-- Give the inner query a name
) t;