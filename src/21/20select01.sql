SELECT DISTINCT pilot
FROM PilotSkills AS PS1
WHERE NOT EXISTS
    (SELECT *
        FROM Hanger
        WHERE NOT Exists(
            SELECT * FROM PilotSkills AS PS2
            WHERE (PS1.pilot = PS2.pilot)
            AND (PS2.plane = Hanger.plane)));
            