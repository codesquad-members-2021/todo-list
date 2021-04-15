use
TODO_DB;
drop table if exists TODO_USER;
drop table if exists TODO_COLUMN;
drop table if exists TODO_TASK;
drop table if exists TODO_LOG;

create table TODO_USER
(
    ID            bigint(20) auto_increment primary key,
    NAME          varchar(30),
    USER_ID       varchar(30),
    PASSWORD      varchar(30),
    PROFILE_IMAGE varchar(60)
);

create table TODO_COLUMN
(
    ID            bigint(20) auto_increment primary key,
    COLUMN_TITLE  varchar(30),
    TODO_USER     bigint(20) references TODO_USER (id),
    TODO_USER_KEY int
);

create table TODO_TASK
(
    ID                bigint(20) auto_increment primary key,
    TASK_TITLE        varchar(30),
    TASK_CONTENT      varchar(30),
    TODO_COLUMN       bigint(20) references TODO_COLUMN (id),
    TODO_COLUMN_KEY   int,
    CREATED_DATE_TIME timestamp,
    UPDATED_DATE_TIME timestamp
);

create table TODO_LOG
(
    ID                bigint(20) auto_increment primary key,
    ACTION            varchar(30),
    FROM_COLUMN_TITLE varchar(30),
    TO_COLUMN_TITLE   varchar(30),
    TASK_TITLE        varchar(30),
    TODO_USER         bigint(20) references TODO_USER (id),
    TODO_USER_KEY     int,
    CREATED_DATE_TIME timestamp
);
