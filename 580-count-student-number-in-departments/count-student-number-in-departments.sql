# Write your MySQL query statement below

SELECT
    d.dept_name,
    coalesce(count(distinct s.student_id), 0) as student_number
FROM
    Department d
LEFT JOIN
    Student s
ON
    d.dept_id = s.dept_id
GROUP BY
    1
ORDER BY
    student_number desc, dept_name asc