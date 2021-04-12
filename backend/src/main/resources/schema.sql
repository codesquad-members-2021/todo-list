CREATE TABLE ToDoList (
    id   BIGINT AUTO_INCREMENT PRIMARY KEY,
    name varchar(50) NOT NULL
);

CREATE TABLE ToDoList_Column (
    ToDoList BIGINT,
    Column BIGINT,
    ToDoList_key BIGINT
);

CREATE TABLE Column (
    id   BIGINT AUTO_INCREMENT PRIMARY KEY,
    name varchar(50) NOT NULL
);

CREATE TABLE Column_Card (
    Column BIGINT,
    Card BIGINT,
    Column_key BIGINT
);

CREATE TABLE Card (
    id    BIGINT AUTO_INCREMENT PRIMARY KEY,
    title varchar(50),
    body  varchar(500)
);

CREATE TABLE user (
    id       BIGINT AUTO_INCREMENT PRIMARY KEY,
    userid   VARCHAR(45) NOT NULL UNIQUE,
    password varchar(45) NOT NULL,
    name     varchar(45) NOT NULL
);

CREATE TABLE activity (
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    action_user BIGINT,
    action      char(10),
    title       varchar(50),
    from_column varchar(50),
    to_column   varchar(50),
    action_time DATETIME,
    CONSTRAINT ACTION_USER FOREIGN KEY (action_user) REFERENCES user (id)
);
