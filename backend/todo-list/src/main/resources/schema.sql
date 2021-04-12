DROP TABLE IF EXISTS card, user;

CREATE TABLE user(
    user_id  int auto_increment primary key,
    name     varchar(30),
    password varchar(30),
    profile_url varchar(255),
    token varchar(255)
);

CREATE TABLE card(
    id       int auto_increment primary key,
    title    varchar(30),
    contents varchar(30),
    status   varchar(30),
    post_time datetime DEFAULT CURRENT_TIMESTAMP(),
    user_id int,
    foreign key (user_id) references user(user_id) ON UPDATE CASCADE
);



