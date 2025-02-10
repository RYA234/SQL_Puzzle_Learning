SELECT E1.i,E2.i,E3.i,E4.i,E5.i,E6.i,E7.i
FROM ELEMENTS AS E1,ELEMENTS AS E2,ELEMENTS AS E3,
     ELEMENTS AS E4,ELEMENTS AS E5,ELEMENTS AS E6,
     ELEMENTS AS E7
WHERE (E1.i + E2.i + E3.i + E4.i + E5.i + E6.i + E7.i) =28
AND E1.i NOT IN (E2.i, E3.i ,E4.i , E5.i, E6.i, E7.i)
AND E2.i NOT IN (E1.i, E3.i ,E4.i , E5.i, E6.i, E7.i)
AND E3.i NOT IN (E1.i, E2.i ,E4.i , E5.i, E6.i, E7.i)
AND E4.i NOT IN (E1.i, E2.i ,E3.i , E5.i, E6.i, E7.i)
AND E5.i NOT IN (E1.i, E2.i ,E3.i , E4.i, E6.i, E7.i)
AND E6.i NOT IN (E1.i, E2.i ,E3.i , E4.i, E5.i, E7.i)
AND E7.i NOT IN (E1.i, E2.i ,E3.i , E4.i, E5.i, E6.i)
;