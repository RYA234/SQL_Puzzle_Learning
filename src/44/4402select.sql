drop view if EXISTS Report;
create view Report(s1,s2, pair_tally)
AS SELECT CASE WHEN item_a <= item_b
			   THEN item_a
			   ELSE item_b END,
		  CASE WHEN item_a <= item_b
			   THEN item_b
			   ELSE item_a END,
          pair_tally
    FROM SalesSlips;

SELECT s1, s2,SUM(pair_tally)
FROM Report
GROUP BY s1,s2;

