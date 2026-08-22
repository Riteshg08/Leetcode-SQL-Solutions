SELECT p.firstName as firstName,
       p.lastName as lastName,
       a.city as city,
       a.state as state
FROM person AS p
LEFT JOIN address AS a
  ON p.personId = a.personId;
--   left join is used to get all the records from the left table and matching records from the right table. 
-- If there is no match, NULL values will be returned for columns from the right table.