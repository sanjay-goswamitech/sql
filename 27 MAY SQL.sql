create database rajdb;
use rajdb;
create table raj45(id int);
insert into raj45 values(10);
select * from raj45;


-- tcl 
start transaction;
insert into raj45 values(100),(99);
commit;-- TRASACTIONS KO SAVE KR DETA H 

-- transaction kb kb start hote h 
-- iske 2 option hote h -- set autocommit disable 
-- aap start trasaction likhte h , dml ke baad transc panding m hote h
-- trasaction ko end krne ke liye roleback , commit krege , ddl statement ko execute 


SET SQL_SAFE_UPDATES = 0;
start transaction;
update raj45 SET id=500;
select * from raj45;
rollback;-- ALL TRASACTIONS KO UNDO KR DETA H 

-- DELETE KRNE PR TRASACTIONS ME UNDO NHI HOTA H 

-- SELECT @@autocommit;

start transaction;
insert into raj45 values(10),(11),(56),(68);
delete from raj45 where id=10;
select * from raj45;
commit;
rollback;

start transaction;
insert into raj45 values(400),(300),(500);
savepoint raj45_savepoint_ins;
update raj45 set id=400;
rollback to raj45_savepoint_ins;-- rollback 
 select * from raj45;
 
--  TRUNCATE AND DROP  ROLLBACK NI HO SKTE BECAUSE YE DDL COMMAND H 
-- AND DELETE IS A DML COMMAND 
 
 