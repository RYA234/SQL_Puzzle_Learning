drop table if exists projects;

create table projects
(workorder_id char(5) not null,
step_nbr integer not null check(step_nbr between 0 and 1000),
step_status char(1) not null check(step_status in('C','W')),
primary key (workorder_id,step_nbr)
);

insert into projects VALUES
('AA100',0,'C'),
('AA100',1,'W'),
('AA100',2,'W'),
('AA200',0,'W'),
('AA200',1,'W'),
('AA300',0,'C'),
('AA300',1,'C'),
('AA400',0,'W'),
('AA400',1,'C'),
('AA400',2,'W')
;