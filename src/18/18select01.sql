SELECT * FROM Consumers
WHERE fam IS NULL
AND EXISTS
    (SELECT *
        FROM Consumers AS C1
        WHERE C1.con_id <> Consumers.con_id
        AND C1.address = Consumers.address
        AND C1.fam IS NOT NULL);