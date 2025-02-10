-- ２日以上の長期休暇
Update absenteeism
	SET severity_points= 0,
		reason_code = '5'
	WHERE EXISTS
		(SELECT *
			FROM absenteeism AS A2
			WHERE absenteeism.emp_id = A2.emp_id
				AND absenteeism.absent_date =
					(A2.absent_date + INTERVAL '1' DAY));

-- SELECT  * FROM absenteeism WHERE emp_id = 1;