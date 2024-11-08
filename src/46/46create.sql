DROP TABLE IF EXISTS Promotions;
CREATE TABLE Promotions
(promo_name CHAR(25) NOT NULL PRIMARY KEY,
 start_date DATE NOT NULL,
 end_date DATE NOT NULL,
    CHECK (start_date <= end_date));

DROP TABLE IF EXISTS Sales;
CREATE TABLE Sales
(ticket_nbr INTEGER NOT NULL PRIMARY KEY,
 clerk_name CHAR (15) NOT NULL,
 sale_date DATE NOT NULL,
 sale_amt DECIMAL (8,2) NOT NULL);

INSERT INTO Promotions VALUES('Feast of St. Fred'    ,'1995-02-01'  ,'1995-02-07');
INSERT INTO Promotions VALUES('National Pickle Pageant'  ,'1995-11-01'  ,'1995-11-07');
INSERT INTO Promotions VALUES('Christmas Week'    ,'1995-12-18'  ,'1995-12-25');

INSERT INTO Sales VALUES(1, 'スミス', '1995-02-01', 10);
INSERT INTO Sales VALUES(2, 'ジョン', '1995-02-02', 20);
INSERT INTO Sales VALUES(3, 'ジョン', '1995-02-03', 30);
INSERT INTO Sales VALUES(4, 'ジョン', '1995-02-04', 20);
INSERT INTO Sales VALUES(5, 'メアリ', '1995-02-05', 70);
INSERT INTO Sales VALUES(6, 'ケン',   '1995-11-03', 10);
INSERT INTO Sales VALUES(7, 'テリー', '1995-11-05', 20);
INSERT INTO Sales VALUES(8, 'テリー', '1995-11-05', 20);