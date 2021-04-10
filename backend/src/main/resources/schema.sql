DROP TABLE IF EXISTS card;

CREATE TABLE card
(
    id                int AUTO_INCREMENT,
    title             varchar(50),
    contents          varchar(500),
    column_id         varchar(255),
    created_date_time datetime,
    primary key (id)
);
