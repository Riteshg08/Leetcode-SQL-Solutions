-- 1378 - Replace Employee ID With The Unique Identifier

SELECT em.unique_id,e.name
FROM employees e
-- we use left join because we want whole data of employees even if it does not have unique id
-- even if id does not matches the name will be shown due to left join
LEFT JOIN employeeUNI em
 ON e.id = em.id;
-- It matches the each id from employees with all the ids in the employeeUNI if it matches then only we mention unique_id otherwise null will be shown