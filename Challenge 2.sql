/*
Provide a list of the 5 shortest films with “G” rating and rental rates ranging from 2.99 to 4.99. 
Show their film ID and title.
*/
select
	film_id,
	title
from film
where rating = 'G' 
  and (rental_rate between 2.99 and 4.99)
order by length asc
limit 5;


/*
Generate a list of all actors whose last names start with “Jo”. 
Arrange the list in alphabetical order of the last name. 
If there are customers with the same last name, arrange the list further by actor ID
*/
select 
	* 
from actor
where last_name like 'Jo%'
order by last_name asc, actor_id asc;


/*
Use the city table to find all the cities with words “gas” or “him” within the city name. 
Arrange the list by country ID (with the largest ID number on top).
*/
select
	*
from city
where city ilike '%gas%' or city ilike '%him%'
order by country_id desc
limit 10;


/*
Show the address details of customers whose phone numbers end with “10”, 
arranged by city ID where they live (in ascending order). 
Retrieve the address column only.
*/
select 
	* 
from address
where phone like '%10'
order by city_id asc;


/*
The manager asks for a sample of 10 payment transactions (of no particular order) 
that occurred between 8:00:00 AND 17:00:00 on February 16, 2007 in the amount of either 0.99, 4.99 or 8.99.
*/
select
	*
from payment
where payment_date between '2007-02-16 08:00:00' and '2007-02-16 17:00:00'
  and amount in (0.99, 4.99, 8.99)
limit 10;