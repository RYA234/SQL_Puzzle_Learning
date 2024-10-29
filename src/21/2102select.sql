-- SELECT pilot
--   FROM PilotSkills AS PS1, Hangar AS H1
--  WHERE PS1.plane = H1.plane
--  GROUP BY PS1.pilot
-- HAVING COUNT(PS1.plane) = (SELECT COUNT(*) FROM Hangar)
-- 	;



-- SELECT PS1.*,H1.*
-- FROM PilotSkills AS PS1, Hangar AS H1
-- ;

-- SELECT PS1.*,H1.*
--   FROM PilotSkills AS PS1, Hangar AS H1
--  WHERE PS1.plane = H1.plane
-- ;

SELECT Pilot
  FROM PilotSkills AS PS1, Hangar AS H1
 WHERE PS1.plane = H1.plane
 GROUP BY PS1.pilot
HAVING COUNT(PS1.plane) = (SELECT COUNT(*) FROM Hangar)	
;


