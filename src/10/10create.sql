DROP TABLE IF EXISTS pensions CASCADE;

CREATE TABLE pensions (
	SIN CHAR(10) NOT NULL,
	PEN_YEAR INTEGER NOT NULL,
	MONTH_CNT INTEGER DEFAULT 0 NOT NULL CHECK (MONTH_CNT BETWEEN 0 AND 12),
	EARNINGS DECIMAL(8, 2) DEFAULT 0.00 NOT NULL
);

INSERT INTO
	pensions
VALUES
	-- 5年間で月数が60になる人
	('1234567890', 2015, 12, 3000),
	('1234567890', 2016, 12, 3100),
	('1234567890', 2017, 12, 3200),
	('1234567890', 2018, 12, 3300),
	('1234567890', 2019, 12, 3100),
	('1234567890', 2020, 12, 3500),
	('1234567890', 2021, 12, 3600),
	-- 5年間働いて、4年目は全く働かない
	('2345678901', 2015, 12, 3000),
	('2345678901', 2016, 12, 3100),
	('2345678901', 2017, 12, 3200),
	('2345678901', 2018, 0, 0),
	('2345678901', 2019, 12, 3100)
	;