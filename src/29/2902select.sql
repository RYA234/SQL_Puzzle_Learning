-- p126 29 最頻値を求める　その２
SELECT check_amt,COUNT(*) AS check_cnt
FROM Payroll
GROUP BY check_amt
Having COUNT(*) = (SELECT MAX(check_cnt)
                    FROM (SELECT COUNT(*) AS check_cnt
                        FROM Payroll
                        GROUP BY check_amt) AS P1);

-- サブクエリ１ 
SELECT check_amt,COUNT(*) AS check_cnt
FROM Payroll
GROUP BY check_amt;


-- サブクエリ２ 
SELECT MAX(check_cnt)
FROM (SELECT COUNT(*) AS check_cnt
        FROM Payroll
        GROUP BY check_amt
        ) AS P1;