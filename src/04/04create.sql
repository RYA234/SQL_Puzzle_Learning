DROP TABLE IF EXISTS personnel CASCADE;
CREATE TABLE personnel
(
    emp_id integer PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL
);

Insert  Into personnel values
(1,'John'),
(2,'Mary'),
(3,'Bill'),
(4,'Mike')
;


DROP TABLE IF EXISTS badges CASCADE;
CREATE TABLE Badges
(badge_nbr INTEGER NOT NULL PRIMARY KEY,
 emp_id INTEGER NOT NULL,
 issued_date DATE NOT NULL,
 badge_status CHAR(1) NOT NULL
    CHECK (badge_status IN ('A', 'I')));



INSERT INTO Badges VALUES(100, 1, '2007-01-01', 'I');
INSERT INTO Badges VALUES(200, 1, '2007-02-01', 'I');  --社員1番の最新バッジ
INSERT INTO Badges VALUES(300, 2, '2007-03-01', 'I');  --社員2番の最新バッジ
INSERT INTO Badges VALUES(400, 3, '2007-03-01', 'I');  
INSERT INTO Badges VALUES(500, 3, '2007-04-01', 'I');  
INSERT INTO Badges VALUES(600, 3, '2007-05-01', 'I');  --社員3番の最新バッジ
INSERT INTO Badges VALUES(800, 4, '2007-07-01', 'I');  
INSERT INTO Badges VALUES(900, 4, '2007-08-01', 'A');  --社員4番の最新バッジ