-- Having句を使って、部分集合の条件指定する　　達人　p111 Having句でサブクエリ
-- 関係除算ではない？？？？
SELECT S1.clerk_name,P1.promo_name,
       SUM(S1.sale_amt) AS sales_tot
       FROM Sales AS S1, Promotions AS P1
       WHERE S1.sale_date BETWEEN P1.start_date AND P1.end_date
       GROUP BY P1.promo_name,P1.start_date,P1.end_date
       HAVING SUM(S1.sale_amt) >= ALL(
        SELCT SUM(S2.sale_amt)
        FROM Sales AS S2
        WHERE S2.sale_date
              BETWEEN P1.start_date AND P1.end_date
                      AND S2.clerk_name <> S1.clerk_name
        GROUP BY S2.clerk_name);