-- 4502 投稿準備完了
DROP TABLE IF EXISTS FriendsofPepperoni;
--重複行があるというので、主キーなし
CREATE TABLE FriendsofPepperoni
(cust_id INTEGER,
 bill_date DATE,
 pizza_amt DECIMAL(5,2));

--答え３用マスタテーブル
DROP TABLE IF EXISTS ReportRanges;
CREATE TABLE ReportRanges
(day_count CHAR(32), 
 start_cnt INTEGER, 
 end_cnt   INTEGER);

INSERT INTO FriendsofPepperoni VALUES(1, '2007-05-07', 10);
INSERT INTO FriendsofPepperoni VALUES(1, '2007-04-01', 20);
INSERT INTO FriendsofPepperoni VALUES(1, '2007-03-01', 30);
INSERT INTO FriendsofPepperoni VALUES(1, '2007-01-01', 40);
INSERT INTO FriendsofPepperoni VALUES(2, '2007-05-06', 50);
INSERT INTO FriendsofPepperoni VALUES(2, '2007-04-01', 60);
INSERT INTO FriendsofPepperoni VALUES(2, '2007-03-01', 70);
INSERT INTO FriendsofPepperoni VALUES(2, '2007-01-01', 80);

--答え３用
INSERT INTO ReportRanges VALUES('under Thirty days', 00, 30);
INSERT INTO ReportRanges VALUES('Sixty days', 31, 60);
INSERT INTO ReportRanges VALUES('Ninty days', 61, 90);