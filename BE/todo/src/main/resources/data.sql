INSERT INTO `user` (`user_id`,`password`) VALUES ('noel', '1234');
INSERT INTO `card` (`user`, `title`, `content`, `priority`, `column_type`) VALUES (1, '제목입니다.', '내용입니다.', 1, '할일');
INSERT INTO `card` (`USER`, `TITLE`, `CONTENT`, `PRIORITY`, `COLUMN_TYPE`) VALUES (1, '테스트1', '내용', 1.3, '하는중');
INSERT INTO `card` (`USER`, `TITLE`, `CONTENT`, `PRIORITY`, `COLUMN_TYPE`) VALUES (1, '테스트2', '내용', 1.6, '완료');
INSERT INTO `history` (`CARD`, `ACTION`, `DATE`, `FROM`, `TO`) VALUES ('1', '이동', now(), '할일', '하는중');
INSERT INTO `history` (`CARD`, `ACTION`, `DATE`, `FROM`, `TO`) VALUES ('2', '추가', now(), null, '하는중');
INSERT INTO `history` (`CARD`, `ACTION`, `DATE`, `FROM`, `TO`) VALUES ('2', '삭제', now(), '할일', null);
