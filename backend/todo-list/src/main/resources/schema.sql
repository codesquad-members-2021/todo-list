DROP TABLE IF EXISTS user;
CREATE TABLE user
(
    user_id  int auto_increment primary key,
    name     varchar(30),
    password varchar(30)
);

CREATE TABLE IF NOT EXISTS card
(
    id       int auto_increment primary key,
    title    varchar(30),
    contents varchar(30),
    status   varchar(30),
    user_id int,
    foreign key (user_id) references user (user_id)
);


