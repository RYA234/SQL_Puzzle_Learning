SELECT DISTINCT S0.order_nbr,
	(SELECT sch_date
	FROM ServicesSchedule As S1
	WHERE S1.sch_seq ='1'
	AND S1.order_nbr = S0.order_nbr) AS processed,
	(SELECT sch_date
	FROM ServicesSchedule As S2
	WHERE S2.sch_seq ='2'
	AND S2.order_nbr = S0.order_nbr) AS completed,
	(SELECT sch_date
	FROM ServicesSchedule As S3
	WHERE S3.sch_seq ='3'
	AND S3.order_nbr = S0.order_nbr) AS processed	
FROM ServicesSchedule As S0
WHERE  service_type = '01'
;