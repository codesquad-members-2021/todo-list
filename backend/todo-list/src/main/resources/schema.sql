DROP TABLE IF EXISTS card;
CREATE TABLE card (
                    id INT auto_increment,
                    title VARCHAR(30),
                    contents VARCHAR(30),
                    status VARCHAR(30),
                    primary key(id)
                  );
