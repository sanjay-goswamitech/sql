create database text90;
use test90;
create table test_date(dob date);
insert into test_date values('2025-12-05');

insert into test_date
select * from test_date;
-- constraint => constraint are  the set of rules that are applied on the table colomn to avoid invalid data entry 
-- not null ,default,unique,check,primary key
create table test100(salary int not null, age int);
insert into test100 values(100,20),(10,30),(50,null);
-- insert into test100 values(null,900); -- yha not null constraint lga h esliye null store nhi ho skta salary me 

insert into test100(salary) value(88); -- salary me 88 insertvho gy but age null 
-- default => null ki jgh pr koi another element store kr dete h 
create table test101(salary int not null default 1900, age int default 18);
insert into test101 values(100,20),(10,30),(50,null);

insert into test101(salary) value(88);
insert into test101(age) value(60);
select * from test101;
-- unique=> unique value , multiple null ,default one time ok but next time not ok 
create table test102(salary int unique default 1900, age int);
insert into test102 values(100,20),(10,30),(50,null);

insert into test102 value(null,88);
insert into test102 value(null,88);
insert into test102(age) value(88);
select * from test102;
-- check constraint=> condition 
create table test201(salary int , age int check (age>18) );
insert into test201 values(19,22);
drop table test203;
create table test203( a int,b int, salary int, age int,
                     constraint test_test203_salary_chk_1000_lt check (salary>1000),
                     constraint test_test203_age_uq check (age>18) );
insert into test203 values(1,2,2000,19);
-- primary key=>
create table test205(a int primary key ,b int);
insert into test205 values(1,22);
insert into test205 values(1,21);-- error
insert into test205 values(null,22);-- eorro
insert into test205 values(1102,12);

--
create table test206(a int,b int,
			  primary key(a,b) );
insert into test206 values(10,20);
insert into test206 values(10,21);
desc test206;
select * from test206;


