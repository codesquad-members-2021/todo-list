INSERT INTO column (id, name) VALUES (1, '해야할 일');
INSERT INTO column (id, name) VALUES (2, '하고있는 일');
INSERT INTO column (id, name) VALUES (3, '완료한 일');

INSERT INTO user (id, userid, password, name) VALUES (1, 'k', '123', 'PizzaCola-K');

INSERT INTO card(id, title, body, column_id) VALUES (1, 'GitHub 공부하기', 'add, commmit, push', 1);
INSERT INTO card(id, title, body, column_id) VALUES (2, '블로그에 포스팅할 것', 'GitHub 공부내용 모던 자바스크립트 1장 공부내용', 1);
INSERT INTO card(id, title, body, column_id) VALUES (3, '모던 자바스크립트 예제 실습', '1장 예제 내용 실습 후, 커밋까지', 2);
INSERT INTO card(id, title, body, column_id) VALUES (4, 'HTML/CSS 공부하기', 'input 태크 실습+노션에 유형 정리', 2);
