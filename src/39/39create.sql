
DROP TABLE IF EXISTS Losses;
CREATE TABLE Losses
(cust_nbr INTEGER NOT NULL PRIMARY KEY,
 a INTEGER, b INTEGER, c INTEGER, d INTEGER, e INTEGER,
 f INTEGER, g INTEGER, h INTEGER, i INTEGER, j INTEGER,
 k INTEGER, l INTEGER, m INTEGER, n INTEGER, o INTEGER);

DROP TABLE IF EXISTS Policy_Criteria;
CREATE TABLE Policy_Criteria
(criteria_id INTEGER NOT NULL,
 criteria CHAR(1) NOT NULL,
 crit_val INTEGER NOT NULL,
    PRIMARY KEY (criteria_id, criteria, crit_val));

DROP TABLE IF EXISTS LossDoneRight;
CREATE TABLE LossDoneRight
(cust_nbr INTEGER NOT NULL,
 criteria CHAR(1) NOT NULL,
 crit_val INTEGER NOT NULL);

INSERT INTO Losses 
VALUES ( 99, 5, 10, 15, NULL, NULL, NULL, NULL, NULL, 
         NULL, NULL,NULL, NULL, NULL, NULL, NULL);

INSERT INTO Policy_Criteria VALUES (1, 'A', 5);
INSERT INTO Policy_Criteria VALUES (1, 'A', 9);
INSERT INTO Policy_Criteria VALUES (1, 'A', 14);
INSERT INTO Policy_Criteria VALUES (1, 'B', 4);
INSERT INTO Policy_Criteria VALUES (1, 'B', 10);
INSERT INTO Policy_Criteria VALUES (1, 'B', 20);
INSERT INTO Policy_Criteria VALUES (2, 'B', 10);
INSERT INTO Policy_Criteria VALUES (2, 'B', 19);
INSERT INTO Policy_Criteria VALUES (3, 'A', 5);
INSERT INTO Policy_Criteria VALUES (3, 'B', 10);
INSERT INTO Policy_Criteria VALUES (3, 'B', 30);
INSERT INTO Policy_Criteria VALUES (3, 'C', 3);
INSERT INTO Policy_Criteria VALUES (3, 'C', 15);
INSERT INTO Policy_Criteria VALUES (4, 'A', 5);
INSERT INTO Policy_Criteria VALUES (4, 'B', 21);
INSERT INTO Policy_Criteria VALUES (4, 'B', 22);