/*
using the payment and customer table produce a list customer id, first name, last name, payment id
and amount paid for transactions that occurred between 8am of february 18, 2007 and 5pm of february
25, 2007. sort the results by customer id
*/

select
	c.customer_id,
	first_name,
	last_name,
	payment_id,
	amount
from customer c
	inner join payment p on p.customer_id = c.customer_id
where payment_date between '2007-02-18 08:00:00' and '2007-02-25 17:00:00'
order by c.customer_id asc, amount asc;


/*
show the available inventory for each film at store 1 
*/
select
	i.inventory_id,
	f.film_id,
	f.title
from film f
	inner join inventory i on i.film_id = f.film_id
where i.store_id = 1;


/*
Find the addresses of customers named 'Barbara Jones' and 'Deborah Walker'
*/
select 
	c.first_name,
	c.last_name,
	a.address
from customer c
	inner join address a on a.address_id = c.address_id
where (c.first_name = 'Barbara' and c.last_name = 'Jones')
   or (c.first_name = 'Deborah' and c.last_name = 'Walker')
order by c.first_name asc;


/*
Provide a list of customer info(customer id, email) along with their rental id and rental dates for
customers who were served by Staff no.1, sort results by rental date(the most recent one to top)
*/
select
	c.customer_id,
	c.email,
	r.rental_id,
	r.rental_date
from customer c
	inner join rental r on r.customer_id = c.customer_id
where r.staff_id = 1
order by r.rental_date desc;


/*
display film_id, title and category name of the films that are categorized as drama
*/
select
	f.film_id,
	f.title,
	c.name
from film f
	inner join film_category fc on fc.film_id = f.film_id
	inner join category c on c.category_id = fc.category_id
where c.name = 'Drama'
order by 1 asc;


/*
Provide a table showing each film's title, rental rate, rental date and amount paid,
sorted by rental date (latest date on top),
Also add another column named "Amount - Rate" which shows the difference in the amount
paid and rental rate of the film.
*/
select
	f.title,
	f.rental_rate,
	r.rental_date,
	p.amount,
	p.amount - f.rental_rate as "Amount - Rate"
from film f
	inner join inventory i on i.film_id = f.film_id
	inner join rental r on r.inventory_id = i.inventory_id
	inner join payment p on p.rental_id = r.rental_id
order by r.rental_date desc;


/*
which actors appeared in films with the word 'blade' in it's titles?
show the title, actor id, actor's first name and actor's last name
*/
select
	f.title,
	a.actor_id,
	a.first_name,
	a.last_name
from film f
	inner join film_actor fa on fa.film_id = f.film_id
	inner join actor a on a.actor_id = fa.actor_id
where f.title ilike '%blade%'
order by 2 asc;


/*
provide a table that shows top 20 amount paid by the customers.
show the customer's id, first name, last name, address, district and amount paid.
add a column named 'discounted_amt' which gives 10% off the amount paid.
Make sure to round it to 2 decimal places.
*/
select
	c.customer_id,
	c.first_name,
	c.last_name,
	a.address,
	a.district,
	p.amount,
	round(p.amount * 0.9, 2) as discounted_amt
from customer c
	inner join payment p on p.customer_id = c.customer_id
	inner join address a on a.address_id = c.address_id
order by 6 desc;

/*
company wants to order films that don't have any inventory.
provide the list of films that do not have any inventory,
show the film id, title and inventory id, Also sort the results by film id
*/
select
	f.film_id,
	f.title,
	i.inventory_id
from film f
	left join inventory i on i.film_id = f.film_id
where i.inventory_id is null
order by 1 asc;


/*
display film id, title and the amount paid for films with titles that begin with either 'F' or 'G'.
if the film has not been rented out or purchased, leave the amount column blank or null.
sort the results by the amount paid(highest on top)
*/
select
	f.film_id,
	f.title,
	p.amount
from inventory i
	inner join rental r on r.inventory_id = i.inventory_id
	inner join payment p on p.rental_id = r.rental_id
	right join film f on f.film_id = i.film_id
where f.title like 'F%' or f.title like 'G%'
order by 3 desc;


/*
using right join, produce a data that shows the film ids and titles as well as their corresponding
rental ids and rental dates. make sure to show all available film ids and titles (even those not rented out)
sort the results by rental date (latest one on top)
*/
select
	f.film_id,
	f.title,
	r.rental_id,
	r.rental_date
from rental r
	inner join inventory i on i.inventory_id = r.inventory_id
	right join film f on f.film_id = i.film_id
order by 4 desc;


/*
show all the actors whose films did not get rented out
*/
select
	a.first_name,
	a.last_name,
	r.rental_date
from actor a
	inner join film_actor fa on fa.actor_id = a.actor_id
	inner join film f on f.film_id = fa.film_id
	left join inventory i on i.film_id = f.film_id
	left join rental r on r.inventory_id = i.inventory_id
where r.rental_date is null;