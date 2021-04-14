-- MySQL Workbench Forward Engineering
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
-- -----------------------------------------------------
-- Schema todolist
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema todolist
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `todolist` DEFAULT CHARACTER SET utf8 ;
USE `todolist` ;
-- -----------------------------------------------------
-- Table `todolist`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS todolist.user;
CREATE TABLE IF NOT EXISTS todolist.user (
    `id` INT AUTO_INCREMENT,
    `user_id` VARCHAR(64) NOT NULL,
    `password` VARCHAR(64) NOT NULL,
    `name` VARCHAR(64) NOT NULL,
    `email` VARCHAR(64) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE)
    ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `todolist`.`Work`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `todolist`.`work`;
CREATE TABLE IF NOT EXISTS `todolist`.`work` (
    `id` INT AUTO_INCREMENT,
    `title` VARCHAR(255) NOT NULL,
    `content` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `status` VARCHAR(64) NOT NULL,
    `author_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `fk_work_user_idx` (`author_id` ASC) VISIBLE,
    CONSTRAINT `fk_work_user`
    FOREIGN KEY (`author_id`)
    REFERENCES `todolist`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `todolist`.`timeline`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `todolist`.`timeline`;
CREATE TABLE IF NOT EXISTS `todolist`.`timeline` (
    `id` INT AUTO_INCREMENT,
    `content` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `author_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `fk_timeline_user_idx` (`author_id` ASC) VISIBLE,
    CONSTRAINT `fk_timeline_user`
    FOREIGN KEY (`author_id`)
    REFERENCES `todolist`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
