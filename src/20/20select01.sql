-- テスト結果 その１　EXISTS 全量化
SELECT DISTINCT test_name
FROM TestResults AS T1
WHERE NOT EXISTS (SELECT *
                    FROM TestResults AS T2
                    WHERE T1.test_name = T2.test_name
                    AND T2.comp_date IS NULL);


-- サブクエリ内
-- 科目同士の組み合わせ（自己結合）でcomp_date=nullのレコードを取得
SELECT T1.*
FROM TestResults AS T2,TestResults AS T1
WHERE T1.test_name = T2.test_name
AND T2.comp_date IS NULL
;


--  comp_date != nullが一つも存在しない科目のレコードを取得
-- 全称量化の二重否定
SELECT *
FROM TestResults AS T1
WHERE NOT EXISTS (SELECT *
                    FROM TestResults AS T2
                    WHERE T1.test_name = T2.test_name
                    AND T2.comp_date IS NULL);