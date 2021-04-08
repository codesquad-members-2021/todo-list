CREATE TABLE TO_DO_LIST (
    id int AUTO_INCREMENT PRIMARY KEY,
    name varchar (50) NOT NULL
);

CREATE TABLE column (
  id int AUTO_INCREMENT PRIMARY KEY,
  name varchar (50) NOT NULL,
  TO_DO_LIST int,
  TO_DO_LIST_key int,
  CONSTRAINT TODOLIST_FOREIGN_KEY FOREIGN KEY (TO_DO_LIST) references TO_DO_LIST(id)
);

CREATE TABLE user (
  id int AUTO_INCREMENT PRIMARY KEY,
  userid VARCHAR (45) NOT NULL UNIQUE,
  password varchar (45) NOT NULL,
  name varchar (45) NOT NULL
);

CREATE TABLE card (
    id int AUTO_INCREMENT PRIMARY KEY,
    title varchar (50),
    body varchar (500),
    column int,
    column_key int,
    CONSTRAINT COLUMN_FOREIGN_KEY FOREIGN KEY(column) REFERENCES column(id)
);

CREATE TABLE activity (
    id int AUTO_INCREMENT PRIMARY KEY,
    action_user int,
    action char (10),
    title varchar (50),
    from_column varchar (50),
    to_column varchar (50),
    action_time DATETIME,
    CONSTRAINT ACTION_USER FOREIGN KEY(action_user) REFERENCES user(id)
);
