SELECT emp_id,emp_name,SUM(bill_hrs * bill_rate) as bill_tot
FROM HourRateRpt
GROUP BY emp_id,emp_name;
