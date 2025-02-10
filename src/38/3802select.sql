update Journal
    SET duration
            = CAST((Journal.trx_date - 
                    (SELECT MIN(J1.trx_date)
                        FROM Journal AS J1
                        WHERE J1.acct_nbr = Journal.acct_nbr
                            AND J1.trx_date > Journal.trx_date)) AS INTEGER)
    WHERE EXISTS (SELECT * 
                    FROM Journal AS J2
                    WHERE J2.acct_nbr = Journal.acct_nbr
                        AND J2.trx_date > Journal.trx_date);