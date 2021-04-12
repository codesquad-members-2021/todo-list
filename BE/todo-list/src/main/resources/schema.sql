# DROP TABLE IF EXISTS card;
# DROP TABLE IF EXISTS board;

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
    board_key int,
    constraint column_foreign_id foreign key (board) references board(id)
);
