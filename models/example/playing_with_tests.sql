with sample_customer as (
    select * 
    from {{ source('sample2', 'snowflake_customer_purchases') }}
)

select
        c_custkey,
        name,
        nation
from sample_customer        