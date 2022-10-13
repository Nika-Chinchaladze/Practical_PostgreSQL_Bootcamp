-- 1) Provide a list of films (their titles, film IDs and ratings) that are NOT rated NC-17.
select 
	title,
	film_id,
	rating
from film
where rating <> 'NC-17';


-- 2) Get the addresses and postal codes of customers who live in Michigan district.
select
	c.first_name || c.last_name as full_name,
	a.address,
	a.postal_code
from customer c
	inner join address a on a.address_id = c.address_id
where a.district = 'Michigan';


/*
3) Your manager asks for the list of payment transactions between 2007-02-18 00:00:00 and 2007-02-20 00:00:00. 
   Retrieve the payment ID, customer ID, amount and payment dates
*/
select 
	payment_id,
	customer_id,
	amount,
	payment_date
from payment
where payment_date between '2007-02-18 00:00:00' and '2007-02-20 00:00:00'
order by customer_id asc;


-- 4) Retrieve all available information for customers whose last names are either Williams, Taylor or Andrews.
select
	*
from customer
where last_name in ('Williams', 'Taylor', 'Andrews');


/*
5) The manager asks for the rental ID and customer ID of transactions that have rental date starting May 26, 2005 
   and return date before May 29, 2005.
*/
select
	rental_id,
	customer_id,
	rental_date,
	return_date
from rental
where rental_date > '2005-05-26 00:00:00'
  and return_date < '2005-05-29 00:00:00'
order by rental_id asc;
