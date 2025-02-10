DROP VIEW IF EXISTS pen_periods;
CREATE VIEW pen_periods (sin, start_year,earnings_tot)
AS SELECT P0.sin, P0.pen_year, P1.pen_year,
    (SELECT SUM(earnings)
        FROM pensions AS P2
    WHERE P2.sin = P0.sin 
        AND P2.pen_year BETWEEN P0.pen_year AND P1.pen_year
)
    FROM pensions AS P0, pensions AS P1
WHERE P1.sin = P0.sin 
    AND P1.pen_year >= (P0.pen_year - 4)
    AND 0 < ALL (SELECT month_cnt
        FROM pensions AS P3
        WHERE P3.sin = P0.sin
        AND P3.pen_year BETWEEN P0.pen_year AND P1.pen_year)
    AND 60 <= (SELECT SUM(month_cnt)
        FROM pensions AS P4
        WHERE P4.sin = P0.sin
        AND P4.pen_year BETWEEN P0.pen_year AND P1.pen_year);
