-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`district`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`district` ;

CREATE TABLE IF NOT EXISTS `mydb`.`district` (
  `district_id` VARCHAR(3) NOT NULL,
  `district_name` VARCHAR(50) NULL,
  PRIMARY KEY (`district_id`),
  UNIQUE INDEX `district_id_UNIQUE` (`district_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`incident`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`incident` ;

CREATE TABLE IF NOT EXISTS `mydb`.`incident` (
  `incident_id` INT NOT NULL,
  `shooting` TINYINT NOT NULL,
  `occured_on_date` DATETIME NOT NULL,
  `year` VARCHAR(4) NOT NULL,
  `month` ENUM('1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12') NOT NULL,
  `day_of_week` ENUM('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday') NOT NULL,
  `hour` INT NOT NULL,
  `street` VARCHAR(100) NULL,
  `latitude` DECIMAL(10,8) NULL,
  `longitude` DECIMAL(11,8) NULL,
  `reporting_area` VARCHAR(3) NULL,
  `district_id` VARCHAR(3) NOT NULL,
  PRIMARY KEY (`incident_id`),
  UNIQUE INDEX `incident_id_UNIQUE` (`incident_id` ASC) VISIBLE,
  INDEX `fk_incident_district1_idx` (`district_id` ASC) VISIBLE,
  CONSTRAINT `fk_incident_district1`
    FOREIGN KEY (`district_id`)
    REFERENCES `mydb`.`district` (`district_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`offence`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`offence` ;

CREATE TABLE IF NOT EXISTS `mydb`.`offence` (
  `offence_code` INT NOT NULL,
  `offence_code_group` VARCHAR(50) NOT NULL,
  `ucr_part` VARCHAR(20) NULL,
  PRIMARY KEY (`offence_code`),
  UNIQUE INDEX `offence_code_UNIQUE` (`offence_code` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`incident_offence`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`incident_offence` ;

CREATE TABLE IF NOT EXISTS `mydb`.`incident_offence` (
  `incident_id` INT NOT NULL,
  `offence_code` INT NOT NULL,
  `offence_description` VARCHAR(100) NOT NULL,
  INDEX `fk_incident_offence_incident1_idx` (`incident_id` ASC) VISIBLE,
  INDEX `fk_incident_offence_offence1_idx` (`offence_code` ASC) VISIBLE,
  CONSTRAINT `fk_incident_offence_incident1`
    FOREIGN KEY (`incident_id`)
    REFERENCES `mydb`.`incident` (`incident_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_incident_offence_offence1`
    FOREIGN KEY (`offence_code`)
    REFERENCES `mydb`.`offence` (`offence_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
