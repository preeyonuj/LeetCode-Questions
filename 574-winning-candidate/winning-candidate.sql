# Write your MySQL query statement below
SELECT
    (SELECT name from Candidate where v.candidateId = id) as name
FROM
    Vote v
GROUP BY
    1
ORDER BY
    COUNT(id) DESC
LIMIT 1