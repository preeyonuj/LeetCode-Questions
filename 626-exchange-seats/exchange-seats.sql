# Write your MySQL query statement below
WITH CTE_1 AS
(
    SELECT
        a.id,
        a.student,
        LAG(id) OVER(ORDER BY id) as prev_id,
        LAG(student) OVER(ORDER BY id) as prev_student,
        LEAD(id) OVER(ORDER BY id) as next_id,
        LEAD(student) OVER(ORDER BY id) as next_student
    FROM
        Seat a
)
SELECT
    id,
    CASE
    WHEN prev_id is null and next_id is null THEN student
    WHEN prev_id is null THEN next_student
    WHEN next_id is null AND id % 2 <> 0 THEN student
    WHEN id % 2 <> 0 THEN next_student 
    WHEN id % 2 = 0 THEN prev_student 
    END AS student
FROM
    CTE_1;
-- SELECT * FROM CTE_1;