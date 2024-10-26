SELECT workorder_id
FROM projects AS P1
WHERE step_nbr = 0
	AND step_status = 'C'
	AND 'W' = ALL (SELECT step_status
					FROM projects AS P2
				  WHERE step_nbr <> 0
					AND P1.workorder_id = P2.workorder_id
				  );