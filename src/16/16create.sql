drop table if exists jobs;
create table jobs
(job_id integer not null primary
start_date date not null
);

drop table if EXISTS personnel;
create table personnel
(emp_id integer not null primary key,
emp_name char(20) not null
);

drop table if EXISTS teams;
create table teams
(job_id integer not null,
mech_type integer not null,
emp_id integer not null
)