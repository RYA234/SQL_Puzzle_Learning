-- 44　商品のペア　１
-- CASE式を使って順列→組み合わせに変換
SELECT s1, s2, SUM(pair_tally)
FROM (SELECT CASE WHEN item_a <= item_b
				  THEN item_a
				  ELSE item_b END,
			 CASE WHEN item_a <= item_b
				  THEN item_b
				  ELSE item_a END,
			 pair_tally
		FROM SalesSlips) AS Report (s1,s2,pair_tally)
GROUP BY s1,s2;

-- item_a > item_bの場合 item_aとitem_bを交換する。
--全てのレコードに対してs1 <= s2がなるので、s1,s2で部分集合を取ったときの件数が組み合わせの数になる。 
SELECT *
FROM (SELECT item_a,item_b,
			 CASE WHEN item_a <= item_b
				  THEN item_a
				  ELSE item_b END,
			 CASE WHEN item_a <= item_b
				  THEN item_b
				  ELSE item_a END,
			 pair_tally
		FROM SalesSlips) AS Report (item_a,item_b,s1,s2,pair_tally)
;