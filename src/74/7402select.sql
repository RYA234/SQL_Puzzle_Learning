SELECT acct_nbr,
        COALESCE(SUM(foo_qty),0) AS foo_qty_tot,
        COALESCE(SUM(bar_qty),0) AS bar_qty_tot
        FROM ((SELECT A1.acct_nbr,foo_qty,bar_qty
                FROM Accounts AS A1
                    LEFT OUTER JOIN
                    (SELECT acct_nbr, foo_qty, 0 AS bar_qty
                        FROM Foo) AS F
                    ON A1.acct_nbr = F.acct_nbr)
                UNION ALL
                (SELECT A2.acct_nbr,foo_qty,bar_qty
                    FROM Accounts AS A2
                    LEFT OUTER JOIN
                    (SELECT acct_nbr, 0 AS foo_qty,bar_qty
                        FROM Bar) AS B
                    ON A2.acct_nbr = B.acct_nbr)
                ) AS X (acct_nbr,foo_qty,bar_qty)
        GROUP BY X.acct_nbr;