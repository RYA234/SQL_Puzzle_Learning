-- 14 01
DROP VIEW IF EXISTS home_phones;
CREATE VIEW home_phones(last_name)
 AS SELECT E1.last_name
 FROM (personnel AS E1 LEFT OUTER JOIN phones AS H1
         ON E1.emp_id = H1.emp_id
         AND H1.phone_type = 'hom'
 );