DROP TABLE IF EXISTS personnel CASCADE;
CREATE TABLE personnel
(
    emp_id integer PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    birth_date DATE
);

Insert  Into personnel values
(1,'長期病気する人','1979-02-05'),
(2,'2024にクビになる人','1970-02-26'),
(3,'2021-2021の間で43ポイントだがクビにならない人','1970-02-26')
;

DROP TABLE IF EXISTS excuse_list CASCADE;
CREATE TABLE excuse_list
(
    reason_code CHAR(40) PRIMARY KEY,
    description VARCHAR(100) NOT NULL
);

INSERT INTO excuse_list values
('1','電車の遅れ'),
('2','寝坊'),
('3','子供の急病'),
('4','天候'),
('5','長期病欠')
;
	
DROP TABLE IF EXISTS absenteeism CASCADE;

CREATE TABLE absenteeism
(emp_id INTEGER NOT NULL REFERENCES personnel (emp_id) ON DELETE CASCADE,
absent_date DATE NOT NULL,
reason_code VARCHAR(40) NOT NULL,
severity_points INTEGER NOT NULL
            CHECK (severity_points BETWEEN 0 AND 40),
PRIMARY KEY (emp_id, absent_date));

INSERT INTO absenteeism VALUES
(1,'2024-06-09','1',2),
(1,'2024-06-10','3',1),
(2,'2024-07-12','4',39),
(2,'2024-07-16','4',1),
(2,'2023-07-16','4',1),
(3,'2021-07-12','4',39),
(3,'2022-07-16','4',6)
;