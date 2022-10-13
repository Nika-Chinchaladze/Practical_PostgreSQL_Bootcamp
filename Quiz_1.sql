/*
what are the email addresses of customers named: Janice, Mildred, Jared and Angela?
*/
select
	first_name ||' '|| last_name as full_name,
	email
from customer
where first_name in ('Janice', 'Mildred', 'Jared', 'Angela');

/*
find addresses, districts and postal codes of customers who don't live in the following districts:
Chiba, Nebraska, Michigan and Hamilton
*/
select 
	address,
	district,
	postal_code
from address
where district not in ('Chiba', 'Nebraska', 'Michigan', 'Hamilton')
order by district asc;


/*
show the customer ids and amount paid of customers who paid the following amounts:
0.99 and 2.99 and where staff_id is 1
*/
select distinct
	customer_id,
	staff_id,
	amount
from payment
where amount in (0.99, 2.99) and staff_id = 1
order by amount asc, customer_id asc;