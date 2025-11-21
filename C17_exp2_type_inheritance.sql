create or replace type Person1 as object(
    fname varchar(20),
    lname varchar(20),
    dob date,
    
    member function FullName return varchar2,
    member function OnDate return date
)not final;
/
create or replace type body Person1 as
    member function FullName return varchar2 is
    begin 
    return fname || lname;
    end FullName;
    
    
    member function OnDate return date is
    begin 
    return dob;
    end OnDate;
    
end;
/

create or replace type EmpObj1 under Person1(
    job varchar2(20),
    sa integer,
    da integer,
    doj date,
    member function Earn return integer,
    overriding member function OnDate return date
) NOT FINAL;
/

create or replace type body EmpObj1 as 
member function Earn return integer is
begin 
return sa+da;
end Earn;

overriding member function OnDate return date is
begin 
return doj;
end OnDate;

end;
/


create table Employee1 of EmpObj1;

insert into Employee1 values ( EmpObj1('geet', 'raj', TO_DATE('01-01-2004', 'DD-MM-YYYY'), 'SDE', 100,10, TO_DATE('01-01-2025', 'DD-MM-YYYY')) );
insert into Employee1 values ( EmpObj1('kamlesh', 'kore', TO_DATE('01-02-2004', 'DD-MM-YYYY'), 'SDE', 200, 10, TO_DATE('01-02-2025', 'DD-MM-YYYY')));

select e.FullName(), e.Earn(), e.job from Employee1 e;
drop type Person1;

