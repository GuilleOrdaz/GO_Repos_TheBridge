
/*******************************************************************************
   corteingles Database - Version 1.4
   Script: corteingles-creacion.sql
   Description: Base de datos del corte inglés.
   DB Server: MySql
   Author: Guillermo Martín Ordaz
   License: http://www.codeplex.com/ChinookDatabase/license
********************************************************************************/

/*******************************************************************************
   Drop database if it exists
********************************************************************************/
DROP DATABASE IF EXISTS `corteingles`;


/*******************************************************************************
   Create database
********************************************************************************/
CREATE DATABASE `corteingles`;


USE `corteingles`;


/*******************************************************************************
   Create Tables
********************************************************************************/
CREATE TABLE `Familia`
(
    `ID_DPTO` VARCHAR(255) NOT NULL,
    `COD_FAMILIA` VARCHAR(160) NOT NULL,
    `DESC_FAMILIA` VARCHAR(255) NOT NULL,
    CONSTRAINT `PK_Familia` PRIMARY KEY  (`ID_DPTO`)
);

CREATE TABLE `Articulo`
(
    `REFERENCIA` VARCHAR(255) NOT NULL,
    `ID_DPTO` VARCHAR(120) NOT NULL,
    `COD_FAMILIA` VARCHAR(255) NOT NULL,
    `FECHA_ALTA` date not null,
    CONSTRAINT `PK_Articulo` PRIMARY KEY  (`ID_DPTO`)
);

CREATE TABLE `Departamento`
(
    `ID_DPTO` VARCHAR(255) NOT NULL,
    `DESC_DPTO` VARCHAR(40) NOT NULL,
    CONSTRAINT `PK_Departamento` PRIMARY KEY  (`ID_DPTO`)
);

CREATE TABLE `Campanias`
(
    `ID_CAMPANIA` VARCHAR(255) NOT NULL,
    `TIPO` VARCHAR(255) NOT NULL,
    `FECHA_CAMP` datetime NOT NULL,
	CONSTRAINT `PK_Campanias` PRIMARY KEY  (`ID_CAMPANIA`)
);

CREATE TABLE `venta`
(
    `TALON` VARCHAR(255) NOT NULL,
    `REFERENCIA` VARCHAR(120) NOT NULL,
    `PRECIO` VARCHAR(255) NOT NULL,
    `FECHA_VENTA` datetime NOT NULL,
    CONSTRAINT `PK_venta` PRIMARY KEY  (`REFERENCIA`)
);

CREATE TABLE `depto_campania`
(
    `ID_DPTO` VARCHAR(255) NOT NULL,
    `ID_CAMPANIA` VARCHAR(255) NOT NULL,
    CONSTRAINT `PK_depto_campania` PRIMARY KEY  (`ID_DPTO`)
);


/*******************************************************************************
   Create Primary Key Unique Indexes
********************************************************************************/

/*******************************************************************************
   Create Foreign Keys
********************************************************************************/
ALTER TABLE `Familia` ADD CONSTRAINT `FK_ID_DPTO`
    FOREIGN KEY (`ID_DPTO`) REFERENCES `Departamento` (`ID_DPTO`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX `IFK_ID_DPTO` ON `Familia` (`ID_DPTO`);

ALTER TABLE `Departamento` ADD CONSTRAINT `FK_ID_DPTO`
    FOREIGN KEY (`ID_DPTO`) REFERENCES `Articulo` (`ID_DPTO`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX `IFK_ID_DPTO` ON `Departamento` (`ID_DPTO`);

ALTER TABLE `Articulo` ADD CONSTRAINT `FK_ID_DPTO`
    FOREIGN KEY (`ID_DPTO`) REFERENCES `depto_campania` (`ID_DPTO`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX `IFK_ID_DPTO` ON `Articulo` (`ID_DPTO`);

ALTER TABLE `depto_campania` ADD CONSTRAINT `FK_ID_CAMPANIA`
    FOREIGN KEY (`ID_CAMPANIA`) REFERENCES `campanias` (`ID_CAMPANIA`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX `IFK_ID_CAMPANIA` ON `depto_campania` (`ID_CAMPANIA`);

ALTER TABLE `campanias` ADD CONSTRAINT `FK_TIPO`
    FOREIGN KEY (`REFERENCIA`) REFERENCES `venta` (`REFERENCIA`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX `IFK_TIPO` ON `campanias` (`TIPO`);

/*******************************************************************************
   Populate Tables
********************************************************************************/

INSERT INTO `familia` (`ID_DPTO`, `COD_FAMILIA`,`DESC_FAMILIA`) VALUES (1, '1F1','PULSERAS');
INSERT INTO `familia` (`ID_DPTO`, `COD_FAMILIA`,`DESC_FAMILIA`) VALUES (1, '1F2','ANILLOS');
INSERT INTO `familia` (`ID_DPTO`, `COD_FAMILIA`,`DESC_FAMILIA`) VALUES (2, '2F1','BOLSO DE MANO');
INSERT INTO `familia` (`ID_DPTO`, `COD_FAMILIA`,`DESC_FAMILIA`) VALUES (3, '3F1','NAUTICO');
INSERT INTO `familia` (`ID_DPTO`, `COD_FAMILIA`,`DESC_FAMILIA`) VALUES (3, '3F2','SANDALIAS');
INSERT INTO `familia` (`ID_DPTO`, `COD_FAMILIA`,`DESC_FAMILIA`) VALUES (4, '4F1','BERMUDAS');

INSERT INTO `departamento` (`ID_DPTO`, `DESC_DPTO`) VALUES (1, 'JOYERIA');
INSERT INTO `departamento` (`ID_DPTO`, `DESC_DPTO`) VALUES (2, 'BOLSOS');
INSERT INTO `departamento` (`ID_DPTO`, `DESC_DPTO`) VALUES (3, 'ZAPATERIA');
INSERT INTO `departamento` (`ID_DPTO`, `DESC_DPTO`) VALUES (4, 'BANO CAB');


INSERT INTO `articulo` (`REFERENCIA`, `ID_DPTO`,`COD_FAMILIA`,`FECHA_ALTA`) VALUES ('A', '1','1F1','2010-02-21');
INSERT INTO `articulo` (`REFERENCIA`, `ID_DPTO`,`COD_FAMILIA`,`FECHA_ALTA`) VALUES ('B', '2','2F1','2014-02-07');
INSERT INTO `articulo` (`REFERENCIA`, `ID_DPTO`,`COD_FAMILIA`,`FECHA_ALTA`) VALUES ('C', '2','2F1','2014-05-15');
INSERT INTO `articulo` (`REFERENCIA`, `ID_DPTO`,`COD_FAMILIA`,`FECHA_ALTA`) VALUES ('D', '2','2F1','2005-10-01');
INSERT INTO `articulo` (`REFERENCIA`, `ID_DPTO`,`COD_FAMILIA`,`FECHA_ALTA`) VALUES ('E', '2','2F1','2010-10-31');
INSERT INTO `articulo` (`REFERENCIA`, `ID_DPTO`,`COD_FAMILIA`,`FECHA_ALTA`) VALUES ('F', '3','3F1','2001-04-20');
INSERT INTO `articulo` (`REFERENCIA`, `ID_DPTO`,`COD_FAMILIA`,`FECHA_ALTA`) VALUES ('G', '3','3F2','2015-02-14');
INSERT INTO `articulo` (`REFERENCIA`, `ID_DPTO`,`COD_FAMILIA`,`FECHA_ALTA`) VALUES ('H', '4','4F1','2009-03-25');

INSERT INTO `campanias` (`ID_CAMPANIA`, `TIPO`,`FECHA_CAMP`) VALUES ('CA1', 'VENTA','2012-02-05');
INSERT INTO `campanias` (`ID_CAMPANIA`, `TIPO`,`FECHA_CAMP`) VALUES ('CA2', 'VENTA','2012-02-15');
INSERT INTO `campanias` (`ID_CAMPANIA`, `TIPO`,`FECHA_CAMP`) VALUES ('CA3', 'POSVENTA','2009-10-02');
INSERT INTO `campanias` (`ID_CAMPANIA`, `TIPO`,`FECHA_CAMP`) VALUES ('CA4', 'VENTA','2010-10-02');
INSERT INTO `campanias` (`ID_CAMPANIA`, `TIPO`,`FECHA_CAMP`) VALUES ('CA5', 'POSVENTA','2010-11-31');
INSERT INTO `campanias` (`ID_CAMPANIA`, `TIPO`,`FECHA_CAMP`) VALUES ('CA6', 'POSVENTA','2015-02-07');

INSERT INTO `venta` (`TALON`, `REFERENCIA`,`PRECIO`,`FECHA_VENTA`) VALUES (01, 'A' ,'15','2012-02-11');
INSERT INTO `venta` (`TALON`, `REFERENCIA`,`PRECIO`,`FECHA_VENTA`) VALUES (02, 'A' ,'18','2012-02-15');
INSERT INTO `venta` (`TALON`, `REFERENCIA`,`PRECIO`,`FECHA_VENTA`) VALUES (03, 'A' ,'14','2013-10-02');
INSERT INTO `venta` (`TALON`, `REFERENCIA`,`PRECIO`,`FECHA_VENTA`) VALUES (04, 'D' ,'37.95','2010-08-06');
INSERT INTO `venta` (`TALON`, `REFERENCIA`,`PRECIO`,`FECHA_VENTA`) VALUES (05, 'E' ,'125.95','2010-11-30');
INSERT INTO `venta` (`TALON`, `REFERENCIA`,`PRECIO`,`FECHA_VENTA`) VALUES (06, 'E' ,'150','2011-02-05');
INSERT INTO `venta` (`TALON`, `REFERENCIA`,`PRECIO`,`FECHA_VENTA`) VALUES (07, 'H' ,'22.99','2010-04-11');
INSERT INTO `venta` (`TALON`, `REFERENCIA`,`PRECIO`,`FECHA_VENTA`) VALUES (08, 'H' ,'24','2011-08-08');

INSERT INTO `depto_campania` (`ID_DPTO`, `ID_CAMPANIA`) VALUES (1, 'CA1');
INSERT INTO `depto_campania` (`ID_DPTO`, `ID_CAMPANIA`) VALUES (1, 'CA4');
INSERT INTO `depto_campania` (`ID_DPTO`, `ID_CAMPANIA`) VALUES (2, 'CA2');
INSERT INTO `depto_campania` (`ID_DPTO`, `ID_CAMPANIA`) VALUES (3, 'CA2');
INSERT INTO `depto_campania` (`ID_DPTO`, `ID_CAMPANIA`) VALUES (3, 'CA5');
INSERT INTO `depto_campania` (`ID_DPTO`, `ID_CAMPANIA`) VALUES (3, 'CA6');
INSERT INTO `depto_campania` (`ID_DPTO`, `ID_CAMPANIA`) VALUES (4, 'CA1');
INSERT INTO `depto_campania` (`ID_DPTO`, `ID_CAMPANIA`) VALUES (4, 'CA2');
INSERT INTO `depto_campania` (`ID_DPTO`, `ID_CAMPANIA`) VALUES (4, 'CA3');
INSERT INTO `depto_campania` (`ID_DPTO`, `ID_CAMPANIA`) VALUES (4, 'CA6');
