select  
      c_custkey,
      c_name,
      c_nationkey as nation
  from (select  1 as c_custkey,                
                2 as c_name,
                3 as c_nationkey
        )
        
{{group_by(3)}}

/*

SELECT
    c.c_custkey,
    c.c_name,
    c.c_nationkey as nation,
    sum(o.o_totalprice) as total_order_price
from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."CUSTOMER" c
LEFT JOIN "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."ORDERS" o
ON c.c_custkey = o.o_custkey

group_by
    c.c_custkey,
    c.c_name,
    c.c_nationkey
*/