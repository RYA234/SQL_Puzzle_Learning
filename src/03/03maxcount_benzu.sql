SELECT E1.proc_id, E1.event_time
	-- ,
--     (SELECT SUM(E2.event_type)
--         FROM events AS E2
--         WHERE E2.proc_id = E1.proc_id
--             AND E2.event_time < E1.event_time)
--         AS instantaneous_count
FROM events AS E1
ORDER BY E1.proc_id, E1.event_time
	;


  --   SELECT SUM(E2.event_type)
  --       FROM events AS E2,events AS E1
  --       WHERE E2.proc_id = E1.proc_id
  --           AND E2.event_time < E1.event_time
		-- ;

		-- SELECT *
  --       FROM events AS E2,events AS E1
  --       WHERE E2.proc_id = E1.proc_id
		-- ;


		-- SELECT *
  --       FROM events AS E2,events AS E1
  --       WHERE E2.event_time < E1.event_time
		-- ;