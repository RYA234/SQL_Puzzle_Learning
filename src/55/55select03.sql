-- 55 競走馬の入賞回数　その３　p230
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

-- 途中式　各々の項目を表示するだけ
SELECT H1.horse,
        (SELECT COUNT(*) 
           FROM RacingResults AS R1
              WHERE R1.win_name = H1.horse) as C1,
      (SELECT COUNT(*) 
           FROM RacingResults AS R1
              WHERE R1.place_name = H1.horse) as C2,
       (SELECT COUNT(*) 
           FROM RacingResults AS R1
              WHERE R1.show_name = H1.horse) as C3,
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