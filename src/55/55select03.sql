SELECT H1.horse,
        (SELECT COUNT(*) 
           FROM RacingResults AS R1
              WHERE R1.win_name = H1.horse)
      + (SELECT COUNT(*) 
           FROM RacingResults AS R1
              WHERE R1.place_name = H1.horse)
      + (SELECT COUNT(*) 
           FROM RacingResults AS R1
              WHERE R1.show_name = H1.horse)
    FROM HOrseNames AS H1;