-- MySQL Script generated by MySQL Workbench
-- Wed Oct 26 14:49:13 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema QUIZBAZA
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema QUIZBAZA
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `QUIZBAZA` DEFAULT CHARACTER SET utf8 ;
USE `QUIZBAZA` ;

-- -----------------------------------------------------
-- Table `QUIZBAZA`.`questions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QUIZBAZA`.`questions` (
  `id` INT NOT NULL,
  `content` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `QUIZBAZA`.`answers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QUIZBAZA`.`answers` (
  `id` INT NOT NULL,
  `description` VARCHAR(45) NULL,
  `questions_id` INT NOT NULL,
  `is_right` VARCHAR(45) NULL,
  PRIMARY KEY (`id`, `questions_id`),
  CONSTRAINT `fk_answers_questions`
    FOREIGN KEY (`questions_id`)
    REFERENCES `QUIZBAZA`.`questions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `QUIZBAZA`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QUIZBAZA`.`students` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `QUIZBAZA`.`tests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QUIZBAZA`.`tests` (
  `id` INT NOT NULL,
  `data` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `QUIZBAZA`.`tests_has_questions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QUIZBAZA`.`tests_has_questions` (
  `tests_id` INT NOT NULL,
  `questions_id` INT NOT NULL,
  PRIMARY KEY (`tests_id`, `questions_id`),
  CONSTRAINT `fk_tests_has_questions_tests1`
    FOREIGN KEY (`tests_id`)
    REFERENCES `QUIZBAZA`.`tests` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tests_has_questions_questions1`
    FOREIGN KEY (`questions_id`)
    REFERENCES `QUIZBAZA`.`questions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `QUIZBAZA`.`tests_has_students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QUIZBAZA`.`tests_has_students` (
  `tests_id` INT NOT NULL,
  `students_id` INT NOT NULL,
  PRIMARY KEY (`tests_id`, `students_id`),
  CONSTRAINT `fk_tests_has_students_tests1`
    FOREIGN KEY (`tests_id`)
    REFERENCES `QUIZBAZA`.`tests` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tests_has_students_students1`
    FOREIGN KEY (`students_id`)
    REFERENCES `QUIZBAZA`.`students` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `QUIZBAZA`.`students_cheks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QUIZBAZA`.`students_cheks` (
  `id` INT NOT NULL,
  `students_id` INT NOT NULL,
  `tests_id` INT NOT NULL,
  `questions_id` INT NOT NULL,
  `answers_id` INT NOT NULL,
  `answers_questions_id` INT NOT NULL,
  PRIMARY KEY (`id`, `students_id`, `tests_id`, `questions_id`, `answers_id`, `answers_questions_id`),
  CONSTRAINT `fk_students_cheks_students1`
    FOREIGN KEY (`students_id`)
    REFERENCES `QUIZBAZA`.`students` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_students_cheks_tests1`
    FOREIGN KEY (`tests_id`)
    REFERENCES `QUIZBAZA`.`tests` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_students_cheks_questions1`
    FOREIGN KEY (`questions_id`)
    REFERENCES `QUIZBAZA`.`questions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_students_cheks_answers1`
    FOREIGN KEY (`answers_id` , `answers_questions_id`)
    REFERENCES `QUIZBAZA`.`answers` (`id` , `questions_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
