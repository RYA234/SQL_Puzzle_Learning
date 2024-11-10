-- その２答え
-- case式を使用
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

-- 各テーブルがどのageに分類されるか確認する
SELECT *,(cast( '20070601' as date ) - bill_date) as diff
	,CASE WHEN cast( '20070601' as date ) - bill_date BETWEEN '0'  AND '30' THEN 'age1'
		  WHEN cast( '20070601' as date ) - bill_date BETWEEN '31'  AND '60' THEN 'age2'
	 	  WHEN cast( '20070601' as date ) - bill_date BETWEEN '61'  AND  '90' THEN 'age3'
		  WHEN cast( '20070601' as date ) - bill_date > '91' THEN 'age4'
		  ELSE '' END
FROM FriendsOfPepperoni;
