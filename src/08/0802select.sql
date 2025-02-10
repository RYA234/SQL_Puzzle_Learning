
SELECT COALESCE(MIN(printer_name),
	(SELECT MIN(printer_name)
		FROM PrinterControl AS A2
		WHERE user_id IS NULL))
	FROM PrinterControl AS P1
	WHERE user_id = 'pcelco';
-- WHERE user_id = 'thomas';
;