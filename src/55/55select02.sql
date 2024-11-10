SELECT H1.horse, Count(*)
    FROM HorseNames AS H1, RacingResults AS R1
    WHERE H1.horse IN (R1.win_name,R1.place_name,R1.show_name)
    GROUP BY H1.horse;