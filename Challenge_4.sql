-- Which store (1 or 2) generated more revenue?
select
	s.store_id,
	sum(p.amount) as Total_revenue
from payment p
	inner join staff s using (staff_id)
group by s.store_id
order by Total_revenue desc;

-- Show the average number of unique film rentals per month
select
	date_trunc('month', rental_date) as monthly,
	count(rental_id) as total_amount,
	count(distinct f.film_id) as unique_film,
	count(rental_id) / count(distinct f.film_id) as avg_rental
from film f
	inner join inventory i using (film_id)
	inner join rental r using (inventory_id)
group by monthly
order by monthly asc;

-- show customers who had at least 36 payment transactions.
select
	c.customer_id,
	c.first_name ||' '|| c.last_name as full_name,
	COUNT(p.payment_id) as transaction_quantity
from customer c
	inner join payment p using (customer_id)
group by c.customer_id, full_name
having COUNT(p.payment_id) >= 36
order by transaction_quantity desc;


-- Who are the company’s lifelong customers?
select
	c.customer_id,
	first_name ||' '|| last_name as full_name,
	date_trunc('month', rental_date) as monthly,
	count(rental_id) as rental_quantity
from customer c
	inner join rental r using (customer_id)
group by c.customer_id, full_name, monthly
having count(rental_id) >= 5
order by c.customer_id asc, monthly asc;


-- Which are the top 5 countries where most customers come from?
select
	r.country_id,
	r.country,
	count(c.customer_id) as citizen_quantity
from customer c
	inner join address a using (address_id)
	right join city t using (city_id)
	right join country r using (country_id)
group by r.country_id, r.country
order by citizen_quantity desc
limit 5;
 