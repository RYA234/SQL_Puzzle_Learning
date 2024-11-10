-- p215 51 予算と実支出の比較
DROP  TABLE IF EXISTS Budgeted;
CREATE TABLE Budgeted
(task INTEGER NOT NULL PRIMARY KEY,
category INTEGER NOT NULL,
est_cost DECIMAL(8,2) NOT NULL);



DROP  TABLE IF EXISTS Actual;
CREATE TABLE Actual
(voucher INTEGER NOT NULL PRIMARY KEY,
task INTEGER NOT NULL REFERENCES Budgetd(task),
act_cost DECIMAL(8,2) NOT NULL);

INSERT INTO Budgeted VALUES(1, 9100, 100.00);
INSERT INTO Budgeted VALUES(2, 9100,  15.00);
INSERT INTO Budgeted VALUES(3, 9100,   6.00);
INSERT INTO Budgeted VALUES(4, 9200,   8.00);
INSERT INTO Budgeted VALUES(5, 9200,  11.00);

INSERT INTO Actual VALUES(1,  1,  10.00);
INSERT INTO Actual VALUES(2,  1,  20.00);
INSERT INTO Actual VALUES(3,  1,  15.00);
INSERT INTO Actual VALUES(4,  2,  32.00);
INSERT INTO Actual VALUES(5,  4,  8.00);
INSERT INTO Actual VALUES(6,  5,  3.00);
INSERT INTO Actual VALUES(7,  5,  4.00);