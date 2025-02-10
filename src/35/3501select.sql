SELECT req_date,req_qty,
        (SELECT SUM(req_qty)
            FROM InventoryAdjustments AS A2
            WHERE A2.req_date <= A1.req_date) AS req_onhand_qty
            FROM InventoryAdjustments AS A1
            ORDER BY req_date;
            