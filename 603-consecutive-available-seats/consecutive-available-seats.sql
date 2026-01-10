# Write your MySQL query statement below
select
    seat_id
from
(
    select
        seat_id,
        free,
        lead(free, 1, 0) over () as next_seat,
        lag(free, 1, 0) over () as prev_seat
    from
        Cinema
) a
where
    free = 1 and
    (next_seat = 1 or prev_seat = 1)

order by
    seat_id asc