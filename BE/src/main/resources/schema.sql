DROP TABLE IF EXISTS user;
CREATE TABLE user (id bigint auto_increment, email varchar(64), name varchar(64), created_date datetime, primary key(id));
