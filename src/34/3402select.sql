-- 34 コンサルタントの請求書　その２
SELECT emp_name,SUM(H1.bill_hrs * B1.bill_rate)
FROM Consultants AS C1,Billings AS B1, Hoursworked AS H1
WHERE C1.emp_id = B1.emp_id
AND C1.emp_id = H1.emp_id
AND bill_date = (SELECT MAX(bill_date)
                FROM Billings AS B2
                WHERE B2.emp_id = C1.emp_id
                AND B2.bill_date <= H1.work_date)
AND H1.work_date >= bill_date
GROUP BY emp_name;


--　where句のサブクエリをSELECT句に持っていき実際の値を確認する
SELECT emp_name,C1.emp_id,H1.work_date,bill_date,
	(SELECT MAX(bill_date)
                FROM Billings AS B2
                WHERE B2.emp_id = C1.emp_id
                AND B2.bill_date <= H1.work_date
	
	) as max_date,
	H1.bill_hrs,B1.bill_rate
FROM Consultants AS C1,Billings AS B1, Hoursworked AS H1
WHERE C1.emp_id = B1.emp_id
AND C1.emp_id = H1.emp_id
-- GROUP BY emp_name
;

-- AND bill_date = (SELECT MAX(bill_date)　以下略　を加える
-- bill_date< work_dateとなるレコードを取り出す
SELECT emp_name,C1.emp_id,H1.work_date,bill_date,
	(SELECT MAX(bill_date)
                FROM Billings AS B2
                WHERE B2.emp_id = C1.emp_id
                AND B2.bill_date <= H1.work_date
	
	) as max_date,
	H1.bill_hrs,B1.bill_rate
FROM Consultants AS C1,Billings AS B1, Hoursworked AS H1
WHERE C1.emp_id = B1.emp_id
AND C1.emp_id = H1.emp_id
AND bill_date = (SELECT MAX(bill_date)
                FROM Billings AS B2
                WHERE B2.emp_id = C1.emp_id
                AND B2.bill_date <= H1.work_date)
--↓の条件要らない？？？？
--AND H1.work_date >= bill_date
;