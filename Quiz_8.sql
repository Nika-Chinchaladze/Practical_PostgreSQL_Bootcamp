-- categorize customers based on total amount they have paid to the company
select 
	full_name,
	total_amount,
	case
		when total_amount < 71 then 'Bronze'
		when total_amount between 71 and 150 then 'Silver'
		else 'Gold'
	end as category
from
(
select
	first_name ||' '|| last_name as full_name,
	sum(amount) as total_amount
from customer c
	left join payment p using (customer_id)
group by full_name
) a
order by total_amount desc;


/*
count the inventory of each film and then categorize each film as 'high' if it's inventory
is greater or equal to 5 and 'low' otherwise
*/
select
	title,
	count(inventory_id) as quantity,
	case
		when count(inventory_id) >= 5 then 'High'
		else 'Low'
	end as category
from film f
	left join inventory i using (film_id)
group by title;


/*
count the number of rentals for each film and categorize films based on number of rentals,
low - less than 10, medium - between 10 and 20, else - high
*/
select
	title,
	count(rental_id) as quantity,
	case
		when count(rental_id) < 10 then 'Low'
		when count(rental_id) between 10 and 20 then 'Medium'
		else 'High'
	end as category
from film f
	left join inventory i using (film_id)
	left join rental r using (inventory_id)
group by title;

-- display separately country code and local number for each customer
select
	first_name ||' '|| last_name as full_name,
	phone,
	left(phone, length(phone)-10) as country_code,
	right(phone, 10) as local_number
from customer c
	inner join address a using (address_id)
order by country_code asc;


-- how many customers have first names starting a vowel?
-- with count:
select
	COUNT(first_name) AS quantity
from customer
where left(first_name, 1) in ('a', 'A', 'e', 'E', 'i', 'I', 'o', 'O', 'u', 'U');

-- with sum:
select
	sum(a.FirstName) as quantity
from
(
select
	case
		when left(first_name, 1) in ('a', 'A', 'e', 'E', 'i', 'I', 'o', 'O', 'u', 'U') then 1
		else 0
	end as FirstName
from customer
) a;

-- display first and last names from email addresses as separated capitalized columns
-- first way:
select 
	email,
	initcap(left(full_name, position('.' in full_name) - 1)) as first_name,
	initcap(right(full_name, length(full_name) - position('.' in full_name))) as last_name
from
(
select
	email,
	left(email, position('@' in email)-1) as full_name
from customer
) a;

-- second way:
select
	email,
	initcap(substring(email, 1, position('.' in email)-1)) as first_name,
	initcap(substring(email, position('.' in email)+1, position('@' in email) - position('.' in email)-1)) as last_name
from customer;

/*
grab the second word in the film's title (in lowercase) and call film_phrase
*/
select
	title,
	lower(right(title, length(title) - position(' ' in title))) as film_phrase
from film;

/*
create a new version of email address
*/
select 
	email,
	concat(front, back) as email_address 
from
(
select
	email,
	left(email, 1) as front,
	right(email, length(email) - position('.' in email) + 1) as back
from customer
) a;


/*
create a column showing the customer's district and country.
make sure to put a comma and a space in between
*/
select
	concat(district, ', ', country) as new_address
from address a
	inner join city c using (city_id)
	inner join country t using (country_id)
order by country asc;