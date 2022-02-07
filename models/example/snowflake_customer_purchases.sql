with sample_customer as (
  SELECT *
  FROM {{ source('sample3', 'customers') }}
),

sample_orders as (
  SELECT *
  FROM {{ source('sample3', 'orders') }}
)

SELECT
    c.id as c_custkey,
    c.last_name as name,
    c.first_name as nation,
    sum(o.id) as total_order_price
from sample_customer c
LEFT JOIN sample_orders o
ON c.id = o.user_id
where o.id is not null

{{group_by(3)}}