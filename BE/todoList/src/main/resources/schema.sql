DROP TABLE IF EXISTS CARD;
DROP TABLE IF EXISTS NOTE;
DROP TABLE IF EXISTS COLUMNS;

CREATE TABLE COLUMNS (
    ID bigint primary key auto_increment,
    NAME VARCHAR(50)
);

CREATE TABLE CARD (
    ID bigint primary key auto_increment,
    TITLE varchar(50) not null,
    CONTENT varchar(500) not null,
    AUTHOR varchar(30) not null,
    COLUMNS bigint(50) REFERENCES COLUMNS(ID),
    COLUMNS_key int,
    CREATE_DATETIME timestamp not null ,
    UPDATE_DATETIME timestamp not null
);

CREATE TABLE NOTE (
   ID bigint primary key auto_increment,
   BEFORE_STATUS varchar(20) not null,
   AFTER_STATUS varchar(20),
   TITLE varchar(50) not null ,
   ACTION varchar(20) not null ,
   CREATE_ACTION_DATETIME timestamp not null
);
