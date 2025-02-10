SELECT MIN(T1.num) AS low,
       MAX(T1.num) AS high,
       T1.data
    FROM T AS T1
         LEFT OUTER JOIN
         T AS T2
         ON T2.num
            = (SELECT MIN(num)
                FROM T
                WHERE num > T1.num
                 AND date <> T1.data)
GROUP BY T1.data, T2.num;