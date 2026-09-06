-- Write an SQL query to report the percentage of users who have attended each contest. The percentage should be rounded to 2 decimal places.

select r.contest_id,
-- to calculate the percentage of users who have attended each contest, we need to count the number of unique users who have registered 
-- for that contest and divide it by the total number of users in the Users table. We then multiply by 100 to get the percentage and round it to 2 decimal places.
Round(
    Count(r.user_id) * 100.0/(Select Count(*) from Users), 2
) as percentage
from Register r
group by r.contest_id
order by percentage desc, r.contest_id asc;