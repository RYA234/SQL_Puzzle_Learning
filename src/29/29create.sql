drop table if EXISTS Payroll;
create table Payroll(
    check_nbr Integer NOT NULL Primary Key,
    check_amt DECIMAL(8,2) NOT NULL
);


INSERT INTO Payroll VALUES(1, 100);
INSERT INTO Payroll VALUES(2, 100);
INSERT INTO Payroll VALUES(3, 200);
INSERT INTO Payroll VALUES(4, 150);
INSERT INTO Payroll VALUES(5, 300);
INSERT INTO Payroll VALUES(6, 150);
INSERT INTO Payroll VALUES(7, 300);
INSERT INTO Payroll VALUES(8, 300);
INSERT INTO Payroll VALUES(9, 100);