# Write your MySQL query statement below
SELECT
    round(avg(n.num), 1) as median
FROM
    Numbers n
WHERE
    n.frequency >= abs((select sum(frequency) from Numbers where num <= n.num)-(select sum(frequency) from Numbers where num >= n.num))