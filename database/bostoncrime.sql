-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bostoncrime
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `bostoncrime` ;

-- -----------------------------------------------------
-- Schema bostoncrime
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bostoncrime` DEFAULT CHARACTER SET utf8 ;
USE `bostoncrime` ;

-- -----------------------------------------------------
-- Table `bostoncrime`.`district`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bostoncrime`.`district` ;

CREATE TABLE IF NOT EXISTS `bostoncrime`.`district` (
  `district_id` VARCHAR(3) NOT NULL,
  `district_name` VARCHAR(50) NULL,
  PRIMARY KEY (`district_id`),
  UNIQUE INDEX `district_id_UNIQUE` (`district_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bostoncrime`.`incident`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bostoncrime`.`incident` ;

CREATE TABLE IF NOT EXISTS `bostoncrime`.`incident` (
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
    REFERENCES `bostoncrime`.`district` (`district_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bostoncrime`.`offence`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bostoncrime`.`offence` ;

CREATE TABLE IF NOT EXISTS `bostoncrime`.`offence` (
  `offence_code` INT NOT NULL,
  `offence_code_group` VARCHAR(50) NOT NULL,
  `ucr_part` VARCHAR(20) NULL,
  PRIMARY KEY (`offence_code`),
  UNIQUE INDEX `offence_code_UNIQUE` (`offence_code` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bostoncrime`.`incident_offence`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bostoncrime`.`incident_offence` ;

CREATE TABLE IF NOT EXISTS `bostoncrime`.`incident_offence` (
  `incident_id` INT NOT NULL,
  `offence_code` INT NOT NULL,
  `offence_description` VARCHAR(100) NOT NULL,
  INDEX `fk_incident_offence_incident1_idx` (`incident_id` ASC) VISIBLE,
  INDEX `fk_incident_offence_offence1_idx` (`offence_code` ASC) VISIBLE,
  CONSTRAINT `fk_incident_offence_incident1`
    FOREIGN KEY (`incident_id`)
    REFERENCES `bostoncrime`.`incident` (`incident_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_incident_offence_offence1`
    FOREIGN KEY (`offence_code`)
    REFERENCES `bostoncrime`.`offence` (`offence_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

use bostoncrime;

update district
  set district_name = 'Downtown'
  where district_id = 'A1';
  
update district
  set district_name = 'East Boston'
  where district_id = 'A7';
  
update district
  set district_name = 'Roxbury'
  where district_id = 'B2';
  
update district
  set district_name = 'Mattapan'
  where district_id = 'B3';
  
update district
  set district_name = 'South Boston'
  where district_id = 'C6';

update district
  set district_name = 'Dorchester'
  where district_id = 'C11';
  
update district
  set district_name = 'South End'
  where district_id = 'D4';
  
update district
  set district_name = 'Brighton'
  where district_id = 'D14';

update district
  set district_name = 'West Roxbury'
  where district_id = 'E5';
  
update district
  set district_name = 'Jamaica Plain'
  where district_id = 'E13';
  
update district
  set district_name = 'Hyde Park'
  where district_id = 'E18';

update district
  set district_name = 'Charlestown'
  where district_id = 'A15';
  
  
show tables;
select * from district;
select count(*) from offence; #222
select count(*) from district; #13
select count(*) from incident; #293943
select count(*) from incident_offence; #332173
