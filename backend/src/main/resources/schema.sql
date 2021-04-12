DROP TABLE IF EXISTS todo;
DROP TABLE IF EXISTS vertical;

CREATE TABLE IF NOT EXISTS todo(
    id int auto_increment primary key,
    vertical int references vertical(id),
    vertical_key int,
    title varchar(64)
);

CREATE TABLE IF NOT EXISTS vertical(
    id int auto_increment primary key,
    status varchar(64)
);
