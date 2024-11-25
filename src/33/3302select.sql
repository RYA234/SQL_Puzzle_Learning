-- SELECT 1995-07-24 AS my_date,F.machine_name,
--         (MAX((initial_cost / lifespan) * ))
SELECT '1995-08-01' AS my_date ,F.machine_name,(MAX((initial_cost / lifespan) 
							* ('1995-08-01' -purchase_date + 1)) + SUM(manu_cost))
							/ SUM(manu_hrs) AS average_hour 
FROM ManufactHrsCosts AS F, Machines AS M
WHERE M.machine_name = F.machine_name
 AND purchase_date <= '1995-08-01' 
 AND manu_date <= '1995-08-01'
 GROUP BY F.machine_name
 ;