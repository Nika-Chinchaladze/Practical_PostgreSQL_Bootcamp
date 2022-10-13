-- get the customer id, store id and email address for a customer - named as Nancy Thomas
select 
	customer_id,
	store_id,
	email
from customer
where first_name = 'Nancy' 
  and last_name = 'Thomas';

-- obtain the customer information (customer id, first_name, last_name) for customers whose id 
-- is between 1 and 10
select 
	customer_id,
	first_name,
	last_name
from customer
where customer_id between 1 and 10
order by customer_id asc;


/*
write a query that returns the film ID, title and description of films tht are rated 'G', 'PG-13' or 'NC-17'
*/
select
	film_id,
	title,
	description
from film
where rating in ('G', 'NC-17', 'PG-13')
order by rating asc, film_id asc;



/*
write a query that returns the first names and last names of customers whose last names are:
Smith, Miller, Taylor and King
*/
select
	first_name,
	last_name
from customer
where last_name in ('Smith', 'Miller', 'Taylor', 'King')
order by last_name asc;



/*
write a query that provides a list of the drama films being sold by the DVD rental company
*/
select 
	title,
	description,
	rental_rate
from film
where description like '%Drama%';

/*
find the customer id, first name, last name and email address of the customer whose first name sounds like 'Gwen'
*/
select
	customer_id,
	first_name,
	last_name,
	email
from customer
where first_name like 'Gwen%';



-- pull the film titles from film table where rating is equal to 'PG-13' or 'G'
select 
	* 
from film
where rating in ('PG-13', 'G')
order by rating asc;