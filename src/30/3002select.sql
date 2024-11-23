-- 30 買い物の平均サイクル　解法２
SELECT customer_name,
		(MAX(sale_date) -  MIN(sale_date)) as dividend_sales,
		(COUNT(*)-1) as divisor_day,
		(MAX(sale_date) -  MIN(sale_date))/(COUNT(*)-1) as avg_sales_per_day
FROM Sales
GROUP BY customer_name
HAVING COUNT(*) > 1;