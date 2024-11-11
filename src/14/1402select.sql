-- SELECT E1.last_name,E1.first_name,H1.phone_nbr AS Home,
--        F1.phone_nbr AS FAX
--     FROM (Personnel AS E1 LEFT OUTER JOIN Phones AS H1 -- 結合１回目
--            ON E1.emp_id = H1.emp_id
--            AND H1.phone_type = 'hom'
--          )
--          LEFT OUTER JOIN Phones AS F1	-- 結合２回目
--            ON E1.emp_id = F1.emp_id
--            AND F1.phone_type = 'fax'
-- ;


-- SELECT *
--     FROM Personnel AS E1 LEFT OUTER JOIN Phones AS H1
--            ON E1.emp_id = H1.emp_id
-- ;


-- SELECT *
--     FROM Personnel AS E1 LEFT OUTER JOIN Phones AS H1
--            ON E1.emp_id = H1.emp_id
--            AND H1.phone_type = 'hom'
-- ;


-- SELECT *
--     FROM Personnel AS E1 LEFT OUTER JOIN Phones AS H1
--            ON E1.emp_id = H1.emp_id
--            AND H1.phone_type = 'fax'
-- ;


-- 結合１回目
-- SELECT *
--     FROM (Personnel AS E1 LEFT OUTER JOIN Phones AS H1
--            ON E1.emp_id = H1.emp_id
--            AND H1.phone_type = 'hom'
--          )
-- ;
-- 結合２回目
SELECT *
    FROM (Personnel AS E1 LEFT OUTER JOIN Phones AS H1
           ON E1.emp_id = H1.emp_id
           AND H1.phone_type = 'hom'
         )
         LEFT OUTER JOIN Phones AS F1
           ON E1.emp_id = F1.emp_id
           AND F1.phone_type = 'fax'
;