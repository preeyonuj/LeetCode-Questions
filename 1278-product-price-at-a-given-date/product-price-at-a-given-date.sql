# Write your MySQL query statement below
WITH cte_1 as
(
    SELECT
        product_id, new_price as price,
        rank() over(partition by product_id order by change_date desc) as rnk
    FROM
        Products
    WHERE
        change_date <= '2019-08-16'
)
(
    SELECT
        distinct
        product_id, price
    FROM
        cte_1
    WHERE
        rnk = 1
)
UNION ALL
(
    SELECT
        distinct
        product_id, 10 as price
    FROM
        Products
    WHERE
        product_id not in (select distinct product_id from cte_1)
)