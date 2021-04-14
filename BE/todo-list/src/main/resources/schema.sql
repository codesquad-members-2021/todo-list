drop table card;
drop table board;
drop table log;

create table if not exists board (
    id bigint auto_increment primary key ,
    title varchar (50)
);

create table if not exists card (
    id bigint auto_increment primary key ,
    title varchar(50),
    content varchar(500),
    created_time datetime,
    board bigint,
    constraint column_foreign_id foreign key (board) references board(id)
);

create table IF NOT EXISTS log (
    id bigint auto_increment primary key ,
    action varchar(50),
    card_title varchar(50),
    time datetime,
    previous_board varchar(50),
    current_board varchar(50)
)