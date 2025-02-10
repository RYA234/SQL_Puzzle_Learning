SELECT A.acct_nbr,
        COALESCE(SUM(F.foo_qty),0) AS foo_qty_tot,
        COALESCE(SUM(B.bar_qty),0) AS bar_qty_tot
    FROM (SELECT * FROM Accounts) AS A
    LEFT OUTER JOIN
    (SELECT * FROM Foo) AS F
    ON A.acct_nbr = F.acct_nbr
    LEFT OUTER JOIN
    (SELECT acct_nbr,SUM(bar_qty) AS bar_qty
        FROM Bar
        GROUP BY acct_nbr) AS B
        ON A.acct_nbr = B.acct_nbr
    GROUP BY A.acct_nbr;