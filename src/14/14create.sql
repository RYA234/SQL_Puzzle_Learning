
drop Table if exists personnel cascade;

CREATE table personnel
(emp_id integer primary key,
first_name char(20) not null,
last_name char(20) not null
);
drop table if exists phones cascade;
create table phones
(emp_id integer not null,
phone_type char(3) not null check(phone_type IN('hom','fax')),
phone_nbr char(12) not null,
primary key(emp_id,phone_type)
)
;
INSERT INTO Personnel VALUES(1, '山田', '太郎');
INSERT INTO Personnel VALUES(2, '上野', '二郎');
INSERT INTO Personnel VALUES(3, '高田', '三郎');
INSERT INTO Personnel VALUES(4, '松岡', '四郎');

INSERT INTO Phones VALUES(1, 'hom', 1111);
INSERT INTO Phones VALUES(1, 'fax', 2222);
INSERT INTO Phones VALUES(2, 'hom', 3333);
INSERT INTO Phones VALUES(3, 'fax', 4444);
