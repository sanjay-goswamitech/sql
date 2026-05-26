create database if not exists datatypdb;
use datatypdb;
-- numeric 
create table test1(id tinyint);
insert into test1 values(-1),(10);
insert into test1 values(-129);-- out of range ( 1 byte => 8 bit => 2**8 (-128 to 127) 
select * from test1;

-- small int -> 2 byte medium int -> 3 byte 
-- int -> 4 

create table test2(age tinyint unsigned);
insert into test2 values(250);
select * from test2;


create table test3(salary float,salary2 double);
insert into test3 values(1989.98778,1989.183787878);
select * from test3;

create table test4(price double(6,2) );-- total is 6,2 is decimal value , 4 are the value before only 2 decimal 
insert into test4 values(0.754);
insert into test4 values(44.4543);
insert into test4 values(4456.343);
insert into test4 values(4456);
insert into test4 values(44564); -- 5 integar values 
select * from test4;


-- char and varchar 
create table test5 (countrycode char(3) );
insert into test5 values('IND');
insert into test5 values('INDIA');-- <<<<<<<<<-- ERROR 
insert into test5 values('he   ');
select *, char_length(countrycode) from test5; -- char ending ke wide spaces ko hta deta h ,
-- char_length total char ko count krta h 

create table test6 (countrycode varchar(3) );
insert into test6 values('IND');
insert into test6 values('INDIA');-- <<<<<<<<<-- ERROR 
insert into test6 values('he   ');
select *, char_length(countrycode) from test6;


-- ddl statemnt
create table test10(id int, name varchar(20));
insert into test10 values(1,'abhi'),(2,'shimi'),(3,'yash');
select * from test10;

-- ddl drop statement

-- truncate => data is deleted but not the table structure 
-- ddl drop statement => drop will delete both structure and table 
-- drop table struture is droped/removed 
truncate test10;
select * from test10;
drop table test10;


create table test11(id int, name varchar(20));
insert into test11 values(1,'abhi'),(2,'shimi'),(3,'yash');
select * from test11;
-- data me changes hota h to dml 
-- and struture me ho rh h to ddl

 alter table test11 add column (salary int);
 alter table test11 add column (age int default 18);
 alter table test11 drop column salary;-- to delete column
alter table test11 rename column age to newage;
alter table test11 add constraint primary key (id);
desc test11;
-- add a colm before thw name colm , change the datatyp of name colm to int , 
-- and add not null contrainst to name and age colmn add a foregin key of a colmn name as the department id which is reference to department table 


select database();
select * from sakila.actor;


-- CTAS => CREATE TABLE AS SELECT STATEMENT 
drop table tushar985;
create table tushar985 as select actor_id,first_name from sakila.actor;
select * from tushar985;
insert into tushar985 values(19999,'japan'); 

SET SQL_SAFE_UPDATES = 0;
update tushar985 set first_name='raj' WHERE actor_id=2 ;

delete from tushar985 where actor_id=2;

-- interview questions 
-- what is ddl and dml statement 
-- diffrence btw truncate , delete , drop 
-- what is normalization 
-- diffrece btw char , varchar datatyp 


