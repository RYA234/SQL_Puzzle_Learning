SELECT P.emp_id, emp_name,badge_nbr
    FROm Personnel AS P, Badges AS B
    WHERE B.emp_id = P.emp_id
    AND B.badge_status = 'A'
    ;