-- 36 １人２役　その１
-- 答え
SELECT R1.person,MIN(R1.role)
FROM Roles AS R1
WHERE R1.role IN ('D','O')
GROUP BY R1.person
HAVING COUNT(DISTINCT R1.role) = 1
UNION
	SELECT R2.person,'B'
		FROM Roles AS R2
	WHERE R2.role IN('D','O')
	GROUP BY R2.person
	HAVING  COUNT(DISTINCT R2.role) = 2
;

-- Having句を外して、部分集合を確認する
-- この時点でrole='D' or 'O'を弾く
SELECT R1.person,MIN(R1.role) as first_role,MAX(R1.role) as second_role,COUNT(DISTINCT R1.role)
FROM Roles AS R1
WHERE R1.role IN ('D','O')
GROUP BY R1.person
;


-- UNION前のSQLを確認
-- roleを１つ持っている　Jones Whiteを取得する
-- distinct要らない？？？
SELECT R1.person,MIN(R1.role),COUNT(DISTINCT R1.role)
FROM Roles AS R1
WHERE R1.role IN ('D','O')
GROUP BY R1.person
HAVING COUNT(DISTINCT R1.role) = 1
;


-- UNION後のSQLを確認
-- roleを２つ持っているsmithを取得する
SELECT R2.person,'B',COUNT(R2.role)
	FROM Roles AS R2
WHERE R2.role IN('D','O')
GROUP BY R2.person
HAVING  COUNT(R2.role) = 2
;
