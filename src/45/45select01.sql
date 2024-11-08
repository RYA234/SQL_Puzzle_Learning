SELECT cust_id,'0-30 days =' AS age,SUM(pizza_amt)
FROM FriendSOfPepperoni
WHERE bill_date BETWEEN (cast( '20070601' as date ) -INTERVAL '30' DAY)
      AND cast( '20070601' as date )
GROUP BY cust_id
UNION ALL
SELECT cust_id,'31-60 days =' AS age,SUM(pizza_amt)
FROM FriendSOfPepperoni
WHERE bill_date BETWEEN (cast( '20070601' as date ) -INTERVAL '60' DAY)
      AND (cast( '20070601' as date)  -INTERVAL '31')
GROUP BY cust_id	
UNION ALL
SELECT cust_id,'61-90 days =' AS age,SUM(pizza_amt)
FROM FriendSOfPepperoni
WHERE bill_date BETWEEN (cast( '20070601' as date ) -INTERVAL '90' DAY)
      AND (cast( '20070601' as date ) -INTERVAL '61')
GROUP BY cust_id
UNION ALL
SELECT cust_id,'90+ days =' AS age,SUM(pizza_amt)
FROM FriendSOfPepperoni
WHERE bill_date < (cast( '20070601' as date ) - INTERVAL '90' DAY)
GROUP BY cust_id
ORDER BY cust_id,age
;

-- SELECT cust_id,
--         SUM(CASE WHEN bill_date
--                        BETWEEN cast( '20070601' as date )  - INTERVAL '30' DAY
--                             AND cast( '20070601' as date )
--                        THEN pizza_amt ELSE 0.00 END) AS age1,
--         SUM(CASE WHEN bill_date
--                       BETWEEN cast( '20070601' as date ) - INTERVAL '60' DAY
--                             AND cast( '20070601' as date ) - INTERVAL '31' DAY
--                         THEN pizza_amt ELSE 0.00 END) AS age2,
--         SUM(CASE WHEN bill_date
--                       BETWEEN cast( '20070601' as date )- INTERVAL '90' DAY
--                             AND cast( '20070601' as date ) - INTERVAL '61' DAY
--                       THEN pizza_amt ELSE 0.00 END) AS age3,
--         SUM(CASE WHEN bill_date < cast( '20070601' as date )  - INTERVAL '91' DAY
--                       THEN pizza_amt ELSE 0.00 END) AS age4
--         FROM FriendsOfPepperoni
--         GROUP BY cust_id
--         ORDER BY cust_id;