-- 25 マイルストーン　p110 その４
-- CASE式とGROUP BY 極値関数の組み合わせで、列→行　変換
-- MAXを使うことによって部分集合からnullじゃない値を取得できる
SELECT order_nbr,
	MAX(CASE WHEN sch_seq = '1'
		THEN sch_date
		ELSE NULL END) AS processed,
	MAX(CASE WHEN sch_seq ='2'
		THEN sch_date
		ELSE NULL END) AS completd,
	MAX(CASE WHEN sch_seq ='3'
		THEN sch_date
		ELSE NULL END) AS confirmed
FROM ServicesSchedule
WHERE service_type = '01'
AND order_nbr = '4155526710'
GROUP BY order_nbr
;



-- GROUP BY が無い場合
SELECT order_nbr,
	(CASE WHEN sch_seq = '1'
		THEN sch_date
		ELSE NULL END) AS processed,
	(CASE WHEN sch_seq ='2'
		THEN sch_date
		ELSE NULL END) AS completd,
	(CASE WHEN sch_seq ='3'
		THEN sch_date
		ELSE NULL END) AS confirmed
FROM ServicesSchedule
WHERE service_type = '01'
AND order_nbr = '4155526710'
;