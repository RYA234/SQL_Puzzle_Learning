--解法４つあるけど　最初の一つで良くない？
-- シンプルだし
DROP TABLE IF EXISTS printer_control;
CREATE TABLE printer_control
(user_id_start CHAR(10) NOT NULL,
user_id_finish CHAR(10) NOT NULL,
printer_name CHAR(4) NOT NULL PRIMARY KEY,
printer_description CHAR(40) NOT NULL
);

INSERT INTO printer_control VALUES
('chacha','chacha','LPT1','First printer'),
('lee','lee','LPT2','Second printer'),
('thomas','thomas','LPT3','Third printer'),
('a','mzzzzzz','LPT4','Common printer 1'),
('n','zzzzzz','LPT5','Common printer 2')
