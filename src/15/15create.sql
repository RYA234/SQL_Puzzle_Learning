

drop table if exists salaries cascade;
create table salaries
(emp_name char(10) not null,
sal_date date not null,
sal_amt decimal(8,2) not null,
primary key(emp_name,sal_date)
);

insert into salaries values
       ('Tom',   '1996-06-20', 500.00),
       ('Tom',   '1996-08-20', 700.00),
       ('Tom',   '1996-10-20', 800.00),
       ('Tom',   '1996-12-20', 900.00),
       ('Dick',  '1996-06-20', 500.00),
       ('Harry', '1996-07-20', 500.00),
       ('Harry', '1996-09-20', 700.00);

