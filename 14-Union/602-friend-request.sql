-- leetcode - 602. Friend Requests II: Who Has the Most Friends
-- we have to return id with the most friends, if there are multiple ids with same number of friends then return the smallest id
SELECT id, COUNT(*) AS num
-- we are using union all because we want to count both accepter and requester as friends
-- means the accepter and requester both are friends of each other so we have to count both of them
FROM (
    SELECT accepter_id AS id
    FROM RequestAccepted

    UNION ALL

    SELECT requester_id AS id
    FROM RequestAccepted
) x
GROUP BY id
ORDER BY num DESC, id ASC
LIMIT 1;