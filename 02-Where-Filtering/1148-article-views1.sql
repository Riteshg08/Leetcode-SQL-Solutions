-- We want all the author who have viewed their own articles atleast once.
--  The result should be sorted by author_id in ascending order.
SELECT DISTINCT author_id AS id
FROM views v
WHERE author_id = viewer_id
ORDER BY author_id;