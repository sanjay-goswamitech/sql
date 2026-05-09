show databases;
use world;
show tables;
select * from city;
-- apne wa city chaye jiku country code afganisthan ke equal ho 
select name , countrycode from city 
where countrycode='AUS';

select name , countrycode from city 
where countrycode=(SELECT 	countrycode from city where name ='oran');
-- find which city jinka populaton oran ki population se jyada ho 
select name , population from city 
where population>(select population from city where name='oran');
-- get me those city information whose district is same as a tafuna city 
select district from city where name ='tafuna';
select name , district from city 
where district=(select district from city where name ='tafuna');
-- get the district and population for all the city where the contrycode is same as namibe
select countrycode  from city where name ='namibe';
select district , population from city where countrycode=(select countrycode from city where name='namibe');

-- get me the city name and the district where the district is same as of americana city 
select district from city where name = 'americana';
select name , district from city where district=(select district from city where name ='americana');

-- get me all the city info. where the population of city is less than barueri
select population from city where name ='barueri';
select * from city where population<(select population from city where name='barueri'); 

-- 1 get me the countrycode and country name where the continent is same as of albania 
-- 2 get me whse contry info wheere independesse year should be after independence year of afghanistan
select indepyear from country where name='afghanistan';
select * from country where indepyear>(select indepyear from country where name='afghanistan');




-- 3 get the name , continent , region and the poplation for all the countryies where is region is same  as of balgium and have the indepeyear year after 1800



 -- 1  1 get me the countrycode and country name where the continent is same as of albania 
 select continent from country where name='albania';	
 select code,name from country where continent=( select continent from country where name='albania');	

 select * from city;
 select * from country;
 
