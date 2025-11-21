create table salesHash2(
    salesman_id NUMBER(5) PRIMARY KEY,
    salesman_name VARCHAR2(30),
    sales_amount NUMBER(10),
    week_no NUMBER(2)
)
partition by hash(salesman_id)
partitions 4;

select * from user_tab_partitions;

INSERT INTO salesHash2 VALUES (1, 'Aman', 1500, 1);
INSERT INTO salesHash2 VALUES (2, 'Ravi', 3200, 2);
INSERT INTO salesHash2 VALUES (3, 'Sagar', 4200, 3);
INSERT INTO salesHash2 VALUES (4, 'Mehul', 2500, 2);
INSERT INTO salesHash2 VALUES (5, 'John', 5100, 4);
INSERT INTO salesHash2 VALUES (6, 'Sam', 1900, 1);
INSERT INTO salesHash2 VALUES (7, 'Rohan', 3000, 2);
INSERT INTO salesHash2 VALUES (8, 'Pratik', 2800, 3);
INSERT INTO salesHash2 VALUES (9, 'Ankit', 2200, 4);
INSERT INTO salesHash2 VALUES (10, 'Ramesh', 4700, 1);

select * from salesHash2 partition (SYS_P1272);

select salesman_name from salesHash2 partition (SYS_P1275) where sales_amount between 1500 and 5100;

select avg(sales_amount), week_no from salesHash2 partition (SYS_P1275) group by (week_no);