SELECT X.start_date,MIN(Y.end_date) AS end_date
FROM (SELECT T1.start_date
        FROM Timesheets AS T1
            LEFT JOIN 
            Timesheets AS T2
            ON T1.start_date > T2.start_date
            AND T1.start_date <= T2.end_date
            GROUP BY T1.start_date
            HAVING COUNT(T2.start_date) = 0 ) AS X(start_date)
            INNER JOIN
            ( SELECT T3.end_date
                FROM TimeSheets AS T3
                    LEFT OUTER JOIN
                    TimeSheets AS T4
                    ON T3.end_date >= T3.start_date
                    AND T3.end_date < T3.end_date
                GROUP BY T3.end_date
                Having COUNT(T4.start_date) = 0) AS Y(end_date)
                ON X.start_date < Y.end_date
            GROUP BY X.start_date;
            
