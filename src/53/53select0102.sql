SELECT  MIN(CASE WHEN Foobar.lvl = M.lc
                THEN Foobar.color END) AS color,
        MIN(CASE WHEN Foobar.lvl = M.ll
                THEN Foobar.length END) AS length,
        MIN(CASE WHEN Foobar.lvl = M.lw
                THEN Foobar.width END) AS width,
        MIN(CASE WHEN Foobar.lvl = M.lh
                THEN Foobar.hgt END) AS hgt
    FROM (SELECT    MAX(CASE WHEN color IS NOT NULL
                            THEN lvl END) AS lc,
                    MAX(CASE WHEN length IS NOT NULL
                            THEN lvl END) AS ll,
                    MAX(CASE WHEN width IS NOT NULL
                            THEN lvl END) AS lw ,
                    MAX(CASE WHEN hgt IS NOT NULL
                            THEN lvl END) AS lh
                FROM Foobar) AS M
                INNER JOIN
                Foobar
                ON Foobar.lvl IN(M.lc,M.ll,M.lw,M.lh)
                ;