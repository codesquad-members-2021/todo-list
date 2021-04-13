DROP TABLE IF EXISTS history, card, user;

CREATE TABLE user
(
    user_id     int auto_increment primary key,
    name        varchar(30) UNIQUE,
    password    varchar(30),
    profile_url varchar(255)
);

CREATE TABLE card
(
    id        int auto_increment primary key,
    title     varchar(30),
    contents  varchar(30),
    status    varchar(30),
    post_time datetime DEFAULT CURRENT_TIMESTAMP(),
    is_deleted boolean,
    user_id   int,
    foreign key (user_id) references user(user_id) ON UPDATE CASCADE
);

CREATE TABLE history
(
    id          int auto_increment primary key,
    action      varchar(30),
    action_time datetime default CURRENT_TIMESTAMP(),
    pre_status  varchar(30),
    curr_status varchar(30),
    card_id     int,
    foreign key (card_id) references card(id) on update cascade
)



