-- p119 等しい部分集合　その４
SELECT SP1.sno,SP2.sno
    FROM SupParts AS SP1 INNER JOIN SupParts AS SP2
    ON SP1.pno = SP2.pno
    AND SP1.sno < SP2.sno
    GROUP BY SP1.sno,SP2.sno
    HAVING COUNT(*) =
    (SELECT COUNT(*)
        FROM SupParts AS SP3
        WHERE SP3.sno = SP1.sno)
    AND COUNT(*) = 
    (SELECT COUNT(*)
        FROM SupParts AS SP4
        WHERE SP4.sno = SP2.sno);