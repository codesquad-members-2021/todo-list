CREATE TABLE user (id int identity, email varchar(64), name varchar(64), created_date datetime);
insert into user(name, email, created_date) values ('Zero Jung', 'honux@gmail.com', getdate());
