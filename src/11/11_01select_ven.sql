
-- 1
 -- SELECT P2.*
	-- FROM projects AS P2 
 --  WHERE P2.step_nbr <> 0;

-- 2
-- SELECT P1.*
-- 	FROM projects AS P2,projects AS P1 
--   WHERE P1.workorder_id = P2.workorder_id;

-- 3
-- SELECT P1.*,P2.*
-- 	FROM projects AS P2,projects AS P1 
--   WHERE P2.step_nbr <> 0
-- 	AND P1.workorder_id = P2.workorder_id;

-- 4
-- SELECT P1.*
-- FROM projects AS P1;


-- 5
-- SELECT P1.*
-- FROM projects AS P1
-- WHERE 'W' = ALL (SELECT P2.step_status
-- 					FROM projects AS P2
-- 				  WHERE P2.step_nbr <> 0
-- 					AND P1.workorder_id = P2.workorder_id);


-- 5
-- SELECT P1.*
-- FROM projects AS P1
-- WHERE P1.step_nbr = 0;

-- 6
-- SELECT P1.*
-- FROM projects AS P1
-- WHERE  P1.step_status = 'C';



-- 7(完成)
SELECT P1.*
FROM projects AS P1
WHERE step_nbr = 0
	AND step_status = 'C'
	AND 'W' = ALL (SELECT P2.step_status
					FROM projects AS P2
				  WHERE P2.step_nbr <> 0
					AND P1.workorder_id = P2.workorder_id);