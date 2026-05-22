create database rjdb;

use rjdb;

CREATE TABLE sales (
    id INT,
    sale_date DATE,
    amount INT
);


INSERT INTO sales VALUES
(1, '2026-01-01', 100),
(2, '2026-01-02', 200),
(3, '2026-01-03', 300),
(4, '2026-01-04', 400),
(5, '2026-01-05', 500);
-- lag ek piche ka print krwata h 
select *,lag (amount,1) over() from sales;

-- lead => end se ek aage ki print krta hai 
select *, lead(sale_date,1,0) over(order by amount desc) from sales;
-- rinning sum 	
select *, sum(amount) over(order by amount ) from sales;
-- rows between 
select *, sum(amount) over(rows between unbounded preceding and current row)
from sales;
-- unbounded preoceding means => first row 
-- current row => current row 
--  unbounded folowing => 
-- unpreceding => cureent row + just piche wale row
select *, sum(amount) over(rows between  1 preceding and current row)
from sales;

-- first row se current row ke just aage wali row ka sum 
select *, sum(amount) over(rows between  unbounded preceding and 1 following )
from sales;

-- calculate the sum of current row and next row 
select id,sale_date,amount, sum(amount) over( order by sale_date rows  between  unbounded preceding and 1 following ) as current_next_sum
from sales;


select *, sum(amount) over(rows between  unbounded preceding and 1 following )
from sales;
CREATE TABLE employees_sales (
sale_id INT,
employee_name VARCHAR(50),
department VARCHAR(50),
sale_date DATE,
sales_amount INT
);
INSERT INTO employees_sales VALUES
(1, 'Amit', 'Electronics', '2026-01-01', 500),
(2, 'Amit', 'Electronics', '2026-01-03', 700),
(3, 'Amit', 'Electronics', '2026-01-05', 600),
(4, 'Neha', 'Electronics', '2026-01-02', 800),
(5, 'Neha', 'Electronics', '2026-01-04', 900),
(6, 'Neha', 'Electronics', '2026-01-06', 750),
(7, 'Raj', 'Furniture', '2026-01-01', 300),
(8, 'Raj', 'Furniture', '2026-01-03', 450),
(9, 'Raj', 'Furniture', '2026-01-05', 500),
(10, 'Simran', 'Furniture', '2026-01-02', 400),
(11, 'Simran', 'Furniture', '2026-01-04', 550),
(12, 'Simran', 'Furniture', '2026-01-06', 650),
(13, 'Vikas', 'Clothing', '2026-01-01', 200),
(14, 'Vikas', 'Clothing', '2026-01-03', 250),
(15, 'Vikas', 'Clothing', '2026-01-05', 300),
(16, 'Priya', 'Clothing', '2026-01-02', 350),
(17, 'Priya', 'Clothing', '2026-01-04', 400),
(18, 'Priya', 'Clothing', '2026-01-06', 450),
(19, 'Karan', 'Electronics', '2026-01-07', 1000),
(20, 'Karan', 'Electronics', '2026-01-08', 1200);

select * from employees_sales;
CREATE TABLE employee_attendance (
attendance_id INT,
employee_name VARCHAR(50),
department VARCHAR(50),
attendance_date DATE,
hours_worked INT
);
INSERT INTO employee_attendance VALUES
(1, 'Amit', 'Electronics', '2026-01-01', 8),
(2, 'Amit', 'Electronics', '2026-01-02', 9),
(3, 'Amit', 'Electronics', '2026-01-03', 7),
(4, 'Neha', 'Electronics', '2026-01-01', 8),
(5, 'Neha', 'Electronics', '2026-01-02', 10),
(6, 'Neha', 'Electronics', '2026-01-03', 9),
(7, 'Raj', 'Furniture', '2026-01-01', 6),
(8, 'Raj', 'Furniture', '2026-01-02', 7),
(9, 'Raj', 'Furniture', '2026-01-03', 8),
(10, 'Simran', 'Furniture', '2026-01-01', 9),
(11, 'Simran', 'Furniture', '2026-01-02', 8),
(12, 'Simran', 'Furniture', '2026-01-03', 10),
(13, 'Vikas', 'Clothing', '2026-01-01', 5),
(14, 'Vikas', 'Clothing', '2026-01-02', 6),
(15, 'Vikas', 'Clothing', '2026-01-03', 7),
(16, 'Priya', 'Clothing', '2026-01-01', 8),
(17, 'Priya', 'Clothing', '2026-01-02', 8),
(18, 'Priya', 'Clothing', '2026-01-03', 9),
(19, 'Karan', 'Electronics', '2026-01-01', 10),
(20, 'Karan', 'Electronics', '2026-01-02', 11);
select * from employee_attendance;
select * from employees_sales;
-- total sales by each department 
select employee_name,department,sales_amount, sum(sales_amount)
 over(partition by department) from employees_sales order by employee_name;
 -- avg sales per employee
 

select
employee_name,
sales_amount,
AVG(sales_amount) OVER(PARTITION BY employee_name) AS avg_sales
FROM employees_sales order by employee_name; 