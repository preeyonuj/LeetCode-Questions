# Write your MySQL query statement below
WITH ranks as
(
    select 
        id, company, salary,
        row_number() over(partition by company order by salary) as rn
    from
        Employee
),
counts as
(
    select
        company,
        count(distinct id) as cnt
    from
        Employee
    group by
        1
)

select 
    r.id, r.company, r.salary
from
    ranks r
join
    counts c
on
    r.company = c.company and
    r.rn between c.cnt/2 and c.cnt/2 + 1
