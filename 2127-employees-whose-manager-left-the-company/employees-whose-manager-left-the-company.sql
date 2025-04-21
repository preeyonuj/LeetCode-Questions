# Write your MySQL query statement below
SELECT
    employee_id
FROM
    Employees
WHERE
    manager_id is not null and manager_id not in (select distinct employee_id from Employees) and salary < 30000
order by
    1