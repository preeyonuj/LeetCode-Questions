SELECT
    a.id,
    CASE
        WHEN a.id % 2 = 0 THEN c.student
        WHEN a.id % 2 <> 0 and b.id IS NOT NULL THEN b.student
        ELSE a.student
        END as student
FROM
    Seat a
LEFT JOIN
    Seat b
ON
    a.id = b.id-1
LEFT JOIN
    Seat c
ON
    a.id = c.id+1