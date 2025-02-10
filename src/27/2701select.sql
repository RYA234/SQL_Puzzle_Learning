select SP1.sno,SP2.sno
-- leftジョインでも良い？
from SupParts AS SP1 inner join SupParts AS SP2
ON SP1.pno = SP2.pno
AND SP1.sno < SP2.sno
EXCEPT
	SELECT  DISTINCT SP1.sno,SP2.sno
		FROM SupParts AS SP1 FULL OUTER JOIN SupParts AS SP2
		ON SP1.pno = SP2.pno
		AND SP1.sno < SP2.sno
		WHERE SP1.sno IS NULL
		OR SP2.sno IS NULL
		;