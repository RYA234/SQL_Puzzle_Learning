drop view if exists salaries2;  
create view	salaries2(emp_name,sal_date,sal_amt)
AS SELECt S0.emp_name,S0.sal_date,MAX(S0.sal_amt)
FROM salaries AS S0, salaries AS S1
WHERE S0.sal_date <= S1.sal_date
    AND S0.emp_name = S1.emp_name
    GROUP BY S0.emp_name, S0.sal_date
   Having Count(*) <= 2
;

-- 答え
-- 回答の方だとviewだが、検証しやすくするためにSELECT文にする
SELECT S0.emp_name,S0.sal_date,MAX(S0.sal_amt)
FROM salaries AS S0, salaries AS S1
WHERE S0.sal_date <= S1.sal_date
    AND S0.emp_name = S1.emp_name
    GROUP BY S0.emp_name, S0.sal_date
   Having Count(*) <= 2
;

-- step1　グループ化して部分集合を確認する
-- 名前で自己結合して, sal_dateの組み合わせを作る
-- SQLの結果の見やすくすために、グループ化の条件にS１を入れる
SELECT S0.emp_name, S0.sal_date as S0_sal_date,S1.sal_date as S1_sal_date,S0,count(*)
FROM salaries AS S0, salaries AS S1
WHERE  S0.emp_name = S1.emp_name
    GROUP BY S0.emp_name, S0.sal_date,S1.sal_date
;



-- step2 非等号結合を行って 
SELECT S0.emp_name, S0.sal_date as S0_sal_date,S1.sal_date as S1_sal_date,S0,count(*)
FROM salaries AS S0, salaries AS S1
WHERE S0.emp_name = S1.emp_name
	AND S0.sal_date <= S1.sal_date
    GROUP BY S0.emp_name, S0.sal_date,S1.sal_date
    ORDER BY S0.emp_name, S0.sal_date
	;


-- step3 Havingで部分集合の条件 解部分
SELECT S0.emp_name, S0.sal_date as S0_sal_date,count(*),MAX(S0.sal_amt)
FROM salaries AS S0, salaries AS S1
WHERE S0.emp_name = S1.emp_name
	AND S0.sal_date <= S1.sal_date
    GROUP BY S0.emp_name, S0.sal_date
	Having Count(*) <= 2
;

