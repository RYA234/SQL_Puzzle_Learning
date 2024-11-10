--  p228 55 競走馬の入賞回数
DROP TABLE IF EXISTS RacingResults;
CREATE TABLE RacingResults
(track_id CHAR(3) NOT NULL,
 race_date DATE NOT NULL,
 race_nbr INTEGER NOT NULL,
 win_name CHAR(30) NOT NULL,
 place_name CHAR(30) NOT NULL,
 show_name CHAR(30) NOT NULL,
    PRIMARY KEY (track_id, race_date, race_nbr));

DROP TABLE IF EXISTS HorseNames;
CREATE TABLE HorseNames
(horse CHAR(30) NOT NULL PRIMARY KEY);

INSERT INTO RacingResults VALUES(1, '2007-05-01', 1, 'A', 'B', 'C');
INSERT INTO RacingResults VALUES(1, '2007-05-01', 2, 'E', 'F', 'P');
INSERT INTO RacingResults VALUES(1, '2007-05-02', 1, 'B', 'C', 'A');
INSERT INTO RacingResults VALUES(2, '2007-05-02', 1, 'O', 'P', 'Q');
INSERT INTO RacingResults VALUES(2, '2007-05-02', 2, 'A', 'P', 'Q');

INSERT INTO HorseNames VALUES('A');
INSERT INTO HorseNames VALUES('B');
INSERT INTO HorseNames VALUES('C');
INSERT INTO HorseNames VALUES('D');
INSERT INTO HorseNames VALUES('E');
INSERT INTO HorseNames VALUES('F');
INSERT INTO HorseNames VALUES('O');
INSERT INTO HorseNames VALUES('P');
INSERT INTO HorseNames VALUES('Q');