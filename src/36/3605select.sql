SELECT person,
        CASE WHEN MIN(job) <> MAX(role)
        THEN 'B'
        ELSE MIN(job) END AS combined_role
    FROM Roles
    WHERE role IN('D','O')
    GROUP BY person,role;
    