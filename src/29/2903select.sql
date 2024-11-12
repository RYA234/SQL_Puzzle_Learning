SELECT check_amt,COUNT(*) AS check_cnt
FROM Payroll
GROUP BY check_amt
HAVING COUNT(*) >= ALL (SELECT COUNT(*) AS check_cnt
                        FROM Payroll
                        GROUP BY check_amt)
                        ;