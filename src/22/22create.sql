drop table if exists Tenents;
CREATE TABLE Tenants
 (tenant_id INTEGER,
  unit_nbr  INTEGER,
  vacated_date DATE,
  PRIMARY KEY (tenant_id, unit_nbr));

drop table if exists Units;
CREATE TABLE Units
 (complex_id INTEGER,
  unit_nbr   INTEGER,
  PRIMARY KEY (complex_id, unit_nbr));

drop table if exists RentPayments;

CREATE TABLE RentPayments
 (tenant_id   INTEGER,
  unit_nbr   INTEGER,
  payment_date   DATE,
  PRIMARY KEY (tenant_id, unit_nbr));

--サンプルデータ
INSERT INTO Tenants VALUES(1, 1, NULL);
INSERT INTO Tenants VALUES(1, 2, NULL);
INSERT INTO Tenants VALUES(1, 3, '2007-01-01');

INSERT INTO Units VALUES(32, 1);
INSERT INTO Units VALUES(32, 2);
INSERT INTO Units VALUES(32, 3);

/* ユニット１は家賃を払っている。２は払っていない */
INSERT INTO RentPayments VALUES(1, 1, '2007-03-01');