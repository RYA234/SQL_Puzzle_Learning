SELECT workorder_id
FROM projects
GROUP BY workorder_id
Having SUM(CASE WHEN step_nbr <> 0 AND step_status = 'W' THEN 1
                WHEN step_nbr = 0 AND step_status = 'C' THEN 1
                ELSE 0 END) = COUNT(step_nbr);


SELECT *
FROM projects
GROUP BY workorder_id
WHERE CASE WHEN step_nbr <> 0 AND step_status = 'W' THEN 1
                WHEN step_nbr = 0 AND step_status = 'C' THEN 1
                ELSE 0 END;