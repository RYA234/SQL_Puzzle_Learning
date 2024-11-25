-- 42 魚のサンプリング調査　その３
-- COALESCEを使った解法
-- COALESCEは一匹も取得できなかった場合に対処するために使われる
SELECT COALESCE(fish_name, 'pike'),
        AVG(COALESCE(found_tally,0))
        FROM Samples AS SA
	        RIGHT OUTER JOIN
			SampleGroups AS SG
			ON SA.sample_id = SG.sample_id
		AND SA.fish_name = 'pike'
		WHERE SG.group_id = 1
		GROUP BY COALESCE(fish_name,'pike')
;

-- 外部結合
-- ３回目は１匹も取得されていないのでSamplesのレコードがnullになる
SELECT *
FROM Samples AS SA
	RIGHT OUTER JOIN
	SampleGroups AS SG
	ON SA.sample_id = SG.sample_id
		AND SA.fish_name = 'pike'
	WHERE
	SG.group_id = 1
	;

--  fish_nameで部分集合を作り平均値を求める
-- ※fish_name=null のときは　'pike'の部分集合に含める。
-- 回答のSQLの処理を詳しく把握するためにSELECT句に追加する
SELECT COALESCE(fish_name,'pike'),count(*)
	,AVG(found_tally) AS NG_avg_no_COALESCE
	,AVG(COALESCE(found_tally,0)) AS OK_avg_no_COALESCE
FROM Samples AS SA
	RIGHT OUTER JOIN
	SampleGroups AS SG
	ON SA.sample_id = SG.sample_id
		AND SA.fish_name = 'pike'
	WHERE
	SG.group_id = 1
	GROUP BY COALESCE(fish_name,'pike')
;



--GROUP BY fish_name でグループ化した場合、部分集合がnullとpikeの２つができてしまい
-- 正しい平均取得数を取得できない
SELECT fish_name,count(*)
	,AVG(found_tally) AS NG_avg_no_COALESCE
	,AVG(COALESCE(found_tally,0)) AS OK_avg_no_COALESCE
FROM Samples AS SA
	RIGHT OUTER JOIN
	SampleGroups AS SG
	ON SA.sample_id = SG.sample_id
		AND SA.fish_name = 'pike'
	WHERE
	SG.group_id = 1
	GROUP BY fish_name
;




-- COALESCEの動きを確認する用
-- 今回初めて見るものなので簡単に確認
SELECT COALESCE(fish_name,'nulldesu'),count(*)
FROM Samples_clone
GROUP BY COALESCE(fish_name,'nulldesu')
	;
	