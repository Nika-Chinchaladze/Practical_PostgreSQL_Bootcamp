/*
What is the average amount spent by a subset of customers who paid more 
than the average amount spent by all the customers in the database?
*/
select 
	round(avg(amount), 2) as average
from
(
select
	concat(first_name, ' ', last_name) as full_name,
	amount
from customer c
	left join payment p using (customer_id)
where amount > (
	select avg(amount) from payment
)
) a;


/*
Show the film’s title, its description and another attribute that you need to create called string_film. 
Under this attribute, if the title starts with ‘A’, extract or show the first word in the title. 
Otherwise, write ‘NA’
*/
select
	title,
	description,
	case
		when left(title, 1) = 'A' then substring(title, 1, position(' ' in title) - 1)
		else 'NA'
	end as string_film
from film;

-- In the email attribute, extract the ‘sakilacustomer.org’ and call this new attribute web_address.
select distinct
	substring(email, position('@' in email) + 1, length(email) - position('@' in email)) as web_address
from customer
where email ilike '%sakilacustomer.org%';


/*
The company has a holiday special. The special promo is to charge only the 
integer part of the amount (or to remove the decimal part). 
For example, if the amount is $7.99, the customer will be charged $7 only.
Come up with this new column that shows this new price (call it holiday_promo).
*/
-- first way:
select 
	a.amount,
	substring(a.amount, 1, position('.' in a.amount) - 1) as holiday_promo
from
(
select
	cast(amount as varchar) as amount
from payment
) a;

-- second way:
select
	amount,
	floor(amount) as holiday_promo
from payment;