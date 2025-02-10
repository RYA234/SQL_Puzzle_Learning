DROP VIEW IF EXISTS HourRateRpt;
CREATE VIEW HourRateRpt
(emp_id,emp_name,work_date,bill_hrs,bill_rate)
AS SELECT H1.emp_id, emp_name,work_date,bill_hrs,
	(SELECT bill_rate
	FROM Billings AS B1
	WHERE bill_date = (select max(bill_date)
						FROM Billings AS B2
						WHERE B2.bill_date <= H1.work_date
						AND B1.emp_id = B2.emp_id
						AND B1.emp_id = H1.emp_id)
	)
	FROM hoursworked AS H1, Consultants AS C1
	WHERE C1.emp_id = H1.emp_id;
