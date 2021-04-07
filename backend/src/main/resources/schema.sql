create table card (
    id int identity primary key,
    title varchar,
    content varchar(500),
    status varchar,
    created_time timestamp,
    boolean deleted
)
