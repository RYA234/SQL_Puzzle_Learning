-- 57 欠番探し　バージョン１
-- 答え
SELECT CASE WHEN COUNT(*) + MIN(seq) - 1 = MAX(seq)
            THEN 'Sequence'
            ELSE 'Not Sequence' END
        FROM Numbers;



-- 連番である場合
--  COUNT(*) + MIN(seq) - 1 = MAX(seq)
-- →　7 + 2 -1 = 8
SELECT COUNT(*),Min(seq),Max(seq),CASE WHEN COUNT(*) + MIN(seq) - 1 = MAX(seq)
            THEN 'Sequence'
            ELSE 'Not Sequence' END
        FROM Numbers;

-- 連番ではない場合
--  COUNT(*) + MIN(seq) - 1 = MAX(seq)
-- →　7 + 2 -1 != 20
SELECT COUNT(*),Min(seq),Max(seq),CASE WHEN COUNT(*) + MIN(seq) - 1 = MAX(seq)
            THEN 'Sequence'
            ELSE 'Not Sequence' END
        FROM Numbers_no_seq;