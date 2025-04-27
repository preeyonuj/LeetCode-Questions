# Write your MySQL query statement below
select
    player_id,
    device_id
from
(
    select
        player_id,
        device_id,
        rank() over(partition by player_id order by event_date) as rnk
    from
        Activity
    order by
        3
) a
where rnk = 1