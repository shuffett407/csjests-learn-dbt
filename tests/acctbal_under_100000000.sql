SELECT c_acctbal
FROM (
  SELECT SUM(ID) AS c_acctbal
  FROM  `dbt-tutorial.jaffle_shop.customers`
  )
WHERE 
  c_acctbal >= 100000000