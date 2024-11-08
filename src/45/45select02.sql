SELECT cust_id,
        SUM(CASE WHEN bill_date
                       BETWEEN cast( '20070601' as date )  - INTERVAL '30' DAY
                            AND cast( '20070601' as date )
                       THEN pizza_amt ELSE 0.00 END) AS age1,
        SUM(CASE WHEN bill_date
                      BETWEEN cast( '20070601' as date ) - INTERVAL '60' DAY
                            AND cast( '20070601' as date ) - INTERVAL '31' DAY
                        THEN pizza_amt ELSE 0.00 END) AS age2,
        SUM(CASE WHEN bill_date
                      BETWEEN cast( '20070601' as date )- INTERVAL '90' DAY
                            AND cast( '20070601' as date ) - INTERVAL '61' DAY
                      THEN pizza_amt ELSE 0.00 END) AS age3,
        SUM(CASE WHEN bill_date < cast( '20070601' as date )  - INTERVAL '91' DAY
                      THEN pizza_amt ELSE 0.00 END) AS age4
        FROM FriendsOfPepperoni
        GROUP BY cust_id
        ORDER BY cust_id;