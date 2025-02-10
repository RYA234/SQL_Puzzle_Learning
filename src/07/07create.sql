DROP TABLE IF EXISTS portfolios;
CREATE TABLE portfolios
(file_id INTEGER NOT NULL PRIMARY KEY,
stuff CHAR(15) NOT NULL);

INSERT INTO portfolios
VALUES (222, 'stuff'),
       (223, 'old stuff'),
       (224, 'new stuff'),
       (225, 'borrowed stuff'),
       (322, 'blue stuff'),
       (323, 'purple stuff'),
       (324, 'red stuff'),
       (325, 'green stuff'),
       (999, 'yellow stuff');


DROP TABLE IF EXISTS succession;
CREATE TABLE succession
(chain INTEGER NOT NULL,
 next INTEGER NOT NULL,
 file_id INTEGER NOT NULL REFERENCES Portfolios(file_id),
 suc_date DATE NOT NULL,
 PRIMARY KEY(chain, next));

INSERT INTO succession
VALUES (1, 0, 222, '2007-11-01'),
       (1, 1, 223, '2007-11-02'),
       (1, 2, 224, '2007-11-04'),
       (1, 3, 225, '2007-11-05'),
       (1, 4, 999, '2007-11-25'),
       (2, 0, 322, '2007-11-01'),
       (2, 1, 323, '2007-11-02'),
       (2, 2, 324, '2007-11-04'),
       (2, 3, 322, '2007-11-05'),
       (2, 4, 323, '2007-11-12'),
       (2, 5, 999, '2007-11-25');