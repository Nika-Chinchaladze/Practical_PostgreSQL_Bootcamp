-- how many films do not have any inventory
select
	cast(count(f.film_id) as varchar) ||' films - without inventory' as Quantity
from film f
	left join inventory i using (film_id)
where i.inventory_id is null;


/*
count the number of unique rental rates assigned to films with either 'G' or 'PG-13' rating
*/
select
	count(distinct(rental_rate)) as Quantity
from film
where rating in ('G', 'PG-13');


-- calculate the total amount paid by the customer named Elizabeth Brown
select
	c.first_name ||' '|| c.last_name as full_name,
	sum(p.amount) as "paid quantity"
from customer c
	inner join payment p using (customer_id)
where c.first_name = 'Elizabeth' and c.last_name = 'Brown'
group by c.first_name ||' '|| c.last_name;


/*
find the average amount paid by the customer named Elizabeth Brown. round the average amount up to 2 decimal places
*/
select
	c.first_name ||' '|| c.last_name as full_name,
	round(avg(p.amount),2) as "paid average quantity"
from customer c
	inner join payment p using (customer_id)
where c.first_name = 'Elizabeth' and c.last_name = 'Brown'
group by full_name;


-- find the average rental rate charged for comedy films. Round it up to 2 decimal places
select
	c.name,
	round(avg(f.rental_rate), 2) as "Avg Rental Rate"
from film f
	inner join film_category fc on fc.film_id = f.film_id
	inner join category c on c.category_id = fc.category_id
where c.name ilike '%comedy%'
group by c.name;


-- find the total revenue for each stores: a) staff 1, b) staff 2
select
	p.staff_id,
	sum(p.amount) as  revenue
from customer c
	inner join payment p on p.customer_id = c.customer_id
where p.staff_id in (1,2)
group by p.staff_id;


/*
show the number of inventory per film at store 1. show the film id, title and inventory count
and sort the results by film_id
*/
select
	f.film_id,
	f.title,
	count(i.inventory_id) as quantity
from film f
	left join inventory i using (film_id)
where i.store_id = 1
group by f.film_id, f.title
order by 1 asc;


/*
who are the company's power customers - those who bring in the most revenue,
show their customer id, first name, last name and total amount paid to the company
*/
select
	c.customer_id,
	c.first_name ||' '|| c.last_name as fullname,
	sum(p.amount) as revenue
from customer c
	inner join payment p using (customer_id)
group by c.customer_id, fullname
order by revenue desc
limit 10;


-- which are the top 5 revenue-generating films?
select
	f.film_id,
	f.title,
	sum(p.amount) as revenue
from film f
	inner join inventory i using (film_id)
	inner join rental r using(inventory_id)
	inner join payment p using (rental_id)
group by f.film_id, f.title
order by 3 desc
limit 5;


-- which top 3 categories do we have the most films in?
select
	c.category_id,
	c.name,
	count(f.film_id) as quantity
from film f
	inner join film_category fc using(film_id)
	inner join category c using(category_id)
group by c.category_id, c.name
order by 2 desc
limit 3;


-- show the last date each film was rented out and the first time it was rented out
select
	f.film_id,
	f.title,
	cast(min(r.rental_date) as date) as first_date,
	cast(max(r.rental_date) as date) as last_date
from film f
	left join inventory i using (film_id)
	left join rental r using (inventory_id)
group by f.film_id, f.title
order by 1 asc;

-- check out which customers have been inactive
select
	c.customer_id,
	c.first_name ||' '|| c.last_name as fullname,
	max(r.rental_date) as last_date
from customer c
	left join rental r using (customer_id)
group by c.customer_id, fullname
order by 3 asc
limit 10;


-- show the highest payment transaction processed per month by each staff in each store
select
	extract(month from p.payment_date) as month,
	t.store_id,
	s.staff_id,
	max(p.amount) as highest_transaction
from payment p
	inner join staff s using (staff_id)
	inner join store t using (store_id)
group by month, t.store_id, s.staff_id
order by 1 asc;


-- show the monthly revenue per store
select
	date_trunc('month', p.payment_date) as monthly,
	s.store_id,
	sum(amount) as revenue
from payment p
	inner join staff s using (staff_id)
group by monthly, s.store_id
order by monthly asc, s.store_id asc;


/*
how many distinct customers does the company have per month?
what is the average number of rentals per customer?
*/
select
	date_trunc('month', rental_date) as monthly,
	count(rental_id) / count(distinct(customer_id)) as rental_per_customer
from rental
group by monthly
order by monthly asc;