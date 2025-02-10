-- 51 p215 予算と実支出の比較 02
SELECT category,SUM(B1.est_cost) AS estimated,
(SELECT SUM(T1.act_cost)
  FROM Actual AS T1
  WHERE T1.task BETWEEN MIN(B1.task)
                        AND MAX(B1.task)) AS spent
FROM Budgeted AS B1
GROUP BY category;

-- サブクエリ部分を見る
SELECT category,SUM(B1.est_cost) AS estimated,
(SELECT SUM(T1.act_cost)
  FROM Actual AS T1
  WHERE T1.task BETWEEN MIN(B1.task)
                        AND MAX(B1.task)) AS spent
,MIN(B1.task),Max(B1.task)
FROM Budgeted AS B1
GROUP BY category;

-- GROUP　BY無しで見る

-- 
