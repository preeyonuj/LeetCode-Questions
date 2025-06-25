# Write your MySQL query statement below
SELECT
    AVG(num) as median
FROM
    (
        SELECT
            *,
            SUM(frequency) OVER (ORDER BY num) as left_cumul,
            SUM(frequency) OVER (ORDER BY num DESC) as right_cumul,
            SUM(frequency) OVER () as total
        FROM
            Numbers
    ) n
WHERE
    n.left_cumul >= n.total/2 AND
    n.right_cumul >= n.total/2