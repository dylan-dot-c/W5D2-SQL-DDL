-- Data Definition Language (DDL) Statements


-- Create table
create table if not exists blog_user( -- if the table doesnt exist
user_id SERIAL primary key, --primary key unique and not null
username VARCHAR(25) not null unique, -- not null means that it cant be null
password_hash VARCHAR(100) not null,
email_address VARCHAR(50),
first_name VARCHAR(50),
last_name VARCHAR(50)
)

-- rename a column
alter table blog_user
rename column email to email_address;

-- adding a column
--alter table table_name add column new_col_name DATATYPE
alter table blog_user add column middle_name VARCHAR(50);


--changing datatype
alter table blog_user 
alter column email_address type varchar(100)


create table post(
  post_id SERIAL primary key,
  title Varchar(50) not null,
  body varchar,
  date_created TIMESTAMP default current_TIMESTAMP,
  user_id INTEGER not null, --create column key first
--  now add foreign key
--  foriegn key
  foreign key(user_id) references blog_user(user_id)
);

--
create table post_category(
post_id integer not null,
foreign key(post_id) references post(post_id),
category_id Integer not null,
 foreign key (category_id) references category(category_id) 
-- cannot referencea table that dont exist

);

alter table post_category 
add foreign key(category_id) references category(category_id);

create table category(
	category_id SERIAL primary key,
	category_name varchar(50) not null,
	description varchar(50) not null
);


-- to add a foreign key to an already existing table
--alter table table_name add foreign key(domestic-col_name) references foreign_table(col_name)
alter table post_category
add foreign key(category_id) references category(category_id);
--select * from blog_user;

create table post_comment(
	comment_id SERIAL primary key,
	body VARCHAR not null,
	date_created TIMESTAMP default current_timestamp,
	user_id INTEGER not null,
	foreign KEY(user_id) references blog_user(user_id),
	post_id integer not null,
	foreign key(post_id) references blog_user(user_id)
	
)
