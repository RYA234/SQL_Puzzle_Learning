DROP TABLE IF EXISTS register;
CREATE TABLE register
(course_nbr integer NOT NULL,
student_name CHAR(20) NOT NULL,
teacher_name CHAR(20) NOT NULL
);

INSERT INTO register values
-- 古文の講座には先生が3人いる
(1,'古文の生徒A','kobun_teacher_1'),
(1,'古文の生徒A','kobun_teacher_2'),
(1,'古文の生徒A','kobun_teacher_3'),
-- 数学の講座には先生が2人いる
(2,'数学の生徒A','数学先生1号'),
(2,'数学の生徒A','数学先生2号'),
-- 物理の講座には先生が1人いる
(3,'物理の生徒A','物理先生1号')
;
