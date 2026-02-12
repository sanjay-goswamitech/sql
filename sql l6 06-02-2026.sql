show databases ;
use sakila;
show tables;
select * from payment;
-- sum , count , max , avg 
-- non aggrigate colomn kisi bhi aggrate function ke sath access ho skta h 
select customer_id,sum(amount) from payment where customer_id=3 ;


select customer_id, sum(amount) , count(customer_id) from payment group by customer_id;

select  * from  payment;
select count(*) , sum(amount) from payment where payment_id=3;
select payment_id, count(*) , sum(amount) from payment group by payment_id ;


-- question 
select amount , count(*) from payment group by amount;
-- 2
select  customer_id ,  sum(amount) , max(amount) , count(*) from payment group by customer_id;

-- you have to find out the total amount is spend by each staff along with the number of customers they have served only after the payment id 9 
select staff_id, sum(amount) , max(amount) , count(customer_id) from payment where payment_id>9  group by staff_id;

-- you have to find the total amont is spend and avg amount  and total transtion done in each month 
select * from payment;
select  month(payment_date) , sum(amount), avg(amount) , count(payment_id) from payment group by month(payment_date);
-- get total avg max amont gone for the fist week of each month may june and july 
select   month(payment_date),sum(amount), avg(amount),  max(amount)  from payment 
 where month(payment_date) in (5,6,7) and day(payment_date) between 1 and 7 group by month(payment_date);

  
select count(customer_id) , count( distinct customer_id )  from payment where date(payment_date)=last_day(payment_date);
