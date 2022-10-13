create table beer_info(
	beer_id int,
	beer_name varchar(100),
	manufacturer varchar(100),
	price int
);

create table beer_drinkers(
	drinker_id int,
	got_name varchar(30),
	age int,
	birthdate date,
	beer_name varchar(30),
	beer_id int
);

insert into beer_info (beer_id, beer_name, manufacturer, price) values
(1001, 'Guinness', 'Diageo', 14),
(1002, 'Bigfoot', 'Sierra Nevada Brewing Co.', 6),
(1003, 'Forbidden Planet', 'Bluejacket', 24),
(1004, null, 'Brewery Ommegang', 8),
(1005, 'Milkbeer', null, 8);

insert into beer_drinkers (drinker_id, got_name, age, birthdate, beer_name, beer_id) values
(324, 'Tyrion Lannister', 49, '1996-06-11', 'Guinness', 1001),
(439, 'Samwell Tarly', 30, '1988-09-15', 'Bigfoot', 1002),
(698, 'Jaime Lannister', 50, '1968-12-17', 'Forbidden Planet', 1003),
(730, 'John Snow', 32, '1986-07-08', null, 1004),
(324, 'Tormund Giantsbane', 46, '1972-11-28', 'Milkbeer', 1005);

CREATE TABLE students (
	id int, 
	studentname varchar(30), 
	teacherid int
);												

INSERT INTO students (id, studentname, teacherid) values 
(1001, 'Jane Schmidt', 1),
(1002, 'Kristin Jones', NULL),
(1003, 'Angelina Perotti', 3);


CREATE TABLE teachers (
	id int, 
	name varchar(30)
);	

INSERT INTO teachers (id, name) values 
(1, 'Sandra Cook'),
(2, 'Timothy James'),
(3, 'Georgina Valdez');


CREATE TABLE heights (
	name varchar(30), 
	gender varchar(15), 
	height int
);

INSERT INTO heights (name, gender, height) values 
('Anna', 'female', 157),
('Ben', 'male', 190),
('Catherine', 'female', 175),
('Dion', 'male', 177),
('Eva', 'female', 167),
('Frank', 'male', 182);

CREATE TABLE employee (
	id int, 
	name varchar(30), 
	department varchar(30)
);

INSERT INTO employee (id, name, department) values 
(1, 'James', 'Marketing'),
(2, 'John', 'Marketing'),
(3, 'Michael', 'IT'),
(4, 'Kathy', 'IT'),
(5, 'John', 'IT'),
(6, 'Sara', 'Marketing');



CREATE TABLE salary (
	id int, 
	salary int
);

INSERT INTO salary (id, salary) VALUES 
(1, 70000),
(2, 80000),
(3, 90000),
(4, 97000),
(5, 105000),
(6, 90000);

CREATE TABLE courses (
	name varchar(30), 
	class varchar(30)
);

INSERT INTO courses (name, class) values 
('Ana', 'Math'),
('Bob', 'English'),
('Cathy', 'Math'),
('David', 'Social Science'),
('Ed', 'Math'),
('Frank', 'Internet Technology'),
('Gina', 'Math'),	
('Helen', 'Math'),
('Irene', 'Math');


select * from beer_info;
select * from beer_drinkers;
select * from students;
select * from teachers;
select * from heights;
select * from employee;
select * from salary;
select * from courses;