drop table if EXISTS Sales CASCADE;

create Table Sales(
    customer_name char(5) NOT NULL,
    sale_date Date NOT NULL,
    Primary KEY(customer_name, sale_date)
);

INSERT INTO Sales VALUES('Fred', '1994-06-01');
INSERT INTO Sales VALUES('Mary', '1994-06-01');
INSERT INTO Sales VALUES('Bill', '1994-06-01');
INSERT INTO Sales VALUES('Fred', '1994-06-02');
INSERT INTO Sales VALUES('Bill', '1994-06-02');
INSERT INTO Sales VALUES('Bill', '1994-06-03');
INSERT INTO Sales VALUES('Bill', '1994-06-04');
INSERT INTO Sales VALUES('Bill', '1994-06-05');
INSERT INTO Sales VALUES('Bill', '1994-06-06');
INSERT INTO Sales VALUES('Bill', '1994-06-07');
INSERT INTO Sales VALUES('Fred', '1994-06-07');
INSERT INTO Sales VALUES('Mary', '1994-06-08');