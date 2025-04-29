# Write your MySQL query statement below
SELECT
    player_id,
    event_date,
    SUM(games_played) OVER(PARTITION BY player_id ORDER BY event_date RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW ) as games_played_so_far
FROM
    Activity