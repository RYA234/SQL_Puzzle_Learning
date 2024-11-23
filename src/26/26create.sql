drop table if  EXISTS DataFlowDiagrams; 
CREATE TABLE DataFlowDiagrams
(diagram_name CHAR(10) NOT NULL,
 bubble_name CHAR(10) NOT NULL,
 flow_name CHAR(10) NOT NULL,
    PRIMARY KEY (diagram_name, bubble_name, flow_name));

INSERT INTO DataFlowDiagrams VALUES('Proc1',  'input' ,   'guesses');
INSERT INTO DataFlowDiagrams VALUES('Proc1',  'input' ,   'opinions'); 
INSERT INTO DataFlowDiagrams VALUES('Proc1',  'crunch',   'facts');
INSERT INTO DataFlowDiagrams VALUES('Proc1',  'crunch',   'guesses');
INSERT INTO DataFlowDiagrams VALUES('Proc1',  'crunch',   'opinions' );
INSERT INTO DataFlowDiagrams VALUES('Proc1',  'output',   'facts');
INSERT INTO DataFlowDiagrams VALUES('Proc1',  'output',   'guesses');
INSERT INTO DataFlowDiagrams VALUES('Proc2',  'reckon',   'guesses');
INSERT INTO DataFlowDiagrams VALUES('Proc2',  'reckon',   'opinions' );