-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema prueba3
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema prueba3
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `prueba3` DEFAULT CHARACTER SET utf8mb4 ;
USE `prueba3` ;

-- -----------------------------------------------------
-- Table `prueba3`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prueba3`.`rol` (
  `id_rol` INT NOT NULL AUTO_INCREMENT COMMENT 'Id Rol',
  `nombre` VARCHAR(45) NOT NULL COMMENT 'Nombre de rol',
  PRIMARY KEY (`id_rol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prueba3`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prueba3`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT COMMENT 'id Usuario',
  `nombre` VARCHAR(16) NOT NULL COMMENT 'nombre de usuario',
  `apellido` VARCHAR(16) NOT NULL COMMENT 'apellido de usuario',
  `email` VARCHAR(255) NULL COMMENT 'email de usuario',
  `contrasena` VARCHAR(32) NOT NULL COMMENT 'contraseña de usuario',
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creado usuario',
  `cod_rol` INT NOT NULL COMMENT 'codigo de Rol desde tabla Rol',
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `id_usuario_UNIQUE` (`id_usuario` ASC) VISIBLE,
  PRIMARY KEY (`id_usuario`),
  INDEX `fk_usuario_rol_idx` (`cod_rol` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_rol`
    FOREIGN KEY (`cod_rol`)
    REFERENCES `prueba3`.`rol` (`id_rol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `prueba3`.`equipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prueba3`.`equipo` (
  `id_equipo` INT NOT NULL AUTO_INCREMENT COMMENT 'ID equipo',
  `serial_equipo` VARCHAR(45) NOT NULL COMMENT 'Serial equipo',
  PRIMARY KEY (`id_equipo`),
  UNIQUE INDEX `serial_equipo_UNIQUE` (`serial_equipo` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prueba3`.`estado_ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prueba3`.`estado_ticket` (
  `id_estado_ticket` INT NOT NULL AUTO_INCREMENT COMMENT 'id Estado de ticket',
  `nombre` VARCHAR(45) NOT NULL COMMENT 'nombre Estado de ticket',
  PRIMARY KEY (`id_estado_ticket`),
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prueba3`.`ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prueba3`.`ticket` (
  `id_ticket` INT NOT NULL AUTO_INCREMENT COMMENT 'ID ticket',
  `descripcion` VARCHAR(255) NOT NULL COMMENT 'Descripcion de Ticket',
  `fecha_creado` DATETIME NULL COMMENT 'fecha de creado de Ticket',
  `cod_usuario` INT NOT NULL,
  `cod_equipo` INT NOT NULL COMMENT 'codigo de usuario desde tabla usuario',
  `cod_estado_ticket` INT NOT NULL COMMENT 'codigo de estado de ticket desde tabla estado de ticket',
  `imagen` VARCHAR(255) NULL COMMENT 'imagen desde ruta de carpeta',
  `respuesta` VARCHAR(255) NULL,
  PRIMARY KEY (`id_ticket`),
  INDEX `fk_ticket_usuario1_idx` (`cod_usuario` ASC) VISIBLE,
  INDEX `fk_ticket_equipo1_idx` (`cod_equipo` ASC) VISIBLE,
  INDEX `fk_ticket_estado_ticket1_idx` (`cod_estado_ticket` ASC) VISIBLE,
  CONSTRAINT `fk_ticket_usuario1`
    FOREIGN KEY (`cod_usuario`)
    REFERENCES `prueba3`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_equipo1`
    FOREIGN KEY (`cod_equipo`)
    REFERENCES `prueba3`.`equipo` (`id_equipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_estado_ticket1`
    FOREIGN KEY (`cod_estado_ticket`)
    REFERENCES `prueba3`.`estado_ticket` (`id_estado_ticket`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
