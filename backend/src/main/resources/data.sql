
INSERT INTO user (name) VALUES ('sunny');

INSERT INTO vertical (user, status) VALUES (1, 'ToDo');

INSERT INTO vertical (user, status) VALUES (1, 'Doing');

INSERT INTO vertical (user, status) VALUES (1, 'Done');

INSERT INTO todo (vertical, title, contents) VALUES (1, "1 ToDo", "1123123 ToDo123123");

INSERT INTO todo (vertical, title, contents) VALUES (1, "2 ToDo", "1123213213 ToDo 12312321");

INSERT INTO todo (vertical, title, contents) VALUES (2, "3 Doing", "112312321 ToDo123123");

INSERT INTO todo (vertical, title, contents) VALUES (2, "4 Doing", "1123213 ToDo123123");

INSERT INTO todo (vertical, title, contents) VALUES (3, "5 Done", "1123213 ToDo123213");

INSERT INTO todo (vertical, title, contents) VALUES (3, "6 Done", "112312321 ToDo12312321");
