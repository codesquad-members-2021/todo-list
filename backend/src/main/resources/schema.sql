DROP TABLE IF EXISTS card;

CREATE TABLE card
(
    id       int AUTO_INCREMENT,
    title    varchar(50),
    contents varchar(500),
    column_id   int,
    created_date_time datetime,
    primary key(id)
);
