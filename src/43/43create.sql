
drop table if exists Credits;
CREATE TABLE Categories
(credit_cat CHAR(1) NOT NULL,
 rqd_credits INTEGER NOT NULL);

drop table if exists CreditsEarned;
CREATE TABLE CreditsEarned --主キーなし
(student_name CHAR(10) NOT NULL,
 credit_cat CHAR(1) NOT NULL,
 credits INTEGER NOT NULL);

INSERT INTO Categories VALUES ('A', 10);
INSERT INTO Categories VALUES ('B', 3);
INSERT INTO Categories VALUES ('C', 5);

INSERT INTO CreditsEarned
VALUES ('Joe', 'A', 3), ('Joe', 'A', 2), ('Joe', 'A', 3),
       ('Joe', 'A', 3), ('Joe', 'B', 3), ('Joe', 'C', 3),
       ('Joe', 'C', 2), ('Joe', 'C', 3),
       ('Bob', 'A', 2), ('Bob', 'C', 2), ('Bob', 'A', 12),
       ('Bob', 'C', 4),
       ('John', 'A', 1), ('John', 'B', 1),
       ('Mary', 'A', 1), ('Mary', 'A', 1), ('Mary', 'A', 1),
       ('Mary', 'A', 1), ('Mary', 'A', 1), ('Mary', 'A', 1),
       ('Mary', 'A', 1), ('Mary', 'A', 1), ('Mary', 'A', 1),
       ('Mary', 'A', 1), ('Mary', 'A', 1), ('Mary', 'B', 1),
       ('Mary', 'B', 1), ('Mary', 'B', 1), ('Mary', 'B', 1),
       ('Mary', 'B', 1), ('Mary', 'B', 1), ('Mary', 'B', 1),
       ('Mary', 'C', 1), ('Mary', 'C', 1), ('Mary', 'C', 1),
       ('Mary', 'C', 1), ('Mary', 'C', 1), ('Mary', 'C', 1),
       ('Mary', 'C', 1), ('Mary', 'C', 1);