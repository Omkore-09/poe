create table emp2(
    eno     NUMBER PRIMARY KEY,
    ename   VARCHAR2(30),
    city    VARCHAR2(30),
    salary  NUMBER
)

INSERT INTO emp2 VALUES (1, 'Amit', 'Pune', 12000);
INSERT INTO emp2 VALUES (2, 'Neha', 'Delhi', 18000);
INSERT INTO emp2 VALUES (3, 'Suresh', 'Mumbai', 15000);
INSERT INTO emp2 VALUES (4, 'Rita', 'Chennai', 22000);
INSERT INTO emp2 VALUES (5, 'Kiran', 'Pune', 14000);
INSERT INTO emp2 VALUES (6, 'John', 'Mumbai', 26000);
INSERT INTO emp2 VALUES (7, 'Meera', 'Delhi', 16000);
INSERT INTO emp2 VALUES (8, 'Arjun', 'Goa', 10000);
INSERT INTO emp2 VALUES (9, 'Dev', 'Bangalore', 24000);
INSERT INTO emp2 VALUES (10, 'Rohit', 'Pune', 15000);

drop table emph2;
drop table emph3;

create table emph2 as select * from emp2 where salary <=15000;
create table emph3 as select * from emp2 where salary > 15000;

SELECT * FROM emph2;
SELECT * FROM emph3;


create table hfnew1 as select eno, ename, city from emp2;
create table hfnew2 as select eno, salary from emp2;

select * from hfnew1;

select eno, ename from emp;

select eno, ename from emp2 where salary = 15000;

SELECT ename, city 
FROM emp
WHERE salary BETWEEN 15000 AND 25000;

SELECT ename, city 
FROM emp
WHERE eno = 5;

