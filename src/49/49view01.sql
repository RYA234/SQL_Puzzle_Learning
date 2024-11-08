DROP VIEW IF EXISTS prod3;

CREATE VIEW prod3(production_center, wk_date,widge_cnt,third)
AS SELECT production_center,wk_date,widget_cnt,
          CASE WHEN batch_nbr <= (SELECT MAX(batch_nbr)/3
                                        FROM Production AS P2
                                        WHERE P1.production_center
                                                =P2.production_center
                                          AND P1.wk_date = P2.wk_date)
          THEN 1
          WHEN batch_nbr> (SELECT MAX(batch_nbr * 2)/3
                                        FROM Production AS P2
                                        WHERE P1.production_center
                                                =P2.production_center
                                          AND P1.wk_date = P2.wk_date)
          THEN 3
          ELSE 2
      END
      From Production AS P1;
