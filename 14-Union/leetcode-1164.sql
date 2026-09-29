-- Product price at a given date

SELECT product_id, new_price AS price
FROM products
WHERE (product_id, change_date) IN (
    SELECT product_id, MAX(change_date)
    FROM products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
)
-- It will return the products whose change_date is the maximum change_date for that product_id and less than or equal to '2019-08-16'

UNION

SELECT DISTINCT product_id, 10 AS price
FROM products
WHERE product_id NOT IN (
    SELECT product_id
    FROM products
    WHERE change_date <= '2019-08-16'
);
-- In this if change_date of a product is greater than the given date, then it will return the product with price 10.