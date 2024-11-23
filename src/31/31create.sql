DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers
(customer_id INTEGER NOT NULL PRIMARY KEY,
 acct_balance DECIMAL (12, 2) NOT NULL);

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders
(customer_id INTEGER NOT NULL,
 order_id INTEGER NOT NULL PRIMARY KEY);

DROP TABLE IF EXISTS OrderDetails;
CREATE TABLE OrderDetails
(order_id INTEGER NOT NULL,
 item_id INTEGER NOT NULL,
 item_qty INTEGER NOT NULL,
 PRIMARY KEY(order_id, item_id));

DROP TABLE IF EXISTS Products;
CREATE TABLE Products
(item_id INTEGER NOT NULL PRIMARY KEY,
 item_qty_on_hand INTEGER NOT NULL);

--顧客１と２は全部の製品を買っている。顧客ｂRと４は一部の製品だけ買っている。顧客５と６は一つも注文していない。
DELETE FROM Customers;
INSERT INTO Customers VALUES(1, 10);
INSERT INTO Customers VALUES(2, 20);
INSERT INTO Customers VALUES(3, 30);
INSERT INTO Customers VALUES(4, 40);
INSERT INTO Customers VALUES(5, 50);
INSERT INTO Customers VALUES(6, 60);

--注文テーブル
DELETE FROM Orders;
INSERT INTO Orders VALUES(1, 1);
INSERT INTO Orders VALUES(1, 2);
INSERT INTO Orders VALUES(2, 3);
INSERT INTO Orders VALUES(3, 4);
INSERT INTO Orders VALUES(3, 5);
INSERT INTO Orders VALUES(3, 6);
INSERT INTO Orders VALUES(4, 7);

--注文明細テーブル
DELETE FROM OrderDetails;
INSERT INTO OrderDetails VALUES(1, 1, 1);

INSERT INTO OrderDetails VALUES(2, 1, 1);
INSERT INTO OrderDetails VALUES(2, 2, 1);
INSERT INTO OrderDetails VALUES(2, 3, 1);

INSERT INTO OrderDetails VALUES(3, 1, 1);
INSERT INTO OrderDetails VALUES(3, 2, 1);
INSERT INTO OrderDetails VALUES(3, 3, 1);

INSERT INTO OrderDetails VALUES(4, 1, 1);
INSERT INTO OrderDetails VALUES(5, 1, 1);
INSERT INTO OrderDetails VALUES(6, 1, 1);
INSERT INTO OrderDetails VALUES(7, 1, 1);

--製品テーブル
DELETE FROM Products;
INSERT INTO Products VALUES(1, 1);
INSERT INTO Products VALUES(2, 1);
INSERT INTO Products VALUES(3, 1);