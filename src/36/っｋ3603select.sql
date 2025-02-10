--36 １人２役　その３
SELECT person,
        CASE WHEN COUNT(*) = 1
        THEN MAX(role)
        ELSE 'Both' END AS role
    FROM Roles 
    WHERE role IN ('D','O')
    GROUP BY person
	Having Count(*) = 1
	UNION
	SELECT R2.person, 'B'
	FROM Roles AS R2
	WHERE R2.role IN ('D','O')
	GROUP BY R2.person
	HAVING COUNT(*) = 2
	;   
-- UNION前のSQL部分を確認する
SELECT person,
        CASE WHEN COUNT(*) = 1
        THEN MAX(role)
        ELSE 'Both' END AS role
    FROM Roles 
    WHERE role IN ('D','O')
    GROUP BY person
	Having Count(*) = 1
;

-- UNION後のSQL部分を確認する
	SELECT R2.person, 'B'
	FROM Roles AS R2
	WHERE R2.role IN ('D','O')
	GROUP BY R2.person
	HAVING COUNT(*) = 2
	; 