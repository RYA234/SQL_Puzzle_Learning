-- SELECT test_name
-- FROM TestResults
-- GROUP BY test_name
-- Having COUNT(*) = SUM(CASE WHEN comp_date IS NOT NULL
--                         THEN 1
--                         ELSE 0 END);


--test_name毎に部分集合を作る
SELECT test_name,count(*) as C_aster, count(comp_date) as C_comp_date
FROM TestResults
GROUP BY test_name
;

-- Having句で部分集合の条件を指定する
-- cout(*)がnullを数えるに対して、COUNT(comp_date)はnullを数えないことを利用している。
SELECT test_name,count(*) as C_aster, count(comp_date) as C_comp_date
FROM TestResults
GROUP BY test_name
HAVING COUNT(*) = COUNT(comp_date)
;