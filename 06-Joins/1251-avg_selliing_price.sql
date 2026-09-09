-- leetcode 1251. Average Selling Price

SELECT p.product_id,
-- We use COALESCE to handle cases where there are no units sold for a product, which would result in a NULL average price. 
-- By using COALESCE, we can return 0 instead of NULL in such cases. We calculate the average selling price by dividing the 
-- total revenue (SUM(p.price * u.units)) by the total units sold (SUM(u.units)). The ROUND function is used to round the average price to 2 decimal places for better readability.
-- It calculate total revenue for one product and also the total units then perform division.
       COALESCE(ROUND(SUM(p.price * u.units) / SUM(u.units), 2),0) AS average_price
FROM Prices p
-- We perform left join because we want to include all products from the Prices table, even if they have no corresponding records in the UnitsSold table.
-- The join condition ensures that we only consider units sold for a product within the specified date range defined by the start_date and end_date in the Prices table.
LEFT JOIN UnitsSold u
    ON p.product_id = u.product_id
    AND u.purchase_date BETWEEN p.start_date AND p.end_date
-- We group the results by product_id to calculate the average selling price for each product. 
-- This allows us to aggregate the total revenue and total units sold for each product, which is necessary for calculating the average price.
GROUP BY p.product_id;