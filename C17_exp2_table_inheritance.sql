create table person2(
    personId integer primary key,
    fname varchar2(20),
    lname varchar2(20)
)

create table students2(
    personId integer primary key,
    division varchar2(10),
    foreign key (personId) references person2(personId)
)


create table teachers2(
    personId integer primary key,
    division varchar2(10),
    foreign key (personId) references person2(personId)
)

create table parents2(
    personId integer primary key,
    numberOfChildren integer,
    foreign key (personId) references person2(personId)
)

insert into person2 values (1, 'ganesh', 'kore');

insert into person2 values (2, 'suresh', 'kir');


insert into person2 values (3, 'vighnesh', 'koth');

insert into parents2 values(2, 3);

select * from parents2;

delete from person2 where personId = 2;