SELECT 
      t1.orderid,
      t2.order_date, 
      t1.id AS paymentid,
      -- amount is stored in cents, convert it to dollars      
      t1.amount / 100 AS amountpd, 
      SUM(amount / 100) OVER (ORDER BY order_date, t1.id) AS runningtotal
FROM  `dbt-tutorial.stripe.payment` t1, 
      `dbt-tutorial.jaffle_shop.orders` t2
WHERE t1.orderid = t2.id
AND   t1.status = 'success'