SELECT X.start_date,MIN(X.end_date) AS end_date
    FROM (SELECT T1.start_date,T2.end_date
            FROM Timesheets AS T1, Timesheets AS T2,
                 Timesheets AS T3
            WHERE T1.end_date <= T2.end_date
            GROUP BY T1.start_date, T2.end_date
            Having MAX(CASE WHEN (T1.start_date > T3.start_date
                                    AND T1.start_date <= T3.end_date)
                                    OR
                                    (T2.end_date >= T3.start_date
                                    AND T2.end_date < T3.end_date)
                                THEN 1 ELSE 0 END) = 0) AS X
        GROUP BY X.start_date;
    