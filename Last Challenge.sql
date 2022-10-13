select
	category_name,
	sum(paid) as total_through_category
from
(
	select
		concat(c.first_name,' ',c.last_name) as customer_name,
		concat(a.first_name,' ',a.last_name) as actor_name,
		g.name as category_name,
		p.amount as paid
	from customer c
		inner join payment p on p.customer_id = c.customer_id
		inner join rental r on r.rental_id = p.rental_id
		inner join inventory i on i.inventory_id = r.inventory_id
		inner join film f on f.film_id = i.film_id
		inner join film_category fc on fc.film_id = f.film_id
		inner join category g on g.category_id = fc.category_id
		inner join film_actor fa on fa.film_id = f.film_id
		inner join actor a on a.actor_id = fa.actor_id
	where c.first_name = 'Peter' and c.last_name = 'Menard'
) b
group by category_name
order by 2 desc;