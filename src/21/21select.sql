SELECT DISTINCT pilot
  FROM PilotSkills PS1
 WHERE NOT EXISTS
        (SELECT plane
           FROM Hangar
         EXCEPT
         SELECT plane
           FROM PilotSkills PS2
          WHERE PS1.pilot = PS2.pilot);