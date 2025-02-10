DELETE FROM personnel 
	WHERE  emp_id =
(SELECT A1.emp_id
FROM absenteeism AS A1
--サブクエリが personnel テーブルの emp_id と一致する行を特定するため
WHERE A1.emp_id = personnel.emp_id
	AND absent_date
		BETWEEN CURRENT_TIMESTAMP - INTERVAL '365' DAY
			AND CURRENT_TIMESTAMP
GROUP BY A1.emp_id
Having SUM(severity_points) >= 40
);

-- emp_id=1のみ表示される　emp_id=3は削除されるべきではない
--SELECT * FROM personnel;