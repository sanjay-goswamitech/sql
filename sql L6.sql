show databases;
create database sanjay;
use sanjay;
show tables;
create table student(sid int, name char(10));
show tables;
-- to use database
use sakila; 
show tables;

-- explain table structure 
describe actor;

-- select colomn   from    table_name 
select * from actor;
select actor_id , first_name from actor;
select actor_id , first_name, first_name,actor_id*10 from actor;
-- select works like print --> does not have any impact on the original data 
-- x-10
-- print(x+10)
select * from actor;

-- to filter by row / data --> we use = where 
-- select * from table where condition 
select * from actor where actor_id!=3;
-- ( > , >=,<=,=,!=,<> )

select * from actor where first_name='NICK';
-- select * from actor where first_name>'A';
select * from actor where first_name>'A';
-- logical operater (and , or , not )
-- logical operator condition, (col>value)
select * from actor where actor_id>3 and actor_id<7; 
 select * from actor where actor_id>3 and actor_id=5;
 
 
select * from actor where actor_id=3 or actor_id=5;
select * from actor where actor_id>3 or actor_id=5;
select * from actor where actor_id>3 or actor_id=1;
select * from actor where actor_id>2 and  actor_id>4 or actor_id=7;