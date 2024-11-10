SELECT CASE WHEN COUNT(*) + MIN(seq) - 1 = MAX(seq)
            THEN 'Sequence'
            ELSE 'Not Sequence' END
        FROM Numbers;