Update Badges
    SET badge_status = 'A'
    WHERE ('I' = ALL (SELECT badge_status
                        FROM Badges AS B1
                        WHERE Badges.emp_id = B1.emp_id))
    AND (issued_date = (SELECT MAX(issued_date)
                            FROM Badges AS B2
                        WHERE Badges.emp_id = B2.emp_id));