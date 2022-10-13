/*
write a query that returns a list of all the films with titles that include any single character followed by
characters 'he' the followed by any sequence of characters
*/
select
	title
from film
where title ilike '_he%';


/*
write a query that provides a list of all the films with titles that don't start with 'A'
*/
select
	title
from film
where title not like 'A%'
order by title asc;


/*
retrieve the customer id, first name, last name and email address of all the customers 
whose last names end with 'son'
*/
select
	customer_id,
	first_name,
	last_name,
	email
from customer
where last_name ilike '%son'
order by customer_id asc;


/*
use the address table to retrieve the phone numbers of those who live in 'Garland Manor' street
*/
select 
	address,
	phone
from address
where address ilike '%Garland Manor%';


/*
write a query to return the first 10 film with 'PG-13' rating
*/
select
	title,
	rating
from film
where rating = 'PG-13'
order by title asc
LIMIT 10;

/*
write a query to get a sense of what data is stored in payment table
*/
select * from payment
limit 10;


/*
write a query to show the first 20 customers available in the database
*/
select
	customer_id,
	first_name,
	last_name,
	email
from customer
limit 20;


/*
Provide a list of the 10 longest films with rental rates greater than or equal to 2.99
*/
select
	film_id,
	title,
	rental_rate,
	length
from film
where rental_rate >= 2.99
order by length desc
limit 10;

/*
provide a list of customer id, first name and last name of customers who shop at store id - 1,
in alphabetical order based on last name
*/
select
	customer_id,
	first_name,
	last_name,
	store_id
from customer
where store_id = 1
order by last_name asc;


/*
provide all the payment attributes: payment id, customer id, staff id, rental id
for the top 20 amount paid by customers
*/
select
	payment_id,
	customer_id,
	staff_id,
	rental_id,
	amount
from payment
order by amount desc
limit 20;