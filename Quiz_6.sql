/*
how many unique films are rented each month?
*/
select
	date_trunc('month', rental_date) as monthly,
	count(distinct film_id) as quantity
from inventory i
	inner join rental r using (inventory_id)
group by monthly
order by monthly asc;


-- show the average amount paid per customer in each month
select
	date_trunc('month', payment_date) as monthly,
	round(sum(amount) / count(distinct c.customer_id),2) as average_amount
from customer c
	left join payment p using (customer_id)
group by monthly
order by monthly asc;


-- show customers who brought at least $200 to the company
select
	c.customer_id,
	first_name ||' '|| last_name as full_name,
	sum(amount) as total_amount
from customer c
	inner join payment p using (customer_id)
group by c.customer_id, full_name
having sum(amount) > 200
order by 1 asc;

/*
show the average rental_rate for each of the following film categories:
children, action, animation, comedy and family -> where average rental is less than $3
*/
select
	c.name,
	round(avg(f.rental_rate), 2) as avg_rental_rate
from category c
	inner join film_category fc using(category_id)
	inner join film f using (film_id)
where c.name in ('Children', 'Action', 'Animation', 'Comedy', 'Family')
group by c.name
having round(avg(f.rental_rate), 2) < 3
order by 2 desc;


/*
show customers who have rented films at least 30 times
*/
select
	c.customer_id,
	first_name ||' '|| last_name as full_name,
	count(rental_id) as quantity
from customer c
	inner join rental r using(customer_id)
group by c.customer_id, full_name
having count(rental_id) >= 30
order by quantity asc;


-- show the customers with avg rental duration of more than 5 days
select
	customer_id,
	round(avg(rental_duration), 2) as rental_period
from film f
	inner join inventory i using (film_id)
	inner join rental r using (inventory_id)
group by customer_id
having avg(rental_duration) > 5
order by 2 asc;