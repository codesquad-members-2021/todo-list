DROP TABLE IF EXISTS user;
CREATE TABLE user (
                      id INT auto_increment,
                      name VARCHAR(30),
                      password VARCHAR(30),
                      primary key(id)
);


DROP TABLE IF EXISTS card;
CREATE TABLE card (
                    id INT auto_increment,
                    title VARCHAR(30),
                    contents VARCHAR(30),
                    status VARCHAR(30),
                    primary key(id),
                    user int references user(id)
                  );


