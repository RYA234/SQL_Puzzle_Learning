-- 19 セールスマンの売上ランキング その１
SELECT S0.district_nbr,S0.sales_person
FROM SalesData as S1, SalesData AS S0
WHERE S0.district_nbr = S1.district_nbr
AND S0.sales_amt <= S1.sales_amt
GROUP BY S0.district_nbr,S0.sales_person
HAVING COUNT(DISTINCT S1.sales_person) <= 3
ORDER BY S0.district_nbr,S0.sales_person	
;


-- 自己結合で地区番号毎の重複順列を作る。
-- 6*6(地区番号１) + 4*4(地区番号2) + 2*2(地区番号3) + 5*5(地区番号4) = 81
-- レコード数は81になる。
SELECT *
FROM SalesData as S1, SalesData AS S0
WHERE S0.district_nbr = S1.district_nbr
;


-- 部分集合を作る前のレコード
-- S0.sales_person以上に売上を出しているS1.sale_personを表示する。
SELECT S0.district_nbr,S0.sales_person,S1.sales_person,S0.sales_amt,S1.sales_amt
FROM SalesData as S1, SalesData AS S0
WHERE S0.district_nbr = S1.district_nbr
AND (S0.sales_amt < S1.sales_amt 
	 OR S0.sales_amt = S1.sales_amt
	)
	ORDER BY S0.district_nbr,S0.sales_person
;
  
-- 部分集合を作る前のレコード
-- COUNT(DISTINCT S1.sales_person)　＝自分を含む上位のセールスマンの人数 
--  1の時：一位　２：２位　３：３位
SELECT S0.district_nbr,S0.sales_person,COUNT(DISTINCT S1.sales_person) as Ranking
FROM SalesData as S1, SalesData AS S0
WHERE S0.district_nbr = S1.district_nbr
AND (S0.sales_amt < S1.sales_amt 
	 OR S0.sales_amt = S1.sales_amt
	)
GROUP BY S0.district_nbr,S0.sales_person	
;
  

