-- SELECT S1.customer_name, S1.sale_date, 
--         (SELECT MAX(sale_date) 
--          FROM Sales AS S2
--          WHERE S1.customer_name = S2.customer_name
--          AND S2.sale_date < S1.sale_date)
--          FROM Sales AS S1
--          ;


 -- SELECT S1.customer_name,S1.sale_date,S2.sale_date
 -- FROM Sales AS S1,Sales AS S2
 -- WHERE S1.customer_name = S2.customer_name
 -- AND S2.sale_date < S1.sale_date
 -- ;


SELECT  S1.customer_name,S1.sale_date,
		(SELECT max(sale_date)  
         FROM Sales AS S2
         WHERE S1.customer_name = S2.customer_name
         AND S2.sale_date < S1.sale_date) as latest_date,
　　-- 
		(SELECT count(sale_date)
         FROM Sales AS S2
         WHERE S1.customer_name = S2.customer_name
         AND S2.sale_date < S1.sale_date)
	-- salegaps viewに相当する
		,S1.sale_date - 		
		(SELECT max(sale_date)  
         FROM Sales AS S2
         WHERE S1.customer_name = S2.customer_name
         AND S2.sale_date < S1.sale_date) as day_diff
         FROM Sales AS S1
         ;



 -- SELECT S1.customer_name,S1.sale_date,MAX(S2.sale_date)
 -- FROM Sales AS S1,Sales AS S2
 -- WHERE S1.customer_name = S2.customer_name
 -- AND S2.sale_date < S1.sale_date
 -- ;	
