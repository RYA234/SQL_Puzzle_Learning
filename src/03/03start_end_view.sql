DROP VIEW IF EXISTS events;

/*  
Description:  開始と終了のイベントを生成するビュー。
Param:   event_type 1:開始イベント、-1:終了イベント
Return:   
*/  
CREATE VIEW events
(proc_id,comparison_proc, anest_name,event_time,event_type) AS
SELECT P1.proc_id, P2.proc_id, P1.anest_name, P2.start_time, +1
FROM procs AS P1, procs AS P2
WHERE P1.anest_name = P2.anest_name
	AND NOT (P2.end_time <= P1.start_time 
				OR P2.start_time >= P1.end_time)
UNION
SELECT P1.proc_id,P2.proc_id,P1.anest_name,P2.end_time,
		-1 AS event_type
	FROM procs AS P1, procs AS P2
	WHERE P1.anest_name = P2.anest_name
		AND NOT (P2.end_time <= P1.start_time
					OR P2.start_time >= P1.end_time);