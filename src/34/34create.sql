drop table if  EXISTS Consultants CASCADE;
CREATE TABLE Consultants
(emp_id INTEGER NOT NULL,
 emp_name CHAR(10) NOT NULL);

drop table if  EXISTS Billings CASCADE;
CREATE TABLE Billings
(emp_id INTEGER NOT NULL,
 bill_date DATE NOT NULL,
 bill_rate DECIMAL (5,2));

drop table if  EXISTS HoursWorked CASCADE;
CREATE TABLE HoursWorked
(job_id INTEGER NOT NULL,
 emp_id INTEGER NOT NULL,
 work_date DATE NOT NULL,
 bill_hrs DECIMAL(5, 2));

INSERT INTO Consultants VALUES (1, 'Larry');
INSERT INTO Consultants VALUES (2, 'Moe');
INSERT INTO Consultants VALUES (3, 'Curly');

INSERT INTO Billings VALUES (1, '1990-01-01', 25.00);
INSERT INTO Billings VALUES (2, '1989-01-01', 15.00);
INSERT INTO Billings VALUES (3, '1989-01-01', 20.00);
INSERT INTO Billings VALUES (1, '1991-01-01', 30.00);

INSERT INTO HoursWorked VALUES (4, 1, '1990-07-01', 3);
INSERT INTO HoursWorked VALUES (4, 1, '1990-08-01', 5);
INSERT INTO HoursWorked VALUES (4, 2, '1990-07-01', 2);
INSERT INTO HoursWorked VALUES (4, 1, '1991-07-01', 4);