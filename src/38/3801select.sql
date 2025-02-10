update Journal 
    SET duration
    = (SELECT CAST((Journal.trx_date - J1.trx_date) AS INTEGER)
        FROM Journal AS J1
        WHERE J1.acct_nbr = Journal.acct_nbr
        AND J1.trx_date =
            (SELECT MIN(trx_date)
                FROM Journal AS J2
                WHERE J2.acct_nbr = Journal.acct_nbr
                AND J2.trx_date > Journal.trx_date))
        WHERE EXISTS (SELECT *
                 FROM Journal AS J3
                 WHERE J3.acct_nbr = JOurnal.acct_nbr
                 AND J3.trx_date > Journal.trx_date)
