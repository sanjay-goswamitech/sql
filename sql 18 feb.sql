use world;
select * from world.city;
select * from world.country;
-- joins with group by 
select cntry.name , c.district, sum(c.population) 
from city as c inner join country as cntry
where c.countrycode=cntry.code
 group by cntry.name , c.district;
 
 -- get the distname , counrty code , counrty nAME AND THE REGION FOR EACH DISTRICT 
 select  c.district ,c.countrycode, cntry.code,cntry.name,cntry.region , c.population
 from city as c inner join country as cntry
 on  c.countrycode=cntry.code;
 
 -- d.name ,cntry.name , c.district , sum(c.population) hamesha select wali non agregate values ko group by m likte h 
 select cntry.region,cntry.name,c.district,sum(c.population) 
 from city as c inner join country as cntry 
 on c.countrycode=cntry.code 
 group by cntry.region,cntry.name,c.district;
 
 select * from countrylanguage;
 
 -- find out the language nme and the sum of popultion for each language spoken 
 select sum(cntry.population) , l.language from country as cntry inner join countrylanguage as l  on cntry.code=l.countrycode group by language; 

 -- find out the total population for each language spoken ether for official or unoffficial language 
 select sum(cntry.population) , l.language,l.isofficial from country
 as cntry inner join countrylanguage as l 
 on cntry.code=l.countrycode group by language , group by isofficial; 
 
 
-- find actor name , sum(movies the actor has work )
use sakila;
select * from actor;
select * from film_actor;
select * from film;
select a.first_name,count(fa.film_id) from actor as a inner join film_actor as fa on a.actor_id=fa.actor_id group by a.actor_id , a.first_name;
 
-- get the name of actor , rating of the film along with the avg length of the movie done by each actor 
select a.actor_id, a.first_name , fa.film_id, f.rating,avg(f.length) 
from actor as a 
 join film_actor as fa
  join film as f 
 on a.actor_id = fa.actor_id and fa.film_id = f.film_id
 group by a.actor_id, a.first_name, fa.film_id,f.rating;
  