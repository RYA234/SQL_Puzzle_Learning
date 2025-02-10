DROP TABLE IF EXISTS fiscal_year_table1;

CREATE TABLE fiscal_year_table1
(fiscal_year INTEGER NOT NULL PRIMARY KEY,
 start_date  DATE NOT NULL,
 CONSTRAINT valid_start_date
   CHECK ((EXTRACT(YEAR FROM start_date) = fiscal_year - 1)
           AND (EXTRACT(MONTH FROM start_date) = 10)
           AND (EXTRACT(DAY FROM start_date) = 01)),
 end_date DATE NOT NULL,
 CONSTRAINT valid_end_date
   CHECK ((EXTRACT(YEAR FROM end_date) = fiscal_year)
           AND (EXTRACT(MONTH FROM end_date) = 09)
           AND (EXTRACT(DAY FROM end_date) = 30)));