-- leetcode 1527. Patient With a Condition
-- The problem is to find all patients who have a specific medical condition that has prefix DIAB1.

SELECT patient_id,patient_name,conditions
FROM patients
WHERE conditions LIKE "DIAB1%"
 OR conditions LIKE "% DIAB1%";

-- % - means we can add any number of characters including zeros
-- _ - means only one character can be added
-- so all the words that have prefix DIAB1 will be taken 