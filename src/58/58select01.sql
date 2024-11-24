-- 58欠番探し　バージョン２　その１ 
--  Having句を使った場合
SELECT buyer_name
FROM Tickets
GROUP BY buyer_name
Having NOT (MAX(ticket_nbr) - MIN(ticket_nbr) <= count(*))
-- 下でも成り立つ 
-- Having  (MAX(ticket_nbr) - MIN(ticket_nbr)  > count(*))	
;


-- Having句を外して、SELECT句以下にmax,min,countを加える
-- 連番の場合　max(ticket_nbr)-min(ticket_nbr) -1 =count(*)だと確認できる
SELECT buyer_name,min(ticket_nbr),max(ticket_nbr),max(ticket_nbr)-min(ticket_nbr) as diff_max_min,count(*)
FROM Tickets
GROUP BY buyer_name
;