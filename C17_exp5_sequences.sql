create table customer2(
    cus_code integer,
    fname varchar2(20),
    lname varchar2(20),
    cus_initial varchar2(1)
    
)

create sequence cus_seq start with 1 increment by 1;

select sequence_name from user_sequences;

insert into customer2 values (cus_seq.nextval, 'hemlesh', 'kore', 'h');

insert into customer2 values (cus_seq.nextval, 'vimlesh', 'telang', 'v');

insert into customer2 values (cus_seq.nextval, 'ganvesh', 'kamble', 'g');

select * from customer2;