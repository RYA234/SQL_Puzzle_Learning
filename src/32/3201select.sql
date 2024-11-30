-- 32 税金の計算　その１
SELECT 'city2' AS city, '1994-11-01' AS effect_date,
	SUM(tax_rate) as total_taxes
FROm TaxRates AS R1
WHERE R1.effect_date =
(SELECT MAX(R2.effect_date)
    FROM TaxRates AS R2
    WHERE R2.Effect_date <= '1994-11-01'
    AND R1.tax_authority = R2.tax_authority)
    And R1.tax_authority IN
        ( select tax_authority
            from TaxAuthorities AS A1
            where A1.tax_area = 'city2')
group by tax_authority,effect_date;

-- where句の非相関サブクエリを、SELECTに移し実際のレコードを確認する
-- tax_authority毎のR2.Effect_date <= '1994-11-01'　かつ最大値のeffect_dateを取得している。
SELECT 'city2' AS city, '1994-11-01' AS effect_date_1,tax_rate,
	R1.effect_date,
	(SELECT MAX(R2.effect_date)
    FROM TaxRates AS R2
    WHERE R2.Effect_date <= '1994-11-01'
    AND R1.tax_authority = R2.tax_authority
	)  as sub_query_max_date,
	tax_authority,
	(SELECT MAX(R4.tax_authority)
    FROM TaxRates AS R4
    WHERE R4.Effect_date <= '1994-11-01'
    AND R1.tax_authority = R4.tax_authority
	)  as sub_query_r2_tax_autho
FROm TaxRates AS R1
;

-- where句にR1.effect_date =　サブクエリを加える
-- '1994-11-01'より前で最も近いレコードを条件指定する
SELECT 'city2' AS city, '1994-11-01' AS effect_date_1,
	R1.effect_date,tax_rate,tax_authority
FROm TaxRates AS R1
WHERE R1.effect_date =
(SELECT MAX(R3.effect_date)
    FROM TaxRates AS R3
    WHERE R3.Effect_date <= '1994-11-01'
    AND R1.tax_authority = R3.tax_authority
	)
;


-- 答え
-- Whereに　INを加える
SELECT 'city2' AS city, '1994-11-01' AS effect_date_1,
	R1.effect_date,tax_rate,tax_authority
FROm TaxRates AS R1
WHERE R1.effect_date =
(SELECT MAX(R3.effect_date)
    FROM TaxRates AS R3
    WHERE R3.Effect_date <= '1994-11-01'
    AND R1.tax_authority = R3.tax_authority
	)
    And R1.tax_authority IN
        ( select tax_authority
            from TaxAuthorities AS A1
            where A1.tax_area = 'city2')
;

-- in句以下の相関サブクエリ
 select tax_authority
            from TaxAuthorities AS A1
            where A1.tax_area = 'city2'
;