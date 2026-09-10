-- leetcode-626. Exchange Seats
-- problem ask to exchange the seat of students in a classroom. The students are seated in a row, and each student has a unique ID. 
-- The goal is to swap the seats of adjacent students. If there is an odd number of students, the last student will remain in their original seat.

SELECT id,student
FROM (
    SELECT student,
        CASE 
        -- In first case, we check if the total number of students (cnt) is odd and if the current student is the last one (LEAD(id) OVER () IS NULL).
        -- If both conditions are true, we keep the last student's seat unchanged by returning their original id.
              WHEN cnt%2 = 1 AND LEAD(id) OVER () IS NULL THEN id
        -- In the second case, we check if the current student's id is even (id%2 = 0). If it is, we swap their seat with the next student by returning id-1.
        -- In the third case, we check if the current student's id is odd (id%2 = 1). If it is, we swap their seat with the previous student by returning id+1.
              WHEN id%2 = 0 THEN id-1
              WHEN id%2 = 1 THEN id+1
        END AS id
    -- Here, we use a subquery to calculate the total number of students (cnt) by selecting the maximum id for each student and grouping by id.
    -- Using Group by with MAX(id) gives us max id for each student, which is used to determine the total count of students in the classroom.
    FROM (
        SELECT id,student,MAX(id) AS cnt
        FROM seat
        GROUP BY id
    ) s
) t
ORDER BY id;

-- Better and Simple approach
/*
SELECT
    CASE
        WHEN id = (SELECT MAX(id) FROM Seat)
             AND id % 2 = 1
        THEN id
        WHEN id % 2 = 1
        THEN id + 1
        ELSE id - 1
    END AS id,
    student
FROM Seat
ORDER BY id;
*/