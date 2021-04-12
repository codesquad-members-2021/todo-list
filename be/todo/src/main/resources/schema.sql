drop table if exists USER;
drop table if exists COLUMN;
drop table if exists TASK;
drop table if exists TODO_LOG;

create table USER
(
    ID            int auto_increment primary key,
    NAME          varchar(30),
    USER_ID       varchar(30),
    PASSWORD      varchar(30),
    PROFILE_IMAGE varchar(60)
);

create table COLUMN
(
    ID                int auto_increment primary key,
    COLUMN_TITLE      varchar(30),
    USER              int references user (id),
    USER_KEY          int,
    CREATED_DATE_TIME timestamp,
    UPDATED_DATE_TIME timestamp
);

create table TASK
(
    ID                int auto_increment primary key,
    TASK_TITLE        varchar(30),
    TASK_CONTENT      varchar(30),
    COLUMN            int references column (id),
    COLUMN_KEY        int,
    CREATED_DATE_TIME timestamp,
    UPDATED_DATE_TIME timestamp
);

create table TODO_LOG
(
    ID                int auto_increment primary key,
    ACTION            varchar(30),
    USER              int references user (id),
    USER_KEY          int,
    CREATED_DATE_TIME timestamp
);
