-- 26 DFD その１
-- 答え
SELECT *
FROM ( -- bubble_nameとflow_nameの組み合わせを全部算出する。
    SELECT F1.diagram_name, F1.bubble_name,F2.flow_name
        FROM DataFlowDiagrams AS F1
        CROSS JOIN DataFlowDiagrams AS F2) AS TMP
	EXCEPT -- 存在するテーブルを弾く。
	SELECT F3.diagram_name,F3.bubble_name,F3.flow_name
	FROM DataFlowDiagrams AS F3
;
-- FROM以下のSQLを確認する
--クロス結合で直積を求める。（９＊９＝８１の組み合わせ）
SELECT F1.diagram_name, F1.bubble_name,F2.flow_name
FROM DataFlowDiagrams AS F1
CROSS JOIN DataFlowDiagrams AS F2;

--　既にあるフローを表示する
SELECT F3.diagram_name,F3.bubble_name,F3.flow_name
FROM DataFlowDiagrams AS F3
;