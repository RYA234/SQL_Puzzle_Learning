DROP VIEW IF EXISTS active_badges;
CREATE VIEW active_badges(emp_id, badge_nbr)
AS SELECT emp_id,badge_nbr
    FROM badges AS B1
    WHERE badge_seq = (SELECT MAX(badge_seq) 
                        FROM badges AS B2 
                        WHERE B1.emp_id = B2.emp_id);