INSERT INTO Samples
SELECT DISTINCT M1.sample_id,M2.fish_name,0
 FROM Samples AS M1, Samples AS M2
WHERE NOT EXISTS
 (SELECT *
    FROM Samples AS M3
    WHERE M1.sample_id = M3.sample_id
    AND M2.fish_name = M3.fish_name
 )
;

SELECT *