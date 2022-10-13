/*
1.	Find the top 10 customers who paid the most in a single transaction. 
Show their customer ID, first name, last name and amount paid. 
Sort the results by amount paid (highest on top) and by customer ID.
*/
select
	c.customer_id,
	c.first_name,
	c.last_name,
	p.amount
from customer c
	inner join payment p on p.customer_id = c.customer_id
order by 4 desc
limit 10;

/*
For the customer named Elizabeth Brown, find all the amounts she paid, 
the payment dates as well as the staff’s first and last name who served her on each transaction. 
Sort the results by payment date (latest date on top).
extra:
Also add another column named “Amount > 2.99” which performs mathematical operation (amount > 2.99). 
It will show either ‘true’ or ‘false’ under that column.  
*/
select
	c.first_name ||' '|| c.last_name as customer_name,
	p.amount,
	p.payment_date,
	s.first_name ||' '|| s.last_name as staff_name,
	p.amount > 2.99 as "amount > 2.99"
from customer c
	inner join payment p on p.customer_id = c.customer_id
	inner join staff s on s.staff_id = p.staff_id
where c.first_name = 'Elizabeth' and c.last_name = 'Brown'
order by p.payment_date asc;


/*
Produce a table showing the film ID, title, category name (renamed as category) 
and inventory ID of films that do not have any inventory.
*/
select
	f.film_id,
	f.title,
	c.name as category,
	i.inventory_id
from film f
	inner join film_category fc on fc.film_id = f.film_id
	inner join category c on c.category_id = fc.category_id
	left join inventory i on i.film_id = f.film_id
where i.inventory_id is null
order by 1 asc;


/*
Using either left join or right join clause, produce a table that shows the film ID title, 
language name (renamed as language) and rental date of film IDs ranging from 144 to 149.
*/
select
	f.film_id,
	f.title,
	l.name as language,
	r.rental_date
from film f
	inner join language l on l.language_id = f.language_id
	left join inventory i on i.film_id = f.film_id
	left join rental r on r.inventory_id = i.inventory_id
where f.film_id between 144 and 149
order by 1 asc;

/*
display data showing the customer ID, email address, city and country of origin of customers. 
Sort by customer ID and limit your results to the first 10 customers.
*/
select
	s.customer_id,
	s.email,
	c.city,
	t.country
from customer s
	inner join address a on a.address_id = s.address_id
	inner join city c on c.city_id = a.city_id
	inner join country t on t.country_id = c.country_id
order by 1 asc
limit 10;