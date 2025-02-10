SELECT DISTINCT P1.file_id,stuff,suc_date
	FROM portfolios AS P1, succession AS S1
	WHERE P1.file_id = S1.file_id
	AND next =(SELECT MAX(next)
		FROM succession AS S2
		WHERE S1.chain = S2.chain)
	;