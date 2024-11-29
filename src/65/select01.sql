
-- 65 製品の対象年齢の範囲 その１
SELECT P.product_id
    FROM PriceByAge AS P, sequence_1 AS S
    WHERE S.seq BETWEEN P.low_age AND P.high_age
    AND S.seq <= 150
    GROUP BY P.product_id
	-- 150 = Max - MIN + 1 = 150 -1 +1
    Having COUNT(seq) = 150;

-- クロスジョインで連番作成
-- sequence_1(160レコード)とPirceByAge(10レコード)の組み合わせを求める
-- 1600（=160*10）
-- PirceByAgeのレコード1件毎に、1~160の160件のレコードが作成される。
SELECT P.*,S.seq
    FROM PriceByAge AS P, sequence_1 AS S
;



-- WHERE句で条件を絞る
-- で作ったBetweenにより、レコード数がhigh_age - low_age +1件になる
SELECT P.product_id,P.low_age, P.high_age,count(*)
    FROM PriceByAge AS P, sequence_1 AS S
	WHERE S.seq BETWEEN P.low_age AND P.high_age
    AND S.seq <= 150
	GROUP BY P.product_id, P.low_age ,P.high_age
	ORDER BY P.product_id
;

-- product_idに対して部分集合を作り
-- 部分集合に対して、1-150において連番になるかどうか　判定する
-- 条件式
-- 150 - 1 + 1 = 150
SELECT P.product_id,count(*),max(S.seq),min(S.seq)
	,CASE WHEN max(S.seq) - min(S.seq) + 1 = count(*)
	THEN 'Sequence'
	ELSE 'Not Sequence' END
	,CASE WHEN max(S.seq) - min(S.seq) + 1 = 150
	THEN 'from 1 to 150'
	ELSE 'Not from 1 to 150' END
    FROM PriceByAge AS P, sequence_1 AS S
	WHERE S.seq BETWEEN P.low_age AND P.high_age
    AND S.seq <= 150
	GROUP BY P.product_id
	;


