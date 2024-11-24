
-- 36 １人２役　その4
-- 答え
SELECT R1.person
	,CASE WHEN COUNT(*) = 1 
	      THEN MIN(R1.role)
          ELSE 'B'
	      END
 FROM Roles AS R1
 WHERE R1.role IN ('D','O')
 GRoup BY R1.person
	;

--SELECT句以下にCASE式で使われる値(Count(*),MIN(R1.role))を追加する
SELECT R1.person,COUNT(*),MIN(R1.role)
	  ,CASE WHEN COUNT(*) = 1 
	      THEN MIN(R1.role)
          ELSE 'B'
	      END
 FROM Roles AS R1
 WHERE R1.role IN ('D','O')
 GRoup BY R1.person
;