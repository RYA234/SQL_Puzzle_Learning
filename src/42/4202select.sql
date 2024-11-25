-- 42 魚のサンプリング調査　その２
SELECT fish_name,SUM(found_tally) /
                (SELECT COUNT(sample_id)
                   FROM SampleGroups
                WHERE group_id = 1) AS X
FROM Samples SA
    INNER JOIN
	SampleGroups SG
	ON SA.sample_id = SG.sample_id
	WHERE fish_name = 'pike'
		And group_id = 1
		GROUP BY fish_name
	;

--　inner JOIN部分を確認する
SELECT *
FROM Samples SA
    INNER JOIN
	SampleGroups SG
	ON SA.sample_id = SG.sample_id
	;
--　fish_nameに対して部分集合を作る（GROUP句）
-- group_id fish_name毎の 、回数(x_bunbo)、取得匹数（x_bunshi）をSELECT句に加える
SELECT fish_name
	,SUM(found_tally) AS X_bunshi
	,(SELECT COUNT(sample_id)
                   FROM SampleGroups
                WHERE group_id = 1) AS X_bunbo
	,SUM(found_tally) /
                (SELECT COUNT(sample_id)
                   FROM SampleGroups
                WHERE group_id = 1) AS X
FROM Samples SA
    INNER JOIN
	SampleGroups SG
	ON SA.sample_id = SG.sample_id
	WHERE 
	-- group_idを指定しないとSUM(found_tally)が他のgroup_idの値も含めてしまうため。
	group_id = 1
	-- And fish_name = 'pike'
	GROUP BY fish_name
	;



-- 参考
-- WHERE句で結合しても　InnerJoinと同じ結果になる
SELECT *
FROM Samples SA,SampleGroups SG
	WHERE SA.sample_id = SG.sample_id
	;
