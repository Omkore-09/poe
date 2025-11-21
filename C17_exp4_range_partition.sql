create table employees2(
    id int primary key,
    fname varchar2(20),
    lname varchar2(20),
    store_id int,
    dept_id int
)
Partition by range(id)(
    partition p0 values less than (5),
    partition p1 values less than (8),
    partition p2 values less than (12)
);
INSERT INTO employees2 VALUES (1,  'Sname1',  'Lname1',  1, 1);
INSERT INTO employees2 VALUES (2,  'Sname2',  'Lname2',  2, 2);
INSERT INTO employees2 VALUES (3,  'Sname3',  'Lname3',  3, 3);
INSERT INTO employees2 VALUES (4,  'Sname4',  'Lname4',  4, 4);

INSERT INTO employees2 VALUES (5,  'Fname5',  'Lname5',  5, 1);
INSERT INTO employees2 VALUES (6,  'Fname6',  'Lname6',  1, 2);
INSERT INTO employees2 VALUES (7,  'Fname7',  'Lname7',  2, 3);
INSERT INTO employees2 VALUES (8,  'Fname8',  'Lname8',  3, 4);
INSERT INTO employees2 VALUES (9,  'Fname9',  'Lname9',  4, 1);

INSERT INTO employees2 VALUES (10, 'Sname10', 'Lname10', 5, 2);

sel

select * from employees2 partition (p1) union select * from employees2 partition p2;
select * from employees2 partition (p1) where fname like 'S%' union select * from employees2 partition (p2) where fname like 'S%';

select count(*) count_emp from employees2 partition (p0) group by (dept_id) union select count(*) count_emp from employees2 partition (p1) group by (dept_id) ;