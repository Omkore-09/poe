create or replace type nameStruct as object(
    fname varchar(20),
    lname varchar(20)
);

create or replace type publisher as object(
    pub_id varchar(20),
    pub_name varchar(20),
    branch varchar(20)
);

create or replace type phone_no as varray(10) of varchar2(20);



create or replace type author_id as varray(10) of varchar2(20);



create or replace type keywords as varray(10) of varchar2(20);

drop table Author;
create table Author (
    auth_id varchar(20) primary key,
    name_author nameStruct,
    phone phone_no
);

drop table Book;
create table Book(
    isbn integer primary key,
    title varchar2(20),
    auth_id varchar2(20),
    category varchar2(20),
    publisher publisher,
    keyword keywords,
    price integer,
    foreign key(auth_id) references Author(auth_id)
);


drop table Customer;


create table Customer(
    customer_id varchar(10) primary key,
    name nameStruct,
    phone phone_no
    
);

drop table book_sale;

create table book_sale(
    sale_id varchar2(10) primary key,
    customer_id varchar2(10),
    isbn integer,
    foreign key(isbn) references book(isbn),
    foreign key(customer_id) references customer(customer_id)
);


insert into Author values(
    '1001',
    nameStruct('sarvesh', 'kamtekar'),
    phone_no('919293')
);


insert into Author values(
    '1002',
    nameStruct('kamlesh', 'kore'),
    phone_no('919293')
);

insert into Author values(
    '1003',
    nameStruct('vimlesh', 'telang'),
    phone_no('919293')
);

insert into Book values(100, 'abc', '1001', 'funny', publisher('111', 'verma', 'mumbai'), keywords('none'), 999);
insert into Book values(101, 'xyz', '1002', 'science', publisher('112', 'sharma', 'pune'), keywords('none'), 999);
insert into Book values(102, 'uvw', '1001', 'fiction', publisher('111', 'verma', 'mumbai'), keywords('none'), 999);


insert into Customer values('C1', nameStruct('CS1', 'CE1'), phone_no('111','1111'));
insert into Customer values('C2', nameStruct('CS2', 'CE2'), phone_no('111','1111'));
insert into Customer values('C3', nameStruct('CS3', 'CE3'), phone_no('111','1111'));

insert into book_sale values('S1', 'C1', 100);
insert into book_sale values('S2', 'C3', 100);
insert into book_sale values('S3', 'C1', 101);

select b.title, b.isbn, a.name_author.fname || a.name_author.lname from Book b natural join author a ;


select c.name.fname from Customer c join book_sale bs on c.customer_id = bs.customer_id join book b on b.isbn = bs.isbn where b.publisher.branch = 'mumbai order by' ;

select c.name.fname, b.title, b.publisher.pub_name from Customer c join book_sale bs on c.customer_id = bs.customer_id join Book b on b.isbn = bs.isbn where b.publisher.branch in ('mumbai', 'pune') order by c.name.lname;

select b.category, count(*) from Book b group by (b.category) order by(b.category) asc;

select a.name_author.fname, count (*) from Author a join book b on a.auth_id = b.auth_id join book_sale bs on bs.isbn = b.isbn group by a.name_author.fname;