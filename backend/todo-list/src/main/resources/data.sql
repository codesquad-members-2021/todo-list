--USER
INSERT INTO user(NAME, PASSWORD, PROFILE_URL) VALUES ('Lia','test', 'https://www.flaticon.com/svg/vstatic/svg/2784/2784465.svg?token=exp=1618387189~hmac=d2d84e2c56dc5ba59e4ea7dc5de50a1c');
INSERT INTO user(NAME, PASSWORD, PROFILE_URL) VALUES ('Min','test', 'https://www.flaticon.com/svg/vstatic/svg/2784/2784465.svg?token=exp=1618387189~hmac=d2d84e2c56dc5ba59e4ea7dc5de50a1c');
INSERT INTO user(NAME, PASSWORD, PROFILE_URL) VALUES ('Robin','test', 'https://www.flaticon.com/svg/vstatic/svg/2784/2784465.svg?token=exp=1618387189~hmac=d2d84e2c56dc5ba59e4ea7dc5de50a1c');
INSERT INTO user(NAME, PASSWORD, PROFILE_URL) VALUES ('Jane','test', 'https://www.flaticon.com/svg/vstatic/svg/2784/2784465.svg?token=exp=1618387189~hmac=d2d84e2c56dc5ba59e4ea7dc5de50a1c');

--CARD
INSERT INTO card(IS_DELETED, USER_ID, TITLE, CONTENTS, STATUS, POST_TIME) VALUES (0, 1, 'Lia가 작성한 글','뷰 깎는 요정','todo', now());
INSERT INTO card(IS_DELETED, USER_ID, TITLE, CONTENTS, STATUS ,POST_TIME) VALUES (0, 2, 'Mn이 작성 글','맥주마시는 코딩 요정','todo',now());
INSERT INTO card(IS_DELETED, USER_ID, TITLE, CONTENTS, STATUS ,POST_TIME) VALUES (0, 3, 'Robin이 작성한 글','힘듦 공감 요정','doing',now());
INSERT INTO card(IS_DELETED, USER_ID, TITLE, CONTENTS, STATUS ,POST_TIME) VALUES (0, 4,'Jane이 작성한 글','로빈과 절친된 밤코요정','done',now());
