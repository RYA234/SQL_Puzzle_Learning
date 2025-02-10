-- ２日以上の長期休暇 パフォーマス改善版
-- 　explainを使って評価したが、全然違いがわからん
Update absenteeism AS A1
	SET severity_points= 0,
		reason_code = '5'
	WHERE EXISTS
		(SELECT *
			FROM absenteeism AS A2
			WHERE A1.emp_id = A2.emp_id
				AND (A2.absent_date + INTERVAL '1' DAY) = A1.absent_date);

--SELECT  * FROM absenteeism WHERE emp_id = 1;