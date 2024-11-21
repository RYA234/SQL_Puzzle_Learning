--答え
-- WHERE句は要件で取得したい行の情報
SELECT *
FROM (Units AS U1 LEFT OUTER JOIN Tenants AS T1
    ON U1.unit_nbr = T1.unit_nbr
    AND T1.vacated_date IS NULL
    AND U1.complex_id=32)
    LEFT OUTER JOIN RentPayments AS RP1
    ON(T1.tenant_id = RP1.tenant_id
    AND U1.unit_nbr = RP1.unit_nbr )
WHERE RP1.payment_date BETWEEN  '2006-03-01' AND '2009-03-07'
OR RP1.payment_date IS NULL
	;

-- 途中式

--　部屋とテナントテーブル結合
-- 部屋と借り主の組み合わせを求める
-- 今回の場合だと unit_nb=3はvadate
SELECT * 
	FROM  (Units AS U1
	LEFT OUTER JOIN Tenants AS T1
	ON U1.unit_nbr = T1.unit_nbr
    AND T1.vacated_date IS NULL
    AND U1.complex_id=32
	);


-- 家賃テーブルを結合
SELECT *
FROM (Units AS U1 LEFT OUTER JOIN Tenants AS T1
    ON U1.unit_nbr = T1.unit_nbr
    AND T1.vacated_date IS NULL
    AND U1.complex_id=32)
    LEFT OUTER JOIN RentPayments AS RP1
    ON(T1.tenant_id = RP1.tenant_id
    AND U1.unit_nbr = RP1.unit_nbr )
	;