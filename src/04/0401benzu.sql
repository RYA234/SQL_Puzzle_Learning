-- Update Badges
--     SET badge_status = 'A'
--     WHERE ('I' = ALL (SELECT badge_status
--                         FROM Badges AS B1
--                         WHERE Badges.emp_id = B1.emp_id))
--     AND (issued_date = (SELECT MAX(issued_date)
--                             FROM Badges AS B2
--                         WHERE Badges.emp_id = B2.emp_id));


-- SELECT B1.*,B2.*
-- -- SELECT B1.badge_status
--               FROM Badges AS B1, Badges AS B2
--               WHERE B2.emp_id = B1.emp_id
-- 	;

-- １　'I'の状態のバッジを全部取得する
-- SELECT B2.*
-- FROM Badges AS B2
-- WHERE
-- ('I' = ALL (SELECT B1.badge_status
--               FROM Badges AS B1
--               WHERE B2.emp_id = B1.emp_id));

-- SELECT B1.emp_id,B1.badge_nbr,B1.issued_date
--     FROM Badges AS B2,Badges AS B1
-- 	WHERE B1.emp_id = B2.emp_id;


-- SELECT B1.emp_id,MAX(B2.issued_date)
--     FROM Badges AS B2,Badges AS B1
-- 	WHERE B1.emp_id = B2.emp_id
-- 	GROUP BY B1.emp_id;

-- ２　一番新しい日付のバッジを取得する
-- SELECT * 
-- FROM Badges AS B1
-- WHERE
-- (B1.issued_date = (SELECT MAX(B2.issued_date)
--                         FROM Badges AS B2
--                         WHERE B1.emp_id = B2.emp_id));


-- 3　Aに更新するBadgeを取得する
SELECT * 
FROM Badges
WHERE
('I' = ALL (SELECT badge_status
              FROM Badges AS B1
              WHERE Badges.emp_id = B1.emp_id))
AND
(issued_date = (SELECT MAX(issued_date)
                            FROM Badges AS B2
                        WHERE Badges.emp_id = B2.emp_id));