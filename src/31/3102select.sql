SELECT AVG(acct_balance)
FROM Customers AS C1
WHERE (SELECT COUNT(DISTINCT item_id)
            FROM Products)
        <> (SELECT COUNT(DISTINCT item_id)
                FROM Orders, OrderDetails
                WHERE Orders.customer_id = C1.customer_id
                AND Orders.order_id = OrderDetails.order_id
        );