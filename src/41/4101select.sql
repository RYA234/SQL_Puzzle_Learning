-- p174 41 予算　方法　その１
SELECT * FROM
    (SELECT I1.item_nbr,I1.item_descr,
        (SELECT SUM(A1.actual_amt)
            FROM Actuals AS A1
            WHERE I1.item_nbr = A1.item_nbr) AS tot_act,
        (SELECT SUM(E1.estimated_amt)
            FROM Estimates AS E1
            WHERE I1.item_nbr = E1.item_nbr) AS estimate_tot,
        (SELECT CASE WHEN COUNT(*) = 1
                     THEN MAX(check_nbr)
                     ELSE 'Mixed' END
                FROM  Actuals AS A2
                WHERE I1.item_nbr = A2.item_nbr
                GROUP BY item_nbr) AS check_nbr
FROM Items I1) AS TMP
WHERE tot_act IS NOT NULL
    OR estimate_tot IS NOT NULL;

-- CASE部分がある呼ぶクエリのみ抜粋
-- item_nbr=40 50 は存在しない、他のサブクエリと結合すると、case部分の値はnullとなる
SELECT I1.item_nbr,MIN(check_nbr) as check_nbr_first,MAX(check_nbr) as check_nbr_second,
	CASE WHEN COUNT(*) = 1
                     THEN MAX(check_nbr)
                     ELSE 'Mixed' END
                FROM  Actuals AS A2,Items AS I1
                WHERE I1.item_nbr = A2.item_nbr
                GROUP BY I1.item_nbr
;
-- 最初のFROM句以下の内容
SELECT I1.item_nbr,I1.item_descr,
	(SELECT SUM(A1.actual_amt)
		FROM Actuals AS A1
		WHERE I1.item_nbr = A1.item_nbr) AS tot_act,
	(SELECT SUM(E1.estimated_amt)
		FROM Estimates AS E1
		WHERE I1.item_nbr = E1.item_nbr) AS estimate_tot,
	(SELECT CASE WHEN COUNT(*) = 1
				 THEN MAX(check_nbr)
				 ELSE 'Mixed' END
			FROM  Actuals AS A2
			WHERE I1.item_nbr = A2.item_nbr
			GROUP BY item_nbr) AS check_nbr
	FROM Items I1
	-- この時点では、SELECT句になっておりFROM句の内容ではないので、WHERE句を使えない
	-- WHERE句で条件指定するためFROM句のサブクエリとして使っている
	-- WHERE tot_act IS NOT NULL -- エラーになる。FROMのテーブルにtot_actがないため
	--  OR estimate_tot IS NOT NULL -- エラーになる　FROMのテーブルにtot_actがないため
		;
-- 答えのSQLからWHERE式を取り除いた部分
--  FROM句のサブクエリと同じ結果になることを確認できる。
SELECT * FROM
    (SELECT I1.item_nbr,I1.item_descr,
        (SELECT SUM(A1.actual_amt)
            FROM Actuals AS A1
            WHERE I1.item_nbr = A1.item_nbr) AS tot_act,
        (SELECT SUM(E1.estimated_amt)
            FROM Estimates AS E1
            WHERE I1.item_nbr = E1.item_nbr) AS estimate_tot,
        (SELECT CASE WHEN COUNT(*) = 1
                     THEN MAX(check_nbr)
                     ELSE 'Mixed' END
                FROM  Actuals AS A2
                WHERE I1.item_nbr = A2.item_nbr
                GROUP BY item_nbr) AS check_nbr
FROM Items I1) AS TMP;