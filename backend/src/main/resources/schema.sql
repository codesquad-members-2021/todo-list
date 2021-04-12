DROP TABLE IF EXISTS todo;
DROP TABLE IF EXISTS vertical;
DROP TABLE IF EXISTS user;


CREATE TABLE IF NOT EXISTS todo(
    id int auto_increment primary key,
    vertical int references vertical(id),
    vertical_key int,
    title varchar(64)
);

CREATE TABLE IF NOT EXISTS vertical(
    id int auto_increment primary key,
    user int references user(id),
    user_key int,
    status varchar(64)
);

CREATE TABLE IF NOT EXISTS user(
    id int auto_increment primary key,
    name varchar(64)
);
