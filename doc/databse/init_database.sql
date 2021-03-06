-- MySQL Script generated by MySQL Workbench
-- Sat Sep  8 20:02:19 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MapleBBS
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `MapleBBS` ;

-- -----------------------------------------------------
-- Schema MapleBBS
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MapleBBS` DEFAULT CHARACTER SET utf8 ;
USE `MapleBBS` ;

-- -----------------------------------------------------
-- Table `MapleBBS`.`user_picture`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MapleBBS`.`user_picture` ;

CREATE TABLE IF NOT EXISTS `MapleBBS`.`user_picture` (
  `id` INT NOT NULL,
  `address` VARCHAR(45) NULL DEFAULT 'null',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MapleBBS`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MapleBBS`.`user` ;

CREATE TABLE IF NOT EXISTS `MapleBBS`.`user` (
  `id` INT NOT NULL,
  `nickname` VARCHAR(45) NOT NULL,
  `password` CHAR(32) NOT NULL,
  `rank` TINYINT(10) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `signature` VARCHAR(255) NULL,
  `last_login` DATETIME NOT NULL,
  `user_picture_id` INT NULL DEFAULT -1,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_user_picture_id`
    FOREIGN KEY (`user_picture_id`)
    REFERENCES `MapleBBS`.`user_picture` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `uq_user_nickname` ON `MapleBBS`.`user` (`nickname` ASC);

CREATE INDEX `fk_user_user_picture1_idx` ON `MapleBBS`.`user` (`user_picture_id` ASC);


-- -----------------------------------------------------
-- Table `MapleBBS`.`forum`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MapleBBS`.`forum` ;

CREATE TABLE IF NOT EXISTS `MapleBBS`.`forum` (
  `id` INT NOT NULL,
  `father_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_forum_fatherforum`
    FOREIGN KEY (`father_id`)
    REFERENCES `MapleBBS`.`forum` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_forum_fatherforum_idx` ON `MapleBBS`.`forum` (`father_id` ASC);


-- -----------------------------------------------------
-- Table `MapleBBS`.`topic`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MapleBBS`.`topic` ;

CREATE TABLE IF NOT EXISTS `MapleBBS`.`topic` (
  `id` INT NOT NULL,
  `from_forum` INT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `click_num` INT NOT NULL,
  `next_comment_floor_index` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_forum_id`
    FOREIGN KEY (`from_forum`)
    REFERENCES `MapleBBS`.`forum` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_forum_id_idx` ON `MapleBBS`.`topic` (`from_forum` ASC);


-- -----------------------------------------------------
-- Table `MapleBBS`.`comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MapleBBS`.`comment` ;

CREATE TABLE IF NOT EXISTS `MapleBBS`.`comment` (
  `id` INT NOT NULL,
  `from_topic` INT NOT NULL,
  `floor_index` INT NOT NULL,
  `author` INT NOT NULL,
  `msg` VARCHAR(3500) NOT NULL,
  `create_date` DATETIME NOT NULL,
  `last_edit` DATETIME NOT NULL,
  `reply_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_topic_id`
    FOREIGN KEY (`from_topic`)
    REFERENCES `MapleBBS`.`topic` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_id`
    FOREIGN KEY (`author`)
    REFERENCES `MapleBBS`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_id`
    FOREIGN KEY (`reply_id`)
    REFERENCES `MapleBBS`.`comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_topic_id_idx` ON `MapleBBS`.`comment` (`from_topic` ASC);

CREATE INDEX `fk_user_id_idx` ON `MapleBBS`.`comment` (`author` ASC);

CREATE INDEX `fk_comment_comment1_idx` ON `MapleBBS`.`comment` (`reply_id` ASC);


-- -----------------------------------------------------
-- Table `MapleBBS`.`forum_master`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MapleBBS`.`forum_master` ;

CREATE TABLE IF NOT EXISTS `MapleBBS`.`forum_master` (
  `user_id` INT NOT NULL,
  `forum_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `forum_id`),
  CONSTRAINT `fk_User_has_Forum_User`
    FOREIGN KEY (`user_id`)
    REFERENCES `MapleBBS`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Forum_Forum1`
    FOREIGN KEY (`forum_id`)
    REFERENCES `MapleBBS`.`forum` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_User_has_Forum_Forum1_idx` ON `MapleBBS`.`forum_master` (`forum_id` ASC);

CREATE INDEX `fk_User_has_Forum_User_idx` ON `MapleBBS`.`forum_master` (`user_id` ASC);


-- -----------------------------------------------------
-- Table `MapleBBS`.`mute_list`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MapleBBS`.`mute_list` ;

CREATE TABLE IF NOT EXISTS `MapleBBS`.`mute_list` (
  `user_id` INT NOT NULL,
  `forum_id` INT NOT NULL,
  `mute_from` DATETIME NOT NULL,
  `mute_until` DATETIME NOT NULL,
  PRIMARY KEY (`user_id`, `forum_id`, `mute_from`),
  CONSTRAINT `fk_User_has_Forum_User1`
    FOREIGN KEY (`user_id`)
    REFERENCES `MapleBBS`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Forum_Forum2`
    FOREIGN KEY (`forum_id`)
    REFERENCES `MapleBBS`.`forum` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_User_has_Forum_Forum2_idx` ON `MapleBBS`.`mute_list` (`forum_id` ASC);

CREATE INDEX `fk_User_has_Forum_User1_idx` ON `MapleBBS`.`mute_list` (`user_id` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
