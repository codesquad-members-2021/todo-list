CREATE TABLE ToDoList (
    id   int AUTO_INCREMENT PRIMARY KEY,
    name varchar(50) NOT NULL
);

CREATE TABLE ToDoList_Column (
    ToDoList int,
    Column int,
    ToDoList_key int
);

CREATE TABLE Column (
    id   int AUTO_INCREMENT PRIMARY KEY,
    name varchar(50) NOT NULL
);

CREATE TABLE Column_Card (
    Column int,
    Card int,
    Column_key int
);

CREATE TABLE Card (
    id    int AUTO_INCREMENT PRIMARY KEY,
    title varchar(50),
    body  varchar(500)
);

CREATE TABLE user (
    id       int AUTO_INCREMENT PRIMARY KEY,
    userid   VARCHAR(45) NOT NULL UNIQUE,
    password varchar(45) NOT NULL,
    name     varchar(45) NOT NULL
);

CREATE TABLE activity (
    id          int AUTO_INCREMENT PRIMARY KEY,
    action_user int,
    action      char(10),
    title       varchar(50),
    from_column varchar(50),
    to_column   varchar(50),
    action_time DATETIME,
    CONSTRAINT ACTION_USER FOREIGN KEY (action_user) REFERENCES user (id)
);
