SELECT seq FROm sequence_1
WHERE seq <= (SELECT MAX(seq) FROM Numbers)
EXCEPT ALL
SELECT seq FROM Numbers;
