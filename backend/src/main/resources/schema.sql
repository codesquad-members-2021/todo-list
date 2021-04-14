CREATE TABLE IF NOT EXISTS `column` (
    id   BIGINT AUTO_INCREMENT PRIMARY KEY,
    name varchar(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS `column_card` (
    `column` BIGINT,
    card BIGINT,
    column_key BIGINT
);

CREATE TABLE IF NOT EXISTS card (
    id    BIGINT AUTO_INCREMENT PRIMARY KEY,
    title varchar(50),
    body  varchar(500)
);
