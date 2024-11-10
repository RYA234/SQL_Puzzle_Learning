SELECT category,SUM(B1.est_cost) AS estimated,
(SELECT SUM(T1.act_cost)
  FROM Actual AS T1
  WHERE T1.task BETWEEN MIN(B1.task)
                        AND MAX(B1.task)) AS spent
FROM Budgeted AS B1
GROUP BY category;
