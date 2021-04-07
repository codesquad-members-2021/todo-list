DROP TABLE IF EXISTS todo;

CREATE TABLE IF NOT EXISTS todo(
    id int auto_increment primary key,
    title varchar(64),
    created_date datetime
);
