/*
write a query to retrieve all the students taught by either Timothy James or Georgina Valdez
*/
select
	studentname,
	name
from students s
	inner join teachers t on t.id = s.teacherid
where name in ('Timothy James', 'Georgina Valdez');


-- retrieve all students taught with no or missing teacher
select
	*
from students
where teacherid is null;


-- find the average height of people over 160 cm tall by gender
-- round results up to 2 decimal
select 
	gender,
	round(avg(height), 2) as average
from heights
where height > 160
group by gender;


/*
show the min and max heights of people belonging to a particular gender.
only show the case where in the min height for the group is at least 160 cm.
*/
select
	gender,
	min(height) as minimum,
	max(height) as maximum
from heights
group by gender
having min(height) > 160;


-- find all the duplicate names in a table named employee.
select 
	name,
	count(name) as quantity
from employee
group by name
having count(name) > 1;

-- find employees who have the highest salary in each of the departments
-- first way:
select 
	a.department,
	a.maximum,
	(
		select 
			name 
	 	from employee m
			inner join salary l using (id)
		where m.department = a.department 
		and l.salary = a.maximum
	) as Name
from
(
select
	department,
	max(salary) as maximum
from employee e
	inner join salary s using (id)
group by department
) a;

-- second way:
select
	name,
	department, 
	salary
from employee e
	inner join salary s using (id)
where (department, salary) in (
	select
		department,
		max(salary)
	from employee m
		inner join salary l using (id)
	group by department
);


-- find the classes with at least 5 students
select
	class,
	count(distinct name) as quantity
from courses
group by class
having count(name) >= 5;