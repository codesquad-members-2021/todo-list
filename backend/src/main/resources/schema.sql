drop table if exists CARD;

create table CARD (
                      id bigint auto_increment primary key,
                      title varchar(50),
                      contents varchar(500),
                      column_id int,
                      created_time timestamp,
                      flag double
);

drop table if exists HISTORY;

create table HISTORY (
                         id bigint auto_increment primary key,
                         action varchar(10),
                         title varchar(50),
                         from_column_id bigint,
                         to_column_id bigint,
                         created_time timestamp
);
