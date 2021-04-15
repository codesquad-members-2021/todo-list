INSERT INTO task(TITLE, CONTENT, WRITER, DELETED, PREVIOUS_ID, TASK_TYPE, IS_HEAD)
VALUES ('title1', 'content1', 'writer1', FALSE, 2, 'todo', true);

INSERT INTO task(TITLE, CONTENT, WRITER, DELETED, PREVIOUS_ID, TASK_TYPE, IS_HEAD)
VALUES ('title2', 'content2', 'writer2', FALSE, 3, 'todo', false);

INSERT INTO task(TITLE, CONTENT, WRITER, DELETED, PREVIOUS_ID, TASK_TYPE, IS_HEAD)
VALUES ('title3', 'content3', 'writer3', FALSE, -1, 'todo', false);

INSERT INTO task(TITLE, CONTENT, WRITER, DELETED, PREVIOUS_ID, TASK_TYPE, IS_HEAD)
VALUES ('title4', 'content4', 'writer4', FALSE, -1, 'doing', true);

INSERT INTO task(TITLE, CONTENT, WRITER, DELETED, PREVIOUS_ID, TASK_TYPE, IS_HEAD)
VALUES ('title5', 'content5', 'writer5', FALSE, -1, 'done', true);
