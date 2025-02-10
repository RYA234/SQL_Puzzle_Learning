SELECT X.student_name,
        CASE WHEN COUNT(C1.credit_cat)
            	>= (SELECT COUNT(*) FROM Categories)
			 THEN 'X'
			 ELSE '' END AS grad,
		CASE WHEN COUNT(C1.credit_cat)
			 	< ( SELECT COUNT(*) FROM Categories)
			 THEN 'X'
			 ELSE '' END AS nograd
	FROM (SELECT student_name, credit_cat,
				SUM(credits) AS cat_credits
		  FROM CreditsEarned
		  GROUP BY student_name, credit_cat) AS X
		LEFT OUTER JOIN
		Categories AS C1
		ON X.credit_cat = C1.credit_cat
		AND X.cat_credits >= C1.rqd_credits
	GROUP BY X.student_name;
	