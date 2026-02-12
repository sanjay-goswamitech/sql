create database rmd;
use rmd;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount DECIMAL(10,2)
);


INSERT INTO customers VALUES
(1, 'John', 'New York'),
(2, 'Alice', 'Los Angeles'),
(3, 'Bob', 'Chicago'),
(4, 'Emma', 'Houston'),
(5, 'Michael', 'Phoenix'),
(6, 'Sophia', 'Dallas'),
(7, 'David', 'Seattle'),
(8, 'Olivia', 'Boston'),
(9, 'James', 'Denver'),
(10, 'Isabella', 'Miami');


INSERT INTO orders VALUES
(101, 1, 250.00),
(102, 2, 300.00),
(103, 1, 150.00),
(104, 3, 400.00),
(105, 5, 500.00),
(106, 7, 700.00),
(107, 7, 200.00),
(108, 9, 350.00),
(109, 11, 600.00),  -- No matching customer
(110, 12, 800.00);  -- No matching customer

select * from customers;
select * from orders;

select customer_id,name from customers;
select order_id,customer_id,order_amount from orders;
-- inner join (matching value)
select cs.customer_id,cs.name,ods.order_id,ods.order_amount from customers as cs 
inner join orders as ods 
on cs.customer_id=ods.customer_id;
-- left  join (matching data and left side all data ), 
select cs.customer_id,cs.name,ods.order_id,ods.order_amount from customers as cs -- (left side)
  left join orders as ods 
on cs.customer_id=ods.customer_id;
--
select cs.customer_id,cs.name,ods.order_id,ods.order_amount from customers as cs 
left join orders as ods 
on cs.customer_id=ods.customer_id where ods.order_id is null;-- null value access krne ke liye (is) use krte hai 
-- total amount spend for the orders by the customer 
select  sum(ods.order_amount) from customers as cs 
inner join orders as ods 
on cs.customer_id=ods.customer_id;
-- total amount spend for the orders by the customer 

select sum(ods.order_amount) from customers as cs 
inner join orders as ods 
on cs.customer_id=ods.customer_id;
-- 1.  get me total no. of orders which are not placed by a customer 
--  2. get me  the total no. are spend and the avg amount spend for the orders plased by cus.id 3 or more than that
 -- 1
 select count(ods.order_id) from customers as cs 
right join orders as ods 
on cs.customer_id=ods.customer_id where cs.customer_id is null;
-- 2 
select sum(ods.order_amount) , avg(ods.order_amount) from customers as cs
 inner join orders as ods on
 cs.customer_id=ods.customer_id 
 where cs.customer_id>=3; 

-- self join => 

CREATE TABLE employees (
    eid INT PRIMARY KEY,
    ename VARCHAR(100),
    salary DECIMAL(10,2),
    manager_id INT
);



INSERT INTO employees VALUES
(1, 'John', 90000, NULL),   -- Top-level manager (CEO)
(2, 'Alice', 75000, 1),
(3, 'Bob', 70000, 1),
(4, 'Emma', 65000, 2),
(5, 'Michael', 60000, 2),
(6, 'Sophia', 62000, 2),
(7, 'David', 58000, 3),
(8, 'Olivia', 55000, 3),
(9, 'James', 50000, 4),
(10, 'Isabella', 52000, 4);


select * from employees;


