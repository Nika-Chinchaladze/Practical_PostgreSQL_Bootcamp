-- what is the compny's total revenue during the latest rental month
select
	sum(amount) as total_revenue
from payment p
	inner join rental r using (rental_id)
where date_trunc('month',rental_date) in (
	select 
		date_trunc('month', max(rental_date)) 
	from rental
);

/*
show the film id, title and rental rate of films with rental rates
greater than the average rental rate
*/
select
	film_id,
	title,
	rental_rate
from film
where rental_rate > (
	select
		avg(rental_rate)
	from film
);


/*
find the districts of customers who paid an average amount of $4 or more to the company
for any particular transaction
*/
select
	first_name ||' '|| last_name as full_name,
	payment_id,
	round(avg(amount),2) as paid
from customer c
	inner join address a using (address_id)
	inner join payment p using (customer_id)
group by full_name, payment_id
having avg(amount) >= 4
order by paid asc;


/*
how many customers made at least 36 rental transactions?
how much revenue have they brought in to the company?
*/
select 
	count(a.customer_id) as quantity,
	sum(p.amount) as revenue
from
(
select
	customer_id,
	count(rental_id) as quantity
from rental
group by customer_id
having count(rental_id) >= 36
) a
	inner join payment p on p.customer_id = a.customer_id;
	
/*
show the list of unique films rented by customers who paid an average amount of $4 or more
to the company for any particular transaction
*/
select distinct
	film_id,
	title
from film f
	inner join inventory i using (film_id)
	inner join rental r using (inventory_id)
	inner join payment p using (rental_id)
where r.customer_id in (
	select
		t.customer_id
	from rental t
		inner join payment m using (rental_id)
	group by t.customer_id
	having avg(amount) >= 4
)
order by film_id asc;


select distinct
	f.film_id,
	title
from
(
	select
		customer_id,
		round(avg(amount), 2) as avg_paid
	from payment
	group by customer_id
) a
	inner join rental r using (customer_id)
	inner join inventory i using (inventory_id)
	inner join film f using (film_id)
order by f.film_id asc;


/*
show the film id and inventory count for each film.
add a column that shows the latest transaction rental date for each film
*/
select
	a.film_id,
	a.quantity,
	max(rental_date) as latest_transaction
from
(
select
	f.film_id,
	count(inventory_id) as quantity
from film f
	left join inventory i using (film_id)
group by f.film_id
) a
	inner join inventory v using (film_id)
	inner join rental r using (inventory_id)
group by a.film_id, a.quantity
order by a.film_id asc;


/*
show the store id and customer count per store.
add a third column showing the total amount of revenue for the whole company.
*/
select
	store_id,
	count(customer_id),
	(select sum(amount) from payment) as total_amount
from payment p
	inner join staff s using (staff_id)
group by store_id
order by store_id asc;