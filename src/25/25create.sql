drop table if EXISTS ServicesSchedule;
Create table ServicesSchedule(
    shop_id char(3) not null,
    order_nbr char(10) Not Null,
    sch_seq char(10) not null,
    service_type char(2) not null,
    sch_date Date,
    primary key(shop_id, order_nbr, sch_seq));

INSERT INTO ServicesSchedule VALUES('002',   '4155526710',   1,   '01', '1994-07-16' );
INSERT INTO ServicesSchedule VALUES('002',   '4155526710',   2,   '01', '1994-07-30' ); 
INSERT INTO ServicesSchedule VALUES('002',   '4155526710',   3,   '01', '1994-10-01' );
INSERT INTO ServicesSchedule VALUES('002',   '4155526711',   1,   '01', '1994-07-16' ); 
INSERT INTO ServicesSchedule VALUES('002',   '4155526711',   2,   '01', '1994-07-30' ); 
INSERT INTO ServicesSchedule VALUES('002',   '4155526711',   3,   '01',  NULL ); 