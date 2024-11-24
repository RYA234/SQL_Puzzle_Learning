DROP TABLE IF EXISTS Roles;
CREATE TABLE Roles(
 person VARCHAR(32), 
 role   VARCHAR(32), 
    PRIMARY KEY (person, role));

INSERT INTO Roles VALUES('Smith', 'O');
INSERT INTO Roles VALUES('Smith', 'D');
INSERT INTO Roles VALUES('Jones', 'O');
INSERT INTO Roles VALUES('White', 'D');
INSERT INTO Roles VALUES('Brown', 'X');