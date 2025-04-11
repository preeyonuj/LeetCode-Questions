# Write your MySQL query statement below
with cte_1 as
(
    select
        person_id,
        person_name,
        weight,
        turn,
        sum(weight) over(order by turn) as cum_weight
    from
        Queue
    order by
        turn
)
select
    person_name
from
    cte_1
where
    cum_weight <= 1000
order by
    turn desc
limit 1
