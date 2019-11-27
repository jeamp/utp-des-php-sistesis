-- MySQL Script generated by MySQL Workbench
-- Wed Nov 27 00:51:06 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema anteproyecto1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema anteproyecto1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `anteproyecto1` DEFAULT CHARACTER SET utf8 ;
USE `anteproyecto1` ;

-- -----------------------------------------------------
-- Table `anteproyecto1`.`carreras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `anteproyecto1`.`carreras` (
  `idcarreras` INT NOT NULL AUTO_INCREMENT,
  `nombreCarrera` VARCHAR(45) NULL,
  PRIMARY KEY (`idcarreras`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `anteproyecto1`.`Estudiantes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `anteproyecto1`.`Estudiantes` (
  `estCodigo` INT NOT NULL AUTO_INCREMENT,
  `estNombre` VARCHAR(45) NULL,
  `estApellido` VARCHAR(45) NULL,
  `estCedula` VARCHAR(45) NULL,
  `estNacimiento` DATE NULL,
  `estCorreo` VARCHAR(45) NULL,
  `estSexo` CHAR(1) NULL,
  `Estudiantescol` VARCHAR(45) NULL,
  `estFoto` VARCHAR(100) NULL,
  `password` VARCHAR(45) NULL,
  `estCarrera` INT NULL,
  PRIMARY KEY (`estCodigo`),
  INDEX `fk_carreras_idcarreras_idx` (`estCarrera` ASC) VISIBLE,
  CONSTRAINT `fk_carreras_idcarreras`
    FOREIGN KEY (`estCarrera`)
    REFERENCES `anteproyecto1`.`carreras` (`idcarreras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `anteproyecto1`.`Departamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `anteproyecto1`.`Departamentos` (
  `idDepartamentos` INT NOT NULL AUTO_INCREMENT,
  `depNombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idDepartamentos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `anteproyecto1`.`NivelAcademico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `anteproyecto1`.`NivelAcademico` (
  `idNivelAcademico` INT NOT NULL AUTO_INCREMENT,
  `nombreNivel` VARCHAR(45) NULL,
  PRIMARY KEY (`idNivelAcademico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `anteproyecto1`.`Cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `anteproyecto1`.`Cargo` (
  `idCargo` INT NOT NULL AUTO_INCREMENT,
  `nombreCargo` VARCHAR(45) NULL,
  PRIMARY KEY (`idCargo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `anteproyecto1`.`Profesores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `anteproyecto1`.`Profesores` (
  `proCodigo` INT NOT NULL AUTO_INCREMENT,
  `proNombre` VARCHAR(45) NULL,
  `proApellido` VARCHAR(45) NULL,
  `proCedula` VARCHAR(45) NULL,
  `proNacimiento` DATE NULL,
  `proSexo` CHAR(1) NULL,
  `proCorreo` VARCHAR(45) NULL,
  `proFoto` VARCHAR(100) NULL,
  `proDepartamento` INT NULL,
  `proNivelAcademico` INT NULL,
  `proCargo` INT NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`proCodigo`),
  INDEX `fk_profesores_departamento_idx` (`proDepartamento` ASC) VISIBLE,
  INDEX `fk_profesores_nivel_idx` (`proNivelAcademico` ASC) VISIBLE,
  INDEX `fk_profesores_cargo_idx` (`proCargo` ASC) VISIBLE,
  CONSTRAINT `fk_profesores_departamento`
    FOREIGN KEY (`proDepartamento`)
    REFERENCES `anteproyecto1`.`Departamentos` (`idDepartamentos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_profesores_nivel`
    FOREIGN KEY (`proNivelAcademico`)
    REFERENCES `anteproyecto1`.`NivelAcademico` (`idNivelAcademico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_profesores_cargo`
    FOREIGN KEY (`proCargo`)
    REFERENCES `anteproyecto1`.`Cargo` (`idCargo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `anteproyecto1`.`Anteproyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `anteproyecto1`.`Anteproyecto` (
  `antCodigo` INT NOT NULL AUTO_INCREMENT,
  `antEstudiante` INT NULL,
  `antTitulo` VARCHAR(45) NULL,
  `antObjetivo` VARCHAR(150) NULL,
  `antTitpo` VARCHAR(45) NULL,
  `antAsesor` INT NULL,
  `antArchivo` VARCHAR(225) NULL,
  `antPrioridad` VARCHAR(45) NULL,
  PRIMARY KEY (`antCodigo`),
  INDEX `fk_anteproyecto_antEstudiante_idx` (`antEstudiante` ASC) VISIBLE,
  INDEX `fk_anteproyecto_antAsesor_idx` (`antAsesor` ASC) VISIBLE,
  CONSTRAINT `fk_anteproyecto_antEstudiante`
    FOREIGN KEY (`antEstudiante`)
    REFERENCES `anteproyecto1`.`Estudiantes` (`estCodigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_anteproyecto_antAsesor`
    FOREIGN KEY (`antAsesor`)
    REFERENCES `anteproyecto1`.`Profesores` (`proCodigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `anteproyecto1`.`Concejo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `anteproyecto1`.`Concejo` (
  `conCodigo` INT NOT NULL AUTO_INCREMENT,
  `conNombre` VARCHAR(45) NULL,
  `conApellido` VARCHAR(45) NULL,
  `conCargo` INT NULL,
  PRIMARY KEY (`conCodigo`),
  INDEX `fk_concejo_cargo_idx` (`conCargo` ASC) VISIBLE,
  CONSTRAINT `fk_concejo_cargo`
    FOREIGN KEY (`conCargo`)
    REFERENCES `anteproyecto1`.`Cargo` (`idCargo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `anteproyecto1`.`Estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `anteproyecto1`.`Estado` (
  `codigoEstado` INT NOT NULL AUTO_INCREMENT,
  `nombreEstado` VARCHAR(45) NULL,
  PRIMARY KEY (`codigoEstado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `anteproyecto1`.`Revision`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `anteproyecto1`.`Revision` (
  `revCoidgo` INT NOT NULL AUTO_INCREMENT,
  `revFechal` DATE NULL,
  `revAnteproyecto` INT NULL,
  `revMensaje` VARCHAR(45) NULL,
  `revEstado` INT NULL,
  `revConcejo` INT NULL,
  PRIMARY KEY (`revCoidgo`),
  INDEX `fk_revision_revEstado_idx` (`revEstado` ASC) VISIBLE,
  INDEX `fl_revision_revConcejo_idx` (`revConcejo` ASC) VISIBLE,
  INDEX `fk_revision_revAnteproecto_idx` (`revAnteproyecto` ASC) VISIBLE,
  CONSTRAINT `fk_revision_revEstado`
    FOREIGN KEY (`revEstado`)
    REFERENCES `anteproyecto1`.`Estado` (`codigoEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fl_revision_revConcejo`
    FOREIGN KEY (`revConcejo`)
    REFERENCES `anteproyecto1`.`Concejo` (`conCodigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_revision_revAnteproecto`
    FOREIGN KEY (`revAnteproyecto`)
    REFERENCES `anteproyecto1`.`Anteproyecto` (`antCodigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `anteproyecto1`.`Asinacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `anteproyecto1`.`Asinacion` (
  `idAsinacion` INT NOT NULL AUTO_INCREMENT,
  `asiRevision` INT NULL,
  `asiProfesor` INT NULL,
  PRIMARY KEY (`idAsinacion`),
  INDEX `fk_asignacion_revision_idx` (`asiRevision` ASC) VISIBLE,
  INDEX `fk_asignacion_profesor_idx` (`asiProfesor` ASC) VISIBLE,
  CONSTRAINT `fk_asignacion_revision`
    FOREIGN KEY (`asiRevision`)
    REFERENCES `anteproyecto1`.`Revision` (`revCoidgo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_asignacion_profesor`
    FOREIGN KEY (`asiProfesor`)
    REFERENCES `anteproyecto1`.`Profesores` (`proCodigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `anteproyecto1`.`sustentacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `anteproyecto1`.`sustentacion` (
  `idsustentacion` INT NOT NULL AUTO_INCREMENT,
  `fechaSustentacion` DATE NULL,
  `horaSustentacion` DATE NULL,
  `lugarSustentacion` VARCHAR(45) NULL,
  `archivoSustentacion` VARCHAR(100) NULL,
  `revisionSsute` INT NULL,
  PRIMARY KEY (`idsustentacion`),
  INDEX `fk_sustentacion_revision_idx` (`revisionSsute` ASC) VISIBLE,
  CONSTRAINT `fk_sustentacion_revision`
    FOREIGN KEY (`revisionSsute`)
    REFERENCES `anteproyecto1`.`Revision` (`revCoidgo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
