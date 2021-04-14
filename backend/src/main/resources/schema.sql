DROP TABLE IF EXISTS card;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS user;


CREATE TABLE IF NOT EXISTS card(
    card_id int auto_increment primary key,
    category int references category(category_id),
    category_key int,
    title varchar(64),
    contents longtext
);

CREATE TABLE IF NOT EXISTS category(
    category_id int auto_increment primary key,
    user int references user(id),
    user_key int
);

CREATE TABLE IF NOT EXISTS user(
    id int auto_increment primary key,
    name varchar(64)
);
