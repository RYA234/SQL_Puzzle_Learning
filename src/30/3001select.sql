DROP VIEW IF EXISTS LastSales;
CREATE VIEW LastSales
(customer_name,this_sale_date,last_sale_date)
AS SELECT S1.customer_name, S1.sale_date, 
        (SELECT MAX(sale_date) 
         FROM Sales AS S2
         WHERE S1.customer_name = S2.customer_name
         AND S2.sale_date < S1.sale_date)
         FROM Sales AS S1
         ;

DROP VIEW IF EXISTS SalesGap;
CREATE VIEW SalesGap (customer_name,gap)
AS SELECT customer_name,DAYS(this_sale_date,last_saledate)
FROM Lastsales;