DROP TABLE IF EXISTS proc CASCADE;
CREATE TABLE procs(
    proc_id integer not null,
    anest_name varchar not null,
    start_time time not null,
    end_time time not null
);

Insert Into procs VALUES
	(10,'Baker','08:00','11:00'),
	(20,'Baker','09:00','13:00'),
	(30,'Dow','09:00','15:30'),
	(40,'Dow','08:00','13:30'),
	(50,'Dow','10:00','11:30'),
	(60,'Dow','12:30','13:30'),
	(70,'Dow','13:30','14:30'),
	(80,'Dow','18:00','19:00')
;