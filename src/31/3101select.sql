-- p131 31 すべての製品を購入した顧客　その1
--  いくつかの製品を買ったユーザーの残高値の平均値を取得したい。
--  ※全ての製品を買ったユーザを含めない
SELECT AVG(acct_balance)
FROM Customers AS C1
WHERE EXISTS
    (SELECT *
        FROM Products AS P1
        WHERE P1.item_id
        NOT IN (SELECT D1.item_id
                FROM Orders AS O1, OrderDetails AS D1
                WHERE O1.customer_id = C1.customer_id
                AND O1.order_id = D1.order_id
        ));

-- NOT IN以下で取得するレコードについて確認する
-- OrderとOrderDetailを結合するのが目的
-- O1.customer_id = C1.customer_id　のC1.customer_id部分には1,2,3,4が入る
-- O1.order_id = D1.order_idでOrderDetailsとOrdersの結合条件
SELECT O1.customer_id,O1.order_id,D1.item_id
                FROM Orders AS O1, OrderDetails AS D1
                WHERE O1.customer_id = 6
                AND O1.order_id = D1.order_id
	;

-- WHERE EXISTS句以下のSQLについて確認する
-- 全ての商品を買っていないcustomerのitemの情報を取得できる
-- 全ての商品を買っているcustomerのレコードは0件となる
SELECT *
        FROM Products AS P1
        WHERE P1.item_id
        NOT IN (SELECT D1.item_id
                FROM Orders AS O1, OrderDetails AS D1
                WHERE O1.customer_id = 1
                AND O1.order_id = D1.order_id
        )
;

-- 該当するcustomer_id一覧を確認したいため、答え部分のSELECT句を*にする。
-- WHERE EXISTS句以下のレコードが１件以上有るときのcustomer_idの値を取得する
-- 全ての商品を買っていないcustomerのレコードは１件以上あるので取得する（customer_id=3,4,5,6）
-- 全ての商品を買っているcustomerのレコードは0件なので取得しない（customer_id=1,2）
SELECT *
FROM Customers AS C1
WHERE EXISTS
    (SELECT *
        FROM Products AS P1
        WHERE P1.item_id
        NOT IN (SELECT D1.item_id
                FROM Orders AS O1, OrderDetails AS D1
                WHERE O1.customer_id = C1.customer_id
                AND O1.order_id = D1.order_id
        ));



