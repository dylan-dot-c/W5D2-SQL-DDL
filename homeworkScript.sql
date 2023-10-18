-- CREATING TABLES FOR OUR DB
--customers table  first
-- 1st
create table customers(
	customer_id serial primary key,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	email varchar(100) not null unique,
	zipcode integer,
	phone varchar(20) unique
);


2nd
-- creating theater table
create table theaters(
	theater_id SERIAl primary key,
	capacity integer not null,
	location varchar(200) not null
);

--3rd
--creatign movies table
create table movies(
	movie_id serial primary key,
	title varchar(100) not null,
	description varchar not null,
	release_date timestamp default current_timestamp
);

--4th
--creating movie_theaters table
create table movie_theaters(
	movie_id integer not null,
	theater_id integer not null,
--	create columns first before we add references
	
);

--adding references
alter table movie_theaters
add foreign key(movie_id) references movies(movie_id),
add foreign key(theater_id) references theaters(theater_id);

--5th
--creating tickets table
create table tickets(
	ticket_id serial primary key,
	cost integer not null,
	date_purchased timestamp default current_timestamp,
	customer_id integer not null,
	movie_id integer not null,
	foreign key(customer_id) references customers(customer_id),
	foreign key(movie_id) references movies(movie_id)
);
--
