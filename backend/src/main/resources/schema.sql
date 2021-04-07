drop table if exists card;

create table card (
        id bigint auto_increment primary key,
        title varchar(50),
        content varchar(500),
        status varchar(50),
        created_time timestamp
);
