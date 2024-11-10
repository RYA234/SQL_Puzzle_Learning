--  Having句を使った場合
SELECT buyer_name
FROM Tickets
GROUP BY buyer_name
Having NOT (MAX(ticket_nbr) - MIN(ticket_nbr) <= count(*));