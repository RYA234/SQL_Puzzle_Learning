-- p65 15 現在の給料と昇給前の給料 04
SELECT S1.emp_name,S1.sal_date,S1.sal_amt, S2.sal_date, S2.sal_amt
FROM salaries2 AS S1, salaries2 AS S2
WHERE S1.emp_name =S2.emp_name
    AND S1.sal_date > S2.sal_date
UNION ALL
SELECT emp_name,MAX(sal_date),MAX(sal_amt), NULL, NULL
FROM salaries2 
GROUP BY emp_name
HAVING COUNT(*) = 1
;

-- step1　グループ化して部分集合を確認する
-- 自己結合



-- step2 非等号結合を行って

-- step3 Havingで部分集合の条件