create database testdb;
 use testdb;
 
 CREATE TABLE customers (
    customerid INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE orders (
    orderid INT PRIMARY KEY,
    productid INT,
    pname VARCHAR(50),
    price DECIMAL(10,2),
    customerid INT
);

INSERT INTO customers (customerid, name, city) VALUES
(1, 'Alice', 'New York'),
(2, 'Bob', 'London'),
(3, 'Charlie', 'Mumbai'),
(4, 'Diana', 'Sydney'),
(5, 'Ethan', 'Toronto');

INSERT INTO orders (orderid, productid, pname, price, customerid) VALUES
(101, 201, 'Laptop', 800.00, 1),
(102, 202, 'Mouse', 25.00, 1),
(103, 203, 'Keyboard', 45.00, 2),
(104, 204, 'Monitor', 200.00, 2),
(105, 205, 'Printer', 150.00, 3),
(106, 206, 'Tablet', 300.00, 3),
(107, 207, 'Mobile', 500.00, 4),
(108, 208, 'Headphones', 75.00, 4),
(109, 209, 'Camera', 600.00, 5),
(110, 210, 'Speaker', 120.00, 5);

select * from orders;
use testdb;
select * from customers;
select * from orders;
select orders.orederid,orders.pname,orders.price,orders.cudtomerid from orders;

select customers.customerid,customers.name from customers;

select orders.orederid , orders.pname , orders.price , orders.customerid ,
         customers.customerid , customers.name from orders
  join customers where orders.customerid=customers.customersid;
  
  -- get the cuty id and city name and country code for city 
  -- get the country id , code , nmae , population , continenet 
 --  get the city id , nmae , country name for each city present in my table
 use world;
 show tables;
 select city.id,city.name,city.countrycode, country.name from city  join country where city.countrycode=country.code;
  
 select city.id,city.name,city.countrycode, country.name , country.population from city  join country where city.countrycode=country.code;
  
 select city.id,city.name,city.countrycode, country.name , country.population from city  join country where city.countrycode=country.code and country.name='Argentina';
  select * from country;
  select * from countrylanguage;
  -- cnty nmae all the lang spoken than in country 
  select country.code , country.name , countrylanguage.language from country join countrylanguage where country.code=countrylanguage.countrycode;
  
  select country.code , country.name , countrylanguage.language from country join countrylanguage where country.code=countrylanguage.countrycode and countrylanguage.language='English';
  -- inner join
    select country.code , country.name , countrylanguage.language from country inner join countrylanguage on  country.code=countrylanguage.countrycode where countrylanguage.language='English';

  
  