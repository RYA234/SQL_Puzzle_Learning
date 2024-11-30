-- 32 税金の計算　その2
-- 答え
SELECT SUM(T2.tax_rate)
FROM TaxAuthorities AS T1, TaxRates AS T2
	WHERE T1.tax_area = 'city2'
    AND T2.tax_authority = T1.tax_authority
	AND T2.effect_date =
	(SELECT MAX(effect_date)
	FROM TaxRates
	WHERE tax_authority = T2.tax_authority
	AND effect_date <= '1994-11-01'
	)
;


-- クロス結合を作る
SELECT *
FROM TaxAuthorities AS T1, TaxRates AS T2
-- ↓ 検索条件　市
	WHERE T1.tax_area = 'city2'
-- ↓ 結合条件
    AND T2.tax_authority = T1.tax_authority
;


--日付の条件も絞る
SELECT *
FROM TaxAuthorities AS T1, TaxRates AS T2
--  ↓ 検索条件　市
	WHERE T1.tax_area = 'city2'
-- ↓ 結合条件
    AND T2.tax_authority = T1.tax_authority
--  ↓ 検索条件　日付
	AND T2.effect_date =
	(SELECT MAX(effect_date)
	FROM TaxRates
	WHERE tax_authority = T2.tax_authority
	AND effect_date <= '1994-11-01'
	)
;

