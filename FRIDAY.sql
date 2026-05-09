use sakila;

use sakila;

CREATE TABLE employees(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    manager_id INT,
    salary INT
);

INSERT INTO employees (emp_id, emp_name, department, manager_id, salary) VALUES
(1, 'Amit', 'Management', NULL, 120000),
(2, 'Neha', 'HR', 1, 75000),
(3, 'Raj', 'IT', 1, 90000),
(4, 'Simran', 'Finance', 1, 85000),
(5, 'Karan', 'IT', 3, 70000),
(6, 'Priya', 'IT', 3, 72000),
(7, 'Rohit', 'HR', 2, 50000),
(8, 'Anjali', 'HR', 2, 52000),
(9, 'Vikas', 'Finance', 4, 65000),
(10, 'Sneha', 'Finance', 4, 62000),
(11, 'Arjun', 'IT', 5, 55000),
(12, 'Pooja', 'IT', 5, 53000),
(13, 'Meera', 'HR', 7, 45000),
(14, 'Dev', 'Finance', 9, 48000),
(15, 'Nitin', 'IT', 6, 51000);



/*

Amit
 ├── Neha
 │    ├── Rohit
 │    │     └── Meera
 │    └── Anjali
 │
 ├── Raj
 │    ├── Karan
 │    │     ├── Arjun
 │    │     └── Pooja
 │    └── Priya
 │           └── Nitin
 │
 └── Simran
      ├── Vikas
      │     └── Dev
      └── Sneha

*/
select * from employees;
-- notebook llm 

select emp.emp_id,emp.emp_name,emp.manager_id,mngr.emp_id,mngr.emp_name
 from employees as emp join 
 employees as mngr
 where emp.manager_id=mngr.emp_id
 ;
--  whose depn is same as manager department 
select e.emp_id,e.emp_name,e.department,m.emp_id,m.emp_name,m.department from employees as e 
join employees as m 
where e.manager_id=m.emp_id and e.department=m.department;
select * from employees;
-- find the emp name and its salary if it is greater than salary of its manager 
select e.emp_name as empname,e.salary,m.emp_name as mngrname,m.salary from employees as e 
join employees as m 
where e.manager_id=m.emp_id and e.salary>m.salary;
-- show all the emp name with all the manager name 
select e.emp_name as empname,m.emp_name as mngrname from employees as e 
join employees as m 
where e.manager_id=m.emp_id ;
-- show all the emp with its grand manager 
select 
e.emp_name as empname
,m.emp_name as mngrrname,
gmngr.emp_name as grandmanager
 from employees as e 
left join employees as m 
on e.manager_id=m.emp_id
 left join employees as gmngr 
 on  m.manager_id=gmngr.emp_id;
-- find the empolyees who are also manager (khud manager ho)  
SELECT DISTINCT m.emp_id, m.emp_name
FROM employees e
JOIN employees m
    ON e.manager_id = m.emp_id;    



